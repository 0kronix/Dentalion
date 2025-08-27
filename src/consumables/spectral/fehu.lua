SMODS.Consumable {
    key = 'fehu',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 0,
        y = 0
    },

    cost = 4,
    hidden = false,
    config = {
        extra = {
            money = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.money }
        }
    end,
    can_use = function(self, card)
        return 3 > 1
    end,
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                
            end
        }))
    end
}