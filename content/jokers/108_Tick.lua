SMODS.Joker {
    key = "tick",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(108, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
    config = { extra = { blind_change = 25 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.blind_change } }
    end,

    add_to_deck = function(self, card, from_debuff)
        if not card.ability.eternal then
            card:set_eternal(true)
        end
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            ease_blind(card.ability.extra.blind_change, -1)
            return {
                message = "-" .. tostring(card.ability.extra.blind_change) .. "%"
            }
        end
    end,
}