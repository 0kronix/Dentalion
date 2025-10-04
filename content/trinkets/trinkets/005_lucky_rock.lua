Dentalion_API.Trinket {
    key = "luckyrock",
    pos = Dentalion.get_atlas_pos(5, 10),

    atlas = 'trinkets',
    unlocked = true,

    config = { extra = { odds = 3, money = 2 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.money }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_type_destroyed then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "luckyrock") then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end
    end
}