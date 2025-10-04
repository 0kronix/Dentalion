Dentalion_API.Trinket {
    key = "tornpocket",
    pos = Dentalion.get_atlas_pos(49, 10),

    config = { extra = { cap = 10 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.cap }
        }
    end,
    equip = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.interest_cap = G.GAME.interest_cap + card.ability.extra.cap
                return true
            end
        }))
    end,
    unequip = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.interest_cap = G.GAME.interest_cap - card.ability.extra.cap
                return true
            end
        }))
    end,
}