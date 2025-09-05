SMODS.Joker {
    key = "milkyway",
    atlas = 'common-jokers',
    pos = {x = 2, y = 2},

    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { bonus = 20, active = false } },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.active then
            return { vars = { card.ability.extra.bonus, "Active!" } }
        else
            return { vars = { card.ability.extra.bonus, "Inactive" } }
        end
	end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.active = true
        end
        if context.end_of_round and not context.blueprint then
            card.ability.extra.active = false
        end
		if G.hand and card.ability.extra.active and context.using_consumeable and context.consumeable.ability.set == "Planet" then
            local random_card = pseudorandom_element(G.hand.cards, "milkyway" )
            random_card.ability.perma_bonus = random_card.ability.perma_bonus or 0
            random_card.ability.perma_bonus = random_card.ability.perma_bonus + card.ability.extra.bonus
            card.ability.extra.active = false
        end
	end
}