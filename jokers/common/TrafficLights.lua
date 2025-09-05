SMODS.Joker {
    key = "trafficlights",
    atlas = 'common-jokers',
    pos = {x = 4, y = 2},

    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { chips = 30, mult = 8, money = 2, mod = 1 } },

    loc_vars = function(self, info_queue, card)
    	if card.ability.extra.mod == 1 then
			return { vars = { 
				card.ability.extra.chips,
				card.ability.extra.mult,
				card.ability.extra.money,
				"Chips", colours = { G.C.CHIPS }
			} }
		elseif card.ability.extra.mod == 2 then
			return { vars = { 
				card.ability.extra.chips,
				card.ability.extra.mult,
				card.ability.extra.money,
				"Mult", colours = { G.C.MULT }
			} }
		else
			return { vars = { 
				card.ability.extra.chips,
				card.ability.extra.mult,
				card.ability.extra.money,
				"Dollars", colours = { G.C.MONEY }
			} }
		end
	end,

	calc_dollar_bonus = function(self, card)
		if card.ability.extra.mod == 3 then
			return card.ability.extra.money
		end
	end,

    calculate = function(self, card, context)
		if context.setting_blind and context.cardarea == G.jokers and not context.blueprint then
			card.ability.extra.mod = card.ability.extra.mod + 1
			if card.ability.extra.mod > 3 then
				card.ability.extra.mod = 1
			end
			if card.ability.extra.mod == 1 then
				return {
					message = "Chips!",
		            card = card,
		            colour = G.C.CHIPS
				}
			elseif card.ability.extra.mod == 2 then
				return {
					message = "Mult!",
		            card = card,
		            colour = G.C.MULT
				}
			else
				return {
					message = "Money!",
		            card = card,
		            colour = G.C.MONEY
				}
			end
		end
		if context.joker_main then
			if card.ability.extra.mod == 1 then
				return {
					chips = card.ability.extra.chips
				}
			elseif card.ability.extra.mod == 2 then
				return {
					mult = card.ability.extra.mult
				}
			end
		end
	end
}