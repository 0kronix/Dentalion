SMODS.Joker {
    key = "lapizore",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(23, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS["Blue"]
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
		return { vars = { } }
	end,

    calculate = function(self, card, context)
        if context.after then
            if context.scoring_hand and context.full_hand and #context.scoring_hand > 0 and #context.full_hand > 0 then
                for _, played_card in ipairs(context.full_hand) do
                    if played_card.ability.name == 'Stone Card' then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.1,
                            func = function()
                                played_card:set_seal("Blue", nil, true)
                                return true
                            end
                        }))
                        delay(0.5)
                    end
                end
                delay(1)
            end
        end
	end
}