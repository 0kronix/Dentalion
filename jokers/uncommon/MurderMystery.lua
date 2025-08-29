SMODS.Joker {
    key = "murdermystery",
    atlas = 'uncommon-jokers',
    pos = {x = 0, y = 2},

    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { cur_xmult = 1, mod_xmult = 0.5, faces_kills = 0, active = true } },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.active then
            return { vars = { 
                card.ability.extra.cur_xmult,
                card.ability.extra.mod_xmult,
                card.ability.extra.faces_kills,
                "Active!"
            } }
        else
            return { vars = { 
                card.ability.extra.cur_xmult,
                card.ability.extra.mod_xmult,
                card.ability.extra.faces_kills,
                "Inactive"
            } }
        end
	end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.active = true
        end
        if context.after and card.ability.extra.active and not context.blueprint then
            if context.full_hand[1]:is_face() then
                card.ability.extra.faces_kills = card.ability.extra.faces_kills + 1
                if card.ability.extra.faces_kills >= 3 then
                    card.ability.extra.cur_xmult = card.ability.extra.cur_xmult + card.ability.extra.mod_xmult
                    card.ability.extra.faces_kills = 0
                    SMODS.destroy_cards(context.full_hand[1])
                    card.ability.extra.active = false
                    delay(1)
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                        card = card
                    }
                end
            else
                card.ability.extra.faces_kills = 0
            end
            SMODS.destroy_cards(context.full_hand[1])
            card.ability.extra.active = false
            delay(1)
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.cur_xmult
            }
        end
	end
}