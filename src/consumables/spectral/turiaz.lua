SMODS.Consumable {
    key = 'turiaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 2,
        y = 2
    },
    soul_pos = { 
        x = 2,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { suit = 'Hearts' }, max_highlighted = 5 },

    loc_vars = function(self, info_queue, card)
        local h, d, s, c = 0, 0, 0, 0
        if G.playing_cards then
            for k, v in ipairs(G.playing_cards) do
                if v:is_suit('Hearts', true) then
                    h = h + 1
                end
                if v:is_suit('Diamonds', true) then
                    d = d + 1
                end
                if v:is_suit('Spades', true) then
                    s = s + 1
                end
                if v:is_suit('Clubs', true) then
                    c = c + 1
                end
            end

            if math.max(h, d, s, c) == h then
                card.ability.extra.suit = "Hearts"
            elseif math.max(h, d, s, c) == d then
                card.ability.extra.suit = "Diamonds"
            elseif math.max(h, d, s, c) == s then
                card.ability.extra.suit = "Spades"
            elseif math.max(h, d, s, c) == c then
                card.ability.extra.suit = "Clubs"
            end

            return { vars = { 
                card.ability.max_highlighted, 
                localize(card.ability.extra.suit, 'suits_plural'), colours = { G.C.SUITS[card.ability.extra.suit] }
            } }
        else
            return { vars = { 
                card.ability.max_highlighted, 
                localize(card.ability.extra.suit, 'suits_plural'), colours = { G.C.SUITS[card.ability.extra.suit] }
            } }
        end
    end,

    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    SMODS.change_base(G.hand.highlighted[i], card.ability.extra.suit)
                    return true
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
}