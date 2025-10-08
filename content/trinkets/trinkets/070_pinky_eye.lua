Dentalion_API.Trinket {
    key = "pinkyeye",
    pos = Dentalion.get_atlas_pos(70, 10),

    config = { extra = { odds = 5 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,

    calculate = function(self, card, context)
        if context.pre_discard and #G.hand.highlighted == 1 then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "pinkyeye") then
                ease_discard(1)
            end
        end
    end,
}