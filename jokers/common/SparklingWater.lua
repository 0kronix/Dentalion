SMODS.Joker {
    key = "sparklingwater",
    atlas = 'common-jokers',
    pos = {x = 2, y = 3},

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { cur_boosters = 0, boosters = 6 } },

    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.cur_boosters, card.ability.extra.boosters } }
	end,

    calculate = function(self, card, context)
		if context.skipping_booster then
            card.ability.extra.cur_boosters = card.ability.extra.cur_boosters + 1
            if card.ability.extra.cur_boosters >= card.ability.extra.boosters and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        local s_card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                        s_card:add_to_deck()
                        G.consumeables:emplace(s_card)
                        G.GAME.consumeable_buffer = 0
                        return true
                    end
                )}))
                delay(0.5)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                card:remove()
                                return true
                            end
                        }))
                        return true
                    end
                }))
                return {
                    message = localize('k_eaten_ex')
                }
            else
                return {
                    message = tostring(card.ability.extra.cur_boosters) .. "/" .. tostring(card.ability.extra.boosters)
                }
            end
        end
	end
}