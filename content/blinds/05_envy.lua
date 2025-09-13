SMODS.Blind {
    key = "envy",
    dollars = 5,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("B0E0E6"),
    discovered = true,

    atlas = 'blinds',
    pos = get_atlas_pos(5, 0), 

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        (max_sell_joker()).sell_cost = 0
                        (max_sell_joker()):juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
    end,
}