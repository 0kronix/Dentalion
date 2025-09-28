Dentalion_API.Trinket {
    key = "curvedhorn",
    pos = get_atlas_pos(8, 10),

    atlas = 'trinkets',
    unlocked = true,

    config = { extra = { xmult = 1.5 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xmult }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}