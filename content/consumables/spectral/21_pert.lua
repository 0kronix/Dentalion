SMODS.Consumable {
    key = 'pert',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 0,
        y = 4
    },
    soul_pos = { 
        x = 0,
        y = 5
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = {  } },

    loc_vars = function(self, info_queue, card)
        return { vars = { 
            
        } }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local voucher_pool = get_current_pool('Voucher')
        local selected_voucher = pseudorandom_element(voucher_pool, 'modprefix_seed')
        local it = 1
        while selected_voucher == 'UNAVAILABLE' do
            it = it + 1
            selected_voucher = pseudorandom_element(voucher_pool, 'modprefix_seed' .. it)
        end
        local voucher_card = SMODS.create_card({ area = G.play, key = selected_voucher })
        voucher_card:start_materialize()
        voucher_card.cost = voucher_card.cost * 2
        G.play:emplace(voucher_card)
        delay(0.8)
        voucher_card:redeem()

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.5,
            func = function()
                voucher_card:start_dissolve()
                return true
            end
        }))
        delay(0.5)
    end,
}