SMODS.Joker {
    key = "kinderjoke",
    atlas = 'jokers',
    pos = get_atlas_pos(96, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
    config = { extra = { rounds = 2, cur_rounds = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rounds, card.ability.extra.cur_rounds } }
    end,

    add_to_deck = function(self, card, from_debuff)
        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    SMODS.add_card {
                        set = 'Joker',
                        rarity = 'Common',
                        key_append = 'kinder',
                        no_edition = true
                    }
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
        end
    end,

    calculate = function(self, card, context)
        local commons = {}
        for _, joker in ipairs(G.jokers.cards) do
            if joker:is_rarity(1) and joker.edition == nil then
                table.insert(commons, joker)
            end
        end
        
        if context.selling_self and not context.blueprint and card.ability.extra.cur_rounds >= card.ability.extra.rounds then
            local rnd_common = pseudorandom_element(commons, "kinder")
            rnd_common:set_edition("e_negative")
            return {
                message = localize("dentalion_negative_ex"),
                colour = G.ARGS.LOC_COLOURS.INDIGO,
                message_card = rnd_common
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