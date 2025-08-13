SMODS.Joker {
    key = "laststair",
    atlas = 'common-jokers',
    pos = {x = 2, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
		return { vars = { } }
	end,

    calculate = function(self, card, context)
		if context.destroying_card then
			local eval = evaluate_poker_hand(context.full_hand)
			if next(eval["Straight"]) then
				return not context.destroying_card.ability.eternal
			end
		end
	end
}