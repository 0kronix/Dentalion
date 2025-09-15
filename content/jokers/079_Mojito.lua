SMODS.Joker {
    key = "mojito",
    atlas = 'jokers',
    pos = get_atlas_pos(79, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { odds = 8 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['dentalion_lightgreen']

        return { vars = { G.GAME.probabilities.normal, card.ability.extra.odds } }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            for _, played_card in ipairs(context.scoring_hand) do
                if played_card.seal and pseudorandom("mojito") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            played_card:set_seal('dentalion_lightgreen', nil, true)
                            played_card:juice_up(0.3, 0.5)
                            play_sound('tarot1')
                            return true
                        end
                    }))
                end
            end
        end
    end,
}