SMODS.Joker {
    key = "firefly",
    atlas = 'common-jokers',
    pos = {x = 1, y = 0},

    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    
    config = { extra = { chips = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
            return {
                extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
                card = card
            }
        end
    end
}