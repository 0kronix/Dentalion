SMODS.Joker {
    key = "replica",
    atlas = 'jokers',
    pos = get_atlas_pos(59, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 4 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            G.GAME.probabilities.normal,
            card.ability.extra.odds
        } }
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Spectral" and 
            #G.consumeables.cards < G.consumeables.config.card_limit then
            if pseudorandom("replica") < G.GAME.probabilities.normal / card.ability.extra.odds then
                local spec_used = context.consumeable.config.center.key
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local _card = create_card(nil, G.consumeables, nil, nil, nil, nil, spec_used, nil)
                        _card:add_to_deck()
                        G.consumeables:emplace(_card)
                        return true
                    end)
                }))
            end
        end
    end
}