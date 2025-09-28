Dentalion_API.Trinket {
    key = "ringworm",
    pos = get_atlas_pos(20, 10),

    config = { extra = { odds = 4, type = 'Three of a Kind' } },

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
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "ringworm") then
                return {
                    card = card,
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}