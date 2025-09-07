SMODS.Joker {
    key = "oracle",
    atlas = 'common-jokers',
    pos = {x = 4, y = 3},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { blind_change = 5, blind_max = 20, all = 0, active = false } },

    loc_vars = function(self, info_queue, card)
        main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = card.ability.extra.active and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. (card.ability.extra.active and 'active' or 'inactive') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        }
        if card.area and card.area == G.jokers then
            return { 
                main_end = main_end, 
                vars = { 
                    card.ability.extra.blind_change, 
                    card.ability.extra.blind_max, 
                    card.ability.extra.all
                } 
            }
        else
            return {
                vars = { 
                    card.ability.extra.blind_change, 
                    card.ability.extra.blind_max, 
                    card.ability.extra.all
                }
            }
        end
	end,

    update = function(self, card, dt)
        if card.ability.extra.all < card.ability.extra.blind_max and card.area and card.area == G.jokers
            and G.GAME.blind.in_blind then
            card.ability.extra.active = true
        else
            card.ability.extra.active = false
        end
    end,

    calculate = function(self, card, context)
		if card.ability.extra.active and context.using_consumeable then
            G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01))
            card.ability.extra.all = card.ability.extra.all + card.ability.extra.blind_change
            G.E_MANAGER:add_event(Event({
                trigger = "ease",
                delay = 0.5,
                ref_table = G.GAME.blind,
                ref_value = "chip_text",
                ease_to = G.GAME.blind.chip_text - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01)),
                func = (function(t)
                    return math.floor(t)
                end)
            }))
            return {
                message = tostring(card.ability.extra.all) .. "/" .. tostring(card.ability.extra.blind_max) .. "%",
                card = context.consumeable
            }
        end
        if context.end_of_round and not context.blueprint then
            card.ability.extra.all = 0
        end
	end
}