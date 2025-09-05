SMODS.Joker {
    key = "decay",
    atlas = 'common-jokers',
    pos = {x = 0, y = 1},

    pixel_size = { w = 71, h = 52 },

    cost = 3,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    
    config = { extra = { odds = 20 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.destroy_card and not context.blueprint then
            if pseudorandom("decay") < G.GAME.probabilities.normal / card.ability.extra.odds then
                return { remove = true }
            end
        end
    end
}