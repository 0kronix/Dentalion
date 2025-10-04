SMODS.Joker {
    key = "flyingisland",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(56, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { chips = 5 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.chips
        } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.blueprint then
            local prev_card = Dentalion.on_left_or_right_of(context.other_card, context.scoring_hand, -1)
            if prev_card ~= nil and prev_card.base.suit == context.other_card.base.suit then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS,
                    message_card = context.other_card
                }
            end
        end
    end
}