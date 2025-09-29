Dentalion_API.Trinket {
    key = "no",
    pos = get_atlas_pos(34, 10),

    config = { extra = { prior = nil } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,
    equip = function(self, card)
        card.ability.extra.prior = G.GAME.joker_rate
        G.GAME.joker_rate = 0
    end,
    unequip = function(self, card)
        G.GAME.joker_rate = card.ability.extra.prior
    end
}