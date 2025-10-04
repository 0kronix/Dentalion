SMODS.Joker {
    key = "snowman",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(76, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_dentalion_frozen']
        return { vars = {  } }
	end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local frozen = 0
            for _, c in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(c, "m_dentalion_frozen") then
                    frozen = frozen + 1
                end
            end
            if frozen == 1 and G.hand.cards and #G.hand.cards > 0 then
                local card = pseudorandom_element(G.hand.cards, "snowman")
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        card:set_ability('m_dentalion_frozen')
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
                return {
                    message = localize("dentalion_frozen_ex"),
                    colour = G.C.CHIPS
                }
            end
        end
	end
}