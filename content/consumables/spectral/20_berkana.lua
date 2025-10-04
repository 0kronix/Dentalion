SMODS.Consumable {
    key = 'berkana',
    set = 'Spectral',
    atlas = "consumables",
    pos = {
        x = 9,
        y = 2
    },
    soul_pos = { 
        x = 9,
        y = 3
    },

    cost = 4,
    unlocked = true,
    discovered = true,

    config = { extra = { tags = 2 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'tag_negative', set = 'Tag' }
        info_queue[#info_queue + 1] = { key = 'tag_foil', set = 'Tag' }
        info_queue[#info_queue + 1] = { key = 'tag_holo', set = 'Tag' }
        info_queue[#info_queue + 1] = { key = 'tag_polychrome', set = 'Tag' }
        if next(SMODS.find_mod("allinjest")) then
            info_queue[#info_queue + 1] = { key = 'tag_aij_glimmer', set = 'Tag' }
            info_queue[#info_queue + 1] = { key = 'tag_aij_stellar', set = 'Tag' }
        end
        if next(SMODS.find_mod("paperback")) then
            info_queue[#info_queue + 1] = { key = 'tag_paperback_dichrome', set = 'Tag' }
        end
        return { vars = { 
            card.ability.extra.tags
        } }
    end,

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        if not self:can_use(card) then
            return
        end
        local tag_pool = {"tag_negative", "tag_foil", "tag_holo", "tag_polychrome"}
        if next(SMODS.find_mod("allinjest")) then
            table.insert(tag_pool, "tag_aij_glimmer")
            table.insert(tag_pool, "tag_aij_stellar")
        end
        if next(SMODS.find_mod("paperback")) then
            table.insert(tag_pool, "tag_paperback_dichrome")
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, card.ability.extra.tags do
                    Dentalion.create_tag(pseudorandom_element(tag_pool, "berkana"), nil)
                end
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        delay(0.5)
    end,
}