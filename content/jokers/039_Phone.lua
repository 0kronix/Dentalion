SMODS.Joker {
    key = "phone",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(39, 10),

    pixel_size = { w = 53, h = 95 },

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { h = 0, d = 0, s = 0, c = 0 } },

    loc_vars = function(self, info_queue, card)
    	return { vars = { 
    				
				}
			}
	end,

    calculate = function(self, card, context)
    	if context.before and not context.blueprint then
	    	for k, v in ipairs(G.playing_cards) do
	        	if v:is_suit('Hearts', true) then
	        		card.ability.extra.h = card.ability.extra.h + 1
	        	end
	        	if v:is_suit('Diamonds', true) then
	        		card.ability.extra.d = card.ability.extra.d + 1
	        	end
	        	if v:is_suit('Spades', true) then
	        		card.ability.extra.s = card.ability.extra.s + 1
	        	end
	        	if v:is_suit('Clubs', true) then
	        		card.ability.extra.c = card.ability.extra.c + 1
	        	end
	        end
	    end
        if context.individual and context.cardarea == G.play then
        	if context.other_card:is_suit('Hearts', true) then
        		return {
        			mult = card.ability.extra.h
        		}
        	end
        	if context.other_card:is_suit('Diamonds', true) then
        		return {
        			mult = card.ability.extra.d
        		}
        	end
        	if context.other_card:is_suit('Spades', true) then
        		return {
        			mult = card.ability.extra.s
        		}
        	end
        	if context.other_card:is_suit('Clubs', true) then
        		return {
        			mult = card.ability.extra.c
        		}
        	end
        end
        if context.after then
        	card.ability.extra.h = 0
        	card.ability.extra.d = 0
        	card.ability.extra.s = 0
        	card.ability.extra.c = 0
        end
	end
}