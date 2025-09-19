SMODS.Joker {
    key = "lucifer",
    atlas = 'legendary-jokers',
    pos = get_atlas_pos(4, 5),
    soul_pos = {x = 3, y = 1},

    cost = 20,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
				
			}
		}
	end,

    calculate = function(self, card, context)
		if context.setting_blind and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                func = function()
                    SMODS.destroy_cards(pseudorandom_element(G.deck.cards, "lucifer"))
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                func = function()
                    local created_cards = {}
                    for i = 1, 1 do
                        local suits = {'S', 'H', 'D', 'C'}
                        local random_suit_prefix = suits[pseudorandom('lucifer_suit'..i, 1, #suits)]
                        local six_card_key = random_suit_prefix .. '_6'
                        local six_card_proto = G.P_CARDS[six_card_key]

                        local random_enhancement_key = SMODS.poll_enhancement({ guaranteed = true, key_append = 'lucifer_enhance'..i })
                        local random_seal_key = SMODS.poll_seal({ guaranteed = true, key_append = 'lucifer_seal'..i })

                        local random_edition_table = poll_edition('lucifer_edition'..i, nil, nil, true, {'e_foil', 'e_holo', 'e_polychrome'})

                        local new_six = create_playing_card({
                            front = six_card_proto,
                            center = G.P_CENTERS[random_enhancement_key or 'c_base'] 
                        }, G.hand, nil, true) 

            
                        if random_seal_key then new_six:set_seal(random_seal_key, true, true) end
                        if random_edition_table then new_six:set_edition(random_edition_table, true, true) end

                        G.GAME.blind:debuff_card(new_six)
                        table.insert(created_cards, new_six)
                        play_sound('card1', 0.9 + i*0.05, 0.5) 
                        new_six:juice_up(0.2, 0.1)
                    end

                    G.hand:sort()
                    playing_card_joker_effects(created_cards)
                    card:juice_up(0.5, 0.2)

                    return true
                end
            }))
            return nil, true
        end
	end
}