SMODS.Joker {
    key = "cyclops",
    atlas = 'rare-jokers',
    pos = {x = 2, y = 1},

    cost = 9,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { bonus_slots = 0, active = true } },

    loc_vars = function(self, info_queue, card)
    	if card.ability.extra.active then
			return { vars = { card.ability.extra.bonus_slots, "Active!" } }
		else
			return { vars = { card.ability.extra.bonus_slots, "Inactive" } }
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