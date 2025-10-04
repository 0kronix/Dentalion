Dentalion_API.Trinket {
    key = "superball",
    pos = Dentalion.get_atlas_pos(35, 10),

    config = { extra = { odds = 2 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[1] then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "superball") then
                return {
                    repetitions = 1
                }
            end
        end
    end,
}