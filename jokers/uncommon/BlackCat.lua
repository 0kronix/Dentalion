-- Based on Cardsauce "Plague Walker" joker
SMODS.Joker {
    key = "blackcat",
    atlas = 'uncommon-jokers',
    pos = {x = 0, y = 3},

    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { lucky_mult = 30, 
                        lucky_money = 30,
                        old_lucky_mult = 20, 
                        old_lucky_money = 20,
                    } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_lucky
        return { vars = { 
                    card.ability.extra.lucky_mult,
                    card.ability.extra.lucky_money,
                    card.ability.extra.old_lucky_mult,
                    card.ability.extra.old_lucky_money,
                } }
    end,

    in_pool = function(self, args)
        if not G.playing_cards then return true end
        
        for _, v in ipairs(G.playing_cards) do
            if v.config.center.key == 'm_lucky' then
                return true
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        local cats = SMODS.find_card('j_dentalion_blackcat')
        local other_cat = false
        for _, v in ipairs(cats) do
            if v ~= card and not v.debuff then
                other_cat = true
                break
            end
        end

        if other_cat then return end

        G.P_CENTERS.m_lucky.config.mult = card.ability.extra.lucky_mult
        G.P_CENTERS.m_lucky.config.p_dollars = card.ability.extra.lucky_money

        for _, v in pairs(G.I.CARD) do
            if v.config and v.config.center and v.config.center.key == 'm_lucky' then
                v.ability.p_dollars = card.ability.extra.lucky_money
                v.ability.mult = card.ability.extra.lucky_mult
            end
        end
    end,

    load = function(self, card, cardTable, other_card)
        local cats = SMODS.find_card('j_dentalion_blackcat')
        local other_cat = false
        for _, v in ipairs(cats) do
            if v ~= card and not v.debuff then
                other_cat = true
                break
            end
        end

        if other_cat then return end

        G.P_CENTERS.m_lucky.config.mult = card.ability.extra.lucky_mult
        G.P_CENTERS.m_lucky.config.p_dollars = card.ability.extra.lucky_money

        for _, v in pairs(G.I.CARD) do
            if v.config and v.config.center and v.config.center.key == 'm_lucky' then
                v.ability.p_dollars = card.ability.extra.lucky_money
                v.ability.mult = card.ability.extra.lucky_mult
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        local cats = SMODS.find_card('j_dentalion_blackcat')
        local other_cat = false
        for _, v in ipairs(cats) do
            if v ~= card and not v.debuff then
                other_cat = true
                break
            end
        end

        if other_cat then return end

        G.P_CENTERS.m_lucky.config.mult = card.ability.extra.old_lucky_mult
        G.P_CENTERS.m_lucky.config.p_dollars = card.ability.extra.old_lucky_money

        for _, v in pairs(G.I.CARD) do
            if v.config and v.config.center and v.config.center.key == 'm_lucky' then
                v.ability.p_dollars = card.ability.extra.old_lucky_money
                v.ability.mult = card.ability.extra.old_lucky_mult
            end
        end
    end
}