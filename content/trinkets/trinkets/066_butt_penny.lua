Dentalion_API.Trinket {
    key = "buttpenny",
    pos = Dentalion.get_atlas_pos(66, 10),

    config = { extra = { money = 7 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.money }
        }
    end,
    unequip = function(self, card)
        return {
            dollars = card.ability.extra.money
        }
    end
}