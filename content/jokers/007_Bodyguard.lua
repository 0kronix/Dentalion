SMODS.Joker {
    key = "bodyguard",
    atlas = 'jokers',
    pos = get_atlas_pos(7, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
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
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			card.ability.extra.rounds = card.ability.extra.rounds + 1
			return {
				message = tostring(card.ability.extra.rounds) .. "/5"
			}
		end
	end,

	calc_dollar_bonus = function(self, card)
        if card.ability.extra.rounds >= 5 then
        	card.ability.extra.rounds = 0
			return (-card.ability.extra.cost)
		end
    end	
}