SMODS.Consumable {
    key = 'mannaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 9,
        y = 0
    },
    soul_pos = { 
        x = 9,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            disc_minus = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.disc_minus, } }
    end,

    can_use = function(self, card)
        return #G.hand.cards > 0 and G.GAME.current_round.discards_left > 0
    end,
    
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for _, c in ipairs(G.hand.cards) do
                    if not c:is_face() then
                        Dentalion.turn_face(c, "mannaz")
                    end
                end
                ease_discard(-card.ability.extra.disc_minus)
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end
}