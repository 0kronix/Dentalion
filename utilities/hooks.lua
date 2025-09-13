-- Special Thanks for Paperback mod!

local init_game_object_ref = Game.init_game_object
function Game.init_game_object(self)
    local ret = init_game_object_ref(self)

    ret.dentalion = {
        most_played_suit_this_ante = {},
    }
    return ret
end