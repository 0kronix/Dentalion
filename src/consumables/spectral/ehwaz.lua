SMODS.Consumable {
    key = 'ehwaz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 1,
        y = 4
    },
    soul_pos = { 
        x = 1,
        y = 5
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
        return #G.consumeables.cards > 0
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if not card.area == G.consumeables then
                    for _, cons in ipairs(G.consumeables.cards) do
                        cons:start_dissolve()
                    end
                    ease_ante(-1)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - 1
                end
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}