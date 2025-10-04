Dentalion_API.Trinket {
    key = "momspearl",
    pos = Dentalion.get_atlas_pos(10, 10),

    config = { extra = { rate = 1.44, display = 1.2 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.display }
        }
    end,
    equip = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.planet_rate = G.GAME.planet_rate * card.ability.extra.rate
                return true
            end
        }))
    end,
    unequip = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.planet_rate = G.GAME.planet_rate / card.ability.extra.rate
                return true
            end
        }))
    end
}