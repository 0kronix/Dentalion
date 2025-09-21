SMODS.Joker {
    key = "jokerapp",
    atlas = 'jokers',
    pos = get_atlas_pos(93, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 8 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint then
            if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "jokerapp") then
                G.E_MANAGER:add_event(Event({
                    trigger = "before",
                    func = function()
                        card:juice_up(0.3, 0.3)
                        local voucher = SMODS.add_voucher_to_shop()
                        voucher.from_tag = true
                        return true
                    end
                }))
                return {
                    message = localize("dentalion_plus_voucher_ex"),
                }
            end
        end
    end,
}