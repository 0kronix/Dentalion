Dentalion_API.Trinket {
    key = "momstoenail",
    pos = Dentalion.get_atlas_pos(59, 10),

    config = { extra = { odds = 3 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.other_card.seal then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "momstoenail") then
                return {
                    repetitions = 1,
                    message_card = context.other_card
                }
            end
        end
    end,
}