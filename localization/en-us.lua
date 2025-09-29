return {
    misc = {
        labels = {
            dentalion_lightgreen_seal = "Light Green Seal",
        },

        dictionary = {
            k_dentalion_trinket = "Trinket",
            k_dentalion_trinkets = "Trinkets",
            k_dentaliontrinket = "Trinket",
            k_DentalionTrinketInfo = { 
                "Only one Trinket may be equipped at a time.",
                "Purchasing a new Trinket replaces an old one." 
            },
            b_dentalion_equip = "EQUIP",

            ph_dentalion_missing_poster = "Saved by Missing Poster",

            dentalion_downgrade_ex = "Downgrade!",
            dentalion_mult_ex = "Mult!",
            dentalion_bonus_ex = "Bonus!",
            dentalion_wild_ex = "Wild!",
            dentalion_glass_ex = "Glass!",
            dentalion_stone_ex = "Stone!",
            dentalion_lucky_ex = "Lucky!",
            dentalion_frozen_ex = "Frozen!",
            dentalion_mutation_ex = "Mutation!",
            dentalion_chips_ex = "Chips!",
            dentalion_dollars_ex = "Dollars!",
            dentalion_failed_ex = "Failed",
            dentalion_boom_ex = "BOOM!",
            dentalion_copy_ex = "Copied!",
            dentalion_negative_ex = "Negative!",
            dentalion_reverse_ex = "Reverse!",
            dentalion_glitch_ex = "GLITCH",
            dentalion_plus_planet_ex = "+1 Planet",
            dentalion_plus_voucher_ex = "+1 Voucher",
            dentalion_plus_discard_ex = "+1 Discard",
            dentalion_plus_consumeable_ex = "+1 Consumeable",
        }
    },
    descriptions = {
        Back = {
            b_dentalion_fashion = {
                name = "Fashion Deck",
                text = {
                    "Starts with random",
                    "{C:legendary}Legendary{} Joker",
                    "and extra {C:money}$6",
                    "{C:attention}-2{} Joker Slot"
                },
            },
        },

        Blind = {
            bl_dentalion_wrath = {
                name = 'The Wrath',
                text = {
                    "+#1#% of Blind requirement",
                    "for each Tag held"
                }
            },

            bl_dentalion_sloth = {
                name = 'The Sloth',
                text = {
                    "Must play less",
                    "than 4 cards"
                }
            },

            bl_dentalion_lust = {
                name = 'The Lust',
                text = {
                    "Hand must contain",
                    "Hearts"
                }
            },

            bl_dentalion_greed = {
                name = 'The Greed',
                text = {
                    "Lose $1 for each level",
                    "of played poker hand"
                }
            },

            bl_dentalion_envy = {
                name = 'The Envy',
                text = {
                    "Sell cost of the most",
                    "expensive Joker sets to $0"
                }
            },

            bl_dentalion_gluttony = {
                name = 'The Gluttony',
                text = {
                    "Consume all your",
                    "consumables"
                }
            },

            bl_dentalion_pride = {
                name = 'The Pride',
                text = {
                    "Debuff all cards in full",
                    "deck if it has less then",
                    "4 different suits"
                }
            },
        },

        Joker = {
			j_dentalion_coloredbag={
                name = "Colored Bag",
                text = {
                    "If {C:attention}poker hand{} is a",
                    "{C:attention}#1#{} and contain {C:attention}all suits{},",
                    " create a random {C:spectral}Spectral{} card",
                    "{C:inactive}(Must have room)",
                },
            },
			
			j_dentalion_crystaljoker={
                name = "Crystal Joker",
                text = {
                    "Retrigger all played {C:attention}Glass{} Cards",
                    "{C:attention}#1#{} additional times"
                },
            },
			
			j_dentalion_dreamcatcher={
                name = "Dream Catcher",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
					"a {C:tarot}Tarot{} card if played",
					"hand is only one {C:attention}2{} or {C:attention}3{}",
					"{C:inactive}(Must have room)"
                },
            },
			
			j_dentalion_firefly={
                name = "Firefly",
                text = {
                    "Played {C:attention}cards{}",
                    "permanently gain",
                    "{C:chips}+#1#{} Chips when scored"
                },
            },
			
			j_dentalion_trinket={
                name = "Trinket",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult, if all",
					"consumeable slots are filled"
                },
            },
			
			j_dentalion_atomiccola={
                name = "Atomic Cola",
                text = {
                    "Sell this card to",
                    "create a free",
                    "{C:attention}#1#",
                },
            },
			
			j_dentalion_planetsparade={
                name = "Planets Parade",
                text = {
                    "{C:green}#1# in #2#{} chance to upgrade",
					"{C:attention}All Hands{} after using",
					"{C:planet}Planet{} card"
                },
            },
			
			j_dentalion_dinosaur={
                name = "Dinosaur",
                text = {
                    "Turn all {C:attention}played{} but {C:attention}not scored{}",
                    "cards into {C:attention}Stone Cards{}"
                },
            },
			
			j_dentalion_blackclover={
                name = "Black Clover",
                text = {
                    "Turn all {C:attention}scored{}",
					"{C:clubs}Clubs{} cards into",
					"{C:attention}Lucky{} Cards"
                },
            },
			
			j_dentalion_bodyguard={
                name = "Bodyguard",
                text = {
                    "{C:mult}+#1#{} Mult.",
                    "{C:red}-$#2#{} every {C:attention}5{} rounds",
                    "{C:inactive}(Currently #3#/5)"
                }
            },
			
			j_dentalion_firstaidkit={
                name = "First Aid Kit",
                text = {
                    "Hand {C:chips}Chips{} cannot",
					"be less then {C:chips}#1#{}"
                },
            },
			
			j_dentalion_decay={
                name = "Decay",
                text = {
                    "{C:green}#1# in #2#{} chance to",
					"destroy scored card or",
                    "card in hand"
                },
            },
			
			j_dentalion_doublesidedcoin={
                name = "Double-sided Coin",
                text = {
                    "Gives {C:money}$#1#{} at end",
					"of round, if the number",
					"of chips is a {C:attention}palindrome{}"
                },
            },
			
			j_dentalion_givewaysign={
                name = '"Give way" sign',
                text = {
                    "Gives {C:money}$#1#{} at end",
					"of round for each",
					"empty joker slot",
                    "{C:inactive}(Will give {C:money}$#2#{}{C:inactive})"
                },
            },
			
			j_dentalion_candywrapper={
                name = "Candy Wrapper",
                text = {
                    "Cards with {C:dark_edition}Editions{}",
					"give {C:money}$#1#{}"
                },
            },
			
			j_dentalion_mutantjoker={
                name = "Mutant Joker",
                text = {
                    "{C:green}#1# in #2#{} chance to increase",
					"rank of played {C:attention}non-face{} card",
					"by {C:attention}1{} after hand scoring"
                },
            },
			
			j_dentalion_crumpledbanknote={
                name = "Crumpled Banknote",
                text = {
                    "Changes its {C:attention}sell value{} to a",
					"random one from {C:money}$#1#{} to {C:money}$#2#{}",
					"after each round"
                },
            },
			
			j_dentalion_chalks={
                name = "Chalks",
                text = {
					"{C:green}#1# in #2#{} chance to",
                    "turn played card",
                    "into {C:attention}Wild{} Card"
                },
            },

            j_dentalion_piechart={
                name = "Pie Chart",
                text = { {
                    "Divide {C:money}dollars{} by {C:attention}4{} after",
                    "selecting {C:attention}Boss Blind{}"
                },
                {
                    "This joker gains {C:mult}+Mult{} equals",
                    "to {C:money}dollars{} lost",
                    "{C:inactive}(Less than 20 at once)",
                    "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)"
                } },
            },

            j_dentalion_snakesnladders={
                name = "Snakes&Ladders",
                text = {
                    "A hand is considered to",
                    "contain a {C:attention}Straight{}, if it",
                    "contains scored cards with",
                    "a difference in ranks of {C:attention}5{}",
                },
            },

            j_dentalion_alephzero={
                name = "Aleph 0",
                text = {
                    "If the {C:attention}leftmost{} card {C:attention}rank{} in {C:attention}played hand{}",
                    "is at least three times of the {C:attention}rightmost{}",
                    "card {C:attention}rank{}, turn the right card into",
                    "the left one after scoring",
                },
            },

            j_dentalion_farejoker={
                name = "Fare Joker",
                text = {
                    "At end of the round, this joker gets",
                    "{C:mult}+Mult{} equal to its {C:money}selling value",
                    "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)"
                },
            },

            j_dentalion_murdermystery={
                name = "Murder Mystery",
                text = {
                    "{C:red}Destroys{} first played card each round.",
                    "If a {C:attention}face{} card has been {C:red}destroyed{} three",
                    "times in a row, this joker gains {X:mult,C:white}X#2#{} Mult",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult, #3#/3)"
                },
            },

            j_dentalion_door={
                name = "Door",
                text = {
                    "Gains {X:chips,C:white}X#2#{} Chips each round.",
                    "Loses {X:chips,C:white}X#3#{} each {C:green}reroll{} in the {C:attention}Shop{}",
                    "{C:inactive}(Cannot be less than {X:chips,C:white}X0.5{}{C:inactive})",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{}{C:inactive} Chips)"
                },
            },

            j_dentalion_bipolarjoker={
                name = "Bipolar Joker",
                text = {
                    "{C:green}#1# in #2#{} chance to {C:green}decrease{} or {C:red}increase{}",
                    "the score requirement of the",
                    "current {C:attention}Blind{} by {C:attention}#3#%"
                },
            },

            j_dentalion_lapizore={
                name = "Lapiz Ore",
                text = {
                    "Add a {C:blue}Blue Seal{} to",
                    "played {C:attention}Stone Cards"
                },
            },

            j_dentalion_marbas={
                name = "Marbas",
                text = {
                    "{C:green}#1# in #2#{} chance to apply {C:dark_edition}Negative{}",
                    "to a {C:attention}random{} Joker after",
                    "defeating the {C:attention}Boss Blind{}"
                },
            },

            j_dentalion_milkyway={
                name = "Milky Way",
                text = {
                    "{C:planet}Planet{} cards, used during",
                    "round, gives permanent {C:chips}+#1#{} Chips",
                    "to {C:attention}random{} card in hand",
                },
            },

            j_dentalion_obsidian={
                name = "Obsidian",
                text = { {
                    "Gains {C:chips}+#2#{} Chips for each",
                    "{C:attention}dark suit{} card scored"
                },
                {
                    "Every {C:attention}light suit{} scored card",
                    "turns into {C:attention}dark suit{} after scoring",
                    "{C:inactive}(Currently {C:chips}+#1#{}{C:inactive} Chips)"
                } },
            },

            j_dentalion_pegasus={
                name = "Pegasus",
                text = {
                    "{X:mult,C:white}X#1#{} Mult.",
                    "{C:attention}#2#{}, {C:attention}#3#{}, {C:attention}#4#{} and",
                    "{C:attention}#5#{} are debuffed"
                },
            },

            j_dentalion_partner={
                name = "Partner",
                text = {
                    "This joker gains {C:mult}+#2#{} and {C:chips}+#1#{}",
                    "when {C:attention}Pair{} is discarded",
                    "{C:inactive}(Currently {C:mult}+#4#{} Mult and {C:chips}+#3#{}{C:inactive} Chips)"
                },
            },

            j_dentalion_dentalion={
                name = "Dentalion",
                text = {
                    "This joker gains {X:mult,C:white}X#2#{} Mult",
                    "every {C:money}$20{} of solded cards",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult, #3#/$15)"
                },
            },

            j_dentalion_trafficlights={
                name = "Traffic Lights",
                text = {
                    "Change mod each round: {C:chips}+#1#{} Chips,",
                    "{C:mult}+#2#{} Mult or {C:money}$#3#{} at end of round"
                },
            },

            j_dentalion_ouroboros={
                name = "Ouroboros",
                text = {
                    "{C:chips}+#1#{} Chips.",
                    "Rettriger {C:attention}random{} amount",
                    "of times"
                },
            },

            j_dentalion_cryinggoblin={
                name = "Crying Goblin",
                text = {
                    "{C:attention}Lucky Cards{} gives {C:chips}+#1#{} Chips",
                    "when failed to trigger"
                },
            },

            j_dentalion_cyclops={
                name = "Cyclops",
                text = { {
                    "Set number of {C:chips}hands{} to {C:attention}1{}",
                    "at start of round"
                },
                {
                    "If more than {C:attention}5{} {C:chips}hands{} are",
                    "removed, gives {C:INDIGO}+1 Joker Slot",
                    "{C:inactive}(Once per Ante)"
                } },
            },

            j_dentalion_sight={
                name = "Sight",
                text = {
                    "Open {C:attention}#2#{} Booster Packs to",
                    "create {C:attention}#3#{} random tags",
                    "{C:inactive}(Once per Ante, #1#/#2#)"
                },
            },

            j_dentalion_sparklingwater={
                name = "Sparkling Water",
                text = {
                    "Skip {C:attention}#2#{} Booster Packs to create",
                    "a random {C:spectral}Spectral{} card",
                    "{C:inactive}(Currently #1#/#2#)",
                    "{C:red,E:2}self destructs"
                },
            },

            j_dentalion_virus={
                name = "Virus",
                text = {
                    "Gains {X:mult,C:white}X#2#{} Mult for each",
                    "copy of themself you have",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                },
            },

            j_dentalion_blackcat={
                name = "Black Cat",
                text = {
                    "{C:attention}Lucky Cards{} are {X:black,C:white}1.5{} times",
                    "more effective"
                },
            },

            j_dentalion_phone={
                name = "Phone",
                text = {
                    "Scored cards gives {C:mult}+Mult{}",
                    "equals to the number of cards in",
                    "{C:attention}full deck{} with the same suit"
                },
            },

            j_dentalion_nahidwin={
                name = "Nah I'd Win",
                text = {
                    "Gains {C:chips}+#1#{} Chips if {C:attention}Blind{}",
                    "is beaten in exactly {C:blue}2{} hands",
                    "{C:inactive}(Currently {C:chips}+#2#{}{C:inactive} Chips)"
                },
            },

            j_dentalion_bugs={
                name = "Bugs",
                text = {
                    "Gains {X:mult,C:white}X#1#{} at end of",
                    "round, if you have {C:money}$#3#{} or less",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                },
            },

            j_dentalion_oracle={
                name = "Oracle",
                text = {
                    "Using {C:attention}consumable{} {C:green}decrease{}",
                    "score requirement of",
                    "the current {C:attention}Blind{} by {C:attention}#1#%{}",
                    "{C:inactive}(Currently #3#/#2#%)"
                },
            },

            j_dentalion_darkpeasant={
                name = "Dark Peasant",
                text = {
                    "{C:attention}+1{} hand size for each",
                    "{C:green}reroll{} in the shop",
                    "{C:inactive}(Resets each round, +#2# max)",
                    "{C:inactive}(Currently +#1# hand size)"
                },
            },

            j_dentalion_freakjoker={
                name = "Freak Joker",
                text = {
                    "Using {C:planet}Planet{} gives",
                    "{C:attention}#1#{} free {C:green}Reroll{} in the shop",
                    "{C:inactive}(Currently +#2#{C:inactive} rerolls)"
                },
            },

            j_dentalion_paranoidjoker={
                name = "Paranoid Joker",
                text = {
                    "{C:green}Decrease{} the score requirement",
                    "of the current {C:attention}Blind{} by {C:attention}#1#%{} for",
                    "every {C:attention}#3# {C:inactive}[#2#]{} cards {C:red}discarded"
                },
            },

            j_dentalion_disneyjoker={
                name = "Disney Joker",
                text = {
                    "Gains {X:green,C:white}^0.1{} for every",
                    "{C:attention}Voucher{} you have",
                    "{C:inactive}(Currently {X:green,C:white}#1#{}{C:inactive} Mult)"
                },
            },

            j_dentalion_plantsvsjokers={
                name = "Plants VS Jokers",
                text = {
                    "{X:chips,C:white}X#2#{} for each card",
                    "slot in the shop",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{}{C:inactive} Chips)"
                },
            },

            j_dentalion_leprechaun={
                name = "Leprechaun",
                text = {
                    "Gives {C:green}+1{} to all {C:attention}listed",
                    "{C:green}probabilities{} for every",
                    "{C:money}$#1#{} you have {C:inactive}(+#2# max)",
                    "{C:inactive}(Currently {C:green}+#3#{}{C:inactive})"
                },
            },

            j_dentalion_beatsaber={
                name = "Beat Saber",
                text = { {
                    "{C:green}#1# in #2#{} chance to",
                    "give {C:mult}+#2#{} Mult"
                },
                {
                    "Halves {C:mult}Mult{} and {C:green}Odds{}",
                    "if {C:red}doesn't{} trigger",
                    "{C:inactive}(Reset on +1 Mult)"
                } },
            },

            j_dentalion_puzzle={
                name = "Puzzle",
                text = {
                    "Using {C:tarot}Suit Change Tarot{} card",
                    "creates random {C:tarot}Suit Change Tarot{} card",
                    "{C:inactive}(Once per round)"
                },
            },

            j_dentalion_blueplanet={
                name = "Blue Planet",
                text = {
                    "Use the same {C:planet}Planet{} card {C:attention}#1#{} times in",
                    "a row to create a random {C:spectral}Spectral{} card",
                    "{C:inactive}(Currently #2#/#1#)",
                    "{C:red}self destructs{}"
                },
            },

            j_dentalion_anxiety={
                name = "Anxiety",
                text = {
                    "{C:dentalion_plasma}Balances{} {C:attention}#1#%{} of {C:mult}Mult{} and {C:chips}Chips{}.",
                    "{C:attention}+2%{} for each card below {C:attention}52{}",
                    "in your full deck"
                },
            },

            j_dentalion_sleepparalysis={
                name = "Sleep Paralysis",
                text = {
                    "Disables effect of {C:attention}Boss Blind{},",
                    "if during {C:attention}Ante{} no {C:attention}Blinds{}",
                    "was skipped"
                },
            },

            j_dentalion_popupad={
                name = "Pop-Up Ad",
                text = {
                    "Gives {C:money}$#1#{} at end of round,",
                    "if {C:money}dollars{} hasn't changed",
                    "since start of round"
                },
            },

            j_dentalion_mactonight={
                name = "Mac Tonight",
                text = {
                    "Add {C:money}$#1#{} to {C:attention}sell value",
                    "of {C:attention}all{} jokers after",
                    "using {C:tarot}The Moon"
                },
            },

            j_dentalion_flyingisland={
                name = "Flying Island",
                text = {
                    "Scored cards permanently gain",
                    "{C:chips}+#1#{} Chips, if previous scored",
                    "card has the same {C:attention}suit"
                },
            },

            j_dentalion_avatar={
                name = "Avatar",
                text = {
                    "Gains {X:green,C:white}#2#{} Mult for each",
                    "{C:legendary}Legendary{} Joker you have",
                    "{C:inactive}(Currently: {X:green,C:white}#1#{}{C:inactive} Mult)"
                },
            },

            j_dentalion_matchthree={
                name = "Match Three",
                text = {
                    "{C:red}Destroy{} all scored cards,",
                    'if {C:attention}hand{} is {C:attention}"Of a Kind"{} type'
                },
            },

            j_dentalion_replica={
                name = "Replica",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a copy of used {C:spectral}Spectral{} card"
                },
            },

            j_dentalion_plazma={
                name = "Plazma",
                text = {
                    "{C:attention}Retrigger{} all scored cards, if",
                    "played hand is your {C:attention}most played{}"
                },
            },

            j_dentalion_comics={
                name = "Comics",
                text = {
                    "{X:chips,C:white}X#1#{} Chips.",
                    "if no {C:attention}face{} cards played",
                    "{C:red}self destructs{},",
                },
            },

            j_dentalion_hourglasses={
                name = "Multiverse Hourglasses",
                text = {
                    "Sell this card to change",
                    "{C:attention}Ante{} by random number",
                    "between {C:attention}#1#{} and {C:attention}#2#"
                },
            },

            j_dentalion_chainingblast={
                name = "Chaining Blast",
                text = {
                    "Cards, {C:attention}adjacent{} to the",
                    "{C:attention}Mult{} Cards, give {C:mult}+#1#{} Mult"
                },
            },

            j_dentalion_musician={
                name = "Musician",
                text = {
                    "{C:attention}-$1{} {C:green}reroll{} cost",
                    "for each {C:red}discard{} left",
                    "at end of round"
                },
            },

            j_dentalion_fallingjoker={
                name = "Falling Joker",
                text = {
                    "{C:green}#1# in #2#{} chance to {C:attention}enhance",
                    "random {C:attention}card{} in hand, if played",
                    "hand is a {C:attention}#3#"
                },
            },

            j_dentalion_rockbottom={
                name = "Rock Bottom",
                text = {
                    "Gives {C:money}$#1#{}, if played",
                    "poker hand is on {C:attention}1{} level"
                },
            },

            j_dentalion_eggspack={
                name = "Eggs Pack",
                text = {
                    "Create {C:attention}Egg{} when",
                    "{C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently #1#/6)"
                },
            },

            j_dentalion_scariestjoker={
                name = "Scariest Joker",
                text = {
                    "If {C:attention}played hand{} is your {C:attention}last hand",
                    "and it has only {C:attention}1{} card, convert scored",
                    "card into random card in hand and",
                    "add a permanent copy to deck"
                },
            },

            j_dentalion_noirjoker={
                name = "Noir Joker",
                text = {
                    "Gains {X:chips,C:white}X#1#{} for each",
                    "{C:attention}dark suit{} card in hand",
                    "{C:inactive}(Will give {X:chips,C:white}X#2#{}{C:inactive} Chips)"
                },
            },

            j_dentalion_magnificent={
                name = "Jimbo The Magnificent",
                text = {
                    "{X:green,C:white}#1#{} Mult"
                },
            },

            j_dentalion_bamboo={
                name = "Bamboo",
                text = {
                    "Increases rank of {C:attention}all",
                    "cards in {C:attention}hand{} at end of round"
                },
            },

            j_dentalion_prize={
                name = "Prize",
                text = {
                    "{X:money,C:white}X2{} {C:attention}interest{} after",
                    "defeating {C:attention}Boss Blind"
                },
            },

            j_dentalion_jackofalltrades={
                name = "Jack Of All Trades",
                text = {
                    "Gives {X:mult,C:white}XMult{} and {X:chips,C:white}XChips",
                    "between {X:dentalion_mulps,C:white}X#1#{} and {X:dentalion_mulps,C:white}X#2#{}"
                },
            },

            j_dentalion_doppelganger={
                name = "Doppelganger",
                text = {
                    "If {C:attention}played hand{} is your {C:attention}last hand{} and it has",
                    "only {C:attention}2{} cards with the same {C:attention}suit{} and {C:attention}rank{}, add",
                    "a permanent copy of {C:attention}first{} card to deck",
                    "and draw it to {C:attention}hand"
                },
            },

            j_dentalion_seraphim={
                name = "Seraphim",
                text = {
                    "Play {C:attention}Jack #1#{} {C:inactive}[#2#]{} times to",
                    "create {C:dark_edition}Negative {C:attention}Temperance"
                },
            },

            j_dentalion_stickyhand={
                name = "Sticky Hand",
                text = { {
                    "{C:red}Discards{} {C:attention}#3#{} random cards",
                    "per hand {C:attention}played"
                },
                {
                    "Gains {C:chips}+#1#{} Chips for each",
                    "card {C:red}discarded{} this way",
                    "{C:inactive}(Currently {C:chips}+#2#{}{C:inactive} Chips)"
                } },
            },

            j_dentalion_snowman={
                name = "Snowman",
                text = {
                    "Enhances random card in hand",
                    "to {C:attention}Frozen Card{} if {C:attention}scored hand",
                    "contain only one {C:attention}Frozen Card"
                },
            },

            j_dentalion_frozenjoker={
                name = "Frozen Joker",
                text = {
                    "{C:attention}Rettriger{} all {C:attention}Frozen Cards.",
                    "{C:attention}Frozen Cards{} count this joker",
                    "as {C:attention}3 Frozen Cards"
                },
            },

            j_dentalion_blizzard={
                name = "Blizzard",
                text = {
                    "Gains {X:chips,C:white}X#1#{} Chips for",
                    "each {C:attention}Frozen Card",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently {X:chips,C:white}X#2#{C:inactive} Chips)",
                },
            },

            j_dentalion_mojito={
                name = "Mojito",
                text = {
                    "{C:green}#1# in #2#{} chance to change {C:attention}seal",
                    "on played card to {C:attention}Light Green Seal"
                },
            },

            j_dentalion_outlinemap={
                name = "Outline Map",
                text = {
                    "Create random {C:planet}Planet{} card if card",
                    "with {C:attention}Light Green Seal{} is {C:red}discarded",
                    "{C:inactive}(Must have room)"
                },
            },

            j_dentalion_parallax={
                name = "Parallax",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult, if number",
                    "of {C:attention}played cards{} equals",
                    "number of {C:attention}joker cards"
                },
            },

            j_dentalion_bomb={
                name = "Bomb",
                text = { {
                    "Cards {C:attention}without{} enhancement",
                    "gives {X:mult,C:white}X#1#{} Mult"
                },
                {
                    "{C:red}Destroy{} self and adjacent",
                    "jokers, if hand is {C:dentalion_onfire}on fire"
                } },
            },

            j_dentalion_stickman={
                name = "Stickman",
                text = {
                    "Gains {C:mult}+#1#{} Mult, if played",
                    "hand contain scoring",
                    "{C:attention}Jack{}, {C:attention}Queen{} and {C:attention}King",
                    "{C:inactive}(Currently {C:mult}+#2#{}{C:inactive} Mult)"
                },
            },

            j_dentalion_999jokers={
                name = "999 Jokers",
                text = {
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played poker hand, if it",
                    "contain scoring {C:attention}9"
                },
            },

            j_dentalion_ivbag={
                name = "IV Bag",
                text = { {
                    "At start of round, joker",
                    "with {C:attention}most sell value{} {C:red}lose",
                    "{C:money}$#1#{} of {C:attention}sell value"
                },
                {
                    "Gains {X:mult,C:white}X#2#{} Mult for each",
                    "joker, {C:attention}sell value{} of which",
                    "less than {C:money}$#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{}{C:inactive} Mult)"
                } },
            },

            j_dentalion_samuraijoker={
                name = "Samurai Joker",
                text = {
                    "If {C:red}discard{} contain only",
                    "{C:attention}one{} card, play it",
                    "{C:inactive}(Once per round)"
                },
            },

            j_dentalion_simonsays={
                name = "Simon Says",
                text = {
                    "Give {C:money}$#2#{} when {C:attention}event{} trigger",
                    "{C:inactive}(Event changes every ante)",
                    "{C:inactive}(Now - #1#)"
                },
            },

            j_dentalion_abyss={
                name = "Abyss",
                text = { {
                    "{C:red}Destroy{} {C:attention}leftmost{} consumable",
                    "when {C:attention}ending shop"
                },
                {
                    "Gains {X:mult,C:white}X#1#{} Mult for each",
                    "consumable, {C:red}destroyed{} this way",
                    "{C:inactive}(Resets, if no consumable was destroyed)",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)"
                } },
            },

            j_dentalion_gear={
                name = "Gear",
                text = {
                    "Reroll {C:attention}Boss Blind",
                    "when {C:attention}skipping{} Blind"
                },
            },

            j_dentalion_fallingstar={
                name = "Falling Star",
                text = { {
                    "After defeating each",
                    "{C:attention}Boss Blind{}, gain a",
                    "{C:attention,T:tag_dentalion_star}#1#{}",
                },
                {
                    "{C:attention,T:tag_dentalion_star}#1#{} twice",
                    "as effective"
                } },
            },

            j_dentalion_celticcross={
                name = "Celtic Cross",
                text = {
                    "Gains {X:green,C:white}#1#{} Mult for",
                    "each {C:clubs}Club{} card",
                    "in your {C:attention}full deck",
                    "{C:inactive}(Currently {X:green,C:white}#2#{C:inactive} Mult)",
                },
            },

            j_dentalion_lucifer={
                name = "Lucifer",
                text = { {
                    "{C:red}Destroy{} random card in your",
                    "{C:attention}full deck{} at start of each round"
                },
                {
                    'Add one random {C:attention}6{} to your hand',
                    'with a random {C:attention}Enhancement{}, {C:dark_edition}Edition{}',
                    'and {C:attention}Seal{} at start of each round'
                } },
            },

            j_dentalion_d20={
                name = "D20",
                text = {
                    "{C:money}Selling{} {C:green}Uncommon{} or {C:red}Rare{}",
                    "joker create {C:attention}tag{} of",
                    "the same {C:attention}rarity"
                },
            },

            j_dentalion_jokerapp={
                name = "Joker App",
                text = {
                    "{C:green}#1# in #2#{} chance to add",
                    "{C:attention}voucher{} to the shop",
                    "then {C:green}rerolling{} shop"
                },
            },

            j_dentalion_octahedron={
                name = "Octahedron",
                text = {
                    "Each {C:attention}played{} card gives",
                    "{C:money}$#1#{} for each {C:diamonds}Diamond",
                    "card held in hand",
                    "{C:inactive}(Will give {C:money}$#2#{C:inactive})"
                },
            },

            j_dentalion_fnaj={
                name = "Five Nights At Jombos",
                text = {
                    "{C:green}#1# in #2#{} chance to give {C:red}+1 Discard{},",
                    "if number of {C:attention}discarded{} cards {C:attention}equals{}",
                    "to {C:red}discards{} left",
                    "{C:inactive}(Resets each round)"
                },
            },

            j_dentalion_kinderjoke={
                name = "Kinder Joke",
                text = { {
                    "After {C:attention}#1#{} rounds, {C:attention}sell{} this card to",
                    "apply {C:dark_edition}Negative{} to a random {C:chips}Common",
                    "Joker without {C:dark_edition}Edition",
                    "{C:inactive}(Currently #2#/#1#)"
                },
                {
                    "Create random {C:chips}Common{} Joker",
                    "when {C:attention}added to deck",
                    "{C:inactive}(Must have room)"
                } },
            },

            j_dentalion_punchcard={
                name = "Punch Card",
                text = { {
                    "{C:red}Destroy{} all played cards",
                    "without {C:attention}suit{} or/and {C:attention}rank"
                },
                {
                    "Create random {C:attention}Consumeable",
                    "every {C:attention}#1#{} cards {C:red}destroyed{} this way",
                    "{C:inactive}(Must have room)"
                } },
            },

            j_dentalion_shopkeeper={
                name = "Shopkeeper",
                text = {
                    "Buying {C:attention}Booster packs",
                    "{C:green}Rerolls{} the shop"
                },
            },

            j_dentalion_missingno={
                name = "Missing No",
                text = {
                    "{C:{C:dentalion_random}Randomize{} all cards in",
                    "{C:attention}first{} hand of round"
                },
            },

            j_dentalion_bumbo={
                name = "Bumbo",
                text = { {
                    "{C:green}#1# in #2#{} chance to create",
                    "random {C:attention}Consumeable{} at",
                    "start of round"
                },
                {
                    "Lose {C:red}$#3#{} at end",
                    "of {C:attention}each{} round"
                } },
            },

            j_dentalion_antigravity={
                name = "Anti-gravity",
                text = {
                    "After {C:attention}#1#{} rounds, {C:attention}sell{} this",
                    "card to {C:attention}reverse{} your {C:money}dollars",
                    "{C:inactive}(Max of $#3#, Currently #2#/#1#)"
                },
            },

            j_dentalion_bffs={
                name = "BFFS!",
                text = {
                    "non-{C:dark_edition}Negative{} Jokers and",
                    "Consumables give {X:mult,C:white}X#1#{} Mult" 
                },
            },

            j_dentalion_paytoplay={
                name = "Pay To Play",
                text = { {
                    "{C:attention}+#2#{} card slot",
                    "available in shop",
                },
                {
                    "Lose {C:red}$#1#{} at end",
                    "of {C:attention}each{} round"
                } },
            },

            j_dentalion_brokenmodem={
                name = "Broken Modem",
                text = {
                    "fixed {C:green}50%{} chance to create",
                    "a copy of {C:money}selled{} card"
                },
            },

            j_dentalion_consolationprize={
                name = "Consolation Prize",
                text = {
                    "Gains {C:mult}+#1#{} Mult and give {C:money}$#3#{},",
                    "if {C:attention}nothing{} was bought",
                    "in the shop"
                },
            },

            j_dentalion_twistedpair={
                name = "Twisted Pair",
                text = {
                    "Copy the {C:attention}abilities{} of both",
                    "adjacent {C:attention}Jokers{}, if {C:attention}poker",
                    "{C:attention}hand{} is a {C:attention}Pair"
                },
            },

            j_dentalion_recall={
                name = "Recall",
                text = {
                    "After {C:attention}2{} rounds, create {C:dark_edition}Negative",
                    "{C:attention}copy{} of the last {C:money}sold{} joker,",
                    "{C:red}self destructs afterwards"
                },
            },

            j_dentalion_tick={
                name = "Tick",
                text = {
                    "{C:attention}-#1#%{} score requirement",
                    "to all {C:attention}Blinds,",
                    "always contain {C:attention}Eternal"
                },
            },

            j_dentalion_blindrage={
                name = "Blind Rage",
                text = { {
                    "{X:mult,C:white}X#1#{} Mult.",
                    "{C:red}self destructs",
                    "after {C:attention}#2#{} rounds"
                },
                {
                    "{C:attention}+1{} round, if {C:attention}Blind{}",
                    "is beaten in {C:blue}1{} hand",
                    "{C:inactive}(Max of #3# rounds)"
                } }
            },
        },

        Tag = {
            tag_dentalion_star = {
                name = "Star Tag",
                text = {
                    "{C:attention}Level up{} next played hand",
                    "{C:attention}#1#{} times {C:attention}after{} scoring"
                }
            },
        },

        Enhanced = {
            m_dentalion_frozen = {
                name = 'Frozen Card',
                text = {
                    "Gains {X:chips,C:white}X#1#{} Chips",
                    "for each another",
                    "scored {C:attention}Frozen Card"
                }
            },
        },

        Spectral = {
            c_dentalion_fehu = {
                name = 'Fehu',
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "{C:attention}Joker{} you have",
                    "{C:inactive}(Will give {C:money}$#2#{}{C:inactive})"
                }
            },

            c_dentalion_gebu = {
                name = 'Gebu',
                text = {
                    "Give {C:attention}permanent{} bonus",
                    "of {C:chips}+#1#{} Chips to",
                    "{C:attention}all cards{} in hand",
                }
            },

            c_dentalion_sowilu = {
                name = 'Sowilu',
                text = { {
                    "{C:green}#1# in #2#{} chance to",
                    "create {C:spectral}The Soul{}"
                },
                {
                    "{C:red}-#3#{} hand size if not"
                } },
            },

            c_dentalion_raidu = {
                name = 'Raidu',
                text = {
                    "Gain {C:attention}#1#{} free {C:green}Reroll{}",
                    "in every shop"
                }
            },

            c_dentalion_hagalaz = {
                name = 'Hagalaz',
                text = { {
                    "{C:red}Destroys{} all {C:attention}non-selected{} cards",
                    "{C:inactive}(At least #1# card must be selected)"
                },
                {
                    "Halves your {C:money}dollars"
                } },
            },

            c_dentalion_wunjo = {
                name = 'Wunjo',
                text = {
                    "Give a random {C:attention}enhancement",
                    "to random cards in hand",
                    "{C:inactive}(from 2 to 7 cards)"
                }
            },

            c_dentalion_naudiz = {
                name = 'Naudiz',
                text = {
                    "Increases rank of up to {C:attention}#1#",
                    "selected cards by {C:attention}number",
                    "of the selected cards",
                    "{C:inactive}(ex: 2 3 6 -> 5 6 9)"
                }
            },

            c_dentalion_algiz = {
                name = 'Algiz',
                text = { {
                    "Make selected {C:attention}Joker{} eternal"
                },
                {
                    "{C:red}-#1#{} consumable slot"
                } },
            },

            c_dentalion_eihwaz = {
                name = 'Eihwaz',
                text = { {
                    "Fills all {C:attention}empty{} consumable slots",
                    "with random {C:attention}consumables{}"
                },
                {
                    "Lose {C:money}$#1#{} for each",
                    "created {C:attention}consumable{}"
                } },
            },

            c_dentalion_mannaz = {
                name = 'Mannaz',
                text = { {
                    "Converts up all {C:attention}numbered{} cards in",
                    "hand to random {C:attention}Face{} cards"
                },
                {
                    "{C:red}-#1#{} discard every round"
                } },
            },

            c_dentalion_isaz = {
                name = 'Isaz',
                text = {
                    "Enhances up to {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
                }
            },

            c_dentalion_uruz = {
                name = 'Uruz',
                text = {
                    "Add a {C:green}Light Green Seal{}",
                    "to {C:attention}1{} selected",
                    "card in your hand",
                }
            },

            c_dentalion_turiaz = {
                name = 'Turiaz',
                text = {
                    "Converts up to {C:attention}#1#{} selected",
                    "cards to {V:1}#2#{}",
                    "{C:inactive}(Most popular suit in deck)",
                }
            },

            c_dentalion_kaunan = {
                name = 'Kaunan',
                text = {
                    "Level up your {C:attention}most played",
                    "hand {C:attention}#1#{} times",
                    "{C:inactive}(Now: #2#)"
                }
            },

            c_dentalion_jera = {
                name = 'Jera',
                text = { {
                    "Create {C:attention}#1#{} {C:dark_edition}negative{} copies",
                    "of a random {C:attention}Consumable{}"
                },
                {
                    "{C:red}Destroy{} all other consumables"
                } },
            },

            c_dentalion_laguz = {
                name = 'Laguz',
                text = { {
                    "{C:green}#1# in #2#{} chance to gain",
                    "{C:green}+1{} to all {C:attention}listed {C:green}probabilities{}"
                },
                {
                    "Makes random Joker {C:red}perishable"
                } },
            },

            c_dentalion_dagaz = {
                name = 'Dagaz',
                text = { {
                    "Add {C:dark_edition}Negative{} to a",
                    "selected {C:attention}Joker{} with {C:dark_edition}Edition{}"
                },
                {
                    "{C:red}Destroy{} adjacent Jokers",
                    "{C:inactive}(both Jokers must be destroyed)"
                } },
            },

            c_dentalion_ansuz = {
                name = 'Ansuz',
                text = { {
                    "Add random {C:dark_edition}Edition{} to",
                    "up to {C:attention}#1#{} selected cards",
                },
                {
                    "Each joker has {C:green}#2# in #3#{} chance",
                    "to be {C:red}destroyed{}",
                    "{C:inactive}(+1 chance for each selected card)"
                } },
            },

            c_dentalion_tiwaz = {
                name = 'Tiwaz',
                text = { {
                    "{C:red}Destroy{} all cards with the",
                    "same {C:attention}suit{} as selected card"
                },
                {
                    "Create a {C:tarot}Tarot{} card if {C:attention}#2#{} or more",
                    "cards have been destroyed"
                } },
            },

            c_dentalion_berkana = {
                name = 'Berkana',
                text = {
                    "Create {C:attention}#1#{} random",
                    "{C:dark_edition}Edition{} Tags"
                }
            },

            c_dentalion_pert = {
                name = 'Pert',
                text = {
                    "Redeem random voucher",
                    "with {C:money}double cost"
                }
            },

            c_dentalion_ehwaz = {
                name = 'Ehwaz',
                text = { {
                    "{C:attention}-1{} Ante"
                },
                {
                    "{C:red}Destroy{} all consumables",
                    "{C:inactive}(At least 2 consumables must be destroyed)"
                } },
            },

            c_dentalion_inguz = {
                name = 'Inguz',
                text = { {
                    "{C:red}Delete{} seal from up",
                    "to {C:attention}#1#{} selected cards"
                },
                {
                    "Create random {C:spectral}Spectral Seal{}",
                    "card for each",
                    "{C:inactive}(Must have room)"
                } },
            },

            c_dentalion_othala = {
                name = 'Othala',
                text = { {
                    "Create {C:attention}#1#{} random {C:dark_edition}Negative",
                    "{C:planet}Planet{} cards"
                },
                {
                    "Level {C:red}down{} {C:attention}#2#{} random",
                    "poker hands"
                } },
            },
        },

        DentalionTrinket = {
            DentalionTrinket_dentalion_walnut = {
                name = "Walnut",
                text = { 
                    "{C:attention}+#1#{} hand size" 
                }
            },

            DentalionTrinket_dentalion_swallowedpenny = {
                name = "Swallowed Penny",
                text = { 
                    "{C:green}#1# in #2#{} chance to give {C:money}$#3#",
                    "when {C:money}selling{} a card"
                }
            },

            DentalionTrinket_dentalion_callus = {
                name = "Callus",
                text = { 
                    "{C:green}#1# in #2#{} chance to",
                    "disable {C:attention}Boss Blind"
                }
            },

            DentalionTrinket_dentalion_storecredit = {
                name = "Store Credit",
                text = { {
                    "All initial {C:attention}cards{} in",
                    "the {C:money}shop{} are free"
                },
                {
                    "{C:red}Self destructs{}",
                    "after {C:money}buying{} card"
                } }
            },

            DentalionTrinket_dentalion_luckyrock = {
                name = "Lucky Rock",
                text = { 
                    "{C:green}#1# in #2#{} chance to give {C:money}$#3#{},",
                    "when {C:attention}non-playing{} card",
                    "is {C:red}destroyed"
                }
            },

            DentalionTrinket_dentalion_missingposter = {
                name = "Missing Poster",
                text = { 
                    "Prevents Death, {C:red}destroy",
                    "all {C:attention}Jokers{} and {C:attention}Consumeables{},",
                    "set {C:money}dollars{} to {C:red}$0"
                }
            },

            DentalionTrinket_dentalion_pushpin = {
                name = "Push Pin",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:red}destroy",
                    "{C:attention}last{} scored card"
                }
            },

            DentalionTrinket_dentalion_curvedhorn = {
                name = "Curved Horn",
                text = { 
                    "{X:mult,C:white}X#1#{} Mult"
                }
            },

            DentalionTrinket_dentalion_canser = {
                name = "Canser",
                text = { 
                    "{X:chips,C:white}X#1#{} Chips"
                }
            },

            DentalionTrinket_dentalion_momspearl = {
                name = "Mom's Pearl",
                text = { 
                    "{C:planet}Planet{} cards appear",
                    "{C:attention}#1#X{} more frequently",
                    "in the {C:attention}shop"
                }
            },

            DentalionTrinket_dentalion_fragmentedcard = {
                name = "Fragmented Card",
                text = { 
                    "{C:tarot}Tarot{} cards appear",
                    "{C:attention}#1#X{} more frequently",
                    "in the {C:attention}shop"
                }
            },

            DentalionTrinket_dentalion_matchstick = {
                name = "Match Stick",
                text = { 
                    "{C:green}#1# in #2#{} chance to create",
                    "{C:tarot}Tarot{} card, if hand is {C:dentalion_onfire}on fire.",
                    "Remove {C:attention}Eternal{} from {C:attention}Tick"
                }
            },

            DentalionTrinket_dentalion_bloodpenny = {
                name = "Blood Penny",
                text = { 
                    "{C:green}#1# in #2#{} chance for played",
                    "card with {C:hearts}#4#{} suit",
                    "to give {C:money}$#3#"
                }
            },

            DentalionTrinket_dentalion_burntpenny = {
                name = "Burnt Penny",
                text = { 
                    "{C:green}#1# in #2#{} chance for played",
                    "card with {C:clubs}#4#{} suit",
                    "to give {C:money}$#3#"
                }
            },

            DentalionTrinket_dentalion_flatpenny = {
                name = "Flat Penny",
                text = { 
                    "{C:green}#1# in #2#{} chance for played",
                    "card with {C:spades}#4#{} suit",
                    "to give {C:money}$#3#"
                }
            },

            DentalionTrinket_dentalion_counterfaitpenny = {
                name = "Counterfait Penny",
                text = { 
                    "{C:green}#1# in #2#{} chance for played",
                    "card with {C:diamonds}#4#{} suit",
                    "to give {C:money}$#3#"
                }
            },

            DentalionTrinket_dentalion_safetyscissors = {
                name = "Safety Scissors",
                text = { 
                    "{C:green}#1# in #2#{} chance to",
                    "remove {C:attention}enhancement{} from",
                    "{C:attention}scored{} card"
                }
            },

            DentalionTrinket_dentalion_pulseworm = {
                name = "Pulse Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_wiggleworm = {
                name = "Wiggle Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_ringworm = {
                name = "Ring Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_flatworm = {
                name = "Flat Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_hookworm = {
                name = "Hook Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_whipworm = {
                name = "Whip Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_rainbowworm = {
                name = "Rainbow Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#{} or {C:attention}#4#{}"
                }
            },

            DentalionTrinket_dentalion_tapeworm = {
                name = "Tape Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#{} or {C:attention}#4#{}"
                }
            },

            DentalionTrinket_dentalion_lazyworm = {
                name = "Lazy Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_ouroborosworm = {
                name = "Ouroboros Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_brainworm = {
                name = "Brain Worm",
                text = { 
                    "{C:green}#1# in #2#{} chance to {C:attention}level up",
                    "played {C:attention}#3#"
                }
            },

            DentalionTrinket_dentalion_crackeddice = {
                name = "Cracked Dice",
                text = { 
                    "{C:green}X#1#{} to all {C:attention}listed",
                    "{C:green}probabilities",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}1.5 in 3{C:inactive})"
                }
            },

            DentalionTrinket_dentalion_blister = {
                name = "Blister",
                text = { 
                    "{C:green}#1# in #2#{} chance that",
                    "every {C:attention}played card{} will be",
                    "counts in scoring"
                }
            },

            DentalionTrinket_dentalion_endlessnameless = {
                name = "Endless Nameless",
                text = { 
                    "{C:green}#1# in #2#{} chance to",
                    "create a {C:attention}copy{} of",
                    "used {C:attention}Consumeable"
                }
            },
        },

		Other = {
            dentalion_trinket = {
                name = "Trinket",
                text = { 
                    "Only one Trinket may", 
                    "be equipped at a time,", 
                    "purchasing a new Trinket", 
                    "replaces an old one"
                }
            },

            dentalion_lightgreen_seal = {
                name = 'Light Green Seal',
                text = {
                    "{X:green,C:white}#1#{} Mult",
                }
            },

            randomize = {
                name = "Randomize Card",
                text = {
                    "Give card new {C:attention}rank{} and {C:attention}suit",
                    "and non-guaranteed {C:attention}Seal{},",
                    "{C:attention}Enhancement{} or {C:dark_edition}Edition"
                }
            },

			palindrome = {
                name = "Palindrome",
                text = {
                    "Multi-digit number that is",
                    "{C:attention}unchanged{} when reversed",
                    "{C:inactive}e.g 11, 292, 3443{}"
                }
            },

            dark_suits = {
                name = "Dark Suits",
                text = {
                    "{C:spades}Spades{} and {C:clubs}Clubs{}"
                }
            },

            dark_suits_p = {
                name = "Dark Suits",
                text = {
                    "{C:spades}Spades{}, {C:clubs}Clubs{},",
                    "{C:paperback_crowns}Crowns{}"
                }
            },

            dark_suits_b = {
                name = "Dark Suits",
                text = {
                    "{C:spades}Spades{}, {C:clubs}Clubs{},",
                    "{C:bunc_halberds}Halberds{}"
                }
            },

            dark_suits_pb = {
                name = "Dark Suits",
                text = {
                    "{C:spades}Spades{}, {C:clubs}Clubs{},",
                    "{C:paperback_crowns}Crowns{} and {C:bunc_halberds}Halberds{}"
                }
            },

            light_suits = {
                name = "Light Suits",
                text = {
                    "{C:hearts}Hearts{} and {C:diamonds}Diamonds{}"
                }
            },

            light_suits_p = {
                name = "Light Suits",
                text = {
                    "{C:hearts}Hearts{}, {C:diamonds}Diamonds{},",
                    "{C:paperback_stars}Stars{}"
                }
            },

            light_suits_b = {
                name = "Light Suits",
                text = {
                    "{C:hearts}Hearts{}, {C:diamonds}Diamonds{},",
                    "{C:bunc_fleurons}Fleurons{}"
                }
            },

            light_suits_pb = {
                name = "Light Suits",
                text = {
                    "{C:hearts}Hearts{}, {C:diamonds}Diamonds{},",
                    "{C:paperback_stars}Stars{} and {C:bunc_fleurons}Fleurons{}"
                }
            },

            suit_change_tarot = {
                name = "Suit Change Tarot",
                text = {
                    "{C:tarot}The Sun{}, {C:tarot}The Star{},",
                    "{C:tarot}The Moon{} and {C:tarot}The World"
                }
            },
		}
    }
}
