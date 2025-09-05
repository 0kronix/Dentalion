SMODS.Joker {
    key = "popupad",
    atlas = 'common-jokers',
    pos = {x = 3, y = 4},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { money = 6, round_money = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.round_money } }
	end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money > 0 and card.ability.extra.round_money == G.GAME.dollars then 
            return card.ability.extra.money
        end
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.round_money = G.GAME.dollars
        end
    end
}