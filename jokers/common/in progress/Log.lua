SMODS.Joker {
    key = "log",
    atlas = 'common-jokers',
    pos = {x = 2, y = 1},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 2 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, localize('Three of a Kind', 'poker_hands') } }
	end,

    calculate = function(self, card, context)
		local log = false
		local workl = true
		if context.setting_blind then
			workl = true
			log = false
		end
		if context.before and next(context.poker_hands['Three of a Kind']) then
			log = true
		end
		if context.joker_main then
			if log == true then
				if workl == true then
					workl = false
					return {
						xmult = card.ability.extra.xmult
					}
				end
			end
		end
	end
}