SMODS.Joker {
    key = "virus",
    atlas = 'jokers',
    pos = get_atlas_pos(38, 10),

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { bonus = 0, mod = 1.5 } },

    in_pool = function(self, args)
        return true, { allow_duplicates = true }
    end,

    loc_vars = function(self, info_queue, card)
		return { vars = {
            card.ability.extra.bonus,
            card.ability.extra.mod
        } }
	end,

    update = function(self, card, dt)
        card.ability.extra.bonus = card.ability.extra.mod * #SMODS.find_card('j_dentalion_virus')
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.bonus
            }
        end
	end
}