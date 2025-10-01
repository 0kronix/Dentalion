Dentalion_API.Trinket {
    key = "paytowin",
    pos = get_atlas_pos(41, 10),

    config = { extra = { odds = 2, active = false } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                G.GAME.probabilities.normal, card.ability.extra.odds
            }
        }
    end,
    equip = function(self, card)
        if G.STATE == G.STATES.SHOP and prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "paytowin") then
            SMODS.change_free_rerolls(1)
            card:juice_up()
            card.ability.extra.active = true
        end
    end,
    unequip = function(self, card)
        if card.ability.extra.active then
            SMODS.change_free_rerolls(-1)
        end
    end,
    calculate = function(self, card, context)
        if context.entering_shop and prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "paytowin") then
            SMODS.change_free_rerolls(1)
            card:juice_up()
            card.ability.extra.active = true
        end

        if context.ending_shop and card.ability.extra.active then
            SMODS.change_free_rerolls(-1)
            card.ability.extra.active = false
        end
    end,
}