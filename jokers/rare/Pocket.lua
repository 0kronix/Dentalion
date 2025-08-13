SMODS.Joker {
    key = "pocket",
    atlas = 'rare-jokers',
    pos = {x = 3, y = 0},

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { hand_size_mod = 5, hand_size_need = 8 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.hand_size_mod, card.ability.extra.hand_size_need } }
	end,

    calculate = function(self, card, context)
		if context.first_hand_drawn then
			if #G.hand.cards < card.ability.extra.hand_size_need then
				return {
					G.hand:change_size(card.ability.extra.hand_size_mod)
				}
			end
		end
		if context.selling_self then
			G.hand:change_size(-card.ability.extra.hand_size_mod)
		end
	end
}