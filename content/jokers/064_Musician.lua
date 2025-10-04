SMODS.Joker {
    key = "musician",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(64, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { reroll_sale = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.reroll_sale or 0 } }
	end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.reroll_sale = G.GAME.current_round.discards_left
            G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.reroll_sale
            G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost - card.ability.extra.reroll_sale)
        end
        if context.ending_shop and context.cardarea == G.jokers and not context.blueprint then
            G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.reroll_sale
            G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + card.ability.extra.reroll_sale)
        end
    end
}