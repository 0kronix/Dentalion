SMODS.Consumable {
    key = 'raidu',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 3,
        y = 0
    },
    soul_pos = { 
        x = 3,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            rerolls = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rerolls } }
    end,

    can_use = function(self, card)
        return true
    end,
    
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                SMODS.change_free_rerolls(card.ability.extra.rerolls)
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.3)
    end
}