SMODS.Joker {
    key = "999jokers",
    atlas = 'jokers',
    pos = get_atlas_pos(84, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.before then
            for _, played_card in ipairs(context.scoring_hand) do
                if played_card.base.value == "9" then
                    if prob_check(G.GAME.probabilities.normal, card.ability.extra.odds, "999") then
                        return {
                            card = card,
                            level_up = true,
                            message = localize('k_level_up_ex')
                        }
                    else
                        break
                    end
                end
            end
        end
    end,
}