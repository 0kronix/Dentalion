SMODS.Joker {
    key = "marbas",
    atlas = 'legendary-jokers',
    pos = get_atlas_pos(1, 5),
    soul_pos = {x = 0, y = 1},

    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 4 } },

    loc_vars = function(self, info_queue, card)
		return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
	end,

    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers then
            if G.GAME.blind.boss and not context.blueprint then
                if pseudorandom("marbas") < G.GAME.probabilities.normal / card.ability.extra.odds then
            		local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local eligible_card = pseudorandom_element(editionless_jokers, 'marbas')
                            eligible_card:set_edition({ negative = true })
                            return true
                        end
                    }))
                end
            end
        end
	end
}