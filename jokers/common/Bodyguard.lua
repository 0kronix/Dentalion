SMODS.Joker {
    key = "bodyguard",
    atlas = 'common-jokers',
    pos = {x = 3, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mult = 20, cost = 10, rounds = 0 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.cost, card.ability.extra.rounds } }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
			mult = card.ability.extra.mult
			}
		end
		if context.end_of_round and context.cardarea == G.jokers then
			if card.ability.extra.rounds >= 4 then
				ease_dollars(-card.ability.extra.cost)
				card.ability.extra.rounds = 0
				card:juice_up()
				return {
					message = 'Reset',
					card = card
				}					
			else
				card.ability.extra.rounds = card.ability.extra.rounds + 1
				card:juice_up()
				return {
					message = '+1',
					card = card
				}	
			end
		end
	end
}