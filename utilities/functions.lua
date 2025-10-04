-- Special Thanks for AIJ mod!

function Dentalion.ease_blind(percent, mod)
    G.GAME.blind.chips = G.GAME.blind.chips + mod * math.ceil(G.GAME.blind.chips * (percent * 0.01))
    G.E_MANAGER:add_event(Event({
        trigger = "ease",
        delay = 0.5,
        ref_table = G.GAME.blind,
        ref_value = "chip_text",
        ease_to = G.GAME.blind.chips,
        func = (function(t)
            return math.floor(t)
        end)
    }))
end

function Dentalion.pseudorandom_string(key, min, max)
    local size = pseudorandom(key .. "size", min, max)
    local letters = {",", "!", "@", "#", "$", "%", "&", "~", "?", ">"}
    local rnd_str = ""

    for i = 1, size do
        rnd_str = rnd_str .. pseudorandom_element(letters, key .. "element")
    end

    return rnd_str
end

function Dentalion.balance_percent(card, percent)
    local chip_mod = percent * hand_chips
    local mult_mod = percent * mult
    local avg = (chip_mod + mult_mod)/2
    hand_chips = hand_chips + (avg - chip_mod)
    mult = mult + (avg - mult_mod)
    local text = localize('k_balanced')
  
    update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
    card_eval_status_text(card, 'extra', nil, nil, nil, {
        message = text,
        colour = { 0.8, 0.45, 0.85, 1 },
        sound = 'gong'
    })
  
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = (function()
            ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
            ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                blocking = false,
                delay = 4.3,
                func = (function()
                    ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
                    ease_colour(G.C.UI_MULT, G.C.RED, 2)
                    return true
                end)
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                blockable = false,
                blocking = false,
                no_delete = true,
                delay = 6.3,
                func = (function()
                    G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2], G.C.BLUE[3], G.C.BLUE[4]
                    G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3], G.C.RED[4]
                    return true
                end)
            }))
            return true
        end)
    }))

    delay(0.6)
    return hand_chips, mult
end

function Dentalion.randomize_hand(args)
    args = args or {}
    local list = args.list or G.hand.cards
    local key = args.key or "rnd_hand"
    if type(args.guaranteed_seal) == "number" then
        local g_seal = false
        local seal_mod = args.guaranteed_seal
    else
        local g_seal = true
    end
    if type(args.guaranteed_enh) == "number" then
        local g_enh = false
        local enh_mod = args.guaranteed_enh
    else
        local g_enh = true
    end
    if type(args.guaranteed_ed) == "number" then
        local g_ed = false
        local ed_mod = args.guaranteed_ed
    else
        local g_ed = true
    end

    local i = 0
    for card_index, playing_card in ipairs(list) do
        local seal_seed = key .. 'seal_' .. card_index .. '_' .. G.GAME.round_resets.ante
        local enhancement_seed = key .. 'enh_' .. card_index .. '_' .. G.GAME.round_resets.ante
        local edition_seed = key .. 'edition_' .. card_index .. '_' .. G.GAME.round_resets.ante
        local suit_seed = key .. 'suit_' .. card_index .. '_' .. G.GAME.round_resets.ante
        local rank_seed = key .. 'rank_' .. card_index .. '_' .. G.GAME.round_resets.ante
        
        local new_seal = SMODS.poll_seal({guaranteed = g_seal, key = seal_seed, mod = seal_mod or 1})
        local new_enhancement = SMODS.poll_enhancement({guaranteed = g_enh, key = enhancement_seed, mod = enh_mod or 1})
        local new_edition = poll_edition(edition_seed, ed_mod or 1, false, g_ed)
        local new_suit = pseudorandom_element(SMODS.Suits, pseudoseed(suit_seed)).key
        local new_rank = pseudorandom_element(SMODS.Ranks, pseudoseed(rank_seed)).key

        G.E_MANAGER:add_event(Event({
            delay = 0.2 + (i * 0.1),
            trigger = 'before', 
            func = function()
                i = i + 1
                play_sound('card1', 0.85 + (i * 0.05))
                playing_card:juice_up(0.3, 0.4)

                if new_seal then
                    playing_card:set_seal(new_seal, true, true)
                end
                if new_enhancement then
                    playing_card:set_ability(G.P_CENTERS[new_enhancement])
                end
                if new_edition then
                    playing_card:set_edition(new_edition, true)
                end

                SMODS.change_base(playing_card, new_suit, new_rank)

                return true 
            end
        }))
    end
end

function Dentalion.prob_check(chance, odds, key)
    if pseudorandom(key) < chance / odds then
        return true
    end
    return false
end

local dark_suits = {"Spades", "Clubs"}
local light_suits = {"Hearts", "Diamonds"}
if next(SMODS.find_mod("paperback")) then
    table.insert(dark_suits, "paperback_Crowns")
    table.insert(light_suits, "paperback_Stars")
end
if next(SMODS.find_mod("Bunco")) then
    table.insert(dark_suits, "bunc_Halberds")
    table.insert(light_suits, "bunc_Fleurons")
end

function Dentalion.convert_to(card, suit, key)
    local suit_conv = suit
    if suit == "dark" then
        suit_conv = pseudorandom_element(dark_suits, key)
    elseif suit == "light" then
        suit_conv = pseudorandom_element(light_suits, key)
    end

    if suit_conv == "bunc_Halberds" or suit_conv == "bunc_Fleurons" then
        G.GAME.Exotic = true
    end

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            card:flip()
            play_sound('card1')
            card:juice_up(0.3, 0.3)
            return true
        end
    }))
    delay(0.2)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = function()
            SMODS.change_base(card, suit_conv)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            card:flip()
            play_sound('card1')
            card:juice_up(0.3, 0.3)
            return true
        end
    }))
    delay(0.5)
end

function Dentalion.is_light_suit(card)
    if card:is_suit("Hearts") or card:is_suit("Diamonds") or 
        card:is_suit("paperback_Stars") or card:is_suit("bunc_Fleurons") then
        return true
    end
    return false
end

function Dentalion.is_dark_suit(card)
    if card:is_suit("Spades") or card:is_suit("Clubs") or 
        card:is_suit("paperback_Crowns") or card:is_suit("bunc_Halberds") then
        return true
    end
    return false
end

function Dentalion.on_left_or_right_of(card, area, step)
    local ret_card
    for i = 1, #area do
        if area[i] == card then
            ret_card = area[i + step]
        end
    end
    return ret_card
end

function Dentalion.most_played_hand()
    local _handname, _played = 'High Card', -1
    for hand_key, hand in pairs(G.GAME.hands) do
        if hand.played > _played and SMODS.is_poker_hand_visible(hand_key) then
            _played = hand.played
            _handname = hand_key
        end
    end
    return _handname
end

function Dentalion.turn_face(card, seed)
    local face_cards = {}
    for _, v in pairs(SMODS.Ranks) do
        if v.face then
            table.insert(face_cards, v)
        end
    end
    assert(SMODS.change_base(card, nil, pseudorandom_element(face_cards, seed).key))
    card:juice_up(0.3, 0.5)
end

function Dentalion.create_tag(tag, seed)
    local tag_pool = get_current_pool('Tag')
    if tag == nil then
        tag = pseudorandom_element(tag_pool, seed)
    else
        return add_tag(Tag(tag, false, 'Small'))
    end
    local it = 1
    while tag == 'UNAVAILABLE' do
        it = it + 1
        tag = pseudorandom_element(tag_pool, seed .. it)
    end
    return add_tag(Tag(tag, false, 'Small'))
end

function Dentalion.create_voucher(voucher, seed, cost_mod, cost)
    local voucher_pool = get_current_pool('Voucher')
    local voucher_card = nil
    if voucher == nil then
        local it = 1
        voucher = pseudorandom_element(voucher_pool, seed)
        while voucher == 'UNAVAILABLE' do
            it = it + 1
            voucher = pseudorandom_element(voucher_pool, seed .. it)
        end
        voucher_card = SMODS.create_card({ area = G.play, key = voucher })
    else
        voucher_card = SMODS.create_card({ area = G.play, key = voucher })
    end

    voucher_card:start_materialize()
    if cost_mod == "set" then
        voucher_card.cost = cost
    elseif cost_mod == "mult" then
        voucher_card.cost = voucher_card.cost * cost
    elseif cost_mod == "mod" then
        voucher_card.cost = voucher_card.cost + cost
    else
        voucher_card.cost = voucher_card.cost
    end
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
end

function Dentalion.max_sell_joker()
    local max_sell = -999999
    local max_sell_joker = nil
    for _, joker in ipairs(G.jokers.cards) do
        if joker.sell_cost > max_sell then 
            max_sell_joker = joker
            max_sell = joker.sell_cost
        end
    end
    return max_sell_joker
end

function Dentalion.apply_multiplier(t, key, factor, tag)
    t.temp_mult_val = t.temp_mult_val or {}
    t.temp_mult_val[key] = t.temp_mult_val[key] or {}
    t.temp_mult_val[key][tag] = factor
    update_multiplied_value(t, key)
end

function Dentalion.remove_multiplier(t, key, tag)
    if t.temp_mult_val and t.temp_mult_val[key] then
        t.temp_mult_val[key][tag] = nil
        update_multiplied_value(t, key)
    end
end

function Dentalion.update_multiplied_value(t, key)
    local base = t["base_"..key] or t[key]
    t["base_"..key] = base  -- Save original if not already
    local result = base
    for _, mult in pairs(t.temp_mult_val[key] or {}) do
        result = result * mult
    end
    t[key] = result
end

function Dentalion.table_find(tbl, val)
    for i, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

function Dentalion.most_popular_suit()
    local suits = {}
    if G.playing_cards then
        for _, playing_card in ipairs(G.playing_cards) do
            if not SMODS.has_no_suit(playing_card) then
                local cur_suit = playing_card.base.suit
                table.insert(suits, cur_suit)
                suits[cur_suit] = suits[cur_suit] and (suits[cur_suit] + 1) or 1
            end
        end
        local max_suit_count = -999999
        local max_suit = nil
        for _, suit in ipairs(suits) do
            if suits[suit] > max_suit_count then
                max_suit_count = suits[suit]
                max_suit = suit
            end
        end

        if max_suit ~= nil then
            return max_suit, max_suit_count
        else
            return "Hearts", 0
        end
    else
        return "Hearts", 0
    end
end

function Dentalion.get_atlas_pos(id, atl)
    local x_id, y_id = 0, 0
    if atl > 0 then
        if id <= atl then
            x_id = id - 1
        else
            if id % atl ~= 0 then
                x_id = id % atl - 1
            else
                x_id = atl - 1
            end
        end
        y_id = math.ceil(id / atl) - 1
        return {x = x_id, y = y_id}
    else
        return { y = id - 1 }
    end
end