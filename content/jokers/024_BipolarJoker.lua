SMODS.Joker {
    key = "bipolarjoker",
    atlas = 'jokers',
    pos = get_atlas_pos(24, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
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
        if context.before then
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "bipolarjoker") then
                local chose = pseudorandom_element({-1, 1}, "bipolarjoker" .. G.GAME.round_resets.ante)
                ease_blind(card.ability.extra.blind_change, chose)
            end
        end
	end
}