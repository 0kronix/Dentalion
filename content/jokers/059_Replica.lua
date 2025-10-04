SMODS.Joker {
    key = "replica",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(59, 10),

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
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "replica") then
                local spec_used = context.consumeable.config.center.key
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.2,
                    func = (function()
                        SMODS.add_card{ key = spec_used }
                        return true
                    end)
                }))
                return {
                    message = localize('dentalion_copy_ex'),
                    colour = G.C.SECONDARY_SET.Spectral
                }
            end
        end
    end
}