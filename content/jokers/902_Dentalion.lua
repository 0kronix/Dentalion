SMODS.Joker {
    key = "dentalion",
    atlas = 'legendary-jokers',
    pos = Dentalion.get_atlas_pos(2, 5),
    soul_pos = {x = 1, y = 1},

    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_xmult = 1, mod_xmult = 1, cur_sell = 0 } },

    loc_vars = function(self, info_queue, card)
		return {
            vars = {
                card.ability.extra.cur_xmult,
                card.ability.extra.mod_xmult,
                card.ability.extra.cur_sell
            }
        }
	end,

    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
            local card_sell = context.card.sell_cost
            card.ability.extra.cur_sell = card.ability.extra.cur_sell + card_sell
            if card.ability.extra.cur_sell >= 15 then
                card.ability.extra.cur_xmult = card.ability.extra.cur_xmult + card.ability.extra.mod_xmult
                card.ability.extra.cur_sell = card.ability.extra.cur_sell - 15
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MONEY
                }
            else
                return {
                    message = "+$" .. tostring(card_sell),
                    colour = G.C.MONEY
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.cur_xmult
            }
        end
	end
}