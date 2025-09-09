SMODS.Joker {
    key = "givewaysign",
    atlas = 'jokers',
    pos = get_atlas_pos(18, 10),

    pixel_size = { w = 71, h = 62 },

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    
    config = { extra = { money = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, G.jokers and (card.ability.extra.money * (G.jokers.config.card_limit - #G.jokers.cards)) or 0 } }
    end,
    
    calc_dollar_bonus = function(self, card)
        if G.jokers.config.card_limit - #G.jokers.cards > 0 then
            if card.ability.extra.money > 0 then 
                return card.ability.extra.money * (G.jokers.config.card_limit - #G.jokers.cards)
            end
        end
    end
}