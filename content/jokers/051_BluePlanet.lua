SMODS.Joker {
    key = "blueplanet",
    atlas = 'jokers',
    pos = get_atlas_pos(51, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
	config = { extra = { planets = 5, cur_p = 0, cur_planet = nil } },

    loc_vars = function(self, info_queue, card)
        main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = card.ability.extra.cur_planet == nil and mix_colours(G.C.GREY, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.SECONDARY_SET.Planet, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. (card.ability.extra.cur_planet == nil and 'None' or localize { type = "name_text", set = "Planet", key = card.ability.extra.cur_planet }) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        }
        if card.area and card.area == G.jokers then
            return { main_end = main_end, 
                vars = { 
                    card.ability.extra.planets,
                    card.ability.extra.cur_p 
                } 
            }
        else
            return {
                vars = { 
                    card.ability.extra.planets,
                    card.ability.extra.cur_p 
                } 
            }
        end
	end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Planet" and not context.blueprint then
            if card.ability.extra.cur_p == 0 then
                card.ability.extra.cur_planet = context.consumeable.config.center.key
            end
            if card.ability.extra.cur_planet == context.consumeable.config.center.key then
                card.ability.extra.cur_p = card.ability.extra.cur_p + 1
                if card.ability.extra.cur_p >= 5 then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                SMODS.add_card{ set = "Spectral" }
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