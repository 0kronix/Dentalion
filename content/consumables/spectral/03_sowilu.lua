SMODS.Consumable {
    key = 'sowilu',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 2,
        y = 0
    },
    soul_pos = { 
        x = 2,
        y = 1
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = {
        extra = {
            odds = 3,
            hand_size = 1,
        }
    },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_soul']
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.hand_size } }
    end,

    can_use = function(self, card)
        return #G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'before',
            delay = 0.0,
            func = (function()
                if pseudorandom("sowilu") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    local _card = create_card(nil, G.consumeables, nil, nil, nil, nil, "c_soul", nil)
                    _card:add_to_deck()
                    G.consumeables:emplace(_card)
                else
                    G.hand:change_size(-card.ability.extra.hand_size)
                    attention_text({
                        text = localize('k_nope_ex'),
                        scale = 1.3,
                        hold = 1.4,
                        major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                end
                return true
            end)
        }))
        delay(0.3)
    end
}