SMODS.Joker {
    key = "obsidian",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(28, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { chips = 0, mod_chips = 2 } },

    loc_vars = function(self, info_queue, card)
    	if next(SMODS.find_mod("paperback")) and next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_pb'}
            info_queue[#info_queue + 1] = {set = 'Other', key = 'light_suits_pb'}
        elseif next(SMODS.find_mod("paperback")) and not next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_p'}
            info_queue[#info_queue + 1] = {set = 'Other', key = 'light_suits_p'}
        elseif not next(SMODS.find_mod("paperback")) and next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_b'}
            info_queue[#info_queue + 1] = {set = 'Other', key = 'light_suits_b'}
        else
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits'}
            info_queue[#info_queue + 1] = {set = 'Other', key = 'light_suits'}
        end
		return { vars = { card.ability.extra.chips, card.ability.extra.mod_chips } }
	end,

    calculate = function(self, card, context)
    	local count = 0
		if context.before and not context.blueprint then
			for _, played_card in ipairs(context.scoring_hand) do
                if Dentalion.is_dark_suit(played_card) then
                	count = count + 1
                end
            end
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.mod_chips * count
            if count > 0 then
	            return {
	        		message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
	        	}
        	end
        end
        if context.joker_main then
        	return {
        		chips = card.ability.extra.chips
        	}
        end
        if context.after and not context.blueprint and context.cardarea == G.jokers then
			if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
				for _, played_card in ipairs(context.scoring_hand) do
					if is_light_suit(played_card) then
                        card:juice_up(0.3, 0.3)
						Dentalion.convert_to(played_card, "dark", "obsidian")
			        end
			    end
			end
        end
	end
}