SMODS.Joker {
    key = "tvshow",
    atlas = 'rare-jokers',
    pos = {x = 2, y = 2},

    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { } },

    loc_vars = function(self, info_queue, card)
    	return { vars = { 
					
				}
			}
	end,

    calculate = function(self, card, context)
    	if context.disard and not context.blueprint then
            if G.GAME.current_round.hands_played == 0 and G.GAME.current_round.discards_used == 0 then
                if not context.other_card:is_face() then
                    return {
                        dollars = context.other_card:get_id() / 2,
                        card = context.other_card
                    }
                end
            end
        end
	end
}