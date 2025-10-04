SMODS.Joker {
    key = "dreamcatcher",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(9, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { odds = 2 } },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
			}
		}
	end,

    calculate = function(self, card, context)
		if context.before then
			if #context.full_hand == 1 and (context.full_hand[1]:get_id() == 2 or context.full_hand[1]:get_id() == 3) then
				if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "dreamcatcher") and #G.consumeables.cards < G.consumeables.config.card_limit then
					G.E_MANAGER:add_event(Event({
						trigger = 'before',
						delay = 0.0,
						func = (function()
							SMODS.add_card{ set = "Tarot" }
							return true
						end)
					}))
					return {
						message = localize('k_plus_tarot')
					}
				end
			end
		end
	end
}