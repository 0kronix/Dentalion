SMODS.Joker {
    key = "givewaysign",
    atlas = 'common-jokers',
    pos = {x = 2, y = 1},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money = 1 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money } }
	end,
	
    calc_dollar_bonus = function(self, card)
		local slots = G.jokers.config.card_limit - #G.jokers.cards
		if slots > 0 then
			if card.ability.extra.money > 0 then return card.ability.extra.money * card.ability.extra.slots end
		end
	end
}