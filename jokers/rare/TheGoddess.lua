SMODS.Joker {
    key = "thegoddess",
    atlas = 'rare-jokers',
    pos = {x = 2, y = 0},

    cost = 8,
    rarity = 3,
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
		if context.joker_main then
			local aces = 0
			for i = 1, #G.hand.cards do
				if G.hand.cards[i].base.id == 14 and G.hand.cards[i].ability.effect ~= 'Stone Card' then
					aces = aces + 1
				end
			end
			if aces >= 3 then
				return {
					xmult = card.ability.extra.xmult
				}
			end
		end
	end
}