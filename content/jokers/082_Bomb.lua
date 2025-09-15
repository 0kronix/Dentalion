SMODS.Joker {
    key = "bomb",
    atlas = 'jokers',
    pos = get_atlas_pos(82, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xmult = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if next(SMODS.get_enhancements(context.other_card)) == nil then
                return {
                    xmult = card.ability.extra.xmult,
                    card = context.other_card
                }
            end
        end
        if context.after and SMODS.last_hand_oneshot then
            local left_joker = on_left_or_right_of(card, G.jokers.cards, -1)
            local right_joker = on_left_or_right_of(card, G.jokers.cards, 1)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:start_dissolve()
                    if left_joker ~= nil and not left_joker.ability["eternal"] then
                        left_joker:start_dissolve()
                    end
                    if right_joker ~= nil and not right_joker.ability["eternal"] then
                        right_joker:start_dissolve()
                    end
                    return true
                end
            }))
            delay(0.5)
        end
    end,
}