SMODS.Joker {
    key = "murdermystery",
    atlas = 'jokers',
    pos = get_atlas_pos(12, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_xmult = 1, mod_xmult = 0.5, faces_kills = 0, active = true } },

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
            return { main_end = main_end, 
                vars = { 
                    card.ability.extra.cur_xmult,
                    card.ability.extra.mod_xmult,
                    card.ability.extra.faces_kills 
                } 
            }
        else
            return { 
                vars = { 
                    card.ability.extra.cur_xmult,
                    card.ability.extra.mod_xmult,
                    card.ability.extra.faces_kills 
                } 
            }
        end
	end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.active = true
        end
        if context.after and card.ability.extra.active and not context.blueprint then
            if context.full_hand[1]:is_face() then
                card.ability.extra.faces_kills = card.ability.extra.faces_kills + 1
                if card.ability.extra.faces_kills >= 3 then
                    card.ability.extra.cur_xmult = card.ability.extra.cur_xmult + card.ability.extra.mod_xmult
                    card.ability.extra.faces_kills = 0
                    card.ability.extra.active = false
                    SMODS.destroy_cards(context.full_hand[1])
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                        card = card
                    }
                end
            else
                card.ability.extra.faces_kills = 0
            end
            SMODS.destroy_cards(context.full_hand[1])
            card.ability.extra.active = false
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.cur_xmult
            }
        end
	end
}