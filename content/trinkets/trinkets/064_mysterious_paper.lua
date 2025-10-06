Dentalion_API.Trinket {
    key = "mysteriouspaper",
    pos = Dentalion.get_atlas_pos(64, 10),

    config = { extra = { money = 3 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { -card.ability.extra.money, card.ability.extra.money }
        }
    end,
    calc_dollar_bonus = function(self, card)
        local money = pseudorandom("mysteriouspaper", -card.ability.extra.money, card.ability.extra.money)
        if money ~= 0 then return money end
    end
}