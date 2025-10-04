Dentalion_API.Trinket {
    key = "error",
    pos = Dentalion.get_atlas_pos(30, 10),

    config = { extra = { mod = 2 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        main_start = {
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {
                            { string = Dentalion.pseudorandom_string("error_str", 4, 8), colour = pseudorandom_element({G.C.BLUE, G.C.YELLOW, G.C.MONEY, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 2, 4), colour = pseudorandom_element({G.C.BLUE, G.C.RED, G.C.MONEY, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 8, 15), colour = pseudorandom_element({G.C.BLUE, G.C.RED, G.C.MONEY, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 4, 8), colour = pseudorandom_element({G.C.BLUE, G.C.RED, G.C.MONEY, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 1, 8), colour = pseudorandom_element({G.C.BLUE, G.C.PURPLE, G.C.MONEY, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 4, 12), colour = pseudorandom_element({G.C.BLUE, G.C.RED, G.C.MONEY, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 2, 3), colour = pseudorandom_element({G.C.BLUE, G.C.RED, G.C.GREEN, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 4, 8), colour = pseudorandom_element({G.C.BLUE, G.C.RED, G.C.MONEY, G.C.UI.TEXT_DARK}, "error_col") },
                            { string = Dentalion.pseudorandom_string("error_str", 4, 12), colour = pseudorandom_element({G.C.BLUE, G.C.RED, G.C.MONEY, G.C.GREEN}, "error_col") }
                        },
                        colours = { G.C.UI.TEXT_DARK },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            }
        }
        return { main_start = main_start }
    end,
    equip = function(self, card)
        card.ability.extra.mod = pseudorandom("error", 1, 5)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.mod == 1 then
                return {
                    dollars = pseudorandom("error_dollars", 1, 4)
                }
            elseif card.ability.extra.mod == 2 then
                return {
                    mult = pseudorandom("error_mult", 1, 10)
                }
            elseif card.ability.extra.mod == 3 then
                return {
                    xmult = 1 + pseudorandom("error_xmult")
                }
            elseif card.ability.extra.mod == 4 then
                return {
                    chips = 1 + pseudorandom("error_chips", 5, 25)
                }
            elseif card.ability.extra.mod == 5 then
                return {
                    xchips = 1 + pseudorandom("error_xchips")
                }
            end
        end

        if context.after then
            card.ability.extra.mod = pseudorandom("error", 1, 5)
        end
    end,
}