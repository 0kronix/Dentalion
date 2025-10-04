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
        if context.end_of_round and context.cardarea == G.dentalion_trinket_area then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds <= 0 then
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.5,
                        func = function()
                            card:juice_up()
                            SMODS.add_card{ set = "Joker" }
                            card:start_dissolve()
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            else
                return {
                    message = tostring(card.ability.extra.rounds)
                }
            end
        end
    end
}