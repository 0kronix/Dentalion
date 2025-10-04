SMODS.Joker {
    key = "blizzard",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(78, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod_xchips = 0.15 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_dentalion_frozen']

        local frozen_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_dentalion_frozen') then frozen_tally = frozen_tally + 1 end
            end
        end
        return { vars = { card.ability.extra.mod_xchips, 1 + card.ability.extra.mod_xchips * frozen_tally } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local frozen_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_dentalion_frozen') then frozen_tally = frozen_tally + 1 end
            end
            return {
                xchips = 1 + card.ability.extra.mod_xchips * frozen_tally
            }
        end
    end,
}