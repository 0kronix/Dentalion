Dentalion_API.Trinket {
    key = "storecredit",
    pos = get_atlas_pos(4, 10),

    config = { extra = { active = false } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {  }
        }
    end,
    calculate = function(self, card, context)
        if context.entering_shop then
            card.ability.extra.active = true
            if G.shop_jokers then
                card:juice_up()
                for i = 1, #G.shop_jokers.cards do
                    G.shop_jokers.cards[i].ability.couponed = true
                    G.shop_jokers.cards[i]:set_cost()
                end
            end
        end

        if context.buying_card and card.ability.extra.active then
            card:start_dissolve()
        end
    end
}