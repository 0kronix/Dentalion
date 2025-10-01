Dentalion_API.Trinket {
    key = "aaabattery",
    pos = get_atlas_pos(53, 10),

    config = { extra = { odds = 2, type = "Three of a Kind" } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.type }
        }
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_name == card.ability.extra.type and 
        prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "aaabattery") then
            local check = true
            for _, scored_card in ipairs(context.scoring_hand) do
                if not scored_card.base.value == "Ace" then
                    check = false
                end
            end

            if check then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    func = function()
                        create_tag(nil, "aaabattery_tag")
                        card:juice_up()
                        return true
                    end
                }))
            end
        end
    end,
}