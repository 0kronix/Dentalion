SMODS.Joker {
    key = "mactonight",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(55, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { money = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_moon']
        return { vars = { card.ability.extra.money } }
	end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.config.center.key == "c_moon" then
            for _, joker in ipairs(G.jokers.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.3,
                    func = function()
                        joker:juice_up(0.3, 0.3)
                        joker.ability.extra_value = joker.ability.extra_value + card.ability.extra.money
                        joker:set_cost()
                        return true
                    end
                }))
            end
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end
    end
}