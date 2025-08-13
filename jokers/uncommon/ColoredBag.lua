SMODS.Joker {
    key = "coloredbag",
    atlas = 'uncommon-jokers',
    pos = {x = 0, y = 0},

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
		return { vars = { 
					localize('Two Pair', 'poker_hands'),
					localize('Full House', 'poker_hands'),
					localize('Flush House', 'poker_hands')
				}
		}
	end,

    calculate = function(self, card, context)
		if context.before and next(context.poker_hands['Two Pair']) and not next(context.poker_hands['Full House']) and not next(context.poker_hands['Flush House']) and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
			local suits = { ['Hearts'] = 0, ['Diamonds'] = 0, ['Spades'] = 0, ['Clubs'] = 0 }
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].ability.name ~= 'Wild Card' then
                    if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
                end
            end
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i].ability.name == 'Wild Card' then
                    if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0  then suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0  then suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0  then suits["Clubs"] = suits["Clubs"] + 1 end
                end
            end
            if suits["Hearts"] > 0 and suits["Diamonds"] > 0 and suits["Spades"] > 0 and suits["Clubs"] > 0 then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
				)}))
                return {
                    message = localize('k_plus_spectral'),
                    colour = G.C.SECONDARY_SET.Spectral,
                    card = self
                }
            end
		end
	end
}