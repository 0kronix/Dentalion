Dentalion_API.Trinket {
    key = "butter",
    pos = Dentalion.get_atlas_pos(44, 10),

    config = { extra = { odds = 4 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.open_booster and Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "butter") then
            local consums = { "Arcana", "Celestial", "Spectral" }
            local short2 = { "Tarot", "Planet", "Spectral" }
            for i = 1, #consums do
                if context.card.ability.name:find(consums[i]) and #G.consumeables.cards + G.consumeable_buffer < G.consumeables.config.card_limit then
                    G.consumeable_buffer = G.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        delay = 0.5,
                        func = function()
                            card:juice_up()
                            SMODS.add_card{ set = short2[i], area = G.consumeables }
                            G.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
            end
        end
    end
}