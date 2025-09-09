SMODS.Consumable {
    key = 'isaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 0,
        y = 2
    },
    soul_pos = { 
        x = 0,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        max_highlighted = 3, 
        mod_conv = 'm_dentalion_frozen'
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}