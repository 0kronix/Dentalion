Dentalion_API.Trinket {
    key = "dimbulb",
    pos = get_atlas_pos(37, 10),

    config = { extra = { mult = 10 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.initial_scoring_step and #G.jokers.cards < G.jokers.config.card_limit then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}