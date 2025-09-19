SMODS.Joker {
    key = "door",
    atlas = 'jokers',
    pos = get_atlas_pos(25, 10),

    pixel_size = { w = 48, h = 95 },

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_xchips = 1, mod_xchips = 0.25 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cur_xchips, card.ability.extra.mod_xchips, card.ability.extra.mod_xchips * 2 } }
	end,

    calculate = function(self, card, context)
    	if context.setting_blind and not context.blueprint then
            card.ability.extra.cur_xchips = card.ability.extra.cur_xchips + card.ability.extra.mod_xchips
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.CHIPS
            }
        end
        if context.reroll_shop and not context.blueprint then
            if card.ability.extra.cur_xchips >= 0.5 then
                card.ability.extra.cur_xchips = math.max(0.5, card.ability.extra.cur_xchips - card.ability.extra.mod_xchips * 2)
                return {
                    message = localize("dentalion_downgrade_ex"),
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main then
            return {
                xchips = card.ability.extra.cur_xchips
            }
        end
	end
}