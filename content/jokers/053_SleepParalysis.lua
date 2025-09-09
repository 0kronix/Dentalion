SMODS.Joker {
    key = "sleepparalysis",
    atlas = 'jokers',
    pos = get_atlas_pos(53, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { active = true } },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.active then
        	return { vars = { 
    					"Active!"
    				}
    			}
        else
            return { vars = { 
                        "Inactive"
                    }
                }
        end    
	end,

    calculate = function(self, card, context)
    	if context.skip_blind and not context.blueprint and card.ability.extra.active and context.cardarea == G.jokers then
            card.ability.extra.active = false
            return {
                message = "Fail",
                colour = G.C.RED,
                card = card
            }
        end
        if context.setting_blind and not context.blueprint and context.blind.boss and card.ability.extra.active and context.cardarea == G.jokers then
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.blind:disable()
                            play_sound('timpani')
                            delay(0.4)
                            return true
                        end
                    }))
                    SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
                    return true
                end
            }))
            return nil, true
        end
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint and context.cardarea == G.jokers then
            card.ability.extra.active = false
            return {
                message = "Active!",
                colour = G.C.GREEN,
                card = card
            }
        end
	end
}