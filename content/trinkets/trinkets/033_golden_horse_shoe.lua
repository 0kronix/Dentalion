Dentalion_API.Trinket {
    key = "goldenhorseshoe",
    pos = Dentalion.get_atlas_pos(33, 10),

    config = { extra = { odds = 4 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.repetition and not context.repetition_only then
            if SMODS.has_enhancement(context.other_card, "m_gold") and Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "goldenhorseshoe") then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    message_card = context.other_card
                }
            end
        end
    end,
}