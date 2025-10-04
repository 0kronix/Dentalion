SMODS.Blind {
    key = "envy",
    dollars = 5,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("B0E0E6"),
    discovered = true,

    atlas = 'blinds',
    pos = Dentalion.get_atlas_pos(5, 0), 

    calculate = function(self, blind, context)
        if not blind.disabled then
            local ms_joker = Dentalion.max_sell_joker()
            if context.setting_blind and ms_joker ~= nil then
                blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        ms_joker:juice_up(0.3, 0.3)
                        ms_joker.ability.extra_value = 0
                        ms_joker:set_cost()
                        return true
                    end
                }))
            end
        end
    end,
}