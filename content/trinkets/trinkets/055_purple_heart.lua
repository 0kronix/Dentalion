Dentalion_API.Trinket {
    key = "purpleheart",
    pos = Dentalion.get_atlas_pos(55, 10),

    config = { extra = { modify = 50, money = 5 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { 1 + card.ability.extra.modify * 0.01, card.ability.extra.money }
        }
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money ~= 0 then return card.ability.extra.money end
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            Dentalion.ease_blind(card.ability.extra.modify, 1)
            card:juice_up()
        end
    end,
}