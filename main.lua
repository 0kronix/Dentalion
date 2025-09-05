------------ MOD CODE -------------------------

Dentalion = SMODS.current_mod

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

-- Seals
assert(SMODS.load_file("src/seals/lightgreen.lua"))()

-- Enhancements
assert(SMODS.load_file("src/enhancements/frozen.lua"))()

-- Consumables
-- Spectrals
assert(SMODS.load_file("src/consumables/spectral/fehu.lua"))()
assert(SMODS.load_file("src/consumables/spectral/gebu.lua"))()
assert(SMODS.load_file("src/consumables/spectral/sowilu.lua"))()
assert(SMODS.load_file("src/consumables/spectral/raidu.lua"))()
assert(SMODS.load_file("src/consumables/spectral/hagalaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/wunjo.lua"))()
assert(SMODS.load_file("src/consumables/spectral/naudiz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/algiz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/eihwaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/mannaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/isaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/uruz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/turiaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/kaunan.lua"))()
assert(SMODS.load_file("src/consumables/spectral/jera.lua"))()
assert(SMODS.load_file("src/consumables/spectral/laguz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/dagaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/ansuz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/tiwaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/berkana.lua"))()
assert(SMODS.load_file("src/consumables/spectral/pert.lua"))()
assert(SMODS.load_file("src/consumables/spectral/ehwaz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/inguz.lua"))()
assert(SMODS.load_file("src/consumables/spectral/othala.lua"))()

-- Load Jimbos
-- Common
assert(SMODS.load_file("jokers/common/DreamCatcher.lua"))()
assert(SMODS.load_file("jokers/common/Firefly.lua"))()
assert(SMODS.load_file("jokers/common/BeatSaber.lua"))()
assert(SMODS.load_file("jokers/common/Bodyguard.lua"))()
assert(SMODS.load_file("jokers/common/FirstAidKit.lua"))()
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
assert(SMODS.load_file("jokers/common/NahIdWin.lua"))()
assert(SMODS.load_file("jokers/common/Oracle.lua"))()
assert(SMODS.load_file("jokers/common/ParanoidJoker.lua"))()
assert(SMODS.load_file("jokers/common/Puzzle.lua"))()
assert(SMODS.load_file("jokers/common/BluePlanet.lua"))()
assert(SMODS.load_file("jokers/common/PopUpAd.lua"))()
assert(SMODS.load_file("jokers/common/MacTonight.lua"))()
assert(SMODS.load_file("jokers/common/ChainingBlast.lua"))()
assert(SMODS.load_file("jokers/common/Musician.lua"))()
assert(SMODS.load_file("jokers/common/FallingJoker.lua"))()
assert(SMODS.load_file("jokers/common/RockBottom.lua"))()
assert(SMODS.load_file("jokers/common/EggsPack.lua"))()

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
assert(SMODS.load_file("jokers/uncommon/BlackCat.lua"))()
assert(SMODS.load_file("jokers/uncommon/FreakJoker.lua"))()
assert(SMODS.load_file("jokers/uncommon/PlantsVSJokers.lua"))()
assert(SMODS.load_file("jokers/uncommon/Leprechaun.lua"))()
assert(SMODS.load_file("jokers/uncommon/Anxiety.lua"))()
assert(SMODS.load_file("jokers/uncommon/FlyingIsland.lua"))()
assert(SMODS.load_file("jokers/uncommon/Avatar.lua"))()
assert(SMODS.load_file("jokers/uncommon/Replica.lua"))()
assert(SMODS.load_file("jokers/uncommon/Comics.lua"))()

-- Rare
assert(SMODS.load_file("jokers/rare/CrystalJoker.lua"))()
assert(SMODS.load_file("jokers/rare/Trinket.lua"))()
assert(SMODS.load_file("jokers/rare/TheGoddess.lua"))()
assert(SMODS.load_file("jokers/rare/Pocket.lua"))()
assert(SMODS.load_file("jokers/rare/PlanetsParade.lua"))()
assert(SMODS.load_file("jokers/rare/Obsidian.lua"))()
assert(SMODS.load_file("jokers/rare/Pegasus.lua"))()
assert(SMODS.load_file("jokers/rare/Cyclops.lua"))()
assert(SMODS.load_file("jokers/rare/Phone.lua"))()
assert(SMODS.load_file("jokers/rare/Bugs.lua"))()
assert(SMODS.load_file("jokers/rare/DarkPeasant.lua"))()
assert(SMODS.load_file("jokers/rare/DisneyJoker.lua"))()
assert(SMODS.load_file("jokers/rare/SleepParalysis.lua"))()
assert(SMODS.load_file("jokers/rare/MatchThree.lua"))()
assert(SMODS.load_file("jokers/rare/Plazma.lua"))()
assert(SMODS.load_file("jokers/rare/MultiverseHourglasses.lua"))()

-- Legendary
assert(SMODS.load_file("jokers/legendary/Marbas.lua"))()
assert(SMODS.load_file("jokers/legendary/Dentalion.lua"))()