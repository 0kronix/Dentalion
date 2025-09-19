SMODS.Joker {
    key = "ivbag",
    atlas = 'jokers',
    pos = get_atlas_pos(85, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { money_lose = 2, mod_xmult = 0.5 } },

    loc_vars = function(self, info_queue, card)
        local cheap_tally = 0
        if card.area and card.area == G.jokers then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.sell_cost <= card.ability.extra.money_lose + 1 then
                    cheap_tally = cheap_tally + 1
                end
            end
        end
        return { 
            vars = { 
                card.ability.extra.money_lose,
                card.ability.extra.mod_xmult,
                card.ability.extra.money_lose + 1,
                1 + card.ability.extra.mod_xmult * cheap_tally
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local ms_joker = max_sell_joker()
            if ms_joker.sell_cost >= card.ability.extra.money_lose then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        ms_joker.ability.extra_value = ms_joker.ability.extra_value - card.ability.extra.money_lose
                        ms_joker:set_cost()
                        ms_joker:juice_up(0.3, 0.3)
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
                return {
                    message = "-$2",
                    colour = G.C.MONEY,
                    message_card = ms_joker
                }
            end
        end
        if context.joker_main then
            local cheap_tally = 0
            for _, joker in ipairs(G.jokers.cards) do
                if joker.sell_cost <= card.ability.extra.money_lose + 1 then
                    cheap_tally = cheap_tally + 1
                end
            end
            return { 
                xmult = 1 + card.ability.extra.mod_xmult * cheap_tally 
            }
        end
    end,
}