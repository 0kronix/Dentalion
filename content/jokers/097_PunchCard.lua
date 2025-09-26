SMODS.Joker {
    key = "punchcard",
    atlas = 'jokers',
    pos = get_atlas_pos(97, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_destr = 0, destr = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.destr } }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local no_suit_rank = {}
            for _, playing_card in ipairs(context.full_hand) do
                if SMODS.has_no_rank(playing_card) or SMODS.has_no_suit(playing_card) then
                    table.insert(no_suit_rank, playing_card)
                    card.ability.extra.cur_destr = card.ability.extra.cur_destr + 1
                end
            end

            SMODS.destroy_cards(no_suit_rank)

            while card.ability.extra.cur_destr >= card.ability.extra.destr do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            SMODS.add_card{ set = "Consumeables", area = G.consumeables }
                            play_sound('tarot1')
                            card:juice_up(0.3, 0.3)
                        end
                        return true
                    end
                }))
                card.ability.extra.cur_destr = card.ability.extra.cur_destr - card.ability.extra.destr
            end
        end
    end,
}