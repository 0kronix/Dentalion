SMODS.Joker {
    key = "gear",
    atlas = 'jokers',
    pos = get_atlas_pos(89, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            G.from_boss_tag = true
            G.FUNCS.reroll_boss()
        end
    end,
}