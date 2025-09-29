Dentalion_API.Trinket {
    key = "wishbone",
    pos = get_atlas_pos(39, 10),

    config = { extra = { odds = 20 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.ending_shop and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "wishbone") then
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = "before",
                    func = function()
                        SMODS.add_card{ set = "Joker" }
                        card:juice_up()
                        G.GAME.joker_buffer = 0
                        return true
                    end
                }))
            end
        end
    end,
}