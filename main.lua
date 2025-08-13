------------ MOD CODE -------------------------

Dentalion = SMODS.current_mod

SMODS.Atlas {
  key = 'modicon',
  px = 32,
  py = 32,
  path = 'icon.png'
}

-- Jokers Atlases
-- Common
SMODS.Atlas{
    key = 'common-jokers',
    path = 'common-jokers.png',
    px = 71,
    py = 95
}

-- Uncommon
SMODS.Atlas{
    key = 'uncommon-jokers',
    path = 'uncommon-jokers.png',
    px = 71,
    py = 95
}

-- Rare
SMODS.Atlas{
    key = 'rare-jokers',
    path = 'rare-jokers.png',
    px = 71,
    py = 95
}

-- Load Jimbos
-- Common
assert(SMODS.load_file("jokers/common/DreamCatcher.lua"))()
assert(SMODS.load_file("jokers/common/Firefly.lua"))()
assert(SMODS.load_file("jokers/common/LastStair.lua"))()
assert(SMODS.load_file("jokers/common/Bodyguard.lua"))()
assert(SMODS.load_file("jokers/common/StarterKit.lua"))()
assert(SMODS.load_file("jokers/common/Decay.lua"))()
assert(SMODS.load_file("jokers/common/DoublesidedCoin.lua"))()
assert(SMODS.load_file("jokers/common/GivewaySign.lua"))()
assert(SMODS.load_file("jokers/common/CandyWrapper.lua"))()
assert(SMODS.load_file("jokers/common/MutantJoker.lua"))()
assert(SMODS.load_file("jokers/common/CrumpledBanknote.lua"))()
assert(SMODS.load_file("jokers/common/Chalks.lua"))()

-- Uncommon
assert(SMODS.load_file("jokers/uncommon/ColoredBag.lua"))()
assert(SMODS.load_file("jokers/uncommon/AtomicCola.lua"))()
assert(SMODS.load_file("jokers/uncommon/HexagonForce.lua"))()
assert(SMODS.load_file("jokers/uncommon/Dinosaur.lua"))()
assert(SMODS.load_file("jokers/uncommon/BlackClover.lua"))()

-- Rare
assert(SMODS.load_file("jokers/rare/CrystalJoker.lua"))()
assert(SMODS.load_file("jokers/rare/Trinket.lua"))()
assert(SMODS.load_file("jokers/rare/TheGoddess.lua"))()
assert(SMODS.load_file("jokers/rare/Pocket.lua"))()
assert(SMODS.load_file("jokers/rare/PlanetsParade.lua"))()

-- Legendary