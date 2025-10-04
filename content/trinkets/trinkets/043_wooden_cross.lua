Dentalion_API.Trinket {
    key = "woodencross",
    pos = Dentalion.get_atlas_pos(43, 10),

    config = { extra = { odds = 12, suit = "Clubs" } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
        return { 
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds,
                localize(card.ability.extra.suit, 'suits_singular')
            }
        }
    end,
    calculate = function(self, card, context)
        if context.after then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card.base.suit == card.ability.extra.suit and 
                Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "woodencross") then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card:set_edition("e_negative")
                            return true
                        end
                    }))
                    delay(0.5)
                    return {
                        message = localize("dentalion_negative_ex"),  
                        colour = G.ARGS.LOC_COLOURS.INDIGO
                    }
                end
            end
        end
    end,
}