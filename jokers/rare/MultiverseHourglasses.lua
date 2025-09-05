SMODS.Joker {
    key = "hourglasses",
    atlas = 'rare-jokers',
    pos = {x = 4, y = 2},

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { min_ante = -2, max_ante = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.min_ante,
            card.ability.extra.max_ante
        } }
	end,

    calculate = function(self, card, context)
    	local ante = pseudorandom("hourglasses", card.ability.extra.min_ante, card.ability.extra.max_ante)
        if context.selling_self and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    ease_ante(ante)
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
                    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + ante
                    return true
                end
            }))
        end
	end
}