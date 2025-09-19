SMODS.Joker {
    key = "crystaljoker",
    atlas = 'jokers',
    pos = get_atlas_pos(5, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { rep = 2 } },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return { vars = { card.ability.extra.rep } }
	end,

    calculate = function(self, card, context)
		if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if context.other_card.ability.name == 'Glass Card' then
				return {
					message = localize('k_again_ex'),
                    repetitions = card.ability.extra.rep,
                    messege_card = context.other_card
				}
			end
		end
	end
}