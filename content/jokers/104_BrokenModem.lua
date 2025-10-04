SMODS.Joker {
    key = "brokenmodem",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(104, 10),

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
        if context.selling_card and not context.blueprint then
            if pseudorandom("modem", 1, 100) < 50 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        local copied_card = copy_card(context.card, nil, nil, nil, nil)
                        copied_card:start_materialize()
                        copied_card:add_to_deck()
                        context.card.area:emplace(copied_card)
                        play_sound("dentalion_glitch")
                        card:juice_up(0.2 + pseudorandom("modem1"), 0.2 + pseudorandom("modem2"))
                        return true
                    end
                }))
                return {
                    message = pseudorandom_string("modem1", 1, 3) .. localize("dentalion_glitch_ex") .. pseudorandom_string("modem1", 1, 3),
                    colour = G.C.BLACK
                }
            end
        end
    end,
}