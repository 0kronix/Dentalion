SMODS.Joker {
    key = "hexagonforce",
    atlas = 'uncommon-jokers',
    pos = {x = 2, y = 0},
	soul_pos = {x = 0, y = 7},

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 3 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult } }
	end,

    calculate = function(self, card, context)
		local sixes, all_cards = 0, 0
		if context.joker_main then
			for k, v in ipairs(context.full_hand) do
				all_cards = all_cards + 1
				if v:get_id() == 6 then
					sixes = sixes + 1
				end
			end
			if sixes == all_cards and all_cards >= 3 then 
				return {
					xmult = card.ability.extra.xmult,
				}
			end
		end
	end
}