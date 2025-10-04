SMODS.Joker {
    key = "doublesidedcoin",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(17, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money = 22 } },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'palindrome'}
		return { vars = { card.ability.extra.money } }
	end,

	calc_dollar_bonus = function(self, card)
		local s = tostring(hand_chips)
		if s == string.reverse(s) and #s > 1 then
			if card.ability.extra.money > 0 then return card.ability.extra.money end
		end
	end
}