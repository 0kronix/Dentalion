Dentalion_API.Trinket {
    key = "swallowedpenny",
    pos = Dentalion.get_atlas_pos(2, 10),

    config = { extra = { odds = 2, money = 1 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.money }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_card then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "swallowedpenny") then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end
    end
}