SMODS.Joker {
    key = "recall",
    atlas = 'jokers',
    pos = get_atlas_pos(107, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
    config = { extra = { rounds = 1, cur_rounds = 0 } },

    loc_vars = function(self, info_queue, card)
        if G.GAME.dentalion_last_sold_joker ~= nil then  
            info_queue[#info_queue + 1] = G.P_CENTERS[G.GAME.dentalion_last_sold_joker.config.center.key] 
        end
        return { vars = { card.ability.extra.rounds, card.ability.extra.cur_rounds } }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and card.ability.extra.cur_rounds < card.ability.extra.rounds
            and context.game_over == false and context.main_eval then
            card.ability.extra.cur_rounds = card.ability.extra.cur_rounds + 1
            if card.ability.extra.cur_rounds >= card.ability.extra.rounds then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.2,
                    func = function()
                        if G.GAME.dentalion_last_sold_joker ~= nil then
                            SMODS.add_card { key = G.GAME.dentalion_last_sold_joker.config.center.key, edition = "e_negative" }
                        end
                        return true
                    end
                }))
                SMODS.destroy_cards(card)
                return nil, true
            end
            return {
                message = tostring(card.ability.extra.cur_rounds) .. "/" .. tostring(card.ability.extra.rounds),
                colour = G.C.FILTER
            }
        end
    end,
}