Dentalion_API.Trinket {
    key = "pulseworm",
    pos = get_atlas_pos(18, 10),

    config = { extra = { odds = 4, type = 'High Card' } },

    atlas = 'trinkets',
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds, 
                localize(card.ability.extra.type, 'poker_hands')
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.type then
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "pulseworm") then
                return {
                    card = card,
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}