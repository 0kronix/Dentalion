Dentalion_API.Trinket {
    key = "brokenremote",
    pos = get_atlas_pos(54, 10),

    config = { extra = { odds = 5 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,
    calculate = function(self, card, context)
        if context.selling_card then
            if context.card.ability.set == "Joker" and prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "brokenremote") then
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    func = function()
                        create_tag(nil, "brokenremote_tag")
                        card:juice_up()
                        return true
                    end
                }))
            end
        end
    end,
}