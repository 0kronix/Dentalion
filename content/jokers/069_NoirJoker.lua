SMODS.Joker {
    key = "noirjoker",
    atlas = 'jokers',
    pos = get_atlas_pos(69, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { mod_xchips = 0.2 } },

    loc_vars = function(self, info_queue, card)
        local black = 0
        if G.hand then
            for _, hcard in ipairs(G.hand.cards) do
                if not tablefind(G.hand.highlighted, hcard) and is_dark_suit(hcard) then
                    black = black + 1
                end
            end
        end
        if next(SMODS.find_mod("paperback")) and next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_pb'}
        elseif next(SMODS.find_mod("paperback")) and not next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_p'}
        elseif not next(SMODS.find_mod("paperback")) and next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_b'}
        else
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits'}
        end
		return { vars = { card.ability.extra.mod_xchips, 1 + black * card.ability.extra.mod_xchips } }
	end,

    calculate = function(self, card, context)
        local black = 0
        for _, hcard in ipairs(G.hand.cards) do
            if is_dark_suit(hcard) then
                black = black + 1
            end
        end
    	if context.joker_main then
            return {
                xchips = 1 + black * card.ability.extra.mod_xchips
            }
        end
	end
}