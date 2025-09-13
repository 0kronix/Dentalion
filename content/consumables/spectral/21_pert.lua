SMODS.Consumable {
    key = 'pert',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 0,
        y = 4
    },
    soul_pos = { 
        x = 0,
        y = 5
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            
        } }
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
                create_voucher(nil, "pert", "mult", 2)
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}