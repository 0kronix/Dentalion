SMODS.Joker {
    key = "puzzle",
    atlas = 'jokers',
    pos = get_atlas_pos(50, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { active = true } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'suit_change_tarot'}
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
            return { main_end = main_end }
        end
	end,

    calculate = function(self, card, context)
        local suit_change = {"c_sun", "c_star", "c_moon", "c_world"}
        if card.ability.extra.active then
            if context.using_consumeable and tablefind(suit_change, context.consumeable.config.center.key) then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    local rnd_tarot = pseudorandom_element(suit_change, "puzzle" .. G.GAME.round_resets.ante)

                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            SMODS.add_card{ key = rnd_tarot }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))

                    if not context.blueprint then
                        card.ability.extra.active = false
                    end

                    return {
                        message = localize('k_plus_tarot')
                    }
                end
            end
        end

        if context.setting_blind and not context.blueprint then
            card.ability.extra.active = true
        end
    end
}