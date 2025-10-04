SMODS.Blind {
    key = "greed",
    dollars = 7,
    mult = 2,
    boss = { min = 3 },
    boss_colour = G.C.GOLD,
    discovered = true,

    atlas = 'blinds',
    pos = Dentalion.get_atlas_pos(4, 0), 

    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.before then
                blind.triggered = true
                ease_dollars(-G.GAME.hands[context.scoring_name].level)
            end
        end
    end,
}