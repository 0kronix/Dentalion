SMODS.Blind {
    key = "gluttony",
    dollars = 5,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("A0522D"),
    discovered = true,

    atlas = 'blinds',
    pos = Dentalion.get_atlas_pos(6, 0), 

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.setting_blind then
                blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                        for _, cons in pairs(G.consumeables.cards) do
                            cons:start_dissolve(nil, _first_dissolve)
                            _first_dissolve = true
                        end
                        return true
                    end
                }))
            end
        end
    end,
}