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
	
    config = { extra = { mult = 32, odds = 32 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult / 2, G.GAME.probabilities.normal, card.ability.extra.odds / 2 } }
	end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers and not context.blueprint then
            if pseudorandom("beatsaber") < G.GAME.probabilities.normal / card.ability.extra.odds then
                if card.ability.extra.mult == 1 or card.ability.extra.odds == 1 then
                    card.ability.extra.mult = 32
                    card.ability.extra.odds = 32
                end
                card.ability.extra.mult = card.ability.extra.mult / 2
                card.ability.extra.odds = card.ability.extra.odds / 2
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}