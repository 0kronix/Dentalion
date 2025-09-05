SMODS.Joker {
    key = "nahidwin",
    atlas = 'common-jokers',
    pos = {x = 3, y = 3},

    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { mod_chips = 10, cur_chips = 0 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mod_chips, card.ability.extra.cur_chips } }
	end,

    calculate = function(self, card, context)
		if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            if G.GAME.current_round.hands_played == 2 then
                card.ability.extra.cur_chips = card.ability.extra.cur_chips + card.ability.extra.mod_chips
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.cur_chips
            }
        end
	end
}