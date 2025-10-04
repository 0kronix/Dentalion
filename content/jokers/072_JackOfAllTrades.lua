SMODS.Joker {
    key = "jackofalltrades",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(72, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { min_x = 8, max_x = 22 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.min_x * 0.1, card.ability.extra.max_x * 0.1 } }
	end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xmult = pseudorandom("jack", card.ability.extra.min_x, card.ability.extra.max_x) * 0.1,
                xchips = pseudorandom("jack", card.ability.extra.min_x, card.ability.extra.max_x) * 0.1,
            }
        end
	end
}