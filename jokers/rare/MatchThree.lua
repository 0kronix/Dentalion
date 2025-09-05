SMODS.Joker {
    key = "matchthree",
    atlas = 'rare-jokers',
    pos = {x = 2, y = 2},

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        
	end,

    calculate = function(self, card, context)
    	if context.destroy_card and not context.blueprint then
            if context.cardarea == G.play and context.scoring_hand and 
                next(context.poker_hands["Three of a Kind"]) and not next(context.poker_hands["Full House"]) then
                return { remove = true }
            end
        end
	end
}