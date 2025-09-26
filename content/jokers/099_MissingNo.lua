SMODS.Joker {
    key = "missingno",
    atlas = 'jokers',
    pos = get_atlas_pos(99, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = {set = 'Other', key = 'randomize'}
        return { vars = {  } }
    end,

    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

        if context.after and not context.blueprint and G.GAME.current_round.hands_played == 0 then
            randomize_hand({
                list = context.full_hand,
                key = "missingno",
                guaranteed_seal = 0.5,
                guaranteed_enh = 0.8,
                guaranteed_ed = 0.3
            })
        end
    end,
}