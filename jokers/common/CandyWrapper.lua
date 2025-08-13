SMODS.Joker {
    key = "candywrapper",
    atlas = 'common-jokers',
    pos = {x = 3, y = 1},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money = 3 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money } }
	end,

    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			if context.other_card.edition ~= nil then
                return {
                    dollars = card.ability.extra.money,
					card = card
                }
			end
		end
	end
}