Dentalion_API.Trinket {
    key = "crackeddice",
    pos = get_atlas_pos(29, 10),

    config = { extra = { modify = 1.5 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.modify }
        }
    end,
    calculate = function(self, card, context)
        if context.mod_probability then
            return {
                numerator = context.numerator * card.ability.extra.modify
            }
        end
    end,
}