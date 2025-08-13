SMODS.Joker {
    key = "trinket",
    atlas = 'rare-jokers',
    pos = {x = 1, y = 0},

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
			if #G.consumeables.cards + G.GAME.consumeable_buffer >= G.consumeables.config.card_limit then
				return {
					xmult = card.ability.extra.xmult,
				}
			end
		end
	end
}