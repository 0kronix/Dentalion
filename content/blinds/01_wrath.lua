SMODS.Blind {
    key = "wrath",
    dollars = 5,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("800000"),
    discovered = true,

    atlas = 'blinds',
    pos = Dentalion.get_atlas_pos(1, 0),

    loc_vars = function(self)
        local percent, prev_chips = 20, 0
        return { vars = { percent, prev_chips } }
    end,

    collection_loc_vars = function(self)
        local percent = 20
        return { vars = { percent } }
    end,

    calculate = function(self, blind, context)
        if not blind.disabled and context.setting_blind then
            blind.triggered = true
            prev_chips = G.GAME.blind.chips
            percent = 20
            local blind_change = #G.GAME.tags * percent
            G.GAME.blind.chips = G.GAME.blind.chips + math.ceil(G.GAME.blind.chips * (blind_change * 0.01))
            G.GAME.blind.chip_text = tostring(G.GAME.blind.chips)
        end
    end,

    disable = function(self)
        G.GAME.blind.chips = prev_chips
        G.GAME.blind.chip_text = tostring(G.GAME.blind.chips)
    end
}