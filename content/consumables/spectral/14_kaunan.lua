SMODS.Consumable {
    key = 'kaunan',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 3,
        y = 2
    },
    soul_pos = { 
        x = 3,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { levels = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.levels,
            localize(most_played_hand(), 'poker_hands')
        } }
    end,

    can_use = function(self, card)
        return most_played_hand() ~= nil
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                SMODS.smart_level_up_hand(card, most_played_hand(), nil, card.ability.extra.levels)
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}