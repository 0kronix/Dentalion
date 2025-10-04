Dentalion_API.Trinket {
    key = "blister",
    pos = Dentalion.get_atlas_pos(31, 10),

    config = { extra = { odds = 3 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.modify_scoring_hand and Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "blister") then
            return {
                add_to_hand = true
            }
        end
    end,
}