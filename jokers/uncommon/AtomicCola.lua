SMODS.Joker {
    key = "atomiccola",
    atlas = 'uncommon-jokers',
    pos = {x = 1, y = 0},

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
		return { vars = { localize{type = 'name_text', set = 'Tag', key = 'tag_boss', nodes = {}} } }
	end,

    calculate = function(self, card, context)
		if context.selling_self then
			G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_boss'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
		end
	end
}