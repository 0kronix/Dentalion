SMODS.Joker {
    key = "antigravity",
    atlas = 'jokers',
    pos = get_atlas_pos(101, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
    config = { extra = { rounds = 4, cur_rounds = 0, maximum = 999 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rounds, card.ability.extra.cur_rounds, card.ability.extra.maximum } }
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint and card.ability.extra.cur_rounds >= card.ability.extra.rounds then
            local check = 1
            if G.GAME.dollars < 0 then check = -1 end
            G.GAME.dollars = check * math.min( card.ability.extra.maximum, tonumber(string.reverse(tostring(math.abs(G.GAME.dollars)))) )
            return {
                message = localize("dentalion_reverse_ex"),
                colour = G.C.MONEY
            }
        end

        if context.end_of_round and not context.blueprint and card.ability.extra.cur_rounds < card.ability.extra.rounds 
            and context.game_over == false and context.main_eval then
            card.ability.extra.cur_rounds = card.ability.extra.cur_rounds + 1
            if card.ability.extra.cur_rounds >= card.ability.extra.rounds then
                local eval = function(card) return not card.REMOVED end
                juice_card_until(card, eval, true)
            end
            return {
                message = (card.ability.extra.cur_rounds >= card.ability.extra.rounds) and localize('k_active_ex') or tostring(card.ability.extra.cur_rounds) .. "/" .. tostring(card.ability.extra.rounds),
                colour = G.C.FILTER
            }
        end
    end,
}