SMODS.Consumable {
    key = 'ansuz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 7,
        y = 2
    },
    soul_pos = { 
        x = 7,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { max_highlighted = 5, odds = 7 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.max_highlighted,
            G.GAME.probabilities.normal + (G.jokers and #G.hand.highlighted or 0),
            card.ability.extra.odds
        } }
    end,

    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for _, cardh in ipairs(G.hand.highlighted) do
                    cardh:set_edition(poll_edition("ansuz", nil, true, true), true)
                    cardh:juice_up(0.3, 0.5)
                end
                for _, joker in ipairs(G.jokers.cards) do
                    if pseudorandom("ansuz") < (G.GAME.probabilities.normal + #G.hand.highlighted) / card.ability.extra.odds then
                        joker:start_dissolve()
                    end
                end
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}