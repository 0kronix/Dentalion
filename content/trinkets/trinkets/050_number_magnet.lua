Dentalion_API.Trinket {
    key = "numbermagnet",
    pos = Dentalion.get_atlas_pos(50, 10),

    config = { extra = {  } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {  }
        }
    end,
    calculate = function(self, card, context)
        if context.after then
            local sixes = {}
            for _, playing_card in ipairs(context.full_hand) do
                if playing_card.base.value == "6" then
                    table.insert(sixes, playing_card)
                end
            end
            SMODS.destroy_cards(sixes)
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = function()
                    card:juice_up()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
}