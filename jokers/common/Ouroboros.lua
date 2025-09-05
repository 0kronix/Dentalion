SMODS.Joker {
    key = "ouroboros",
    atlas = 'common-jokers',
    pos = {x = 0, y = 3},

    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { chips = 10, min_ret = 0, max_ret = 20 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { 
			card.ability.extra.chips,
			card.ability.extra.max_ret
		} }
	end,

    calculate = function(self, card, context)
		if context.repetition_only or (context.retrigger_joker_check) then
        	local ret = pseudorandom('ouroboros', card.ability.extra.min_ret, card.ability.extra.max_ret)
	        if context.other_card == card then
	            return {
	                repetitions = ret,
	                card = card,
	                message = localize('k_again_ex')
	            }  
	        end
      	end
      	if context.joker_main then
        	return {
            	chips = card.ability.extra.chips
        	}
      	end
	end
}