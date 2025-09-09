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
	
    config = { extra = { rep = 1, most_played = nil } },

    loc_vars = function(self, info_queue, card)
        local _handname, _played = 'High Card', -1
        for hand_key, hand in pairs(G.GAME.hands) do
            if hand.played > _played and SMODS.is_poker_hand_visible(hand_key) then
                _played = hand.played
                _handname = hand_key
            end
        end
        card.ability.extra.most_played = _handname
        return { vars = { 
            card.ability.extra.rep,
            localize(card.ability.extra.most_played, 'poker_hands') or "None"
        } }
	end,

    calculate = function(self, card, context)
    	if context.repetition and context.cardarea == G.play then
            if card.ability.extra.most_played ~= nil and context.scoring_name == card.ability.extra.most_played then
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.rep,
                    card = context.other_card
                }
            end
        end
	end
}