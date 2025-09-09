SMODS.Joker {
    key = "magnificent",
    atlas = 'legendary-jokers',
    pos = get_atlas_pos(3, 5),
    soul_pos = {x = 2, y = 1},

    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { powmult = 0.8 },

    loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
				"^" .. tostring(card.ability.powmult + 1)
			}
		}
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            if card.ability.powmult > 0 then
                -- Code frome AIJ mod
                local xmlt = mult^card.ability.powmult
                return {
                    remove_default_message = true,
                    Xmult_mod = xmlt,
                    extra = { message = "^" .. (card.ability.powmult + 1) .. " Mult", colour = G.C.GREEN }
                }
            end
        end
	end
}