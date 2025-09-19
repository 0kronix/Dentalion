SMODS.Joker {
    key = "candywrapper",
    atlas = 'jokers',
    pos = get_atlas_pos(20, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    
    config = { extra = { money = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.edition then
                return {
                    dollars = card.ability.extra.money,
                    message_card = context.other_card
                }
            end
        end
    end
}