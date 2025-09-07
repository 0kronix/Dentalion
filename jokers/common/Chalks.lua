SMODS.Joker {
    key = "chalks",
    atlas = 'common-jokers',
    pos = {x = 1, y = 2},

    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 10 } },

    loc_vars = function(self, info_queue, card)
    	info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
		return { vars = { 
				G.GAME.probabilities.normal,
				card.ability.extra.odds
			}
		}
	end,

    calculate = function(self, card, context)
		if context.after and not context.blueprint then
			if context.full_hand and #context.full_hand > 0 then
				for _, played_card in ipairs(context.full_hand) do
					if played_card.ability.name ~= 'Wild Card' and pseudorandom("chalks") < G.GAME.probabilities.normal / card.ability.extra.odds then
						G.E_MANAGER:add_event(Event({
							trigger = 'before',
							delay = 0.5,
							func = function()
								played_card:juice_up()
								played_card:set_ability(G.P_CENTERS.m_wild)
								return true
							end
						}))
						delay(0.5)
						return {
							message = "Wild"
						}
					end
				end
			end
		end
	end
}