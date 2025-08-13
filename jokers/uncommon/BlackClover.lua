SMODS.Joker {
    key = "blackclover",
    atlas = 'uncommon-jokers',
    pos = {x = 4, y = 0},

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
                if context.scoring_hand[i].ability.name ~= 'Wild Card' then
					if context.scoring_hand[i]:is_suit('Clubs', true) then
						if context.scoring_hand[i].set_ability then
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								func = function()
									context.scoring_hand[i]:juice_up()
									context.scoring_hand[i]:set_ability(G.P_CENTERS.m_lucky)
									return true
								end
							}))
						end
					end
				elseif context.scoring_hand[i].ability.name == 'Wild Card' then
					if context.scoring_hand[i]:is_suit('Clubs', true) then
						if context.scoring_hand[i].set_ability then
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								func = function()
									context.scoring_hand[i]:juice_up()
									context.scoring_hand[i]:set_ability(G.P_CENTERS.m_lucky)
									return true
								end
							}))
						end
					end
                end
            end
		end
	end
}