SMODS.Joker {
    key = "blindrage",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(109, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 2.5, rounds = 2, max_rounds = 5 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.rounds, card.ability.extra.max_rounds } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            if G.GAME.current_round.hands_played == 1 and card.ability.extra.rounds < card.ability.extra.max_rounds then
                card.ability.extra.rounds = card.ability.extra.rounds + 1
                return {
                    message = "+1"
                }
            end
        end

        if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            if card.ability.extra.rounds == 0 then
                SMODS.destroy_cards(card)
            end
            return {
                message = "-1"
            }
        end
    end,
}