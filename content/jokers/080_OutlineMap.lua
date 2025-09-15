SMODS.Joker {
    key = "outlinemap",
    atlas = 'jokers',
    pos = get_atlas_pos(80, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['dentalion_lightgreen']

        return { vars = {  } }
    end,

    calculate = function(self, card, context)
        if context.discard and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if context.other_card.seal and context.other_card.seal == "dentalion_lightgreen" then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                        SMODS.add_card({ set = 'Planet' })
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                }))
                return { 
                    message = localize('dentalion_plus_planet_ex'), 
                    colour = G.C.SECONDARY_SET.Planet
                }
            end
        end
    end,
}