Dentalion_API.Trinket {
    key = "blacklipstick",
    pos = Dentalion.get_atlas_pos(60, 10),

    config = { extra = { chips = 2 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.chips }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and Dentalion.is_dark_suit(context.other_card) and context.cardarea == G.play then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
            return {
                message = localize('k_upgrade_ex'), 
                colour = G.C.CHIPS,
                message_card = context.other_card
            }
        end
    end,
}