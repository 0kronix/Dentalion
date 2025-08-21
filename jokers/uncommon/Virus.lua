SMODS.Joker {
    key = "virus",
    atlas = 'uncommon-jokers',
    pos = {x = 4, y = 2},

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { bonus = 1, odds = 19 } },

    in_pool = function(self, args)
        return true, { allow_duplicates = true }
    end,

    loc_vars = function(self, info_queue, card)
		return { vars = {
            card.ability.extra.prob * G.GAME.probabilities.normal,
            card.ability.extra.odds,
            card.ability.extra.bonus
        } }
	end,

    update = function(self, card, dt)
        card.ability.extra.bonus = #SMODS.find_card('j_dentalion_virus')
        card.ability.extra.prob = #SMODS.find_card('j_dentalion_virus')
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.bonus
            }
        end
        if context.end_of_round and context.cardarea == G.jokers then
            if SMODS.pseudorandom_probability(card, 'virus', card.ability.extra.prob, card.ability.extra.odds) then
                SMODS.destroy_cards(card)
                return {
                    message = "Heal!",
                    colour = G.C.GREEN
                }
            else
                return {
                    message = "Safe!",
                    colour = G.C.GREEN
                }
            end
        end
	end
}