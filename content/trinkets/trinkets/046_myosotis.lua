Dentalion_API.Trinket {
    key = "myosotis",
    pos = get_atlas_pos(46, 10),

    config = { extra = {  } },

    atlas = 'trinkets',
    unlocked = true,
    loc_vars = function(self, info_queue, card)
        local fool_c = G.GAME.last_tarot_planet and G.P_CENTERS[G.GAME.last_tarot_planet] or nil
        local last_tarot_planet = fool_c and localize { type = 'name_text', key = fool_c.key, set = fool_c.set } or
            localize('k_none')
        local colour = (not fool_c or fool_c.name == 'The Fool') and G.C.RED or G.C.GREEN

        if not (not fool_c or fool_c.name == 'The Fool') then
            info_queue[#info_queue + 1] = fool_c
        end

        local main_end = {
            {
                n = G.UIT.C,
                config = { align = "bm", padding = 0.02 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "m", colour = colour, r = 0.05, padding = 0.05 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_tarot_planet .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }
                    }
                }
            }
        }

        return { vars = { last_tarot_planet }, main_end = main_end }
    end,
    calculate = function(self, card, context)
        if context.beat_boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if G.consumeables.config.card_limit > #G.consumeables.cards and G.GAME.last_tarot_planet then
                        play_sound('timpani')
                        SMODS.add_card({ key = G.GAME.last_tarot_planet })
                        card:juice_up()
                    end
                    return true
                end
            }))
            delay(0.6)
            return {
                message = localize("k_plus_tarot")
            }
        end
    end
}