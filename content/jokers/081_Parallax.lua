SMODS.Joker {
    key = "parallax",
    atlas = 'jokers',
    pos = get_atlas_pos(81, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #context.full_hand == #G.jokers.cards then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end,
}