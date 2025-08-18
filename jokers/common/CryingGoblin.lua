SMODS.Joker {
    key = "cryinggoblin",
    atlas = 'common-jokers',
    pos = {x = 1, y = 3},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { chips = 20 } },

    loc_vars = function(self, info_queue, card)
    	info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
		return { vars = { card.ability.extra.chips } }
	end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and not context.other_card.lucky_trigger and context.other_card.ability.name == 'Lucky Card' and not context.blueprint then
            return {
                chips = card.ability.extra.chips
            }
        end
	end
}