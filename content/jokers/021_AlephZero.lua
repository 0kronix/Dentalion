SMODS.Joker {
    key = "alephzero",
    atlas = 'jokers',
    pos = get_atlas_pos(21, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { } },

    loc_vars = function(self, info_queue, card)

	end,

    calculate = function(self, card, context)
		if context.after and not context.blueprint then
			if context.full_hand and #context.full_hand > 0 then
				if context.full_hand[1]:get_id() >= 3 * context.full_hand[#context.full_hand]:get_id() then
        			G.E_MANAGER:add_event(Event({
            			trigger = 'after',
            			delay = 0.15,
            			func = function()
            				context.full_hand[1]:flip()
                			context.full_hand[#context.full_hand]:flip()
                			play_sound('card1')
			                context.full_hand[1]:juice_up(0.3, 0.3)
			                context.full_hand[#context.full_hand]:juice_up(0.3, 0.3)
			                return true
			            end
			        }))
			        delay(0.2)
			        G.E_MANAGER:add_event(Event({
			            trigger = 'after',
			            delay = 0.1,
			            func = function()
			                if context.full_hand[1] ~= context.full_hand[#context.full_hand] then
			                    copy_card(context.full_hand[1], context.full_hand[#context.full_hand])
			                end
			                return true
			            end
			        }))
			        delay(0.2)
			        G.E_MANAGER:add_event(Event({
            			trigger = 'after',
            			delay = 0.15,
            			func = function()
            				context.full_hand[1]:flip()
                			context.full_hand[#context.full_hand]:flip()
                			play_sound('card1')
			                context.full_hand[1]:juice_up(0.3, 0.3)
			                context.full_hand[#context.full_hand]:juice_up(0.3, 0.3)
			                return true
			            end
			        }))
			        delay(2)
				end
			end
		end
	end
}