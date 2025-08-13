SMODS.Joker {
    key = "firefly",
    atlas = 'common-jokers',
    pos = {x = 1, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { chips = 3 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.chips_mod } }
	end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			return {
				chips = card.ability.extra.chips
			}
		end
	end
}