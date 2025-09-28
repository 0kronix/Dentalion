Dentalion_API.Trinket {
    key = "safetyscissors",
    pos = get_atlas_pos(17, 10),

    config = { extra = { odds = 3 } },

    atlas = 'trinkets',
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds, 
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after then
            for _, playing_card in ipairs(context.scoring_hand) do
                if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "safetyscissors") 
                and next(SMODS.get_enhancements(playing_card)) ~= nil then
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        func = function()
                            playing_card:set_ability(G.P_CENTERS.c_base)
                            playing_card:juice_up()
                            card:juice_up()
                            play_sound("slice1")
                            return true
                        end
                    }))
                end
            end
        end
    end
}