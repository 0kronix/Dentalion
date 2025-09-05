SMODS.Consumable {
    key = 'wunjo',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 5,
        y = 0
    },
    soul_pos = { 
        x = 5,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            min_enh = 2,
            max_enh = 7
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.min_enh, card.ability.extra.max_enh } }
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
                for i = 1, math.random(card.ability.extra.min_enh, card.ability.extra.max_enh) do
                    local c = pseudorandom_element(G.hand.cards, "wunjo")
                    local enhancement = SMODS.poll_enhancement {
                        type_key = 'wunjo',
                        guaranteed = true
                    }
                    c:juice_up(0.3, 0.5)
                    c:set_ability(G.P_CENTERS[enhancement])
                end
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.3)
    end
}