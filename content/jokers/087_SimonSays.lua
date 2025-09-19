SMODS.Joker {
    key = "simonsays",
    atlas = 'jokers',
    pos = get_atlas_pos(87, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod = 1, instructions = "None", money = 4 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.instructions, card.ability.extra.money } }
    end,

    add_to_deck = function(self, card, from_debuff)
        local ins = {
            "Before scoring",
            "After scoring",
            "Each card played",
            "When trigger",
            "Final step of scoring",
            "At end of round",
            "At start of round",
            "Before discard",
            "Open Booster pack",
            "Skipping Booster pack",
            "Buying card",
            "Selling card",
            "Reroll shop",
            "Ending shop",
            "Hand drawn",
            "Using Consumeable",
            "Skipping Blind",
            "Playing card added to deck",
            "At start of shop",
            "Blind defeated"
        }
        card.ability.extra.mod = pseudorandom("simon", 1, 20)
        card.ability.extra.instructions = ins[card.ability.extra.mod]
    end,

    calculate = function(self, card, context)
        local ins = {
            "Before scoring",
            "After scoring",
            "Each card played",
            "When trigger",
            "Final step of scoring",
            "At end of round",
            "At start of round",
            "Before discard",
            "Open Booster pack",
            "Skipping Booster pack",
            "Buying card",
            "Selling card",
            "Reroll shop",
            "Ending shop",
            "Hand drawn",
            "Using Consumeable",
            "Skipping Blind",
            "Playing card added to deck",
            "At start of shop",
            "Blind defeated"
        }

        if context.beat_boss then
            card:juice_up(0.3, 0.3)
            card.ability.extra.mod = pseudorandom("simon", 1, 20)
        end
        card.ability.extra.instructions = ins[card.ability.extra.mod]

        if card.ability.extra.mod == 1 then
            if context.before and context.cardarea == G.jokers then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 2 then
            if context.after and context.cardarea == G.jokers then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 3 then
            if context.individual and context.cardarea == G.play then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 4 then
            if context.joker_main and context.cardarea == G.jokers then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 5 then
            if context.final_scoring_step and context.cardarea == G.jokers then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 6 and context.cardarea == G.jokers then
            if context.end_of_round then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 7 and context.cardarea == G.jokers then
            if context.setting_blind then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 8 and context.cardarea == G.jokers then
            if context.pre_discard then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 9 and context.cardarea == G.jokers then
            if context.open_booster then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 10 and context.cardarea == G.jokers then
            if context.skipping_booster then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 11 and context.cardarea == G.jokers then
            if context.buying_card then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 12 and context.cardarea == G.jokers then
            if context.selling_card then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 13 and context.cardarea == G.jokers then
            if context.reroll_shop then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 14 and context.cardarea == G.jokers then
            if context.ending_shop then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 15 and context.cardarea == G.jokers then
            if context.hand_drawn then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 16 and context.cardarea == G.jokers then
            if context.using_consumeable then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 17 and context.cardarea == G.jokers then
            if context.skip_blind then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 18 and context.cardarea == G.jokers then
            if context.playing_card_added then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 19 and context.cardarea == G.jokers then
            if context.starting_shop then
                return {
                    dollars = card.ability.extra.money
                }
            end
        elseif card.ability.extra.mod == 20 and context.cardarea == G.jokers then
            if context.blind_defeated then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end
    end,
}