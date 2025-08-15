SMODS.Joker {
    key = "door",
    atlas = 'uncommon-jokers',
    pos = {x = 1, y = 2},

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_xchips = 1 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cur_xchips } }
	end,

    calculate = function(self, card, context)
    	if context.setting_blind then
            card.ability.extra.cur_xchips = card.ability.extra.cur_xchips + 0.25
            return {
                message = 'Upgrade!',
                card = card,
                colour = G.C.CHIPS
            }
        end
        if context.reroll_shop then
            card.ability.extra.cur_xchips = math.min(0.5, card.ability.extra.cur_xchips - 0.5)
            return {
                message = 'Degrade!',
                card = card,
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            return {
                xchips = card.ability.extra.cur_xchips
            }
        end
	end
}