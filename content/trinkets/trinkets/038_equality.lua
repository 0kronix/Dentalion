Dentalion_API.Trinket {
    key = "equality",
    pos = get_atlas_pos(38, 10),

    config = { extra = { chips = 111 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.initial_scoring_step and G.GAME.current_round.discards_left == G.GAME.current_round.hands_left then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
}