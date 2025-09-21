SMODS.Joker {
    key = "d20",
    atlas = 'jokers',
    pos = get_atlas_pos(92, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint and context.card.ability.set == "Joker" then
            if context.card:is_rarity(2) then
                G.E_MANAGER:add_event(Event({
                    delay = 0.2,
                    func = function()
                        create_tag("tag_uncommon", nil)
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            elseif context.card:is_rarity(3) then
                G.E_MANAGER:add_event(Event({
                    delay = 0.2,
                    func = function()
                        create_tag("tag_rare", nil)
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            end
        end
    end,
}