SMODS.Joker {
    key = "bumbo",
    atlas = 'jokers',
    pos = get_atlas_pos(100, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money = 2, odds = 3 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.money } }
    end,

    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money > 0 then return -card.ability.extra.money end
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "bumbo") then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        SMODS.add_card{ set = "Consumeables", area = G.consumeables }
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                return {
                    message = localize("dentalion_plus_consumeable_ex"),
                    colour = G.C.FILTER
                }
            end
        end
    end,
}