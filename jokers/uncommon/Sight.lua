SMODS.Joker {
    key = "sight",
    atlas = 'uncommon-jokers',
    pos = {x = 3, y = 2},

    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
	
    config = { extra = { active = false, cur_boosters = 0, boosters = 6, tags = 3 } },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.active then
    		return { vars = {
                card.ability.extra.cur_boosters,
                card.ability.extra.boosters,
                card.ability.extra.tags,
                "Active!"
            } }
        else
            return { vars = {
                card.ability.extra.cur_boosters,
                card.ability.extra.boosters,
                card.ability.extra.tags,
                "Inactive"
            } }
        end
	end,

    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.active = true
            card.ability.extra.cur_boosters = 0
        end
        if card.ability.extra.active and context.open_booster and context.cardarea == G.jokers and not context.blueprint then
            card.ability.extra.cur_boosters = card.ability.extra.cur_boosters + 1
            if card.ability.extra.cur_boosters >= card.ability.extra.boosters then
                card.ability.extra.cur_boosters = 0
                card.ability.extra.active = false
                -- From Visibility
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        for i = 1, card.ability.extra.tags do
                            local tag_key = get_next_tag_key()
                            while tag_key == 'tag_orbital' do
                                tag_key = get_next_tag_key()
                            end
                            add_tag(Tag(tag_key))
                        end
                        return true
                    end),
                }))
                return {
                    message = "+" .. tostring(card.ability.extra.tags) .. " tags"
                }
            else
                return {
                    message = tostring(card.ability.extra.cur_boosters) .. "/" .. tostring(card.ability.extra.boosters)
                }
            end
        end
	end
}