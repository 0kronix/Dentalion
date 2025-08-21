SMODS.Joker {
    key = "pegasus",
    atlas = 'rare-jokers',
    pos = {x = 1, y = 1},

    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 5 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { 
			card.ability.extra.xmult,
			localize('High Card', 'poker_hands'),
			localize('Pair', 'poker_hands'),
			localize('Two Pair', 'poker_hands'),
			localize('Three of a Kind', 'poker_hands')
		} }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
		if context.debuff_hand then
            if context.scoring_name == localize('High Card', 'poker_hands') or 
            	context.scoring_name == localize('Pair', 'poker_hands') or 
            	context.scoring_name == localize('Two Pair', 'poker_hands') or 
            	context.scoring_name == localize('Three of a Kind', 'poker_hands') then
                return {
                    debuff = true,
                    debuff_text = localize('High Card', 'poker_hands') .. ", " .. localize('Pair', 'poker_hands') .. ", " .. localize('Two Pair', 'poker_hands') .. " or " .. localize('Three of a Kind', 'poker_hands') .. " are debuffed"
                }
            end
        end
	end
}