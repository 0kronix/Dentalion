SMODS.Joker {
    key = "decay",
    atlas = 'common-jokers',
    pos = {x = 0, y = 1},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 20 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
	end,

    calculate = function(self, card, context)
		if context.destroying_card then
			if pseudorandom("decay") < G.GAME.probabilities.normal / card.ability.extra.odds then
				return not context.destroying_card.ability.eternal
			end
		end
	end
}