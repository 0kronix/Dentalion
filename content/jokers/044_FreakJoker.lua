SMODS.Joker {
    key = "freakjoker",
    atlas = 'jokers',
    pos = get_atlas_pos(44, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { rerolls = 1, all = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
                    card.ability.extra.rerolls,
                    card.ability.extra.all
                } }
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-card.ability.extra.all)
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Planet" and not context.blueprint then
            SMODS.change_free_rerolls(card.ability.extra.rerolls)
            card.ability.extra.all = card.ability.extra.all + 1
            local s = ""
            if card.ability.extra.all > 1 then s = "s" end
            return {
                message = "+" .. tostring(card.ability.extra.all) .. " free reroll" .. s,
                colour = G.C.GREEN
            }
        end
        if context.reroll_shop and card.ability.extra.all > 0 and not context.blueprint then
            card.ability.extra.all = card.ability.extra.all - 1
            SMODS.change_free_rerolls(-card.ability.extra.rerolls)
            local s = ""
            if card.ability.extra.all > 1 then s = "s" end
            return {
                message = tostring(card.ability.extra.all) .. " reroll" .. s .. " left",
                colour = G.C.GREEN
            }
        end
    end
}