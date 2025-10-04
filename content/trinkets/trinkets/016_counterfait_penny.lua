Dentalion_API.Trinket {
    key = "counterfaitpenny",
    pos = Dentalion.get_atlas_pos(16, 10),

    config = { extra = { odds = 3, money = 1, suit = 'Diamonds' } },

    atlas = 'trinkets',
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                G.GAME.probabilities.normal,
                card.ability.extra.odds,
                card.ability.extra.money,
                localize(card.ability.extra.suit, 'suits_singular') 
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) and 
            Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "counterfaitpenny") then
                return {
                    dollars = card.ability.extra.money,
                    message_card = context.other_card
                }
            end
        end
    end
}