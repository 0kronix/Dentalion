Dentalion_API.Trinket {
    key = "brokenankh",
    pos = Dentalion.get_atlas_pos(68, 10),

    config = { extra = { odds = 1 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit 
        and Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "brokenankh") then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            local chosen_joker = pseudorandom_element(G.jokers.cards, 'broken_ankh_choice')
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.4,
                func = function()
                    local copied_joker = copy_card(chosen_joker, nil, nil, nil, chosen_joker.edition and chosen_joker.edition.negative)
                    copied_joker:start_materialize()
                    copied_joker:add_to_deck()
                    if copied_joker.edition and copied_joker.edition.negative then
                        copied_joker:set_edition(nil, true)
                    end
                    G.jokers:emplace(copied_joker)
                    card:start_dissolve()
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
        end
    end,
}