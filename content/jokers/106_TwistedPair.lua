SMODS.Joker {
    key = "twistedpair",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(106, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local left_joker = Dentalion.on_left_or_right_of(card, G.jokers.cards, -1)
            local left_compatible = left_joker and left_joker ~= card and left_joker.config.center.blueprint_compat

            local right_joker = Dentalion.on_left_or_right_of(card, G.jokers.cards, 1)
            local right_compatible = right_joker and right_joker ~= card and right_joker.config.center.blueprint_compat

            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = left_compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' <- ' .. localize('k_' .. (left_compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                },

                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = G.C.WHITE, r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = '', colour = G.C.WHITE, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                },

                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = right_compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (right_compatible and 'compatible' or 'incompatible')) .. ' -> ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            }
            return { main_end = main_end }
        end
    end,

    calculate = function(self, card, context)
        if card.is_pair_calculating then
            return nil, true
        end
        card.is_pair_calculating = true

        local target_joker1 = Dentalion.on_left_or_right_of(card, G.jokers.cards, -1)
        local target_joker2 = Dentalion.on_left_or_right_of(card, G.jokers.cards, 1)
        local effect_to_return = nil
        local effect1_def

        if target_joker1 then
            effect1_def = SMODS.blueprint_effect(card, target_joker1, context)
        end
     
        local effect2_def
        if target_joker2 then
            effect2_def = SMODS.blueprint_effect(card, target_joker2, context)
        end
     
        if effect1_def then
            if effect2_def then
                effect1_def.extra = effect2_def 
            end
            effect_to_return = effect1_def
        elseif effect2_def then
            effect_to_return = effect2_def
        else
            effect_to_return = nil 
        end

        card.is_pair_calculating = false

        return effect_to_return
    end,
}