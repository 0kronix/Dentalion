Dentalion_API.Trinket {
    key = "rosarybead",
    pos = Dentalion.get_atlas_pos(57, 10),

    config = { extra = { odds = 2, money = 1 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.money }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and #G.jokers.cards > 0 and context.cardarea == G.dentalion_trinket_area then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "rosarybead") then
                local left_joker = G.jokers.cards[1]
                left_joker.ability.extra_value = left_joker.ability.extra_value + card.ability.extra.money
                left_joker:set_cost()
                return {
                    message = localize('k_val_up'),
                    colour = G.C.MONEY,
                    message_card = left_joker
                }
            end
        end
    end,
}