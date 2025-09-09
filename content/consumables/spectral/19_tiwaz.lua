SMODS.Consumable {
    key = 'tiwaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 8,
        y = 2
    },
    soul_pos = { 
        x = 8,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { max_highlighted = 1, tarot = 4 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.max_highlighted,
            card.ability.extra.tarot
        } }
    end,

    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted and #G.hand.cards > 0
            and G.hand.cards and G.hand
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local cur_suit = G.hand.highlighted[1].base.suit
        local total = 0
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for _, card in ipairs(G.hand.cards) do
                    if card.base.suit == cur_suit then
                        card:start_dissolve()
                        total = total + 1
                    end
                end
                if total >= card.ability.extra.tarot then
                    SMODS.add_card{set = "Tarot"}
                end
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}