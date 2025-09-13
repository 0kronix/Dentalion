SMODS.Blind {
    key = "lust",
    dollars = 5,
    mult = 2,
    boss = { min = 1 },
    boss_colour = HEX("DDA0DD"),
    discovered = true,

    atlas = 'blinds',
    pos = get_atlas_pos(3, 0),

    debuff_hand = function(self, cards, hand, handname, check)
        if cards then
            for _, v in ipairs(cards) do
                if v:is_suit("Hearts") then
                    return false
                end
            end
            return true
        end
    end
}