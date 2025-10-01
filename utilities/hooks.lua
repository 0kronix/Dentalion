-- Special Thanks for Paperback mod!

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