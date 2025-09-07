SMODS.Joker {
    key = "partner",
    atlas = 'common-jokers',
    pos = {x = 3, y = 2},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { mod_mult = 1, mod_chips = 3, cur_mult = 0, cur_chips = 0 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { 
			card.ability.extra.mod_chips, 
			card.ability.extra.mod_mult, 
			card.ability.extra.cur_chips, 
			card.ability.extra.cur_mult
		} }
	end,

    calculate = function(self, card, context)
		if context.pre_discard and not context.blueprint then
			if G.hand and G.hand.highlighted and #G.hand.highlighted > 0 then
                if G.FUNCS.get_poker_hand_info(G.hand.highlighted) == "Pair" then 
					card.ability.extra.cur_mult = card.ability.extra.cur_mult + card.ability.extra.mod_mult
					card.ability.extra.cur_chips = card.ability.extra.cur_chips + card.ability.extra.mod_chips
					return {
						extra = { message = localize('k_upgrade_ex') },
		                card = card
		        	}
		        end
	        end
	    end
	    if context.joker_main then
	    	return {
	    		chips = card.ability.extra.cur_chips,
	    		mult = card.ability.extra.cur_mult
	    	}
	    end
	end
}