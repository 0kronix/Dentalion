SMODS.Joker {
    key = "plantsvsjokers",
    atlas = 'uncommon-jokers',
    pos = {x = 1, y = 3},

    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_xchips = 1, mod_xchips = 0.35 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
                    card.ability.extra.cur_xchips,
                    card.ability.extra.mod_xchips
                } }
    end,

    calculate = function(self, card, context)
        card.ability.extra.cur_xchips = 1 + card.ability.extra.mod_xchips * G.GAME.shop.joker_max
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xchips = card.ability.extra.cur_xchips
            }
        end
    end
}