SMODS.Joker {
    key = "doppelganger",
    atlas = 'jokers',
    pos = get_atlas_pos(73, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
	end,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_left == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and context.main_eval and G.GAME.current_round.hands_left == 0 and #context.full_hand == 2 then
            if context.full_hand[1].base.suit == context.full_hand[2].base.suit and 
                context.full_hand[1].base.value == context.full_hand[2].base.value then

                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                copy_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copy_card)
                G.hand:emplace(copy_card)
                copy_card.states.visible = nil

                G.E_MANAGER:add_event(Event({
                    func = function()
                        copy_card:start_materialize()
                        return true
                    end
                }))

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
	end
}