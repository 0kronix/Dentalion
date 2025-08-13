SMODS.Joker {
    key = "dreamcatcher",
    atlas = 'common-jokers',
    pos = {x = 0, y = 0},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { odds = 2 } },

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				G.GAME.probabilities.normal,
				card.ability.extra.odds,
				localize('High Card', 'poker_hands')
			}
		}
	end,

    calculate = function(self, card, context)
		if context.before and not context.repetition and not context.blueprintthen then
			if #context.full_hand == 1 and (context.full_hand[1]:get_id() == 2 or context.full_hand[1]:get_id() == 3) then
				if pseudorandom("dreamcatcher") < G.GAME.probabilities.normal / card.ability.extra.odds and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
					G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
					G.E_MANAGER:add_event(Event({
						trigger = 'before',
						delay = 0.0,
						func = (function()
							local _card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'vag')
							_card:add_to_deck()
							G.consumeables:emplace(_card)
							G.GAME.consumeable_buffer = 0
							return true
						end)
					}))
					return {
						message = localize('k_plus_tarot'),
						card = card
					}
				end
			end
		end
	end
}