SMODS.Joker {
    key = "bipolarjoker",
    atlas = 'uncommon-jokers',
    pos = {x = 2, y = 2},

    cost = 5,
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
        if context.before and context.cardarea == G.jokers then
            if pseudorandom("bipolarjoker") < G.GAME.probabilities.normal / card.ability.extra.odds then
                local chose = pseudorandom_element({-1, 1}, "bipolarjoker" .. G.GAME.round_resets.ante)
                G.GAME.blind.chips = G.GAME.blind.chips + chose * math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01))
                card:juice_up(0.3, 0.5)
                G.E_MANAGER:add_event(Event({
                    trigger = "ease",
                    delay = 0.5,
                    ref_table = G.GAME.blind,
                    ref_value = "chip_text",
                    ease_to = G.GAME.blind.chip_text + chose * math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01)),
                    func = (function(t)
                        return math.floor(t)
                    end)
                }))
            end
        end
	end
}