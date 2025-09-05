SMODS.Joker {
    key = "comics",
    atlas = 'uncommon-jokers',
    pos = {x = 1, y = 4},

    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { xchips = 2 } },

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.xchips
        } }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            return {
                xchips = card.ability.extra.xchips
            }
        end
        if context.after and context.cardarea == G.jokers and not context.blueprint then
            for _, cards in ipairs(context.scoring_hand) do
                if not cards:is_face() then
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            card:start_dissolve()
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
            end
        end
    end
}