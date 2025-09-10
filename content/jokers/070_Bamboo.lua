SMODS.Joker {
    key = "bamboo",
    atlas = 'jokers',
    pos = get_atlas_pos(70, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        
	end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and context.cardarea == G.jokers then
            for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        assert(SMODS.modify_rank(G.hand.cards[i], 1))
                        play_sound('card1', percent)
                        G.hand.cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.5)
        end
	end
}