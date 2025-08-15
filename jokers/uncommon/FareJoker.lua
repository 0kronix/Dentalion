SMODS.Joker {
    key = "farejoker",
    atlas = 'uncommon-jokers',
    pos = {x = 4, y = 1},

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_mult = 0 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cur_mult } }
	end,

    calculate = function(self, card, context)
    	if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            card.ability.extra.cur_mult = card.ability.extra.cur_mult + math.floor(card.sell_cost / 2)
            return {
                message = 'Upgrade!',
                card = card,
                colour = G.C.MULT
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.cur_mult
            }
        end
	end
}