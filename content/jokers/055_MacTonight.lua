SMODS.Joker {
    key = "mactonight",
    atlas = 'jokers',
    pos = get_atlas_pos(55, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { money = 4 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_moon']
        return { vars = { card.ability.extra.money } }
	end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.key == "c_moon" then
            G.jokers.cards[1].sell_cost = G.jokers.cards[1].sell_cost + card.ability.extra.money                    
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY,
            }
        end
    end
}