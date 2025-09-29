Dentalion_API.Trinket {
    key = "rainbowworm",
    pos = get_atlas_pos(24, 10),

    config = { extra = { odds = 4, type1 = 'Flush', type2 = 'Flush Five' } },

    atlas = 'trinkets',
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds, 
                localize(card.ability.extra.type1, 'poker_hands'),
                localize(card.ability.extra.type2, 'poker_hands')
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and (context.scoring_name == card.ability.extra.type1 or context.scoring_name == card.ability.extra.type2) then
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "rainbowworm") then
                return {
                    card = card,
                    level_up = true,
                    message = localize('k_level_up_ex')
                }
            end
        end
    end
}