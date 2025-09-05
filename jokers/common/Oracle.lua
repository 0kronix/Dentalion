SMODS.Joker {
    key = "oracle",
    atlas = 'common-jokers',
    pos = {x = 4, y = 3},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { blind_change = 5, blind_max = 20, all = 0, active = false } },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.active then
    		return { vars = { 
                        card.ability.extra.blind_change, 
                        card.ability.extra.blind_max, 
                        card.ability.extra.all,
                        "Active!"
                    } }
        else
            return { vars = { 
                        card.ability.extra.blind_change, 
                        card.ability.extra.blind_max, 
                        card.ability.extra.all,
                        "Inactive"
                    } }
        end
	end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.active = true
        end
		if card.ability.extra.active and context.using_consumeable and not context.blueprint then
            G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01))
            G.GAME.blind.chip_text = G.GAME.blind.chips
            card.ability.extra.all = card.ability.extra.all + card.ability.extra.blind_change
            return {
                message = "-" .. card.ability.extra.blind_change .. "%"
            }
        end
        if card.ability.extra.all >= card.ability.extra.blind_max then
            card.ability.extra.active = false
        end
        if context.end_of_round and not context.blueprint then
            card.ability.extra.active = false
            card.ability.extra.all = 0
        end
	end
}