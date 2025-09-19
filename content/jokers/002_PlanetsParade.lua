SMODS.Joker {
    key = "planetsparade",
    atlas = 'jokers',
    pos = get_atlas_pos(2, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { odds = 4 } },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds
			}
		}
	end,

    calculate = function(self, card, context)
		if context.using_consumeable and context.consumeable.ability.set == "Planet" then
			if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "planetsparade") then
				update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize('k_all_hands'),chips = '...', mult = '...', level=''})
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					play_sound('tarot1')
					return true end }))
				update_hand_text({delay = 0}, {mult = '+', StatusText = true})
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
					play_sound('tarot1')
					return true end }))
				update_hand_text({delay = 0}, {chips = '+', StatusText = true})
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
					play_sound('tarot1')
					return true end }))
				update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level='+1'})
				delay(1.3)
				for k, v in pairs(G.GAME.hands) do
					level_up_hand(self, k, true)
				end
				update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
				card:juice_up(0.3, 0.3)
			end
		end
	end
}