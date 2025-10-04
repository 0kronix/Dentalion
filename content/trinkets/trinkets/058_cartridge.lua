Dentalion_API.Trinket {
    key = "cartridge",
    pos = Dentalion.get_atlas_pos(58, 10),

    config = { extra = { odds = 4 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'suit_change_tarot'}
        return {
            vars = { G.GAME.probabilities.normal, card.ability.extra.odds }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and G.consumeables.config.card_limit + G.GAME.consumeable_buffer > #G.consumeables.cards and 
        context.cardarea == G.dentalion_trinket_area then
            if Dentalion.prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "cartridge") then
                local suit_change = {"c_sun", "c_star", "c_moon", "c_world"}
                local rnd_tarot = pseudorandom_element(suit_change, "cartridge" .. G.GAME.round_resets.ante)
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1

                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    func = (function()
                        SMODS.add_card{ key = rnd_tarot }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))

                return {
                    message = localize('k_plus_tarot')
                }
            end
        end
    end,
}