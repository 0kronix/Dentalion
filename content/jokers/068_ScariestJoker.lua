SMODS.Joker {
    key = "scariestjoker",
    atlas = 'jokers',
    pos = get_atlas_pos(68, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
		return { vars = {  } }
	end,

    calculate = function(self, card, context)
		if G.GAME.current_round.hands_left == 0 and context.before and not context.blueprint and context.full_hand and G.hand
            and #context.full_hand == 1 and #G.hand.cards > 0 then

            local rnd_hand_card = pseudorandom_element(G.hand.cards, "scariestjoker")
            local score_card = context.full_hand[1]

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    rnd_hand_card:flip()
                    score_card:flip()
                    play_sound('card1')
                    rnd_hand_card:juice_up(0.3, 0.3)
                    score_card:juice_up(0.3, 0.3)
                    return true
                end
            }))
            delay(1)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    copy_card(rnd_hand_card, score_card)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    rnd_hand_card:flip()
                    score_card:flip()
                    play_sound('tarot2', 0.6)
                    rnd_hand_card:juice_up(0.3, 0.3)
                    score_card:juice_up(0.3, 0.3)
                    return true
                end
            }))
            delay(1)

            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local copy_card = copy_card(rnd_hand_card, nil, nil, G.playing_card)
            copy_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, copy_card)
            
            return {
                message = localize('k_copied_ex'),
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({ playing_card_added = true, cards = { copy_card } })
                            return true
                        end
                    }))
                end
            }
        end
	end
}