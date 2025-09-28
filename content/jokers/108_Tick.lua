SMODS.Joker {
    key = "tick",
    atlas = 'jokers',
    pos = get_atlas_pos(108, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
	
    config = { extra = { blind_change = 25 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.blind_change } }
    end,

    add_to_deck = function(self, card, from_debuff)
        if not card.ability.eternal then
            card:set_eternal(true)
        end
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01))
            G.E_MANAGER:add_event(Event({
                trigger = "ease",
                delay = 0.5,
                ref_table = G.GAME.blind,
                ref_value = "chip_text",
                ease_to = G.GAME.blind.chip_text - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01)),
                func = (function(t)
                    return math.floor(t)
                end)
            }))
            return {
                message = "-" .. tostring(card.ability.extra.blind_change) .. "%"
            }
        end
    end,
}