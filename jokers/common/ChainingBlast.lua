SMODS.Joker {
    key = "chainingblast",
    atlas = 'common-jokers',
    pos = {x = 0, y = 5},

    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
	config = { extra = { mult = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_mult
        return { vars = { card.ability.extra.mult } }
	end,

    calculate = function(self, card, context)
        function tablefind(tbl, val)
            for i, v in ipairs(tbl) do
                if v == val then
                    return true
                end
            end
            return false
        end
        local chain_cards = {}
        if context.cardarea == G.play and context.individual then
            for i = 1, #context.full_hand do
                if SMODS.has_enhancement(context.full_hand[i], "m_mult") then
                    if context.full_hand[i-1] ~= nil and not tablefind(chain_cards, context.full_hand[i-1]) 
                        and not SMODS.has_enhancement(context.full_hand[i-1], "m_mult") then
                        table.insert(chain_cards, context.full_hand[i-1])
                    end
                    if context.full_hand[i+1] ~= nil and not tablefind(chain_cards, context.full_hand[i+1]) 
                        and not SMODS.has_enhancement(context.full_hand[i+1], "m_mult") then
                        table.insert(chain_cards, context.full_hand[i+1])
                    end
                end
            end
            if tablefind(chain_cards, context.other_card) then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}