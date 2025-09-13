SMODS.Joker {
    key = "darkpeasant",
    atlas = 'jokers',
    pos = get_atlas_pos(43, 10),

    cost = 8,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { hand_bonus = 0, max_bonus = 7 } },

    loc_vars = function(self, info_queue, card)
    	return { vars = { 
					card.ability.extra.hand_bonus,
                    card.ability.extra.max_bonus
				}
			}
	end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_bonus)
    end,

    calculate = function(self, card, context)
    	if context.reroll_shop and not context.blueprint then
            if card.ability.extra.hand_bonus <= card.ability.extra.max_bonus then
                card.ability.extra.hand_bonus = card.ability.extra.hand_bonus + 1
                return {
                    message = localize("k_upgrade_ex")
                }
            end
        end
        if context.setting_blind and context.cardarea == G.jokers and not context.blueprint then
            G.hand:change_size(card.ability.extra.hand_bonus)
            return {
                message = "+" .. tostring(card.ability.extra.hand_bonus) .. " hand size"
            }
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            G.hand:change_size(-card.ability.extra.hand_bonus)
            card.ability.extra.hand_bonus = 0
            return {
                message = localize("k_reset")
            }
        end
	end
}