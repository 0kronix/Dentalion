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

SMODS.Gradient {
    key = 'mulps',
    colours = {
        G.C.MULT, G.C.CHIPS
    },
    cycle = 3,
    interpolation = 'trig'
}

SMODS.Gradient {
    key = 'onfire',
    colours = {
        HEX("FF8C00"), HEX("FF4500")
    },
    cycle = 1,
    interpolation = 'trig'
}