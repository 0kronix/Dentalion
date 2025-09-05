SMODS.Consumable {
    key = 'gebu',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 1,
        y = 0
    },
    soul_pos = { 
        x = 1,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            chips = 50
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    can_use = function(self, card)
        return #G.hand.cards > 0
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
        -- Stolen from Aikoyori's Rock
        for _,_c in ipairs(G.hand.cards) do
            G.E_MANAGER:add_event(Event({
                func = function()
                    _c.ability.perma_bonus = _c.ability.perma_bonus + card.ability.extra.chips
                    _c:juice_up(0.3, 0.3)
                    play_sound("tarot1")
                    return true
                end
            }))
        end
        delay(0.3)
    end
}