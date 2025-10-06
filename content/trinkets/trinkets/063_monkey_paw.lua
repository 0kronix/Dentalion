Dentalion_API.Trinket {
    key = "monkeypaw",
    pos = Dentalion.get_atlas_pos(63, 10),

    config = { extra = {  } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {  }
        }
    end,
    equip = function(self, card)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
        ease_discard(1)
    end,
    unequip = function(self, card)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
        ease_discard(-1)
    end
}