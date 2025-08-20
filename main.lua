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

-- Legendary
SMODS.Atlas{
    key = 'legendary-jokers',
    path = 'legendary-jokers.png',
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
assert(SMODS.load_file("jokers/common/MilkyWay.lua"))()
assert(SMODS.load_file("jokers/common/Partner.lua"))()
assert(SMODS.load_file("jokers/common/TrafficLights.lua"))()
assert(SMODS.load_file("jokers/common/Ouroboros.lua"))()
assert(SMODS.load_file("jokers/common/CryingGoblin.lua"))()
assert(SMODS.load_file("jokers/common/SparklingWater.lua"))()

-- Uncommon
assert(SMODS.load_file("jokers/uncommon/ColoredBag.lua"))()
assert(SMODS.load_file("jokers/uncommon/AtomicCola.lua"))()
assert(SMODS.load_file("jokers/uncommon/HexagonForce.lua"))()
assert(SMODS.load_file("jokers/uncommon/Dinosaur.lua"))()
assert(SMODS.load_file("jokers/uncommon/BlackClover.lua"))()
assert(SMODS.load_file("jokers/uncommon/PieChart.lua"))()
assert(SMODS.load_file("jokers/uncommon/SnakesNLadders.lua"))()
assert(SMODS.load_file("jokers/uncommon/Devilish.lua"))()
assert(SMODS.load_file("jokers/uncommon/AlephZero.lua"))()
assert(SMODS.load_file("jokers/uncommon/FareJoker.lua"))()
assert(SMODS.load_file("jokers/uncommon/MurderMystery.lua"))()
assert(SMODS.load_file("jokers/uncommon/Door.lua"))()
assert(SMODS.load_file("jokers/uncommon/BipolarJoker.lua"))()
assert(SMODS.load_file("jokers/uncommon/LapizOre.lua"))()
assert(SMODS.load_file("jokers/uncommon/Sight.lua"))()
assert(SMODS.load_file("jokers/uncommon/Virus.lua"))()

-- Rare
assert(SMODS.load_file("jokers/rare/CrystalJoker.lua"))()
assert(SMODS.load_file("jokers/rare/Trinket.lua"))()
assert(SMODS.load_file("jokers/rare/TheGoddess.lua"))()
assert(SMODS.load_file("jokers/rare/Pocket.lua"))()
assert(SMODS.load_file("jokers/rare/PlanetsParade.lua"))()
assert(SMODS.load_file("jokers/rare/Obsidian.lua"))()
assert(SMODS.load_file("jokers/rare/Pegasus.lua"))()
assert(SMODS.load_file("jokers/rare/Cyclops.lua"))()
-- Legendary
assert(SMODS.load_file("jokers/legendary/Marbas.lua"))()
assert(SMODS.load_file("jokers/legendary/Dentalion.lua"))()