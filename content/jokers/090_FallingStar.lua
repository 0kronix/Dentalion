SMODS.Joker {
    key = "fallingstar",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(90, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { tag = "tag_dentalion_star" } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = card.ability.extra.tag, set = 'Tag' }
        return { vars = { localize { type = 'name_text', key = card.ability.extra.tag, set = 'Tag' } } }
    end,

    calculate = function(self, card, context)
        if context.round_eval and G.GAME.last_blind and G.GAME.last_blind.boss then
            G.E_MANAGER:add_event(Event({
                delay = 0.2,
                func = function()
                    Dentalion.create_tag(card.ability.extra.tag, nil)
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
        end
    end,
}