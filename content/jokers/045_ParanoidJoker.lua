SMODS.Joker {
    key = "paranoidjoker",
    atlas = 'jokers',
    pos = get_atlas_pos(45, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { blind_change = 5, cur_disc = 7, need_disc = 7 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.blind_change, card.ability.extra.cur_disc, card.ability.extra.need_disc } }
	end,

    calculate = function(self, card, context)
		if context.discard and not context.blueprint then
            card.ability.extra.cur_disc = card.ability.extra.cur_disc - 1
            if card.ability.extra.cur_disc <= 0 then
                card.ability.extra.cur_disc = card.ability.extra.cur_disc + card.ability.extra.need_disc
                ease_blind(card.ability.extra.blind_change, -1)
                return {
                    message = "-" .. card.ability.extra.blind_change .. "%",
                }
            end
        end
	end
}