SMODS.Joker {
    key = "giantcarrot",
    atlas = 'common-jokers',
    pos = {x = 2, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {chips = 100} },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
		if context.joker_main then
			local max_ID = 0
			for i = 1, #G.hand.cards do
                if max_ID <= G.hand.cards[i].base.id and G.hand.cards[i].ability.effect ~= 'Stone Card' then
					max_ID = G.hand.cards[i].base.id
				end
				if max_ID >= 2 and max_ID <= 10 then
                    return {
                        chips = card.ability.extra.chips
                    }
                end
            end
		end
    end
}