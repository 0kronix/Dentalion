Dentalion_API.Trinket {
    key = "paperclip",
    pos = Dentalion.get_atlas_pos(62, 10),

    config = { extra = { odds = 8 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,

    calculate = function(self, card, context)
        if context.entering_shop or context.reroll_shop then
            if G.shop_jokers then
                for i = 1, #G.shop_jokers.cards do
                    local scard = G.shop_jokers.cards[i]
                    if scard.ability.consumeable and Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "paperclip") then
                        scard.ability.couponed = true
                        scard:set_cost()
                        card:juice_up()
                    end
                end
            end
        end
    end,
}