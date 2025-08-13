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
		if context.after and not context.blueprint and context.cardarea == G.jokers then
			if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
				for i in ipairs(context.full_hand) do
					if pseudorandom("mutantjoker") < G.GAME.probabilities.normal / card.ability.extra.odds then
						G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.7,func = function()
							local card = context.full_hand[i]
							local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
							local rank_suffix = card.base.id + 1
							if rank_suffix < 10 then rank_suffix = tostring(rank_suffix)
							elseif rank_suffix == 11 then rank_suffix = 'J'
							else return true
							end
							card:juice_up()
							card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
							delay(0.5)
						return true end }))
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