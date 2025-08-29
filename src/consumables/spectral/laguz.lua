SMODS.Consumable {
    key = 'laguz',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 5,
        y = 2
    },
    soul_pos = { 
        x = 5,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { odds = 4 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            G.GAME.probabilities.normal,
            card.ability.extra.odds
        } }
    end,

    can_use = function(self, card)
        local total = 0
        if G.jokers.cards then
            for i, v in pairs(SMODS.Sticker.obj_table) do
                for i2, v2 in ipairs(G.jokers.cards) do
                    if v2.ability and v2.ability[i] then
                        total = total + 1
                    end
                end
            end
        end
        return #G.jokers.cards > total and #G.jokers.cards > 0
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local good_jokers = {}
        for _, joker in ipairs(G.jokers.cards) do
            if not joker.ability.eternal and not joker.ability["perishable"] then
                table.insert(good_jokers, joker)
            end
        end
        local rnd_joker = pseudorandom_element(good_jokers, "laguz")
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if pseudorandom("laguz") < G.GAME.probabilities.normal / card.ability.extra.odds then
                    G.GAME.probabilities.normal = G.GAME.probabilities.normal + 1
                end
                rnd_joker:add_sticker("perishable", true)
                rnd_joker:juice_up(0.3, 0.5)
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}