SMODS.Enhancement {
    key = "frozen",
    atlas = 'enhancements',
    pos = { x = 0, y = 0 },

    shatters = true,

    config = {
        extra = {
            xchips = 0.2
        }
    },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips
            }
        }
    end,

    calculate = function(self, card, context)
        local frozen_count = 0
        if context.cardarea == G.play and context.main_scoring then
            for _, c in ipairs(context.full_hand) do
                if SMODS.has_enhancement(c, "m_dentalion_frozen") then
                    frozen_count = frozen_count + 1
                end
            end
            frozen_count = frozen_count + #SMODS.find_card('j_dentalion_frozenjoker') * 3
            return {
                xchips = 1 + (frozen_count - 1) * card.ability.extra.xchips
            }
        end
    end
}
