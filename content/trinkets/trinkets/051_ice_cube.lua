Dentalion_API.Trinket {
    key = "icecube",
    pos = Dentalion.get_atlas_pos(51, 10),

    config = { extra = {  } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS["m_dentalion_frozen"]
        return {
            vars = {  }
        }
    end,
}