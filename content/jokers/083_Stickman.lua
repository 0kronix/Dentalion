SMODS.Joker {
    key = "stickman",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(83, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod_mult = 3, cur_mult = 0 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mod_mult, card.ability.extra.cur_mult } }
    end,

    calculate = function(self, card, context)
        local j, q, k = 0, 0, 0
        if context.before and not context.blueprint then
            for _, played_card in ipairs(context.scoring_hand) do
                if played_card:get_id() == 11 then
                    j = j + 1
                end
                if played_card:get_id() == 12 then
                    q = q + 1
                end
                if played_card:get_id() == 13 then
                    k = k + 1
                end
            end
            if j > 0 and q > 0 and k > 0 then
                card.ability.extra.cur_mult = card.ability.extra.cur_mult + card.ability.extra.mod_mult
                return {
                    message = localize("k_upgrade_ex")
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.cur_mult
            }
        end
    end,
}