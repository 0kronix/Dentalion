SMODS.Joker {
    key = "blueplanet",
    atlas = 'common-jokers',
    pos = {x = 2, y = 4},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { planets = 5, cur_p = 0, cur_planet = nil } },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.cur_planet == nil then
    		return { vars = { 
                card.ability.extra.planets,
                card.ability.extra.cur_p,
                "None"
            } }
        else
            return { vars = { 
                card.ability.extra.planets,
                card.ability.extra.cur_p,
                localize { type = "name_text", set = "Planet", key = card.ability.extra.cur_planet } 
            } }
        end
	end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Planet" and not context.blueprint then
            if card.ability.extra.cur_p == 0 then
                card.ability.extra.cur_planet = context.consumeable.config.center.key
            end
            if card.ability.extra.cur_planet == context.consumeable.config.center.key then
                card.ability.extra.cur_p = card.ability.extra.cur_p + 1
                if card.ability.extra.cur_p >= 4 then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                local s_card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                                s_card:add_to_deck()
                                G.consumeables:emplace(s_card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end
                        )}))
                        delay(0.5)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound('tarot1')
                                card.T.r = -0.2
                                card:juice_up(0.3, 0.4)
                                card.states.drag.is = true
                                card.children.center.pinch.x = true
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'after',
                                    delay = 0.3,
                                    blockable = false,
                                    func = function()
                                        card:remove()
                                        return true
                                    end
                                }))
                                return true
                            end
                        }))
                        return {
                            message = localize('k_extinct_ex')
                        }    
                    end
                else
                    return {
                        message = tostring(card.ability.extra.cur_p) .. "/" .. tostring(card.ability.extra.planets)
                    }
                end
            else
                card.ability.extra.cur_p = 0
                card.ability.extra.cur_planet = context.consumeable.config.center.key
                return {
                    message = localize('k_reset')
                }
            end
        end
    end
}