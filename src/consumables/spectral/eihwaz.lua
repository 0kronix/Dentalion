SMODS.Consumable {
    key = 'eihwaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 8,
        y = 0
    },
    soul_pos = { 
        x = 8,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    can_use = function(self, card)
        return G.consumeables.config.card_limit - #G.consumeables.cards > 0 or card.area == G.consumeables
    end,
    
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local empty_slots = G.consumeables.config.card_limit - #G.consumeables.cards
                for i = 1, empty_slots do
                    local _card = create_card(
                        "Consumeables",
                        G.consumeables,
                        nil,
                        nil,
                        nil,
                        nil,
                        pseudorandom_element(G.P_CENTER_POOLS.Consumeables, pseudoseed("ehwaz")).key,
                        "ehwaz"
                    )
                    _card:add_to_deck()
                    G.consumeables:emplace(_card)
                end
                ease_dollars(-(empty_slots * 2))
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end
}