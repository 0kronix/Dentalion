SMODS.Joker {
    key = "seraphim",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(74, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { win_cnt = 24, cur_cnt = 24 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.win_cnt, card.ability.extra.cur_cnt } }
	end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card.base.value == "Jack" then
                card.ability.extra.cur_cnt = card.ability.extra.cur_cnt - 1
                if card.ability.extra.cur_cnt <= 0 then
                    card.ability.extra.cur_cnt = card.ability.extra.cur_cnt + card.ability.extra.win_cnt
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = (function()
                            SMODS.add_card{ key = "c_temperance", edition = "e_negative" }
                            return true
                        end)
                    }))
                    return {
                        message = localize("k_plus_tarot")
                    }
                end
            end
        end
	end
}