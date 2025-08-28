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
        if context.cardarea == G.play and context.main_scoring then
            local frozen_count = 0
            for _, c in ipairs(context.scoring_hand) do
                if c:has_enhancement("m_dentalion_frozen") then
                    frozen_count = frozen_count + 1
                end
            end
            return {
                xchips = 1 + (frozen_count - 1) * card.ability.extra.xchips
            }
        end
    end
}
