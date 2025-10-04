SMODS.Joker {
    key = "bffs",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(102, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { xmult = 1.5 },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].edition == nil or 
                    (not (G.jokers.cards[i].edition == nil) and G.jokers.cards[i].edition.key ~= "e_negative") then
                    SMODS.calculate_effect({xmult = card.ability.xmult}, G.jokers.cards[i])
                end
            end
            for i = 1, #G.consumeables.cards do
                if G.consumeables.cards[i].edition == nil or 
                    (not (G.jokers.cards[i].edition == nil) and G.jokers.cards[i].edition.key ~= "e_negative") then
                    SMODS.calculate_effect({xmult = card.ability.xmult}, G.consumeables.cards[i])
                end
            end
        end
    end,
}