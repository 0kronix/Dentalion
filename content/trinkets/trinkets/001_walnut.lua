Dentalion_API.Trinket {
    key = "walnut",
    pos = get_atlas_pos(1, 10),

    config = { extra = { hand_size = 1 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.hand_size }
        }
    end,
    equip = function(self, card)
        G.hand:change_size(card.ability.extra.hand_size)
    end,
    unequip = function(self, card)
        G.hand:change_size(-card.ability.extra.hand_size)
    end
}