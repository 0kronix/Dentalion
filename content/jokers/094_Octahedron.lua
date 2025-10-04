SMODS.Joker {
    key = "octahedron",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(94, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money = 3 } },

    loc_vars = function(self, info_queue, card)
        local h_diamonds = 0
        if card.area and card.area == G.jokers then
            for _, h_card in ipairs(G.hand.cards) do
                if not Dentalion.table_find(G.hand.highlighted, h_card) and h_card:is_suit("Diamonds") then
                    h_diamonds = h_diamonds + 1
                end
            end
        end
        return { vars = { card.ability.extra.money, card.ability.extra.money * h_diamonds } }
    end,

    calculate = function(self, card, context)
        local h_diamonds = 0
        for _, h_card in ipairs(G.hand.cards) do
            if not Dentalion.table_find(G.hand.highlighted, hcard) and h_card:is_suit("Diamonds") then
                h_diamonds = h_diamonds + 1
            end
        end
        if context.individual and context.cardarea == G.play then
            return {
                dollars = card.ability.extra.money * h_diamonds
            }
        end
    end,
}