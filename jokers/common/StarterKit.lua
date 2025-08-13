SMODS.Joker {
    key = "starterkit",
    atlas = 'common-jokers',
    pos = {x = 4, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { min_chips = 150 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.min_chips } }
	end,

    calculate = function(self, card, context)
		if context.final_scoring_step and context.cardarea == G.jokers then
            if tonumber(hand_chips) < card.ability.extra.min_chips then
				return {
					chips = card.ability.extra.min_chips - tonumber(hand_chips)
				}
			end
		end
	end
}