Dentalion_API.Trinket {
    key = "petrifedpoop",
    pos = Dentalion.get_atlas_pos(52, 10),

    config = { extra = { odds = 7 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,
    calculate = function(self, card, context)
        if context.after then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "petrifedpoop") and #G.hand.cards > 0 then
                local temp_ID = 15
                local raised_card = nil
                for i = 1, #G.hand.cards do
                    if temp_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then
                        temp_ID = G.hand.cards[i].base.id
                        raised_card = G.hand.cards[i]
                    end
                end

                if not raised_card.debuff then
                    G.E_MANAGER:add_event(Event({
                        trigger = "after",
                        func = function()
                            raised_card:set_ability(G.P_CENTERS.m_stone)
                            card:juice_up()
                            return true
                        end
                    }))
                    return {
                        message = localize("dentalion_stone_ex"),
                        message_card = raised_card
                    }
                end
            end
        end
    end,
}