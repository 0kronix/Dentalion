SMODS.Joker {
    key = "blackclover",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(4, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { } },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
	end,

    calculate = function(self, card, context)
		if context.after and not context.blueprint and context.cardarea == G.jokers then
			for i = 1, #context.scoring_hand do
				if context.scoring_hand[i]:is_suit('Clubs', true) then
					G.E_MANAGER:add_event(Event({
						delay = 0.2,
						trigger = 'before',
						func = function()
							card:juice_up(0.3, 0.5)
							context.scoring_hand[i]:juice_up(0.3, 0.5)
							context.scoring_hand[i]:set_ability(G.P_CENTERS.m_lucky)
							return true
						end
					}))
					return {
						message = localize("dentalion_lucky_ex")
					}
				end
                delay(0.5)
            end
		end
	end
}