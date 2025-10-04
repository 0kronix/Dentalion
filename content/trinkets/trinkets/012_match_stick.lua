Dentalion_API.Trinket {
    key = "matchstick",
    pos = Dentalion.get_atlas_pos(12, 10),

    config = { extra = { odds = 8 } },

    atlas = 'trinkets',
    unlocked = true,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_dentalion_tick
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,

    equip = function(self, card)
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.key == "j_dentalion_tick" and joker.ability.eternal then
                joker:set_eternal(false)
                joker:juice_up()
                card:juice_up()
            end
        end
    end,

    calculate = function(self, card, context)
        if context.after and SMODS.last_hand_oneshot then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "matchstick") and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        SMODS.add_card{ set = "Tarot", area = G.consumeables }
                        play_sound('tarot1')
                        card:juice_up()
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                return {
                    message = localize("k_plus_tarot"),
                    colour = G.C.PURPLE
                }
            end
        end

        if context.ending_shop then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.config.center.key == "j_dentalion_tick" and joker.ability.eternal then
                    joker:set_eternal(false)
                    joker:juice_up()
                    card:juice_up()
                end
            end
        end
    end
}