SMODS.Joker {
    key = "puzzle",
    atlas = 'common-jokers',
    pos = {x = 1, y = 4},

    pixel_size = { w = 71, h = 71 },

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { active = true } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Other', key = 'suit_change_tarot'}
        if card.ability.extra.active then
		    return { vars = { "Active!" } }
        else
            return { vars = { "Inactive" } }
        end
	end,

    calculate = function(self, card, context)
        function tablefind(tbl, val)
            for i, v in ipairs(tbl) do
                if v == val then
                    return i
                end
            end
            return nil
        end
        local suit_change = {"c_sun", "c_star", "c_moon", "c_world"}
        if card.ability.extra.active and not context.blueprint then
            if context.using_consumeable and tablefind(suit_change, context.consumeable.config.center.key) ~= nil then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.0,
                        func = (function()
                            local _card = create_card(nil, G.consumeables, nil, nil, nil, nil, tostring(pseudorandom_element(suit_change, "puzzle")), nil)
                            _card:add_to_deck()
                            G.consumeables:emplace(_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    card.ability.extra.active = false
                    return {
                        message = localize('k_plus_tarot'),
                        card = card
                    }
                end
            end
        end
        if context.setting_blind and not context.blueprint then
            card.ability.extra.active = true
        end
    end
}