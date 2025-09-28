Dentalion_API.Trinket {
    key = "missingposter",
    pos = get_atlas_pos(6, 10),

    atlas = 'trinkets',
    unlocked = true,

    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {  }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local all = {}
                    for _, joker in ipairs(G.jokers.cards) do
                        table.insert(all, joker)
                    end
                    for _, cons in ipairs(G.consumeables.cards) do
                        table.insert(all, cons)
                    end
                    table.insert(all, card)
                    SMODS.destroy_cards(all)
                    G.GAME.dollars = 0
                    return true
                end
            }))
            return {
                message = localize('k_saved_ex'),
                saved = 'ph_dentalion_missing_poster',
                colour = G.C.RED
            }
        end
    end
}