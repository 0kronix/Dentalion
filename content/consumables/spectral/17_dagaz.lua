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
        local left_joker, right_joker = nil, nil
        if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == G.jokers.highlighted[1] then 
                    left_joker = G.jokers.cards[i + 1]
                    right_joker = G.jokers.cards[i - 1]
                end
            end
        end
        return G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] and left_joker ~= nil
            and right_joker ~= nil and not left_joker.ability["eternal"] and not right_joker.ability["eternal"]
            and G.jokers.highlighted[1].edition
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local left_joker, right_joker = nil, nil
        if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == G.jokers.highlighted[1] then 
                    left_joker = G.jokers.cards[i + 1]
                    right_joker = G.jokers.cards[i - 1]
                end
            end
        end
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