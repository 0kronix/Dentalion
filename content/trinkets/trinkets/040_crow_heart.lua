Dentalion_API.Trinket {
    key = "crowheart",
    pos = Dentalion.get_atlas_pos(40, 10),

    config = { extra = { odds = 7, from = "Hearts", to = "Spades" } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds,
                localize(card.ability.extra.from, 'suits_singular'),
                localize(card.ability.extra.to, 'suits_singular')
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card.base.suit == card.ability.extra.from and 
                Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "crowheart") then
                    card:juice_up()
                    convert_to(scored_card, card.ability.extra.to, nil)
                end
            end
        end
    end,
}