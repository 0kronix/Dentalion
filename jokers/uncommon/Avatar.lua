SMODS.Joker {
    key = "avatar",
    atlas = 'uncommon-jokers',
    pos = {x = 4, y = 3},

    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { powmult = 0, mod_powmult = 0.2 },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            "^" .. tostring(card.ability.powmult + 1),
            "^" .. tostring(card.ability.mod_powmult)
        } }
    end,

    calculate = function(self, card, context)
        local leg_joks = 0
        for _, joker in ipairs(G.jokers.cards) do
            if joker:is_rarity(4) then
                leg_joks = leg_joks + 1
            end
        end
        card.ability.powmult = leg_joks * card.ability.mod_powmult
        if context.joker_main then
            if card.ability.powmult > 0 then
                -- Code frome AIJ mod
                local xmlt = mult^card.ability.powmult
                return {
                    remove_default_message = true,
                    Xmult_mod = xmlt,
                    extra = { message = "^" .. (card.ability.powmult + 1) .. " Mult", colour = G.C.GREEN }
                }
            end
        end
    end
}