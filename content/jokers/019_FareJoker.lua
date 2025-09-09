SMODS.Joker {
    key = "farejoker",
    atlas = 'jokers',
    pos = get_atlas_pos(19, 10),

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
            card.ability.extra.cur_mult = card.ability.extra.cur_mult + math.floor(card.sell_cost)
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                card = card
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.cur_mult
            }
        end
	end
}