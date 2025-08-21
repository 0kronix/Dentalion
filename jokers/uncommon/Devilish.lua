SMODS.Joker {
    key = "devilish",
    atlas = 'uncommon-jokers',
    pos = {x = 2, y = 1},

    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { } },

    loc_vars = function(self, info_queue, card)
		info_queue[#info_queue + 1] = G.P_CENTERS['c_death']
	end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.key == "c_death" then
            local card1 = pseudorandom_element(G.playing_cards, "devilish")
            card1:start_dissolve()
            local card2 = pseudorandom_element(G.playing_cards, "devilish")
            card2:start_dissolve()
        end
	end
}