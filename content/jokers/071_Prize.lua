-- Special Thanks to AIJ mod!
SMODS.Joker {
    key = "prize",
    atlas = 'jokers',
    pos = Dentalion.get_atlas_pos(71, 10),

    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        
	end,

    remove_from_deck = function(self, card, from_debuff)
        Dentalion.remove_multiplier(G.GAME, "interest_amount", tostring(card).."prize")
    end,

    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint and context.cardarea == G.jokers then
            Dentalion.apply_multiplier(G.GAME, "interest_amount", 2, tostring(card).."prize")
            return {
                message = "X2 Interest",
                colour = G.C.MONEY
            }
        end
        if not context.blueprint and context.cashing_out then
            Dentalion.remove_multiplier(G.GAME, "interest_amount", tostring(card).."prize")
        end
	end
}