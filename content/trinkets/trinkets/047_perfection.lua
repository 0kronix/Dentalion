Dentalion_API.Trinket {
    key = "perfection",
    pos = get_atlas_pos(47, 10),

    config = { extra = { modify = 4 } },

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

        if context.end_of_round then
            card:start_dissolve()
        end
    end,
}