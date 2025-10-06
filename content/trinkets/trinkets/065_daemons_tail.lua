Dentalion_API.Trinket {
    key = "daemonstail",
    pos = Dentalion.get_atlas_pos(65, 10),

    config = { extra = { money = 2 } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        if next(SMODS.find_mod("paperback")) and next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_pb'}
        elseif next(SMODS.find_mod("paperback")) and not next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_p'}
        elseif not next(SMODS.find_mod("paperback")) and next(SMODS.find_mod("Bunco")) then
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits_b'}
        else
            info_queue[#info_queue + 1] = {set = 'Other', key = 'dark_suits'}
        end
        return {
            vars = { card.ability.extra.money }
        }
    end,

    calculate = function(self, card, context)
        if context.before then
            local check = true
            for _, playing_card in ipairs(context.full_hand) do
                if SMODS.has_no_suit(playing_card) or not Dentalion.is_dark_suit(playing_card) then
                    check = false
                end
            end

            if check then
                return {
                    dollars = card.ability.extra.money
                }
            end
        end
    end,
}