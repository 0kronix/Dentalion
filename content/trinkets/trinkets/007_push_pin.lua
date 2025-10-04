Dentalion_API.Trinket {
    key = "pushpin",
    pos = Dentalion.get_atlas_pos(7, 10),

    atlas = 'trinkets',
    unlocked = true,

    config = { extra = { odds = 5 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,

    calculate = function(self, card, context)
        if context.after then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "pushpin") then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        card:juice_up()
                        context.scoring_hand[#context.scoring_hand]:start_dissolve()
                        return true
                    end
                }))
                delay(1)
            end
        end
    end
}