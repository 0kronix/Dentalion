------------ MOD CODE -------------------------

Dentalion = SMODS.current_mod
local mod_path = ''..SMODS.current_mod.path

local function assert_files_from_folder(base_fs)
    local list = {}
    for _, name in ipairs(NFS.getDirectoryItems(mod_path .. base_fs)) do
        local abs = mod_path .. base_fs .. "/" .. name
        local info = NFS.getInfo(abs)
        if info and info.type == "file" and name:match("%.lua$") then
            table.insert(list, name)
        end
    end
    for _, name in ipairs(list) do
        assert(SMODS.load_file(base_fs .. "/" .. name))()
    end
end

-- Misc
assert_files_from_folder("utilities")

-- Blinds
assert_files_from_folder("content/blinds")

-- Decks
assert_files_from_folder("content/decks")

-- Tags
assert_files_from_folder("content/tags")

-- Seals
assert_files_from_folder("content/seals")

-- Enhancements
assert_files_from_folder("content/enhancements")

-- Spectrals
assert_files_from_folder("content/consumables/spectral")

-- Jimbos
assert_files_from_folder("content/jokers")