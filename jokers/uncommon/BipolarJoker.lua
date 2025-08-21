SMODS.Joker {
    key = "bipolarjoker",
    atlas = 'uncommon-jokers',
    pos = {x = 2, y = 2},

    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 4, blind_change = 15 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { 
            G.GAME.probabilities.normal,
            card.ability.extra.odds,
            card.ability.extra.blind_change
        } }
	end,

    calculate = function(self, card, context)
        local rand = math.random(1, 2)
        local a = {-1, 1}
        if context.before then
            if pseudorandom("bipolarjoker") < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.GAME.blind.chips = G.GAME.blind.chips + a[rand] * math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01))
                G.GAME.blind.chip_text = G.GAME.blind.chips
                if a[rand] > 0 then
                    return {
                        message = "+" .. card.ability.extra.blind_change .. "%",
                        card = card
                    }
                else
                    return {
                        message = "-" .. card.ability.extra.blind_change .. "%",
                        card = card
                    }
                end
            end
        end
	end
}