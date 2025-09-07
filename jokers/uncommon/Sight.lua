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
	
    config = { extra = { active = true, cur_boosters = 0, boosters = 6, tags = 3 } },

    loc_vars = function(self, info_queue, card)
        main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = card.ability.extra.active and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. (card.ability.extra.active and 'active' or 'inactive') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        }
        if card.area and card.area == G.jokers then
            return { main_end = main_end, 
                vars = { 
                    card.ability.extra.cur_boosters,
                    card.ability.extra.boosters,
                    card.ability.extra.tags, 
                }
            }
        else
            return { 
                vars = { 
                    card.ability.extra.cur_boosters,
                    card.ability.extra.boosters,
                    card.ability.extra.tags, 
                }
            }
        end
	end,

    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.active = true
            card.ability.extra.cur_boosters = 0
            return {
                message = localize("k_reset")
            }
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
                            card:juice_up(0.3, 0.5)
                        end
                        return true
                    end),
                }))
            else
                return {
                    message = tostring(card.ability.extra.cur_boosters) .. "/" .. tostring(card.ability.extra.boosters)
                }
            end
        end
	end
}