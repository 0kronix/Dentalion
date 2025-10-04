SMODS.Consumable {
    key = 'dagaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 6,
        y = 2
    },
    soul_pos = { 
        x = 6,
        y = 3
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
        if G.jokers.highlighted then
            local left_joker = Dentalion.on_left_or_right_of(G.jokers.highlighted[1], G.jokers.cards, -1)
            local right_joker = Dentalion.on_left_or_right_of(G.jokers.highlighted[1], G.jokers.cards, 1)
            return (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] and left_joker ~= nil
                and right_joker ~= nil and not left_joker.ability["eternal"] and not right_joker.ability["eternal"]
                and G.jokers.highlighted[1].edition
        else
            return false
        end
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local left_joker = Dentalion.on_left_or_right_of(G.jokers.highlighted[1], G.jokers.cards, -1)
        local right_joker = Dentalion.on_left_or_right_of(G.jokers.highlighted[1], G.jokers.cards, 1)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                G.jokers.highlighted[1]:set_edition("e_negative", true)
                G.jokers.highlighted[1]:juice_up(0.3, 0.5)
                left_joker:start_dissolve()
                right_joker:start_dissolve()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}