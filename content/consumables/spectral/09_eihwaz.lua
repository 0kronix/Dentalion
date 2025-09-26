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
            cost = 4
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cost } }
    end,

    can_use = function(self, card)
        return G.consumeables.config.card_limit - #G.consumeables.cards > 0 or card.area == G.consumeables
    end,
    
    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        for i = 1, (G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    SMODS.add_card{ set = "Consumeables", area = G.consumeables }
                    ease_dollars(-card.ability.extra.cost)
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.5)
    end
}