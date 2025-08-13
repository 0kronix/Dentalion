SMODS.Joker {
    key = "mitosis",
    atlas = 'common-jokers',
    pos = {x = 1, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {modmult = 8, curmult = 0} },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {key = 'tag_double', set = 'Tag'}
        return { vars = {card.ability.extra.modmult, card.ability.extra.curmult}}
    end,

    calculate = function(self, card, context)
		if context.before and not context.blueprint then
			for _, tag in ipairs(G.GAME.tags or {}) do
				if tag.name == "Double Tag" then
					card.ability.extra.curmult = card.ability.extra.curmult + card.ability.extra.modmult
				end
			end
		end
		if context.joker_main then
			if card.ability.extra.curmult > 0 then
				return {
					mult = card.ability.extra.curmult
				}
			end
		end
    end
}