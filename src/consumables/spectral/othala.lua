SMODS.Consumable {
    key = 'othala',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 3,
        y = 4
    },
    soul_pos = { 
        x = 3,
        y = 5
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { planets = 3, levels = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.planets,
            card.ability.extra.levels
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
                for i = 1, card.ability.extra.planets do
                    SMODS.add_card{ set = "Planet", edition = "e_negative" }
                end
                for i = 1, card.ability.extra.levels do
                    SMODS.smart_level_up_hand(card, pseudorandom_element(G.handlist, "othala"), nil, -1)
                end
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}