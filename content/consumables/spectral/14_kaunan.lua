SMODS.Consumable {
    key = 'kaunan',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 3,
        y = 2
    },
    soul_pos = { 
        x = 3,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { levels = 3, most_played = nil } },

    loc_vars = function(self, info_queue, card)
        local _handname, _played = 'High Card', -1
        for hand_key, hand in pairs(G.GAME.hands) do
            if hand.played > _played and SMODS.is_poker_hand_visible(hand_key) then
                _played = hand.played
                _handname = hand_key
            end
        end
        card.ability.extra.most_played = _handname
        return { vars = { 
            card.ability.extra.levels,
            localize(card.ability.extra.most_played, 'poker_hands')
        } }
    end,

    can_use = function(self, card)
        return card.ability.extra.most_played ~= nil
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                SMODS.smart_level_up_hand(card, card.ability.extra.most_played, nil, card.ability.extra.levels)
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}