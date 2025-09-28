SMODS.Joker {
    key = "paytoplay",
    atlas = 'jokers',
    pos = get_atlas_pos(103, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money = 5, slots = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money, card.ability.extra.slots } }
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money > 0 then return -card.ability.extra.money end
    end,

    add_to_deck = function(self, card, from_debuff)
        change_shop_size(card.ability.extra.slots)
    end,

    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.extra.slots)
    end,
}