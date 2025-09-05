SMODS.Joker {
    key = "paranoidjoker",
    atlas = 'common-jokers',
    pos = {x = 0, y = 4},

    cost = 5,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { blind_change = 5, cur_disc = 7 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.blind_change, card.ability.extra.cur_disc, card.ability.extra.disc } }
	end,

    calculate = function(self, card, context)
		if context.discard and not context.blueprint then
            card.ability.extra.cur_disc = card.ability.extra.cur_disc - 1
            if card.ability.extra.cur_disc <= 0 then
                card.ability.extra.cur_disc = card.ability.extra.cur_disc + 7
                G.GAME.blind.chips = G.GAME.blind.chips - math.ceil(G.GAME.blind.chips * (card.ability.extra.blind_change * 0.01))
                G.GAME.blind.chip_text = G.GAME.blind.chips
                return {
                    message = "-" .. card.ability.extra.blind_change .. "%"
                }
            end
        end
	end
}