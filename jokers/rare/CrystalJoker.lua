SMODS.Joker {
    key = "crystaljoker",
    atlas = 'rare-jokers',
    pos = {x = 0, y = 0},

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { repetitions = 1 } },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_glass
	end,

    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if context.other_card.ability.name == 'Glass Card' then
				return {
					message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
				}
			end
		end
	end
}