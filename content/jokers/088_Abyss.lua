SMODS.Joker {
    key = "abyss",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(88, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod_xmult = 0.15, cur_xmult = 1 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mod_xmult, card.ability.extra.cur_xmult } }
    end,

    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint then
            if #G.consumeables.cards > 0 then
                card.ability.extra.cur_xmult = card.ability.extra.cur_xmult + card.ability.extra.mod_xmult
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.2,
                    func = function()
                        SMODS.destroy_cards(G.consumeables.cards[1])
                        return true
                    end
                }))
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.MULT
                }
            else
                card.ability.extra.cur_xmult = 1
                return {
                    message = localize("k_reset"),
                    colour = G.C.MULT
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.cur_xmult
            }
        end
    end,
}