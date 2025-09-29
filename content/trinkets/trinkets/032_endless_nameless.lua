Dentalion_API.Trinket {
    key = "endlessnameless",
    pos = get_atlas_pos(32, 10),

    config = { extra = { odds = 10 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and #G.consumeables.cards < G.consumeables.config.card_limit then
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "endlessnameless") then
                local used = context.consumeable.config.center.key
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.2,
                    func = (function()
                        SMODS.add_card{ key = used, area = G.consumeables }
                        return true
                    end)
                }))
                return {
                    message = localize('dentalion_copy_ex')
                }
            end
        end
    end,
}