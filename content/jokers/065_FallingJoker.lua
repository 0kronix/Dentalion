SMODS.Joker {
    key = "fallingjoker",
    atlas = 'jokers',
    pos = get_atlas_pos(65, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { odds = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, localize('Straight', 'poker_hands') } }
	end,

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            if context.scoring_name == "Straight" and pseudorandom("fall") < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local c = pseudorandom_element(G.hand.cards, "fall")
                        local enhancement = SMODS.poll_enhancement { type_key = 'fall', guaranteed = true }
                        c:juice_up(0.3, 0.5)
                        c:set_ability(G.P_CENTERS[enhancement])
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                delay(0.3)
            end
        end
    end
}