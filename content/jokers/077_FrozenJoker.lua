SMODS.Joker {
    key = "frozenjoker",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(77, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_dentalion_frozen']
        return { vars = {  } }
	end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if SMODS.has_enhancement(context.other_card, "m_dentalion_frozen") then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    message_card = context.other_card
                }
            end
        end
	end
}