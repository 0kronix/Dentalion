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
		main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = (card.ability.extra.mod == 1 and mix_colours(G.C.CHIPS, G.C.JOKER_GREY, 0.8)) or (card.ability.extra.mod == 2 and mix_colours(G.C.MULT, G.C.JOKER_GREY, 0.8)) or mix_colours(G.C.MONEY, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. ((card.ability.extra.mod == 1 and 'chips') or (card.ability.extra.mod == 2 and 'mult') or 'dollars') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        }
        if card.area and card.area == G.jokers then
            return { 
            	main_end = main_end, 
            	vars = { 
            		card.ability.extra.chips,
					card.ability.extra.mult,
					card.ability.extra.money 
				} 
			}
        else
            return { 
            	vars = { 
            		card.ability.extra.chips,
					card.ability.extra.mult,
					card.ability.extra.money
				} 
			}
        end
	end,

	calc_dollar_bonus = function(self, card)
		if card.ability.extra.mod == 3 then
			return card.ability.extra.money
		end
	end,

    calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
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
					message = "Dollars!",
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