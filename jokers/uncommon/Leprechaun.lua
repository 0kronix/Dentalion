SMODS.Joker {
    key = "leprechaun",
    atlas = 'uncommon-jokers',
    pos = {x = 2, y = 3},

    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money = 50, max_bonus = 3, cur_bonus = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
                    card.ability.extra.money,
                    card.ability.extra.max_bonus,
                    card.ability.extra.cur_bonus
                } }
    end,

    update = function(self, card, dt)
        card.ability.extra.cur_bonus = math.min(card.ability.extra.max_bonus, 
            math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.money))
    end,

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator + card.ability.extra.cur_bonus
            }
        end
    end
}