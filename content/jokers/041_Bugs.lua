SMODS.Joker {
    key = "bugs",
    atlas = 'jokers',
    pos = get_atlas_pos(41, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod_xmult = 0.2, cur_xmult = 1 } },

    loc_vars = function(self, info_queue, card)
    	return { vars = { 
					card.ability.extra.mod_xmult,
					card.ability.extra.cur_xmult
				}
			}
	end,

    calculate = function(self, card, context)
    	if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
    		if G.GAME.dollars <= 10 then
    			card.ability.extra.cur_xmult = card.ability.extra.cur_xmult + card.ability.extra.mod_xmult
    			return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
    		end
    	end
    	if context.joker_main then
    		return {
    			xmult = card.ability.extra.cur_xmult
    		}
    	end
	end
}