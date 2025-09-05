SMODS.Consumable {
    key = 'algiz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 7,
        y = 0
    },
    soul_pos = { 
        x = 7,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            cons_minus = 1
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cons_minus } }
    end,

    can_use = function(self, card)
        return G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] and 
            not G.jokers.highlighted[1].ability["eternal"] and not G.jokers.highlighted[1].ability["perishable"] 
            and G.jokers.highlighted[1].config.center.eternal_compat and G.consumeables.config.card_limit > 1
    end,
    
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                G.consumeables.config.card_limit = G.consumeables.config.card_limit - card.ability.extra.cons_minus
                G.jokers.highlighted[1]:set_eternal(true)
                play_sound('tarot1')
                G.jokers.highlighted[1]:juice_up(0.3, 0.5)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end
}