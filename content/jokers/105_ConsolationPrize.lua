SMODS.Joker {
    key = "consolationprize",
    atlas = 'jokers',
    pos = get_atlas_pos(105, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod_mult = 8, cur_mult = 0, money = 2, active = true } },

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.mod_mult,
            card.ability.extra.cur_mult,
            card.ability.extra.money
        } }
    end,

    calculate = function(self, card, context)
        if context.ending_shop and not context.blueprint and card.ability.extra.active then
            card.ability.extra.cur_mult = card.ability.extra.cur_mult + card.ability.extra.mod_mult
            ease_dollars(card.ability.extra.money)
            card.ability.extra.active = false
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.MULT
            }
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.cur_mult
            }
        end

        if context.buying_card and not context.blueprint and card.ability.extra.active then
            card.ability.extra.active = false
        end

        if context.end_of_round and not context.blueprint and not card.ability.extra.active then
            card.ability.extra.active = true
        end
    end,
}