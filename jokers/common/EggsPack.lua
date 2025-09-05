SMODS.Joker {
    key = "eggspack",
    atlas = 'common-jokers',
    pos = {x = 4, y = 5},

    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { eggs = 6 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_egg
        return { vars = { card.ability.extra.eggs } }
	end,

    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint and context.cardarea == G.jokers then
            if G.jokers.config.card_limit - #G.jokers.cards > 0 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        SMODS.add_card{ key = "j_egg" }
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                card.ability.extra.eggs = card.ability.extra.eggs - 1
                if card.ability.extra.eggs == 0 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
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
                            return true
                        end
                    }))
                    return {
                        message = localize('k_eaten_ex')
                    }
                else
                    return {
                        message = tostring(card.ability.extra.eggs) .. "/6"
                    }
                end
            end
        end
    end
}