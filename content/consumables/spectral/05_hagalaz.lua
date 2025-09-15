SMODS.Consumable {
    key = 'hagalaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 4,
        y = 0
    },
    soul_pos = { 
        x = 4,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            high_min = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.high_min } }
    end,

    can_use = function(self, card)
        return #G.hand.highlighted >= card.ability.extra.high_min
    end,
    
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                for _, cardh in ipairs(G.hand.cards) do
                    if not tablefind(G.hand.highlighted, cardh) then
                        cardh:start_dissolve()
                    end
                end
                ease_dollars(-(G.GAME.dollars / 2))
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.3)
    end
}