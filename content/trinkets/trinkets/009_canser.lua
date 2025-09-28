Dentalion_API.Trinket {
    key = "canser",
    pos = get_atlas_pos(9, 10),

    atlas = 'trinkets',
    unlocked = true,

    config = { extra = { xchips = 1.5 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xchips }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xchips
            }
        end
    end
}