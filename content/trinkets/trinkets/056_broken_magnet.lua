Dentalion_API.Trinket {
    key = "brokenmagnet",
    pos = Dentalion.get_atlas_pos(56, 10),

    config = { extra = { xchips = 1.5 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xchips }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local scard = context.other_card
            if SMODS.has_enhancement(scard, "m_steel") then
                return {
                    xchips = card.ability.extra.xchips,
                    message_card = scard
                }
            end
        end
    end,
}