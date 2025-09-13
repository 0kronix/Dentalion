SMODS.Joker {
    key = "disneyjoker",
    atlas = 'jokers',
    pos = get_atlas_pos(46, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { powmult = 0 },

    loc_vars = function(self, info_queue, card)
    	return { vars = { 
					"^" .. tostring(card.ability.powmult + 1)
				}
			}
	end,

    calculate = function(self, card, context)
    	card.ability.powmult = redeemed_voucher_count() * 0.1
        if context.joker_main then
            if card.ability.powmult > 0 then
                -- Code from AIJ mod
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