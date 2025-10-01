Dentalion_API.Trinket {
    key = "telescopelens",
    pos = get_atlas_pos(48, 10),

    config = { extra = {  } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {  }
        }
    end,
}

SMODS.Booster:take_ownership_by_kind('Spectral', {
    update = function(self, card, dt)
        card.ability.extra_backup = card.ability.extra_backup or card.ability.extra
        card.ability.extra = card.ability.extra_backup + #SMODS.find_card("DentalionTrinket_dentalion_telescopelens")
    end
}, true)