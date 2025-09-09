SMODS.Joker {
    key = "anxiety",
    atlas = 'jokers',
    pos = get_atlas_pos(52, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { percent = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
                    card.ability.extra.percent or 0
                } }
    end,

    calculate = function(self, card, context)
        card.ability.extra.percent = math.max(0, 52 - #G.playing_cards)
        if context.final_scoring_step then
            balance_percent(card, (card.ability.extra.percent*0.02))
        end
    end
}