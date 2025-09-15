SMODS.Blind {
    key = "pride",
    dollars = 5,
    mult = 2,
    boss = { min = 2 },
    boss_colour = HEX("7B68EE"),
    discovered = true,

    atlas = 'blinds',
    pos = get_atlas_pos(7, 0), 

    calculate = function(self, blind, context)
        if not blind.disabled then
            local suits = {}
            for _, deck_card in ipairs(G.playing_cards) do
                if tablefind(suits, deck_card.base.suit) then
                    table.insert(suits, deck_card.base.suit)
                end
            end
            if #suits < 4 then
                if context.debuff_card and context.debuff_card.area ~= G.jokers then
                    return {
                        debuff = true
                    }
                end
            end
        end
    end,
}