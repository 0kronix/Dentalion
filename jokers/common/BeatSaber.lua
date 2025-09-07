SMODS.Joker {
    key = "beatsaber",
    atlas = 'common-jokers',
    pos = {x = 2, y = 0},

    cost = 2,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mult_odds = 64 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, card.ability.extra.mult_odds } }
	end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and not context.blueprint then
            if pseudorandom("beatsaber") < G.GAME.probabilities.normal / card.ability.extra.mult_odds then
                return {
                    mult = card.ability.extra.mult_odds
                }
            else
                card.ability.extra.mult_odds = card.ability.extra.mult_odds / 2
                if card.ability.extra.mult_odds <= 1 then
                    card.ability.extra.mult_odds = 64
                    return {
                        message = localize("k_reset")
                    }
                end
                return {
                    message = localize("k_nope_ex"),
                }
            end
        end
    end
}