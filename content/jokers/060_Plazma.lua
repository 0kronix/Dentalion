SMODS.Joker {
    key = "plazma",
    atlas = 'jokers',
    pos = get_atlas_pos(60, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { rep = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.rep,
            localize(most_played_hand(), 'poker_hands') or "None"
        } }
	end,

    calculate = function(self, card, context)
    	if context.repetition and context.cardarea == G.play then
            if most_played_hand() ~= nil and context.scoring_name == most_played_hand() then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.rep,
                    card = context.other_card
                }
            end
        end
	end
}