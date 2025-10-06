Dentalion_API.Trinket {
    key = "mysteriouscandy",
    pos = Dentalion.get_atlas_pos(67, 10),

    config = { extra = { odds = 2, xmult = 1.2, scored = 0 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.xmult }
        }
    end,

    equip = function(self, card)
        if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "mysteriouscandy") then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            card:remove()
                            return true
                        end
                    }))
                    return true
                end
            }))
            return {
                message = localize('k_eaten_ex')
            }
        end
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.scored = card.ability.extra.scored + 1
            if card.ability.extra.scored >= 3 then
                card.ability.extra.scored = 0
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end,
}