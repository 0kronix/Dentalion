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
                G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01))
                card.ability.extra.cur_disc = card.ability.extra.cur_disc + card.ability.extra.need_disc
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
                    message = "-" .. card.ability.extra.blind_change .. "%",
                }
            end
        end
	end
}