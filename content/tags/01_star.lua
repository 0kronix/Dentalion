SMODS.Tag {
    key = 'star',
    atlas = 'tags',
    pos = get_atlas_pos(1, 6),
    discovered = true,

    config = { levels = 2 },

    loc_vars = function(self, info_queue)
        return { vars = { self.config.levels * (#SMODS.find_card('j_dentalion_fallingstar') > 0 and (#SMODS.find_card('j_dentalion_fallingstar') * 2) or 1) } }
    end,

    apply = function(self, tag, context)
        if context.type == 'hand_played' then
            tag:yep('+', G.C.MONEY, function()
                return true
            end)

            G.E_MANAGER:add_event(Event {
                trigger = 'immediate',
                func = function()
                    local hand,_,_,_,_ = G.FUNCS.get_poker_hand_info(G.play.cards)
                    SMODS.smart_level_up_hand(nil, hand, nil, self.config.levels * (#SMODS.find_card('j_dentalion_fallingstar') > 0 and (#SMODS.find_card('j_dentalion_fallingstar') * 2) or 1))
                    return true
                end
            })

            tag.triggered = true
        end
    end
}