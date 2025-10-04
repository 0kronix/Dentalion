Dentalion_API.Trinket {
    key = "stemcell",
    pos = Dentalion.get_atlas_pos(42, 10),

    config = { extra = { odds = 8 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and #context.full_hand > 2 and prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "stemcell") then
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local copy_card = copy_card(pseudorandom_element(context.full_hand, "stemcell"), nil, nil, G.playing_card)
            copy_card:add_to_deck()
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            table.insert(G.playing_cards, copy_card)
            copy_card.states.visible = nil

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
    end,
}