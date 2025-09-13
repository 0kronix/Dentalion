SMODS.Back {
    key = "fashion",
    atlas = "decks",
    pos = { x = 0, y = 0},
    config = {
        joker_slot = -2,
        dollars = 6
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
                    card:add_to_deck()
                    card:start_materialize()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
    end
}