------------ MOD CODE -------------------------

Dentalion = SMODS.current_mod

loc_colour()
G.ARGS.LOC_COLOURS.GREY = HEX('ADD8E6')
G.ARGS.LOC_COLOURS.INDIGO = HEX('4B0082')

-- Special thanks for AIJ Mod
SMODS.Gradient {
    key = 'plasma',
    colours = {
        HEX('F9A2E6'), HEX('b288bc')
    },
    cycle = 5,
    interpolation = 'trig'
}

SMODS.Atlas {
  key = 'modicon',
  px = 32,
  py = 32,
  path = 'icon.png'
}

SMODS.Atlas {
    key = "decks",
    path = "decks.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "consumables",
    path = "consumables.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "enhancements",
    path = "enhancements.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "seals",
    path = "seals.png",
    px = 71,
    py = 95
}

-- Jokers Atlases
SMODS.Atlas{
    key = 'jokers',
    path = 'jokers.png',
    px = 71,
    py = 95
}

-- Legendary
SMODS.Atlas{
    key = 'legendary-jokers',
    path = 'legendary-jokers.png',
    px = 71,
    py = 95
}


-- Load Decks
SMODS.Back {
    key = "fashion",
    atlas = "decks",
    pos = { x = 0, y = 0},
    config = {
        joker_slot = -2,
        dollars = 6
    },
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = create_card("Joker", G.jokers, true, 4, nil, nil, nil, "")
                    card:add_to_deck()
                    card:start_materialize()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
    end
}

function tablefind(tbl, val)
    for i, v in ipairs(tbl) do
        if v == val then
            return true
        end
    end
    return false
end

function get_atlas_pos(id, atl)
    local x_id, y_id = 0, 0
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
end

local mod_path = ''..SMODS.current_mod.path

local function get_files_in_folder(base_fs, out)
    for _, name in ipairs(NFS.getDirectoryItems(base_fs)) do
        local abs = base_fs.."/"..name
        local info = NFS.getInfo(abs)
        if info and info.type == "file" and name:match("%.lua$") then
            table.insert(out, name)
        end
    end
end

local function assert_files_from_folder(base_fs, list)
    for _, name in ipairs(list) do
        assert(SMODS.load_file(base_fs .. "/" .. name))()
    end
end

-- Seals
local seals = {}
get_files_in_folder(mod_path .. "content/seals", seals)
assert_files_from_folder("content/seals", seals)

-- Enhancements
local enhancements = {}
get_files_in_folder(mod_path .. "content/enhancements", enhancements)
assert_files_from_folder("content/enhancements", enhancements)

-- Spectrals
local spectrals = {}
get_files_in_folder(mod_path .. "content/consumables/spectral", spectrals)
assert_files_from_folder("content/consumables/spectral", spectrals)

-- Load Jimbos
local jokers = {}
get_files_in_folder(mod_path .. "content/jokers", jokers)
assert_files_from_folder("content/jokers", jokers)