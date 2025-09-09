SMODS.Joker {
    key = "milkyway",
    atlas = 'jokers',
    pos = get_atlas_pos(27, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { bonus = 10, active = false } },

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
            return { main_end = main_end, vars = { card.ability.extra.bonus } }
        else
            return { vars = { card.ability.extra.bonus } }
        end
	end,

    update = function(self, card, dt)
        if G.hand and card.area and card.area == G.jokers and G.GAME.blind.in_blind then
            card.ability.extra.active = true
        else
            card.ability.extra.active = false
        end
    end,

    calculate = function(self, card, context)
		if G.hand and card.ability.extra.active and context.using_consumeable and 
            context.consumeable.ability.set == "Planet" and not context.blueprint then
            local random_card = pseudorandom_element(G.hand.cards, "milkyway" )
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    random_card.ability.perma_bonus = random_card.ability.perma_bonus or 0
                    random_card.ability.perma_bonus = random_card.ability.perma_bonus + card.ability.extra.bonus
                    random_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
	end
}