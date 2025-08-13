SMODS.Joker {
    key = "chalks",
    atlas = 'common-jokers',
    pos = {x = 1, y = 2},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 10 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { 
				G.GAME.probabilities.normal,
				card.ability.extra.odds
				}
		}
	end,

    calculate = function(self, card, context)
		if context.after and not context.blueprint and context.cardarea == G.jokers then
			if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
				for _, played_card in ipairs(context.full_hand) do
					if played_card.ability.name ~= 'Wild Card' then
						if pseudorandom("chalks") < G.GAME.probabilities.normal / card.ability.extra.odds then
							card.ability.extra.activated = true
							if played_card.set_ability then
								G.E_MANAGER:add_event(Event({
									trigger = 'before',
									func = function()
										played_card:juice_up()
										played_card:set_ability(G.P_CENTERS.m_wild)
										return true
									end
								}))
							end
						end
					end
				end
			end
			if card.ability.extra.activated then
				return {
					message = 'Wild',
					card = card
				}
			end
		end
	end
}