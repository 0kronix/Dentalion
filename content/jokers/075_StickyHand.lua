SMODS.Joker {
    key = "stickyhand",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(75, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod_chips = 2, cur_chips = 0, max_cards = 5 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mod_chips, card.ability.extra.cur_chips, card.ability.extra.max_cards } }
	end,

    calculate = function(self, card, context)
        if context.press_play and not context.blueprint then
            local any_selected = nil
            G.E_MANAGER:add_event(Event({
                func = function()
                    local cards = math.min(card.ability.extra.max_cards, #G.hand.cards)
                    for i = 1, cards do
                        if G.hand.cards[i] then
                            card.ability.extra.cur_chips = card.ability.extra.cur_chips + card.ability.extra.mod_chips
                            G.hand:add_to_highlighted(G.hand.cards[i], true)
                            any_selected = true
                            play_sound('card1', 1)
                        end
                    end
                    delay(0.2)
                    if any_selected then G.FUNCS.discard_cards_from_highlighted(nil, true) end
                    return true
                end
            }))
            if any_selected then
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.CHIPS
                }
            end
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.cur_chips
            }
        end
	end
}