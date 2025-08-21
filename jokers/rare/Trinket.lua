SMODS.Joker {
    key = "trinket",
    atlas = 'rare-jokers',
    pos = {x = 1, y = 0},

    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 3, active = false } },

    loc_vars = function(self, info_queue, card)
    	if card.ability.extra.active then
			return { vars = { card.ability.extra.xmult, "Active!" } }
		else
			return { vars = { card.ability.extra.xmult, "Inactive" } }
		end
	end,

	update = function(self, card, dt)
		if #G.consumeables.cards + G.GAME.consumeable_buffer >= G.consumeables.config.card_limit then
			card.ability.extra.active = true
		else
			card.ability.extra.active = false
		end
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			if card.ability.extra.active then
				return {
					xmult = card.ability.extra.xmult,
				}
			end
		end
	end
}