SMODS.Joker {
    key = "crumpledbanknote",
    atlas = 'common-jokers',
    pos = {x = 0, y = 2},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { min_money = 2, max_money = 20 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.min_money, card.ability.extra.max_money } }
	end,

    calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			card.ability.extra_value = math.random(card.ability.extra.min_money, card.ability.extra.max_money)
			card:set_cost()
			return {
				message = localize('k_val_up'),
				colour = G.C.MONEY
			}
		end
	end
}