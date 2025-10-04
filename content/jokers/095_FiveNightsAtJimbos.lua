SMODS.Joker {
    key = "fnaj",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(95, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 5, all = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.all } }
    end,

    remove_from_deck = function(self, card, from_debuff)
        ease_discard(-card.ability.extra.all)
    end,

    calculate = function(self, card, context)
        if context.pre_discard and not context.blueprint then
            if #G.hand.highlighted == G.GAME.current_round.discards_left then
                if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "fnaj") then
                    ease_discard(1)
                    card.ability.extra.all = card.ability.extra.all + 1
                    return {
                        message = localize("dentalion_plus_discard_ex"),
                        colour = G.C.RED
                    }
                end
            end
        end
        if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            ease_discard(-card.ability.extra.all)
            card.ability.extra.all = 0
            return {
                message = localize("k_reset"),
                colour = G.C.RED
            }
        end
    end,
}