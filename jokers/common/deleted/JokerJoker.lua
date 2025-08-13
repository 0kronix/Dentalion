SMODS.Joker {
    key = "jokerjoker",
    atlas = 'common-jokers',
    pos = {x = 0, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mult = 8 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
		end
	end
}