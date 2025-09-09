SMODS.Joker {
    key = "piechart",
    atlas = 'jokers',
    pos = get_atlas_pos(6, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_mult = 0 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cur_mult } }
	end,

    calculate = function(self, card, context)
    	local ease = math.min(20, math.floor(3 * (G.GAME.dollars / 4)))
		if context.setting_blind and not context.blueprint then
          	if G.GAME.blind and G.GAME.blind.boss then
          		ease_dollars(-ease)
          		card.ability.extra.cur_mult = card.ability.extra.cur_mult + ease
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
          	end
        end
        if context.joker_main then
			return {
				mult = card.ability.extra.cur_mult,
			}
		end
	end
}