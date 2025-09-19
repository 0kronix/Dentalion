SMODS.Joker {
    key = "crumpledbanknote",
    atlas = 'jokers',
    pos = get_atlas_pos(26, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
    config = { extra = { min_money = 2, max_money = 20 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.min_money, card.ability.extra.max_money } }
	end,

    calculate = function(self, card, context)
		if context.end_of_round and not context.blueprint then
			card.ability.extra_value = pseudorandom("banknote", card.ability.extra.min_money, card.ability.extra.max_money)
			card:set_cost()
			return {
				message = localize('k_val_up'),
				colour = G.C.MONEY
			}
		end
	end
}