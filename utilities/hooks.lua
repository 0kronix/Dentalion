-- Special Thanks for Paperback mod!

SMODS.Booster:take_ownership_by_kind('Spectral', {
    update = function(self, card, dt)
        card.ability.extra_backup = card.ability.extra_backup or card.ability.extra
        card.ability.extra = card.ability.extra_backup + #SMODS.find_card("DentalionTrinket_dentalion_telescopelens")
    end
}, true)

local cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
    SMODS.calculate_context({
        cashing_out = true
    })
    cash_out_ref(e)
end

local sell_card_ref = Card.sell_card
function Card:sell_card()
    local ret = sell_card_ref(self)

    if G.jokers and self.ability.set == 'Joker' then
        G.GAME.dentalion_last_sold_joker = self
    end

    return ret
end

local init_game_object_ref = Game.init_game_object
function Game.init_game_object(self)
    local ret = init_game_object_ref(self)

    ret.dentalion = {
        most_played_suit_this_ante = {},
    }

    return ret
end