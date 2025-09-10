return {
    misc = {
        labels = {
            dentalion_lightgreen_seal = "Light Green Seal",
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
                text = { {
                    "{C:mult}+#1#{} Mult"
                },
                {
                    "{C:red}-$#2#{} every {C:attention}5{} rounds",
                    "{C:inactive}(Currently #3#/5)"
                } },
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
                text = { {
                    "{C:red}Destroys{} first played card each round"
                },
                {
                    "If a {C:attention}face{} card has been {C:red}destroyed{} three",
                    "times in a row, this joker gains {X:mult,C:white}X#2#{} Mult",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive} Mult, #3#/3)"
                } },
            },

            j_dentalion_door={
                name = "Door",
                text = { {
                    "Gains {X:chips,C:white}X#2#{} Chips each round"
                },
                {
                    "Loses {X:chips,C:white}X#3#{} each {C:green}reroll{} in the {C:attention}Shop{}",
                    "{C:inactive}(Cannot be less than {X:chips,C:white}X0.5{}{C:inactive})",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{}{C:inactive} Chips)"
                } },
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
                text = { {
                    "Gives {X:mult,C:white}X#1#{} Mult"
                },
                {
                    "{C:attention}#2#{}, {C:attention}#3#{}, {C:attention}#4#{} and",
                    "{C:attention}#5#{} are debuffed"
                } },
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
                text = { {
                    "{C:chips}+#1#{} Chips"
                },
                {
                    "Rettriger {C:attention}random{} amount",
                    "of times"
                } },
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
                text = { {
                    "Skip {C:attention}#2#{} Booster Packs to create",
                    "a random {C:spectral}Spectral{} card",
                    "{C:inactive}(Currently #1#/#2#)"
                },
                {
                    "{C:red,E:2}self destructs"
                } },
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
                    "Scored cards gives {C:chips}+Chips{}",
                    "equals to the number of cards in",
                    "{C:attention}full deck{} with the same suit"
                },
            },

            j_dentalion_nahidwin={
                name = "Nah I'd Win",
                text = {
                    "Gains {C:chips}+#1#{} Chips if {C:attention}Blind{}",
                    "is beaten in exactly {C:attention}2 hands{}",
                    "{C:inactive}(Currently {C:chips}+#2#{}{C:inactive} Chips)"
                },
            },

            j_dentalion_bugs={
                name = "Bugs",
                text = {
                    "Gains {X:mult,C:white}X#1#{} at end of",
                    "round, if you have {C:money}$10{} or less",
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
                text = { {
                    "Use the same {C:planet}Planet{} card {C:attention}#1#{} times in",
                    "a row to create a random {C:spectral}Spectral{} card",
                    "{C:inactive}(Currently #2#/#1#)"
                },
                {
                    "{C:red}self destructs{}"
                } },
            },

            j_dentalion_anxiety={
                name = "Anxiety",
                text = { {
                    "{C:dentalion_plasma}Balances{} {C:attention}#1#%{} of {C:mult}Mult{} and {C:chips}Chips{}"
                },
                {
                    "{C:attention}+2%{} for each card below {C:attention}52{}",
                    "in your full deck"
                } },
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
                    "since start of round",
                    "{C:inactive}(Currently: {C:money}$#2#{}{C:inactive})"
                },
            },

            j_dentalion_mactonight={
                name = "Mac Tonight",
                text = {
                    "Add {C:money}$#1#{} of {C:attention}sell value",
                    "to {C:attention}leftmost{} Joker after",
                    "Using {C:tarot}The Moon"
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
                text = { {
                    "{X:chips,C:white}X#1#{} Chips"
                },
                {
                    "{C:red}self destructs{},",
                    "if no {C:attention}face{} cards played",
                } },
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
                    "If {C:attention}last hand{} of round has",
                    "only {C:attention}1{} card, convert scored",
                    "card into random card in hand,",
                    "add a permanent copy to deck",
                    "and draw it to {C:attention}hand"
                },
            },

            j_dentalion_noirjoker={
                name = "Noir Joker",
                text = {
                    "Gains {X:chips,C:white}X#1#{} for each",
                    "{C:attention}dark suit{} card in hand"
                },
            },

            j_dentalion_magnificent={
                name = "Jimbo The Magnificent",
                text = {
                    "{X:green,C:white}#1#{} Mult"
                },
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
                    "Lose {C:money}$4{} for each",
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
                    "Create {C:attention}#1#{} copy of",
                    "a random {C:dark_edition}Edition{} Tag"
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

		Other = {
            dentalion_lightgreen_seal = {
                name = 'Light Green Seal',
                text = {
                    "{X:green,C:white}#1#{} Mult",
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

            light_suits = {
                name = "Light Suits",
                text = {
                    "{C:hearts}Hearts{} and {C:diamonds}Diamonds{}"
                }
            },

            suits_change = {
                name = "Change of suits",
                text = {
                    "{C:hearts}Hearts{} into {C:spades}Spades{}",
                    "{C:diamonds}Diamonds{} into {C:clubs}Clubs{}"
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
