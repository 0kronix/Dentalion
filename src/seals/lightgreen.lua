SMODS.Seal {
    key = 'lightgreen',
    atlas = "seals",

    pos = { x = 0, y = 0 },

    config = { extra = { powmult = 0.2 } },

    badge_colour = HEX('00c200'),

    loc_vars = function(self, info_queue, card)
        return { vars = { "^" .. tostring(self.config.extra.powmult + 1) } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            -- Code frome AIJ mod
            local xmlt = mult^self.config.extra.powmult
            return {
                remove_default_message = true,
                Xmult_mod = xmlt,
                extra = { message = "^" .. (self.config.extra.powmult + 1) .. " Mult", colour = G.C.GREEN }
            }
        end
    end
}