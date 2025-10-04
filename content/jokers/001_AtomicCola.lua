SMODS.Joker {
    key = "atomiccola",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(1, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,

    config = { extra = { tag = "tag_boss" } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = card.ability.extra.tag, set = 'Tag' }
		return { vars = { localize{type = 'name_text', set = 'Tag', key = card.ability.extra.tag, nodes = {}} } }
	end,

    calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
                func = (function()
                    Dentalion.create_tag(card.ability.extra.tag, nil)
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
		end
	end
}