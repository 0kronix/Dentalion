SMODS.Joker {
    key = "snakesnladders",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(15, 10),

    pixel_size = { w = 71, h = 82 },

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { } },

    loc_vars = function(self, info_queue, card)
		
	end,

    calculate = function(self, card, context)
    	if context.before and not context.blueprint then
    		for i in ipairs(context.scoring_hand) do
    			for j in ipairs(context.scoring_hand) do
    				if math.abs(context.scoring_hand[i]:get_id() - context.scoring_hand[j]:get_id()) == 5 then
						if context.poker_hands and context.scoring_hand and not next(context.poker_hands["Straight"]) then
            				table.insert(context.poker_hands["Straight"], context.scoring_hand)
            			end
            		end
            	end
            end
        end
	end
}