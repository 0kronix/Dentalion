SMODS.Joker {
    key = "dinosaur",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(3, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { activated = false } },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
	end,

    calculate = function(self, card, context)
		if context.after and not context.blueprint and context.cardarea == G.jokers then
			if #context.scoring_hand == #context.full_hand then
				card.ability.extra.activated = false
			end
			if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
				local scoring_lookup = {}
				for _, scoring_card in ipairs(context.scoring_hand) do
					scoring_lookup[scoring_card.sort_id or scoring_card] = true
				end
				for _, played_card in ipairs(context.full_hand) do
					if not scoring_lookup[played_card.sort_id or played_card] and played_card.ability.name ~= 'Stone Card' then
						card.ability.extra.activated = true
						if played_card.set_ability then
							G.E_MANAGER:add_event(Event({
								trigger = 'before',
								func = function()
									played_card:juice_up()
									played_card:set_ability(G.P_CENTERS.m_stone)
									return true
								end
							}))
						end
					end
				end
			end
			if card.ability.extra.activated then
				return {
					message = localize("dentalion_stone_ex"),
					card = card
				}
			end
		end
	end
}