SMODS.Joker {
    key = "cyclops",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(34, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { bonus_slots = 0, active = true } },

    loc_vars = function(self, info_queue, card)
		main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = card.ability.extra.active and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. (card.ability.extra.active and 'active' or 'inactive') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        }
        if card.area and card.area == G.jokers then
            return { main_end = main_end }
        end
	end,

	remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.bonus_slots
    end,

    calculate = function(self, card, context)
    	local del = G.GAME.current_round.hands_left - 1
		if context.setting_blind and card.ability.extra.active then
			G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - del
			if del >= 5 then
				G.jokers.config.card_limit = G.jokers.config.card_limit + 1
				card.ability.extra.bonus_slots = card.ability.extra.bonus_slots + 1
				card.ability.extra.active = false
				return {
					message = localize("k_upgrade_ex"),
					colour = G.ARGS.LOC_COLOURS.INDIGO
				}
			end
		end
		if context.end_of_round then
			G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + del
			if G.GAME.blind.boss then
            	card.ability.extra.active = true
            end
		end
	end
}