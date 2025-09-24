SMODS.Consumable {
    key = 'fehu',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = { 
        x = 0,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            money = 3
        }
    },

    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.money, 
                (#G.jokers.cards or 0) * card.ability.extra.money
            }
        }
    end,

    can_use = function(self, card)
        return #G.jokers.cards > 0
    end,
    
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                ease_dollars(#G.jokers.cards * card.ability.extra.money)
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.3)
    end
}