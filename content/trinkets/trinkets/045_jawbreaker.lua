Dentalion_API.Trinket {
    key = "jawbreaker",
    pos = Dentalion.get_atlas_pos(45, 10),

    config = { extra = { rounds = 4 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.rounds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds <= 0 then
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{ set = "Joker" }
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    card:remove()
                                    return true
                                end
                            }))
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex')
                    }
                end
            else
                return {
                    message = tostring(card.ability.extra.rounds)
                }
            end
        end
    end
}