SMODS.Joker {
    key = "mutantjoker",
    atlas = 'common-jokers',
    pos = {x = 4, y = 1},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 8 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
	end,

    calculate = function(self, card, context)
		if context.after and not context.blueprint then
			if context.full_hand and #context.full_hand > 0 then
				for _, i in ipairs(context.full_hand) do
					if pseudorandom("mutantjoker") < G.GAME.probabilities.normal / card.ability.extra.odds and not i:is_face() then
			            G.E_MANAGER:add_event(Event({
			                trigger = 'after',
			                delay = 0.1,
			                func = function()
			                    assert(SMODS.modify_rank(i, 1))
			                    i:juice_up(0.3, 0.5)
			                    return true
			                end
			            }))
						return {
							message = "Mutation!",
							card = card,
							colour = G.C.GREEN
						}
					end
				end
			end
		end
	end
}