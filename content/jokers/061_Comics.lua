SMODS.Joker {
    key = "comics",
    atlas = 'jokers',
    pos = get_atlas_pos(61, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
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
            local faces = 0
            for _, card in ipairs(context.scoring_hand) do
                if card:is_face() then
                    faces = faces + 1
                end
            end
            if faces < 1 then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:start_dissolve()
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                return {
                    message = localize("k_extinct_ex")
                }
            end
        end
    end
}