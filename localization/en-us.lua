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
                    "Retrigger all played {C:attention}Glass Card",
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
			
			j_dentalion_hexagonforce={
                name = "Hexagon Force",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult if",
					"played hand contains only {C:attention}6s{}",
					"and at least {C:attention}3{} cards"
                },
            },
			
			j_dentalion_trinket={
                name = "Trinket",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult if all",
					"consumeable slots are filled"
                },
            },
			
			j_dentalion_thegoddess={
                name = "The Goddess",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult if",
					"at least {C:attention}3 Aces{} held in hand"
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
			
			j_dentalion_pocket={
                name = "Pocket",
                text = {
                    "{C:attention}+#1#{} hand size if it",
					"less than {C:attention}#2#{} when",
					"first hand drawn"
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
                    "Turn all {C:attention}scoring{}",
					"{C:clubs}Clubs{} cards into",
					"{C:attention}Lucky Cards"
                },
            },
			
			j_dentalion_bodyguard={
                name = "Bodyguard",
                text = {
                    "{C:mult}+#1#{} Mult",
					"{C:red}-$#2#{} every {C:attention}5{} rounds",
					"{C:inactive}(Currently #3#/5)"
                },
            },
			
			j_dentalion_starterkit={
                name = "Starter Kit",
                text = {
                    "Hand {C:chips}Chips{} cannot",
					"be less then {C:chips}#1#{}"
                },
            },
			
			j_dentalion_decay={
                name = "Decay",
                text = {
                    "{C:green}#1# in #2#{} chance to",
					"destroy scored card"
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
					"empty joker slot"
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
                    "into {C:attention}Wild Card{}"
                },
            },

            j_dentalion_piechart={
                name = "Pie Chart",
                text = {
                    "Divide {C:money}dollars{} by {C:attention}4{} after",
                    "selecting {C:attention}Boss Blind{}. This joker gains",
                    "{C:mult}+1{} Mult for each {C:money}dollar{} lost",
                    "{C:inactive}(No more than 20 at once)",
                    "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive})"
                },
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

            j_dentalion_devilish={
                name = "Devilish",
                text = {
                    "Using {C:tarot}Death{} {C:red}destroy{} {C:attention}2{}",
                    "random cards in {C:attention}full deck",
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
                    "{C:mult}+Mult{} equal to half of its {C:money}selling value",
                    "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive})"
                },
            },

            j_dentalion_murdermystery={
                name = "Murder Mystery",
                text = {
                    "{C:red}Destroys{} first played card each round.",
                    "If a {C:attention}face{} card has been {C:red}destroyed{} three",
                    "times in a row, this joker gains {X:mult,C:white}X#2#{} Mult",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive}, #3#/3)",
                    "{C:inactive}#4#"
                },
            },

            j_dentalion_door={
                name = "Door",
                text = {
                    "Gains {X:chips,C:white}X#2#{} Chips each round.",
                    "Loses {X:chips,C:white}X#3#{} each {C:green}reroll{} in the {C:attention}Shop{}",
                    "{C:inactive}(cannot be less than {X:chips,C:white}X0.5{}{C:inactive})",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{}{C:inactive})"
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
                    "Once per round, used {C:planet}Planet{} card",
                    "gives permanent {C:chips}+#1#{} Chips",
                    "to {C:attention}random{} card in hand",
                    "{C:inactive}#2#"
                },
            },

            j_dentalion_obsidian={
                name = "Obsidian",
                text = {
                    "Gains {C:chips}+#2#{} Chips for each {C:attention}dark suit{}",
                    "card scored. Every {C:attention}light suit{} scored",
                    "card turns into {C:attention}dark suit{} after scoring",
                    "{C:inactive}(Currently {C:chips}+#1#{}{C:inactive})"
                },
            },

            j_dentalion_pegasus={
                name = "Pegasus",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult.",
                    "{C:attention}#2#{}, {C:attention}#3#{}, {C:attention}#4#{} and",
                    "{C:attention}#5#{} are debuffed"
                },
            },

            j_dentalion_partner={
                name = "Partner",
                text = {
                    "This joker gains {C:chips}+#1#{} and {C:mult}+#2#{}",
                    "then {C:attention}#3#{} is discarded",
                    "{C:inactive}(Currently {C:chips}+#4#{}{C:inactive} and {C:mult}+#5#{}{C:inactive})"
                },
            },

            j_dentalion_dentalion={
                name = "Dentalion",
                text = {
                    "This joker gains {X:mult,C:white}X#2#{} Mult",
                    "every {C:money}$20{} of solded cards",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{}{C:inactive}, {C:money}$#3#/$20{}{C:inactive})"
                },
            },

            j_dentalion_trafficlights={
                name = "Traffic Lights",
                text = {
                    "Change mod each round: {C:chips}+#1#{} Chips,",
                    "{C:mult}+#2#{} Mult or {C:money}$#3#{} at end of round",
                    "{C:inactive}(Currently: {V:1}#4#{C:inactive})"
                },
            },

            j_dentalion_ouroboros={
                name = "Ouroboros",
                text = {
                    "Gives {C:chips}+#1#{} Chips. Rettriger",
                    "random amount of times"
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
                text = {
                    "Set number of hands to {C:red}1{} at start",
                    "of round. If more than {C:attention}5{} hands are",
                    "removed, gives {C:attention}+1{} Joker Slot",
                    "{C:inactive}(Once per Ante), #2#",
                    "{C:inactive}(Currently {}+#1#{C:inactive})"
                },
            },

            j_dentalion_sight={
                name = "Sight",
                text = {
                    "Open {C:attention}#2#{} Booster Packs to",
                    "create {C:attention}#3#{} random tags",
                    "{C:inactive}(Once per Ante)",
                    "{C:inactive}#4#, (#1#/#2#)"
                },
            },

            j_dentalion_sparklingwater={
                name = "Sparkling Water",
                text = {
                    "Skip {C:attention}#1#/#2#{} Booster Packs to create",
                    "a random {C:spectral}Spectral{} card",
                    "{S:1.1,C:red,E:2}self destructs afterwards{}"
                },
            },

            j_dentalion_virus={
                name = "Virus",
                text = {
                    "{C:green}#1# in #2#{} chance to {C:red}self destructs{}",
                    "at end of round. Gains {X:mult,C:white}X1{} Mult and {C:green}+1",
                    "{C:green}chance{} for each copy of themself you have",
                    "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive})"
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
                    "equal to the number of cards in",
                    "{C:attention}full deck{} with the same suit"
                },
            },

            j_dentalion_nahidwin={
                name = "Nah I'd Win",
                text = {
                    "Gains {C:chips}+#1#{} if {C:attention}Blind{} is",
                    "beaten in exactly {C:attention}2 hands{}",
                    "{C:inactive}(Currently {C:chips}+#2#{}{C:inactive})"
                },
            },

            j_dentalion_bugs={
                name = "Bugs",
                text = {
                    "Gains {X:mult,C:white}X#1#{} at and of",
                    "round, if you have {C:money}$10{} or less",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive})"
                },
            },

            j_dentalion_oracle={
                name = "Oracle",
                text = {
                    "Using {C:attention}consumable{} {C:green}decrease{}",
                    "score requirement of",
                    "the current {C:attention}Blind{} by {C:attention}#1#%{}",
                    "{C:inactive}Up to #2#%. (Currently {C:attention}#3#%{C:inactive})",
                    "{C:inactive}#4#"
                },
            },

            j_dentalion_darkpeasant={
                name = "Dark Peasant",
                text = {
                    "{C:attention}+1{} hand size for each",
                    "{C:green}reroll{} in the shop (up to +#2#)",
                    "{C:inactive}Resets each round",
                    "{C:inactive}(Currently {C:attention}+#1#{}{C:inactive})"
                },
            },

            j_dentalion_freakjoker={
                name = "Freak Joker",
                text = {
                    "Using {C:planet}Planet{} gives",
                    "{C:attention}#1#{} free {C:green}Reroll{} in the shop",
                    "{C:inactive}(Currently {C:green}#2#{}{C:inactive})"
                },
            },

            j_dentalion_paranoidjoker={
                name = "Paranoid Joker",
                text = {
                    "{C:red}Discard{} {C:inactive}[#2#]{} cards to {C:green}decrease{}",
                    "score requirement of the",
                    "current {C:attention}Blind{} by {C:attention}#1#%{}"
                },
            },

            j_dentalion_disneyjoker={
                name = "Disney Joker",
                text = {
                    "Gains {X:green,C:white}^0.1{} for every",
                    "{C:attention}Voucher{} owned",
                    "{C:inactive}(Currently {X:green,C:white}#1#{}{C:inactive})"
                },
            },

            j_dentalion_plantsvsjokers={
                name = "Plants VS Jokers",
                text = {
                    "{X:chips,C:white}X#2#{} for each card",
                    "slot in the shop",
                    "{C:inactive}(Currently {X:chips,C:white}X#1#{}{C:inactive})"
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
                text = {
                    "{C:green}#2# in #3#{} chance to give {C:mult}+#1#{}.",
                    "Halves {C:mult}Mult{} and {C:green}Odds{} then",
                    "triggered. {C:inactive}(Resets after +1 Mult)"
                },
            },

            j_dentalion_puzzle={
                name = "Puzzle",
                text = {
                    "Using {C:tarot}Suit Change Tarot{} card",
                    "creates random {C:tarot}Suit Change Tarot{} card",
                    "{C:inactive}(Once per round), #1#"
                },
            },

            j_dentalion_blueplanet={
                name = "Blue Planet",
                text = {
                    "Use the same {C:planet}Planet{} card {C:attention}#1#{} times in",
                    "a row to create a random {C:spectral}Spectral{} card",
                    "{C:red}self destructs afterwards{}",
                    "{C:inactive}(#2#/#1#, #3#)"
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
                    "Give {C:attention}permanent{} bonus of {C:chips}+#1#{} Chips",
                    "to {C:attention}all cards{} in hand",
                }
            },

            c_dentalion_sowilu = {
                name = 'Sowilu',
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "create {C:spectral}The Soul{},",
                    "{C:red}-#3#{} hand size if not"
                }
            },

            c_dentalion_raidu = {
                name = 'Raidu',
                text = {
                    "Gain {C:attention}#1#{} free {C:green}Reroll{}",
                    "in every shop shop"
                }
            },

            c_dentalion_hagalaz = {
                name = 'Hagalaz',
                text = {
                    "Destroys all {C:attention}non-selected{} cards,",
                    "Halves your {C:money}dollars",
                    "{C:inactive}(At least #1# card must be selected)"
                }
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
                text = {
                    "Make selected {C:attention}Joker{} eternal",
                    "{C:red}-#1#{} consumable slot",
                }
            },

            c_dentalion_eihwaz = {
                name = 'Eihwaz',
                text = {
                    "Fills all {C:attention}empty{} consumable slots",
                    "with random {C:attention}consumables{},",
                    "Lose {C:money}$2{} for each",
                    "created {C:attention}consumable{}"
                }
            },

            c_dentalion_mannaz = {
                name = 'Mannaz',
                text = {
                    "Converts up all {C:attention}numbered{} cards in",
                    "hand to random {C:attention}Face{} cards",
                    "{C:red}-#1#{} discard every round"
                }
            },

            c_dentalion_isaz = {
                name = 'Isaz',
                text = {
                    "Enhances {C:attention}#1#",
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
                text = {
                    "Create {C:attention}#1#{} copies of a",
                    "random {C:attention}Consumable{},",
                    "{C:red}destroy{} all other consumables",
                }
            },

            c_dentalion_laguz = {
                name = 'Laguz',
                text = {
                    "{C:green}#1# in #2#{} chance to gain",
                    "{C:green}+1{} to all {C:attention}listed {C:green}probabilities{},",
                    "Makes random {C:attention}Joker{} {C:red}perishable"
                }
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
