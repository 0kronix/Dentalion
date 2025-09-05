SMODS.Consumable {
    key = 'jera',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 4,
        y = 2
    },
    soul_pos = { 
        x = 4,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { copies = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.copies
        } }
    end,

    can_use = function(self, card)
        return #G.consumeables.cards > 0
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local chosen_cons = pseudorandom_element(G.consumeables.cards, 'jera_choice')
        local _first_dissolve = nil
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.75,
            func = function()
                for _, cons in pairs(G.consumeables.cards) do
                    if cons ~= chosen_cons then
                        cons:start_dissolve(nil, _first_dissolve)
                        _first_dissolve = true
                    end
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.4,
            func = function()
                for i = 1, card.ability.extra.copies do
                    local copied_cons = copy_card(chosen_cons, nil, nil, nil, nil)
                    copied_cons:start_materialize()
                    copied_cons:add_to_deck()
                    copied_cons:set_edition("e_negative", true)
                    G.consumeables:emplace(copied_cons)
                end
                return true
            end
        }))
        delay(0.5)
    end,
}