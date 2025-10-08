Dentalion_API.Trinket {
    key = "fishhead",
    pos = Dentalion.get_atlas_pos(69, 10),

    config = { extra = { odds = 5, chips = 5 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.chips }
        }
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local cnt = 0
            for _, playing_card in ipairs(G.hand.cards) do
                if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "fishhead") then
                    cnt = cnt + 1
                    G.E_MANAGER:add_event(Event({
                        delay = 0.2,
                        func = function()
                            playing_card.ability.perma_bonus = playing_card.ability.perma_bonus or 0
                            playing_card.ability.perma_bonus = playing_card.ability.perma_bonus + card.ability.extra.chips
                            playing_card:juice_up()
                            return true
                        end
                    }))
                end
            end

            if cnt > 0 then
                return {
                    message = localize('k_upgrade_ex'), 
                    colour = G.C.CHIPS
                }
            end
        end
    end,
}