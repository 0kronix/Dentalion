Dentalion_API.Trinket {
    key = "callus",
    pos = Dentalion.get_atlas_pos(3, 10),

    config = { extra = { odds = 10 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and context.blind.boss then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "callus") then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.blind:disable()
                                play_sound('timpani')
                                delay(0.4)
                                return true
                            end
                        }))
                        SMODS.calculate_effect({ message = localize('ph_boss_disabled'), colour = G.C.RED }, card)
                        return true
                    end
                }))
            end
        end
    end
}