SMODS.Joker {
    key = "celticcross",
    atlas = 'jokers',
    pos = get_atlas_pos(91, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { mod_powmult = 0.02 },

    loc_vars = function(self, info_queue, card)
        local clubs_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.base.suit == "Clubs" then clubs_tally = clubs_tally + 1 end
            end
        end
        return { vars = { "^" .. tostring(card.ability.mod_powmult), "^" .. tostring(1 + card.ability.mod_powmult * clubs_tally) } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local clubs_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.base.suit == "Clubs" then clubs_tally = clubs_tally + 1 end
            end
            if card.ability.mod_powmult * clubs_tally > 0 then
                -- Code from AIJ mod
                local xmlt = mult^(card.ability.mod_powmult * clubs_tally)
                return {
                    remove_default_message = true,
                    Xmult_mod = xmlt,
                    extra = { message = "^" .. (card.ability.mod_powmult * clubs_tally + 1) .. " Mult", colour = G.C.GREEN }
                }
            end
        end
    end,
}