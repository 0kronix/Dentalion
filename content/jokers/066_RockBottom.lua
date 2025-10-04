SMODS.Joker {
    key = "rockbottom",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(66, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { money = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.money } }
	end,

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers then
            if G.GAME.hands[context.scoring_name].level == 1 then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end
    end
}