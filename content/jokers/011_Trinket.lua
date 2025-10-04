SMODS.Joker {
    key = "trinket",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(11, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 3, active = false } },

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
            return { main_end = main_end, 
                vars = { 
                    card.ability.extra.xmult
                } 
            }
        else
            return { 
                vars = { 
                    card.ability.extra.xmult 
                } 
            }
        end
	end,

	update = function(self, card, dt)
        if card.area and card.area == G.jokers then
    		if #G.consumeables.cards + G.GAME.consumeable_buffer >= G.consumeables.config.card_limit then
    			card.ability.extra.active = true
    		end
        end
	end,

    calculate = function(self, card, context)
		if context.joker_main then
			if card.ability.extra.active then
				return {
					xmult = card.ability.extra.xmult,
				}
			end
		end
	end
}