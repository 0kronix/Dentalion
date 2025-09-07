SMODS.Joker {
    key = "obsidian",
    atlas = 'rare-jokers',
    pos = {x = 0, y = 1},

    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { chips = 0, mod_chips = 2 } },

    loc_vars = function(self, info_queue, card)
    	info_queue[#info_queue+1] = {set = 'Other', key = 'dark_suits'}
    	info_queue[#info_queue+1] = {set = 'Other', key = 'light_suits'}
    	info_queue[#info_queue+1] = {set = 'Other', key = 'suits_change'}
		return { vars = { card.ability.extra.chips, card.ability.extra.mod_chips } }
	end,

    calculate = function(self, card, context)
    	local count = 0
		if context.before and not context.blueprint then
			for _, played_card in ipairs(context.scoring_hand) do
                if played_card:is_suit('Spades', true) or played_card:is_suit('Clubs', true) then
                	count = count + 1
                end
            end
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.mod_chips * count
            if count > 0 then
	            return {
	        		extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
	                card = card
	        	}
        	end
        end
        if context.joker_main then
        	return {
        		chips = card.ability.extra.chips
        	}
        end
        if context.after and not context.blueprint and context.cardarea == G.jokers then
			if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
				for _, played_card in ipairs(context.scoring_hand) do
					if played_card:is_suit('Hearts', true) or played_card:is_suit('Diamonds', true) then
						G.E_MANAGER:add_event(Event({
			                trigger = 'after',
			                delay = 0.15,
			                func = function()
			                    played_card:flip()
			                    play_sound('card1')
			                    played_card:juice_up(0.3, 0.3)
			                    return true
			                end
			            }))
			            delay(0.2)
			            if played_card:is_suit('Hearts', true) then
				            G.E_MANAGER:add_event(Event({
				                trigger = 'after',
				                delay = 0.1,
				                func = function()
				                    SMODS.change_base(played_card, "Spades")
				                    return true
				                end
				            }))
				        elseif played_card:is_suit('Diamonds', true) then
				            G.E_MANAGER:add_event(Event({
				                trigger = 'after',
				                delay = 0.1,
				                func = function()
				                    SMODS.change_base(played_card, "Clubs")
				                    return true
				                end
				            }))
				        end
				        G.E_MANAGER:add_event(Event({
			                trigger = 'after',
			                delay = 0.15,
			                func = function()
			                    played_card:flip()
			                    play_sound('card1')
			                    played_card:juice_up(0.3, 0.3)
			                    return true
			                end
			            }))
			            delay(0.5)
			        end
			    end
			end
        end
	end
}