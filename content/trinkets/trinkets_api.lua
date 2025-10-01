SMODS.ObjectType {
        key = "DentalionTrinket"
}

Dentalion_API.Trinket = SMODS.Center:extend {
        required_params = { "key" },
        unlocked = true,
        discovered = true,
        pos = {
            x = 0,
            y = 0
        },
        cost = 5,
        config = {},
        consumeable = true,
        set = 'DentalionTrinket',
        class_prefix = 'DentalionTrinket',
        pools = { "DentalionTrinket" },
        set_card_type_badge = function(self, card, badges)
            badges[#badges + 1] = create_badge(localize('k_dentalion_trinket'), G.ARGS.LOC_COLOURS.TRINKET, G.C.WHITE, 1.2)
        end,
        load = function(self, card, cardTable, other_card)
            card.T.h = G.CARD_W
            card.T.w = G.CARD_W
        end,
        register = function(self)
            local raw_obj_loc_vars = self.loc_vars
            self.loc_vars = function(self, info_queue, card)
                info_queue[#info_queue + 1] = {
                    set = "Other",
                    key = "dentalion_trinket"
                }
                if raw_obj_loc_vars then
                    return raw_obj_loc_vars(self, info_queue, card)
                end
            end
            Dentalion_API.Trinket.super.register(self)
        end,
        equip = function(self, card)
        end,
        unequip = function(self, card)
        end
}

SMODS.Atlas {
        key = "trinkets",
        px = 68,
        py = 68,
        path = "trinkets.png"
}

G.FUNCS.your_collection_dentalion_trinkets_page = function(args)
        if not args or not args.cycle_config then
            return
        end
        for j = 1, #G.your_collection do
            for i = #G.your_collection[j].cards, 1, -1 do
                local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
                c:remove()
                c = nil
            end
        end
        for i = 1, 5 do
            for j = 1, #G.your_collection do
                local center = G.P_CENTER_POOLS.DentalionTrinket[i + (j - 1) * 5 +
                (5 * #G.your_collection * (args.cycle_config.current_option - 1))]
                if not center then
                    break
                end
                local card = Card(G.your_collection[j].T.x + G.your_collection[j].T.w / 2, G.your_collection[j].T.y,
                    G.CARD_W, G.CARD_W, G.P_CARDS.empty, center)
                card.sticker = get_joker_win_sticker(center)
                G.your_collection[j]:emplace(card)
            end
        end
        INIT_COLLECTION_CARD_ALERTS()
end

SMODS.current_mod.custom_collection_tabs = function()
        local tally = 0
        for _, v in pairs(G.P_CENTER_POOLS.DentalionTrinket) do
            if v.discovered or G.PROFILES[G.SETTINGS.profile].all_unlocked then
                tally = tally + 1
            end
        end
        return { UIBox_button {
            button = 'your_collection_dentalion_trinkets',
            id = 'your_collection_dentalion_trinkets',
            label = { localize('k_dentalion_trinkets') },
            count = {
                tally = tally,
                of = #G.P_CENTER_POOLS.DentalionTrinket
            },
            minw = 5
        } }
end
function G.FUNCS.your_collection_dentalion_trinkets()
        G.SETTINGS.paused = true
        G.FUNCS.overlay_menu {
            definition = SMODS.card_collection_UIBox(G.P_CENTER_POOLS.DentalionTrinket, {9, 9, 9, 9}, {
                snap_back = true,
                hide_single_page = true,
                collapse_single_page = true,
                h_mod = 0.65,
                modify_card = function(card, center, i, j)
                    card.T.h = card.T.w
                end
            })
        }
end

local raw_Card_set_sprites = Card.set_sprites
function Card:set_sprites(center, front)
        raw_Card_set_sprites(self, center, front)
        if center and center.set == 'DentalionTrinket' and not center.unlocked then
            self.children.center.atlas = G.ASSET_ATLAS.dentalion_trinkets
            self.children.center.scale = {
                x = G.ASSET_ATLAS.dentalion_trinkets.px,
                y = G.ASSET_ATLAS.dentalion_trinkets.py
            }
            self.children.center.scale_mag = math.min(
                G.ASSET_ATLAS.dentalion_trinkets.px / (self.children.center.VT.W or 1),
                G.ASSET_ATLAS.dentalion_trinkets.py / (self.children.center.VT.H or 1))
            self.children.center:set_sprite_pos({
                x = 0,
                y = 0
            })
        end
end

function Dentalion_API.get_next_trinkets(ret, count)
        local ret = ret or {
            spawn = {}
        }
        local _pool, _pool_key = get_current_pool('DentalionTrinket')
        local already = 0
        G.GAME.current_round.dentalion_trinket = G.GAME.current_round.dentalion_trinket or {
            spawn = {}
        }
        for _, v in ipairs(_pool) do
            if G.GAME.current_round.dentalion_trinket.spawn[v] then
                already = already + 1
            end
        end
        for i = 1, math.min(SMODS.size_of_pool(_pool) - already, count or 1) do
            local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
            local it = 1
            while center == 'UNAVAILABLE' or G.GAME.current_round.dentalion_trinket.spawn[center] do
                it = it + 1
                center = pseudorandom_element(_pool, pseudoseed(_pool_key .. '_resample' .. it))
            end

            ret[#ret + 1] = center
            ret.spawn[center] = true
        end
        return ret
end

function Dentalion_API.add_trinkets_to_shop()
        local trinkets_to_spawn = 0
        G.GAME.current_round.dentalion_trinket = G.GAME.current_round.dentalion_trinket or {
            spawn = {}
        }
        for _ in pairs(G.GAME.current_round.dentalion_trinket.spawn) do
            trinkets_to_spawn = trinkets_to_spawn + 1
        end
        if trinkets_to_spawn < 1 then
            Dentalion_API.get_next_trinkets(G.GAME.current_round.dentalion_trinket)
        end
        for _, key in ipairs(G.GAME.current_round.dentalion_trinket or {}) do
            if G.P_CENTERS[key] and G.GAME.current_round.dentalion_trinket.spawn[key] and key ~= 'j_joker' then
                Dentalion_API.add_trinket_to_shop(key, 'shop_voucher')
            end
        end
end

function Dentalion_API.add_trinket_to_shop(key, source)
        assert(key, "Expected a key")
        assert(G.P_CENTERS[key], "Invalid charm key: " .. key)
        local card = Card(G.shop_vouchers.T.x + G.shop_vouchers.T.w / 2, G.shop_vouchers.T.y, G.CARD_W, G.CARD_W,
            G.P_CARDS.empty, G.P_CENTERS[key], {
                bypass_discovery_center = true,
                bypass_discovery_ui = true
            })
        card[source] = true
        create_shop_card_ui(card, 'Trinket', G.shop_vouchers)
        card:start_materialize()
        G.shop_vouchers:emplace(card)
        G.shop_vouchers.config.card_limit = #G.shop_vouchers.cards
        return card
end

function Dentalion_API.equip_button(card)
        return {
            n = G.UIT.ROOT,
            config = {
                ref_table = card,
                minw = 1.1,
                maxw = 1.3,
                padding = 0.1,
                align = 'bm',
                colour = G.C.GREEN,
                shadow = true,
                r = 0.08,
                minh = 0.98,
                func = 'dentalion_can_equip',
                one_press = true,
                button = 'dentalion_equip_from_shop',
                hover = true
            },
            nodes = { {
                n = G.UIT.T,
                config = {
                    text = localize('b_dentalion_equip'),
                    colour = G.C.WHITE,
                    scale = 0.4
                }
            } }
        }
end

G.FUNCS.dentalion_can_equip = function(e)
    if G.GAME.dollars < 5 then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    else
        e.config.colour = G.C.GREEN
        e.config.button = 'dentalion_equip_from_shop'
    end
end
G.FUNCS.dentalion_equip_from_shop = function(e, mute, nosave)
        e.config.button = nil
        local card = e.config.ref_table
        local area = card.area
        local prev_state = G.STATE
        local delay_fac = 1

        G.TAROT_INTERRUPT = G.STATE
        G.STATE = (G.STATE == G.STATES.TAROT_PACK and G.STATES.TAROT_PACK) or
            (G.STATE == G.STATES.PLANET_PACK and G.STATES.PLANET_PACK) or
            (G.STATE == G.STATES.SPECTRAL_PACK and G.STATES.SPECTRAL_PACK) or
            (G.STATE == G.STATES.STANDARD_PACK and G.STATES.STANDARD_PACK) or
            (G.STATE == G.STATES.BUFFOON_PACK and G.STATES.BUFFOON_PACK) or G.STATES.PLAY_TAROT

        G.CONTROLLER.locks.use = true

        if card.children.use_button then
            card.children.use_button:remove();
            card.children.use_button = nil
        end
        if card.children.price then
            card.children.price:remove();
            card.children.price = nil
        end

        if card.area then
            card.area:remove_card(card)
        end

        delay(0.1)
        G.GAME.round_scores.cards_purchased.amt = G.GAME.round_scores.cards_purchased.amt + 1
        e.config.ref_table:dentalion_equip()

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                G.STATE = prev_state
                G.TAROT_INTERRUPT = nil
                G.CONTROLLER.locks.use = false

                if area and area.cards[1] then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.CONTROLLER.interrupt.focus = nil
                            G.CONTROLLER:snap_to({
                                node = G.shop:get_UIE_by_ID('next_round_button')
                            })
                            return true
                        end
                    }))
                end
                return true
            end
        }))
end

function Card:dentalion_equip()
        if self.config.center.set ~= 'DentalionTrinket' then
            return
        end
        stop_use()
        if self.shop_voucher then
            G.GAME.current_round.dentalion_trinket.spawn[self.config.center_key] = false
        end

        if G.GAME.dentalion_trinket then
            G.P_CENTERS[G.GAME.dentalion_trinket]:unequip(G.dentalion_trinket_area.cards[1])
            G.GAME.used_jokers[G.GAME.dentalion_trinket] = nil
            if G.dentalion_trinket_area.cards[1] then
                G.dentalion_trinket_area.cards[1]:start_dissolve()
            end
        end
        G.GAME.dentalion_trinket = self.config.center_key
        G.GAME.used_jokers[self.config.center_key] = true
        G.dentalion_trinket_area:emplace(self)
        if self.cost ~= 0 then
            ease_dollars(-self.cost)
            inc_career_stat('c_shop_dollars_spent', self.cost)
        end

        self.config.center:equip(self)
        delay(0.6)

        if G.GAME.modifiers.inflation then
            G.GAME.inflation = G.GAME.inflation + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    for k, v in pairs(G.I.CARD) do
                        if v.set_cost then
                            v:set_cost()
                        end
                    end
                    return true
                end
            }))
        end
end

function Dentalion_API.create_trinket_area()
        G.dentalion_trinket_area = CardArea(0, 0, 0.95 * G.CARD_W, 0.95 * G.CARD_W, {
            card_limit = 1,
            type = 'joker',
            highlight_limit = 1
        })
        G.dentalion_trinket_area.ARGS.invisible_area_types = {
            joker = 1
        }
end

local raw_set_screen_positions = set_screen_positions
function set_screen_positions()
        raw_set_screen_positions()
        if G.STAGE == G.STAGES.RUN and G.dentalion_trinket_area then
                G.dentalion_trinket_area.T.x = G.TILE_W - G.dentalion_trinket_area.T.w - 0.5
                G.dentalion_trinket_area.T.y = G.TILE_H - G.deck.T.h - 2.4 * G.dentalion_trinket_area.T.h
        end
end

local raw_CardArea_can_highlight = CardArea.can_highlight
function CardArea:can_highlight(card)
        return self ~= G.dentalion_trinket_area and raw_CardArea_can_highlight(self, card)
end

SMODS.Atlas {
    key = "trinkets",
    px = 68,
    py = 68,
    path = "trinkets.png"
}