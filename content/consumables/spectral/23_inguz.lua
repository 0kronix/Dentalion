SMODS.Consumable {
    key = 'inguz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 2,
        y = 4
    },
    soul_pos = { 
        x = 2,
        y = 5
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { max_highlighted = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'c_deja_vu', set = 'Spectral' }
        info_queue[#info_queue + 1] = { key = 'c_trance', set = 'Spectral' }
        info_queue[#info_queue + 1] = { key = 'c_medium', set = 'Spectral' }
        info_queue[#info_queue + 1] = { key = 'c_talisman', set = 'Spectral' }
        info_queue[#info_queue + 1] = { key = 'c_dentalion_uruz', set = 'Spectral' }
        return { vars = { 
            card.ability.extra.max_highlighted
        } }
    end,

    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.extra.max_highlighted
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local seal_cards = { "c_deja_vu", "c_trance", "c_medium", "c_talisman", "c_dentalion_uruz" }
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for _, cardh in ipairs(G.hand.highlighted) do
                    if cardh.seal and #G.consumeables.cards < G.consumeables.config.card_limit then
                        cardh:set_seal(nil)
                        cardh:juice_up(0.3, 0.5)
                        SMODS.add_card{ key = pseudorandom_element(seal_cards, "inguz") }
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