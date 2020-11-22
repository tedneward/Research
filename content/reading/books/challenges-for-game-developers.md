title=Challenges for Game Developers
tags=reading, books, gamedev
summary=
~~~~~~
*(by Brenda Brathwaite, Ian Schreiber (Charles River Media))* 

# Part I: Building Blocks

## Chapter 1: The Basics
* What is Game Design?
 
     * It's Also All About the Player

     * Meaningful Decisions: game design is about creating opportunities for players to make meaningful decisions

* What Game Design is Not

* Types of Design

     * World design

     * System design

     * Content design

     * Game writing

     * Level design

     * User interface

* What Is a Game?

* The Core of a Game

     * Territorial acquisition: "zero sum" [Risk, Carcassone, etc]

     * Prediction: players trying to guess what will happen [Roulette, Rock-Paper-Scissors, etc]

     * Spatial Reasoning: think not only of the piece that they're putting in, but also the piece they may put in [Tic-Tac-Toe, Connect Four, Pente, etc]

     * Survival: don't confuse core dynamic with lose condition; survival is often a secondary activity supporting another core

     * Destruction: wreck-everything-in-sight [Nuclear War, Plague and Pestilence, Car Wars]

     * Building [SimCity, Caesar, Settlers of Catan, character development in RPGs]

     * Collection: collectible card games, casual games (match three things together), platformers (collect rings, bolts, or gold coins), or games where getting the most of a resource determines the winner

     * Chasing or Evading: capture prey or evade predators [Pac-Man, Scotland Yard]

     * Trading: trading and negotiation [Pit, Settlers of Catan, Animal Crossing, Pokemon]

     * Race to the End: Being the first to cross the street, the first to cross the line, or the first to learn a particular technology

* Where Do Ideas Come From?

     * Playing lots of games

     * Networking with other designers

     * Everywhere

* Learning Game Design

* Common Terms in Game Design

     * Feature List: list that details key features or selling points of the game

     * Brainstorming: process to generate ideas, usually done in a group

     * Prototype: a playable early version of the game or part of the game

     * Balance

     * Mechanics

     * Dynamics: the result when rules are put in motion

     * System: collection of game mechanics that is responsible for producing a given outcome

     * Avatar: direct representation of a player in the game

     * Playtesting

     * Platform

     * Concept Doc

     * Proposal: 5-to-20-page document that provides a more in-depth view of the potential game than a concept document

     * Pitch: "elevator speech" given to a game publisher or VC

     * Design Document: a "living" document that is continuously undergoing revision

     * Bugs

     * Engine: core program that runs the game

     * Alpha

     * Beta

     * Gold

     * Game Jam

     * Milestone

     * Game Bits

     * Card Game: standard deck of cards, Pokemon cards, Magic: The Gathering cards, or other cards

     * Board Game: game whose board serves as the playing field for the game

     * Tile Game: a type of game where the game "board" is made out of tiles, usually square or hexagonal

     * Dice Game: game that uses dice as the main bits, typically lacking board, cards or tiles

* Approaches to Game Design

     * Blue sky

     * Slow boil

     * Mechanic: focusing on mechanic(s): first-person shooter, jumping onto/over/into things

     * MDA: mechanics-dynamics-aesthetics (http://mahk.8kindsoffun.com)
          Aesthetics: the emotional response the designer and development team hope to evoke in the players
          Designers ask themselves which aesthetic they hope to achieve, define the dynamics that would lead to this feeling, and then create the mechanics to produce the desired dynamics.

     * IP: "intellectual property"

     * Story: developing a game based on a story

     * Research: games being used to research a variety of topics or as the topic of research itself

* Iterative Design

     * Rapid prototype

     * Playtest

     * Revision

     * Repeat

     * Don't write your rules down until you have to write your rules down. If you as the designers can't keep them straight in your head, how do you expect your players to? If, on the other hand, your players have things like monster lists in front of them while playing, so should you.

     * In identifying problems in games, be wary of putting a Band-Aid on top of a problem, but leaving the problem in the game.

* Constraints on Game Design

     * Video-Game Constraints

     * Non-Digital Constraints

* Overcoming Designer's Block

     * Make a Resource Limited (or Unlimited)

     * Interacting with Your Friends

     * Mess with the Play Order

     * Kill a Rule

     * Use the "Rule of Two": multiply or divide by two

## Chapter 2: Game Design Atoms
* Game State and Game Views

     * game state: collection of all relevant virtual information that may change during play

     * game view: the portions of the game state that the players can see

* Players, Avatars and Game Bits

* Mechanics

     * Setup: rule(s) that describe how the game begins

     * Victory conditions: rule(s) that describe how the game is won

     * Progression of play: who goes first and how? Turn-based or real-time?
          Turn-based: does the game start with one player and go clockwise, or do players bid resources in an auction for the right to go first each round, or is there some other method?
          Real-time: when two players try to do something at the same time, how is that resolved?

     * Player actions: referred to as "verbs", what players can do and what effect those actions have on the game state

     * Definition of game view(s): mechanics define exactly what information each player knows at any given time

* Dynamics

* Goals

* Theme

* Challenges:

    * Challenge I: The Path
      Allow 2 - 4 players, be about progressing on a path, and make them go from point A to point B; first player to point B wins

      Deliverable: Board-game, Card-game, Tile-based game prototype, or one-page write-up

      Suggested process:

        * Determine a theme and a goal

        * Identify mechanics

        * Identify the conflict between players

        * Playtest

        * Create deliverable
    
    * Challenge 2: It's Mine!
      Territorial acquisition: Allow 2 - 4 players, first player to get all the territory wins or player with the most territory after X turns wins

      Deliverable: Board/card/tile-game prototype

      Process: as above
    
    * Challenge 3: When I Find You....
      Focus on the exploration dynamic; consider how it is used in MMOs, adventure games, and RPGs

      Create a 2-4 player game (board/card/tile-game prototype); since the game involves exploration; needs some kind of space (physical or otherwise) to explore

      Process: as above

    * Challenge 4: Pick It Up
      Walking over an object -> collection dynamic. Take this mechanic and make a game out of it.

      Create a 2-4 player game (board/card/tile-game prototype) in which players "walk" over objects and pick them up; determine collections (3 of a kind, similar color, etc) and victory conditions

      Choose different themes (gardening game, gangster game, car-racing game, etc)

    * Challenge 5: War Without Frontiers
      Simulate and resolve a Civil War battle without using territorial acquisition or destruction of all units on the enemy side as the primary gameplay dynamic.

      Variants: different war (World War I, II) or other conflicts (corporate acquisition, feuding neighbors, or competing chain stores)

## Chapter 3: Puzzle Design

### Basic Puzzle Characteristics
* Affordances: it should be easy to figure out the rules and controls

* Identifiable patterns: patterns within the puzzle should be clear so that players are able to identify a series of possibilities required for the puzzle to be solved. Colors and shapes are commonly used, as are other forms of pre-existing knowledge like the spelling of words or the function of common objects

* Ease of use: Good UI

* Reward player skill: player should be able to improve his/her skill if a player encounters the puzzle many times

* Immersion: smooth transition between the main game and mini-game (this mostly falls to the artists making sure that the mini-game interface is done in the same visual style as the rest of the game, but the designer must consider the fit with the story and the world).

* Meaningful consequences in the game, outside of the mini-game: Not just "you unlock a door" but "you get cool items"

### Puzzle Types
* Riddles: questions that have one right answer, but that answer is not obvious
     * Several tricks to make riddles less frustrating: make the riddles purely optional, offer clues, or allow alternate solutions

* Lateral thinking: trick questions that have a single correct answer.

* Spatial reasoning: the manipulation of objects, either in the mind or on the playing surface

* Pattern Recognition: require the player to look for and identify a pattern when presented with information. Code-breaking is the height of this form of puzzle.

* Logic: Logic puzzles require the player to take a set of given information and derive additional information to find the solution.

* Exploration: Exploring the environment is found in a wide variety of games.

* Item Use: Use puzzles that involve the use of objects; the player must figure out which item(s) to use, in what order, to solve a particular challenge.

### Level Design and Puzzle Design
* Add or remove additional clues

* Move the clues around

* Allow multiple solutions

* Offer dynamic, play-sensitive help

* Make use of dynamic difficulty adjustments (DDA)

* Remove linearity

* Add a time limit

* Add or remove feedback

* Test the game on a variety of players

### Challenges
* Challenge 1: It's Da Bomb!
  Design a game based on "MacGyver"*make defusing a bomb into a timed puzzle; choose at least three puzzle types that would be appropriate to the theme

  Deliverable: three paragraphs and accompanying sketch, one per puzzle type, describing the basic mechanics

* Challenge 2: More Than a Maze
    Consider the maze to be a type of exploration puzzle; give the player a reason to make his own map; brainstorm as many mechanics you can that can be added to a simple maze which makes the process of mapping a puzzle in and of itself

* Challenge 3: What's the Password?
    Design three different password puzzles: determine the code (it need not be numbers), determine how the player enters the code, determine how the player gets the code in the first place. Consider things that players don't expect, like physical interaction within a level to manipulate some object into entering a code or finding particular items that match a necessary pattern. Research the many "keys" that were used to keep people out (and to keep people in) in the medieval period.

* Challenge 4: A Shocking Puzzle
    Electricity makes for great puzzles in video games, since passing its current from one side to another can logically result in some action being performed, provided it is, in fact, passed correctly. Create a paper prototype of a puzzle in which electrical current is passed from one side of the screen to the other.

* Iron Designer Challenge 5: Play New Eleusis

* Non-Digital Shorts: ideas for board/card/other games free of a digital components
     * create a tile-based game that simulates the process of exploring a dungeon. It should include various items that players require to progress further.

     * create a tile-based game where the tiles can only fit together correctly in one particular way to solve the game. Create the dynamics that would allow this to happen as a solo- or multiplayer game.

     * using graph paper and a simple six-sided die, create a map that payers must travel through that includes at least two different types of puzzles.

     * create the rules for a game that uses the following components: a 100-piece jigsaw puzzle (initially unassembled) for use as a game board that's built during play, and uses pawns to represent the players. Use additional components if desired.

     * create a game played on the surface of a Rubik's Cube. Assume that there are magnetic pawns, representing the players, which can stick to the sides and bottom of the cube

     * take any kind of puzzle that is normally solved by one player (such as a crossword or Sudoku) and modify the rules so that it becomes a two-player competitive game

     * take a multiplayer game where the goal is to solve a puzzle (such as the board game Clue, the puzzle game Mastermind, or the card game Sleuth) and modify the rules so that it is a single-player puzzle. Make sure that the player has enough information to solve the puzzle, and that it is playable without a computer or another human providing clues or information.

     * using pattern recognition, create a game that teaches children how to spell. Note that a correctly spelled word is, in fact, pattern recognition

     * create a trivia-based game in which trivia puzzles must be solved by a group in order to progress within a game

     * look at the puzzles page of any major newspaper. Select a puzzle and create a mod of it that changes both the theme and introduces or changes at least one mechanic

## Chapter 4: Converting Digital to Physical
* How to Start

     * Literal conversions attempt to re-create the gameplay experience as closely as possible in a non-digital medium for which it is ideally suited. Super Mario Kart is an excellent example of a game that could be converted to a race to the end board game with little modification to the game structure

     * Thematic conversions take the basic theme of the digital game and apply that to a traditional style of non-digital game. For instance, one could make the original Super Mario Bros into something similar to a D&D traditional RPG. One would borrow the storyline from Super Mario Bros, but not the mechanics. Instead, players might roll characters (or get preselected ones), and search for a princess hidden in a castle.

     * Mechanic conversions take a particular, common mechanic in the digital game and use it as the basis for a non-digital game

* Challenges
    * Challenge 1: Pick a Game, Any Game

        Create a board-game prototype for an Activision/Blizzard game.

        Process:
        * Choose your game: Make a list of the relevant games that you own/played.
 
        * Choose a method: Literal, thematic, or mechanic?
 
        * Determine player expectation: What will players of the video game expect when the play your board-game version of it?
 
        * Scavenge what you can: List all of the elements you can life immediately from your video game
 
        * Fill in the blanks: List everything you're missing before you have a complete game
 
        * Create deliverables: Create a prototype and a tentative set of written rules.
    
    * Challenge 2: Massively Two-Player Offline Card Game
         A popular MMO wants to release a separate standalone card game that reflects the thematic content of the virtual word; they aren't looking for a literal interpretation, but hope that you'll be able to incorporate some degree of story into the cards and feature at least one of the locations in the game.
          
         2-4 players, at least 50 cards in the game

         Process:
         * Choose a suitable MMO

         * Focus on one aspect of the game

         * Create a goal

         * Create the mechanics: 
              How do players achieve victory? Capturing the cards? Taking all the other player's hitpoints? What actions can they take? What effects do those actions have? Is it based on combat? Auctions and trade? Are the cards shuffled to make a common deck from which players draw? Held by players in a closed hand?

         * Design the cards

         * Create deliverable

    * Challenge 3: WWII: The Tabletop RPG
        Create an intro-level pencil-and-paper RPG similar to D&D but using historical video game as point of reference; to be used by high school students to facilitate learning. Specific constraints:
          * play a full game in one hour

          * Character creation needs to be really quick, but should allow some degree of customization

          * Game should come with one "campaign" for 4-6 players plus one "referee"/GM/DM

          * Game will need rules to resolve situations

        Process:
          * Choose a video game: prefer one with a strong narrative over games that focus purely on combat

          * Choose and design the characters and setting for your campaign

          * Create a template for creatures/enemies, if applicable

          * Create a template for items, if applicable

          * Create the mechanics

          * Write down the details of the campaign

        Variant: create the game that can be played with an entire class of 20 - 25 students

    * Challenge 4: Twitch Board Gaming
        Choose any FPS, RTS or MMORPG that doesn't already have an official board game based on it. Design a literal conversion of that game to a board game.

        (It turns out that converting real-time games to turn-based is not all that difficult. Suppose that one "turn" consists of, say, half a second of real-time play (enough to move or turn a short distance or perform an action like shooting.) Make turns simultaneous (all players declaring their actions secretly, then revealing and resolving one at a time) to give a feeling of uncertainty.)

    * Iron Designer Challenge 5: Would You Like Games With That?
 
        Create a board game companion/equivalent to an "advergame" (a la the Burger King XBOX games)
        * Non-digital shorts

        * create a board game that simulates the production of presents at Christmastime

        * create a collectible card game of 100 different cards separated into packs of five that simulates the running of a radio station. Develop some kind of system that allows you to compete for listeners and reach the coveted #1 station milestone.

        * develop a game in any medium that incorporates something exceptionally non-traditional, like forcing you to take only one turn per day or making certain moves possible only at certain times

        * make a card game that simulates the making of a video game

        * develop a tile-based game that incorporates a real-time component. For instance, though players may take turns laying tiles down, at some point, there is an event in the game (or something similar) that forces players into a real-time mode. Games like SlapJack work the same way: players take turns flipping cards until a Jack is revealed, at which point, all players go into a real-time mode to see who hits the Jack first.

        * create a game in any medium that is designed to incorporate sequels right from the get-go. As such, its medium must allow for expansion and incorporation of expansion components.

        * develop a game and a set of rules to be played in a public place by up to 50 players. You may incorporate teams into your design

        * select any well-known card game and develop a board-game version of it.

        * select any well-known but ultimately boring board game and create replayability and unpredictability by making it tile-based and by adding or removing mechanics as necessary

        * create a game in any medium that simulates the ebb and flow of people during rush hour. The goal of the game, as well as the number of players, is entirely up to you

# Part II: Chance and Skill

## Chapter 5: Elements of Chance
* The Role (Roll?) of Chance in Games

     * Delaying or Preventing Solvability

     * Making play "competitive" for all players

     * Increasing variety

     * Creating dramatic moments

     * Enhancing decision making

* Mechanics of Chance
     * Dice

     * Cards

     * Pseudo-random number generators

     * Hidden information (fog of war, etc): when hidden information is also random, there is the danger of the player becoming confused or frustrated; players should be able to understand the consequences of their actions and be able to form some degree of strategy that takes into account the random elements of the game.

     * Other game bits (spinners == dice, flipping a coin == d2, dreidel == d4, cardboard tiles drawn from a bag == deck of cards)

* All Randomness is Not Created Equal

* Completely Random Games: Children's games and Gambling games

* Challenges
    * Challenge 1: Luck Tac Toe
         Modify the game Tic-Tac-Toe by adding one or more chance-based mechanics (and other skill-based mechanics provided that the game still resembles Tic-Tac-Toe at its core)

    * Challenge 2: The GDC CCG
         Design the rules for a collectible card game (CCG) like Magic, adhering to the following constraints:
         * Two players only

         * Must support "constructed deck" format; that is, each player brings his/her own stack of business cards collected, and each player plays their own deck

         * Any standard-size business card must be playable in the game, therefore requiring use of the information typically found on business cards (names, phone numbers, job titles, etc)

         * This is a collectible card game, thus the cards must be distinct from one another*there should be a reason to include one card over another in an given deck; deck building should be strategic and not arbitrary (think of what might get someone in real life to say to a new acquaintance, "Wow, nice card.... Can I have an extra cop for my deck?)

         Variant: Add the following constraints:
         * the rules should be simple enough to teach another game developer in a short period of time*the written rules should be no longer than a page, and explainable to another person in less than two minutes

         * for maximum difficulty, the written rules must be short enough to fit on the back of our own business card in readable font

    * Challenge 3: The Fourth Wheel
         When most board games say "for two to four players", they really mean "for two or four players". Implementing a human-like AI in a board or card game is difficult*instead, add a completely unrealistic, chaotic AI instead. Choose a non-digital game that supports at least two, three, and four players (and possibly more), like Risk, Monopoly, or Blokus. Create a new set of rules for a three-player game that includes a fourth, randomly controlled nonhuman player. This fake player's actions must be governed by a set of card that are randomly shuffled, not influenced by the other players in the game (thus adding an element of luck to the game).
 
    * Challenge 4: The Alien in the Desert
         So many games of chance focus on dice or cards. An under-used mechanic in non-digital games is the fog of war, although it's a staple in many video games. You will develop a new tile-based game, The Alien in the Desert, using or employing one of the following:
         * Tiles similar to those in Carcassone or Settlers of Catan

         * The name Alien in the Desert (interpretations open)

         * Fog of war

    * Iron Designer Challenge 5: Open-Ended Randomness
         Break into groups of 2-4 players. Each group is given 100 blank index cards and a pen. Make a game using only these bits, and make it better than the games the other teams are designing. The game must include an element of randomness, be it through a draw, card flipping, shuffling, and so on. The game may not include any dice, however, or anything other than the 100 cards. The players may shape or alter the cards any way desired.

         Variant: Use a large bag of dice (with varying numbers of sides) as the only game bits
          * Non-digital shorts

          * Choose a classic card game with a heavy emphasis on skill (such as Euchre) and redesign it to be entirely dependent on chance

          * Redesign the classic card game War to incorporate at least three different kinds of chance other than the shuffled deck

          * In Risk, randomness is used to create dramatic moments during battle by incorporating dice rolls. Redesign the game to create these types of moments during a different stage of the game, such as reinforcement or fortification

          * Identify something that occurs by chance or is heavily influenced by chance in real life. Think of chance meetings or something that would make somebody say, "I never expected it!" Then create a game that re-creates this experience

          * Design a table-top role-playing game that only uses coin flips to create randomness

          * Parents the world over are begging you to create a game that involved both skill and chance*skill for them and chance for their kids. Modify an existing kids' game or create your own that fulfills these requirements

          * Choose a game you have created form a challenge or non-digital short from a different chapter in this book. Redesign the game to be either entirely based on chance or entirely devoid of chance

          * Design a game based on chance that uses exactly one of each of the following types of die: d6, d8, d10, d12 and d20.

          * Design a game using exactly one of each of the following mechanisms of chance: a shuffled deck of cards, tiles dealt and flipped, and tiles blind-drawn from a bag.

          * Use the elements of a well-known children's game (such as Candy Land) to create a gambling game

## Chapter 6: Elements of "Strategic" Skill
* The Role of Skill in Games: a good game is a series of interesting decisions

* Types of Decisions

     * obvious decisions: many obvious decisions are not interesting ones*remove the choice and make it automatic, or add time pressure, changing it from a strategic decision to a test of dexterity

     * meaningless decisions: remove them. One caveat: player perception. Many modern games offer players a choice in narrative that doesn't actually affect the overall outcome of the game. However, the player certainly perceives that it does, due to the way the game responds to them.

     * blind decisions: neither obvious (because the player lacks information) nor meaningless (because it affects the outcome of the game). In general, blind decisions can be turned into other kinds of decisions by giving the player enough information (which does not mean complete information)

     * tradeoffs: players lack the resources to do/buy/build everything, but this only works if the there is no obvious "better" choice (balance)

     * dilemmas: similar to a tradeoff, but occurs when all choices will harm the player. (Prisoner's Dilemma) Add multiple players (so that a small number of players defecting gets an advantage, but too many hurts everyone), to change things as well, especially if players have the ability to seek retribution against those who defected. If players don't know who cooperated and who defected, that can likewise change things, bringing in feelings of paranoia.

     * risk vs reward tradeoffs: the greater the risk, the greater the reward

* Frequency or Anticipation of decisions: designer's goal is to keep the player's brain busy with decisions. There are some cases, naturally, where decisions are not frequent, but the anticipation of a known pending decision sustains the player with thoughts of what she may do when decision time rears its head.

* Strategy and Tactics
     Technically, a "grand strategy" is the overarching means to achieving an ultimate, long-term goal, consisting of several supporting strategies, intermediate goals that must be performed in order to achieve the grand strategy. "Tactics" are the lowest-level micro-decisions made when carrying out a strategy. Sometimes, game designers refer to these as macro- and micro-choices.

     Tradeoffs make for interesting strategic or tactical decision-making. Fast decisions ("twitch" mechanics) are limited to tactics. This suggests that games that focus more on strategy do better to focus on decisions that involve tradeoffs, and games that focus on tactics can use either tradeoffs or fast decisions or a mixture of both, resulting in very different gameplay.

* Completely skill-based games
     Games that focus on strategy and tradeoffs tend to have at least some elements of chance. When these games are purely skill-based, like Tic-Tac-Toe or most adventure games, they can be solved, and the decisions that were once interesting can become obvious decisions when there ends up being a single known "right" move. Designing a game like this requires that there be enough depth of choices in the game that it cannot be easily solved by humans... and preferably not by computers.

     Most games that are entirely skill are physically based action games. This is probably because, unlike tradeoff decisions, it is not about getting the right answer but getting it quickly. Human reaction time can continue improving over time forever, especially in games where humans play each other.

* Mechanics of Skill

     * Tradeoff mechanics

          * Auctions

               * "open auction": players call out bids at any time, each one being higher than the last, until everyone is silent

               * "sequential auction": players each making a bid in turn order, one at a time.

                    * variant: it may only go around once, or it may continue indefinitely

                    * variant: players may or may not be allowed to pass without bidding

                    * variant: passing (if allowed) may or may not prevent the player from bidding again in a later round (if there is one)

               * "silent auction" or "closed auction": players make their bid simultaneously and in secret, revealing their bids all at once

               * "fixed-price auction": item is offered at a named price, and the first player to accept the named price buys it

               * "Dutch auction": offers the item at an initial high price, but the price falls slowly over time; first player to accept the price wins the auction/item

               * "reverse auction": the item up for bid is a disadvantage or negative event, and players bid to avoid getting stuck with it

               * instead of auctioning a single item, items can be auctioned off in groups (lots)

               * multiple auctions can be performed at once, with players allocating their resources between them

               * players can all lose all their bids, instead of just the auction winner

               * player with the second-highest bid wins a lesser item (or gets hit with a penalty, making high bids dangerous)

               * instead of resources being removed from play, winner can pay his bid to some or all of the losers

          * Purchases

          * Limited-use special abilities

          * Dynamic limited-use special abilities: vary the strength of special abilities based on space, time, location, or some other factor, amplifying the strategic nature of the decision (for example, the longer you hold an item, the more powerful it becomes)

          * Explicit choices

          * Limited actions

          * Trading and negotiations

* Strategic evaluation
     By interviewing players or watching them play, designers can gather a lot of information; the level of strategy in the game should be commensurate with the audience's desire for the same:

     * Do players care when other players are taking their turn? If a game has a high degree of strategy, players are reluctant to leave the table, let alone the room. A strategic game requires players to care about the outcomes of each player's move, because those moves will, in turn, affect their move.

     * Are players making long-term plans? Strategic games invite the player to form strategies that can be carried out over multiple turns. If players are stifled by the existing mechanics of the game or allowed too much latitude, they may be unable to see how their strategy could be sustained or achieved over multiple turns. When playing a game, ask players what they plan to do or how they think they will win the game.

     * Are there multiple strategies for multiple games? At the beginning of any given game, the player should have an idea of how he will approach the play of the game. The more rich the strategic opportunities are, the more diverse the answers will be.

* Challenges
    * Challenge 1: Skill from Nowhere
         Consider the rules of Thunderstorm (German children's game):

         * One player is chosen to begin and then play proceeds clockwise

         * On the first turn, the player throws 6d6

         * If the player rolls any 1s on his turn, those dice are set aside and the remaining dice are passed to the next player. In this way, players may have fewer than six dice to throw on their turn

         * If a player rolls only 1s on their turn, all six dice are passed to the next player

         * If a player fails to roll any 1s, he is penalized. The first five times this happens to a player, he draws five lines on his paper in the shape of a house. On the sixth failure, lightning strikes that player's house (draw a sixth line through the house) and he is eliminated from the game

         * The object of the game is to be the last player eliminated from the game.

         Create a variant of this game that involves at least some skill. Make this game more palatable to adults while still keeping it close enough to the original that the children are themselves interested in playing

    * Challenge 2: Game Systems
         The Piecepack (www.piecepack.org) is a public domain game system that can be used to create board games. Design a Eurogame that uses only the bits found in a single Piecepack; constraints:

         * Playable in roughly 60 - 90 minutes

         * Short setup time

         * Simple rules, short learning curve

         * Cooperative, not confrontational

         * Contains strategic decision making along with measured randomness

         * Minimal player downtime

         Variant: use Icehouse pieces (www.looneylabs.com)

         Variant: use Stonehenge pieces (www.paizo.com)

         Variant: use any modified deck of cards

    * Challenge 3: Strategy on the Run
         Design a Eurogame with a playtime of 15 minutes or fewer

         Variant: Take the game from Challenge 2 and reduce its playtime to 15 minutes

    * Challenge 4: A Whole New Dimension
         Play Checkers, but on a 12x12 (or 6x6 or 7x7 or 9x9) board instead of the traditional 8x8

    * Iron Designer Challenge 5: Black Friday: The Board Game
         Break into groups of 2-4 players. Each group names a regularly occurring event ("Black Friday" the shopping day immediately after Thanksgiving; High school class reunion; Game Developers Conference; Routine dental cleaning; Academy Awards; Toyotathon), make a board game out of the event with a strong element of strategy and interesting player decisions

## Chapter 7: Elements of "Twitch" Skill
* Challenging the Player

* Tuning

     * Difficulty levels

     * Dynamic difficulty adjustment

     * Difficulty curves: simply start off easy and become progressively more difficult as time goes on

     * Playtesting

* Twitch Decision Making
     Obvious decisions are not very compelling in a strategic environment, but they can be made more interesting if the player has limited time to make those decisions. See "NoBrainer" (http://www.shockwave.com/contentPlay/shockwave.jsp?id=nbrainer&preplay=1)

* Twitch Mechanics
     * Pure speed: perform a repetitive task repeatedly or perform a routine task in a minimum amount of time ("button mashing")

     * Timing: press the right button at the right time

     * Precision: do something accurately

     * Avoidance: staying away from harmful enemies or projectile

     * Time pressure: Any task becomes more difficult when a time limit is added

* Challenges
    * Challenge 1: Adding Twitch to Strategy
         Choose any game that is pure strategy, with no luck and no twitch mechanics. Modify the rules to allow some kind of twitch component

    * Challenge 2: Multi-Ball
         A majority of popular sports involve the players moving a ball around a field of play; let's try something different: instead of one ball in play, there must be two or more balls in play at once. The balls may be identical, or they may serve different functions.

    * Challenge 3: Twitch Dice
         Design a game that involves only twitch mechanics and luck*no strategic elements*using only dice as your components. Use anywhere between five and ten dice for your game. Playable in five minutes or fewer.

    * Challenge 4: Avoidance Under Pressure
         Choose any video game that you own or have access to that does not have an explicit time limit, and create a non-digital version of that game that employs avoidance and gets progressively more challenging through the use of time pressure.

         (Look up Scotland Yard on BoardGameGeek.com)

    * Iron Designer Challenge 5: That's Hard!
         Select any game with which you're familiar and add the necessary mechanics that end the game but allows the players to keep playing, provided they can afford it. You may need to add mechanics that cause the player to be removed from the game before its normal end.

* Non-digital Shorts
    * Create a game that doesn't involve pain that uses 10 pencils and whose winner is the one to get rid of all the pencils first

    * Time pressure is usually a factor in a game. Sometimes, though, its on the designer. Create a game from the first 10 things you pull from your home or office junk drawer or which are sitting at your desk. You have 20 minutes to complete your first iteration of that game.

    * Re-envision an FPS as a non-digital art piece where the gun isn't a gun but the basic mechanics of the game remain unchanged. The piece should be political in nature and be designed to make a statement.

    * Create a tile-based game that incorporates real-time play. Think Slapjack, but don't do Slapjack.

    * Create a single-player game that requires the player to complete a given series of tasks within a given period of time. You may add a time limit to an existing game or create one of your own.

    * Create a dexterity game using only sticks and stones as game bits. The game must involve no physical risk*no possibility of broken bones.

    * Create a card-based game with the concept that players must work together to defuse a bomb. Use a time limit, where the bomb blows up and the players lose if they take too long.

    * Take a trivia game like Trivial Pursuit and modify the rules in such a way that players must answer their questions quickly, not just accurately. Note how this changes the dynamics.

    * Modify an existing non-digital game that uses primarily dexterity mechanics, changing its focus to pure speed. Or modify a pure speed game to be a dexterity game.

    * Consider any physical contact sport. Modify the rules so there is absolutely no contact between players at all (not even using touching or flags).

## Chapter 8: Chance and Skill: Finding the Balance
* Consider the Target Audience
     * Children: Children younger than five may not yet possess the mental skills necessary to make strategic decisions or to keep track of resources; games for this age tend to have few decisions, and strong element of chance. Often these games also allow children to disconnect from turn to turn so that each turn is about immediacy, not permanence and strategy. As children get older, number/complexity of skill-based decisions can gradually increase

     * Competitive games: players with a competitive streak tend to prefer games with more elements of skill.

     * Social gamers: those who like to play games for primarily social reason don't care so much about intense strategy. These people can tolerate a greater range of luck, though there still needs to be enough interesting decisions (especially those that affect other players, which leads to social play) to create a reason to play in the first place.

     * Professional players: games that can be played professionally tend to have extremely strong skill components.

     * Families: designing a game that can appeal to all ages is challenging; generally, family games have certain traits:

          * Short playing time (so as not to outlive the attention span of youngsters)

          * Relatively simple rules, so they can be taught to children

          * some element of luck, to allow children and social players to have a chance of winning against the more competitive players

          * some elements of skill with interesting decisions, to keep the adults entertained and engaged

* Playtesting for luck/skill balance
Warning signals:

     * The players are bored: there is too much luck in the game, or the frequency of interesting decisions is too low

     * The players are bored on all but their turn: find a way for players to engage with other players through gameplay; odds are your game isn't as immersive as it could be; alternatively, make player turns short enough that no one has to wait long for their turn

     * The players never become engaged, or seem confused about what to do: the game is too complicated, or that there are too many decisions, or there is too much information for the players to process; consider removing some decisions, either by automating them or making them random, and perhaps reducing the complexity of the rules in general

     * One player beats all of the other players by a wide margin: this suggests a game that has too many skill elements*add some randomness to the game, or add a negative feedback loop (some mechanics that make it easier for players who are behind to catch up)

* Exchanging luck and skill
     Adding randomness increases the amount of luck in a game; random elements can either be removed by automating them or replacing them with a player decision. Decisions can be added by replacing automatic rules. Also, remember that there are elements of chance beyond simple random die rolls or shuffled decks of cards*information that is concealed from the players involves chance, even if that information is not random.

* Combining luck and skill

* Games of chance: games that are primarily chance tend to fall into one of two categories: children's games and gambling games. For gambling games, adding elements of skill (either kind) is quite possible, and if those elements are strong enough, can convert the game to being primarily skill-based. Even the illusion of skill is enough to make some gambling games more interesting.

* Games of twitch skill: It is difficult to add much luck or strategy to a primarily twitch-based game. The fun of twitch games comes from the mastery of a difficult dexterity challenge. Tactical elements are common in twitch games, especially those that involve shooting. Heavier strategy can be disruptive; twitch games are an adrenaline rush, and stopping the action so the player can strategize is a bit like going on a five-mile run and then stopping every few minutes to do the crossword puzzle.

* Games of strategic skill: Adding minor twitch elements to a strategy game can be a pleasant way to break up long stretches of strategy with a bit of action. Adding luck to a strategy game can widen the audience by allowing players of differing skill levels to play, while still allowing the weaker player to win periodically. Too much luck can take the thrill out of winning, if a player feels that he only won because of favorable card draws or die rolls. Ultimately, the amount of luck that is acceptable depends on the target audience; competitive players will generally tolerate only a small amount of luck, while social and family gamers will accept larger amounts

* Challenges
    * Challenge 1: Risk for Kids
         Create a rules variant for Risk that removes many of the strategic elements and replaces them with chance, in order to make it playable by children ages 5 - 8

         Variant: use a different strategy board game: Chess, Stratego, Go

         Variant: make the strategy board game into a family game that can appeal to all ages

    * Challenge 2: Adult Children's Games
         Pretty Pretty Princess is a children's game with virtually no skill involved; the game comes complete with princess attire for each player (earrings, a ring, a bracelet, a necklace) and a single crown; the person to collect all her pieces first, as well as the crown, wins the game, and move around the board using a spinner that tells them where to go and what item to pick up. Some spaces list a specific item to pick up, while others give the player their choice of items. The game also comes with a black ring, which prevents the player from winning until someone else is forced to take the ring from them. Players periodically take things form each other and put things back in the pot, too. Modify the rules of this game to make it a family game, so that it is more interesting to adults, too.

         Variant: Use a different children's game, like Chutes and Ladders, CandyLand or the card game War

         Variant: Change the children's game into a competitive adult's game

    * Challenge 3: Fog of Strategy
         Choose an entirely skill-based, non-digital game with no elements of chance at all (Connect Four, Chess, Go) and adapt this game for less competitive players by adding some chance via "fog of war": your opponent's pieces are hidden from you (and vice versa) except under certain conditions.

         Variant: Some games (Battleship) use fog of war as a core game concept; modify the game with strategic elements enough that removing the fog of war still makes it an interesting game

    * Challenge 4: Casual Quake
         Create a concept for an original first-person shooter (or a mod to an existing FPS) that is more accessible to less skilled players. Decrease the impact that player skill (primarily physical skill, in this case,) has on the outcome of the game.

    * Iron Designer Challenge 5: Hardcore/Casual
         Choose a game that is marketed as a "casual" game (Bejeweled, Peggle, Chuzzle) and propose a modified version aimed at the competitive hard-core gamer market. Consider ways to support tournament play that remove as much luck as possible, so that the more skilled players can consistently win.

         Variant: instead of using a digital game, use a card or board game that is often played in a social or family setting (Hearts, Scrabble, and Settlers of Catan)

* Non-digital shorts
    * Take any traditional children's game and modify it so that it is enjoyable to adults

    * Add a bidding mechanic to any children's game of your choice; consider, for example, what would happen if you added bidding to Candy Land

    * Create a tile-based game based on the current CNN.com headline that primarily uses skill, but still has some random element; the game may not be made with anything other than tiles

    * Select an incredibly dangerous job and make a game about it that integrates both skill and luck

    * Watch children playing; then make a game about their play that replicates the skill and luck involved in their play

    * Every rule has exceptions; create a family game that has no luck elements at all

    * Take a primarily luck-based game and modify the rules so that it is instead dominated by twitch skill

    * Try to create a card game that has equal elements of twitch skill, chance, and strategic skill without any single one outweighing the others

    * In Poker, repeated play makes the game more focused on skill than luck; in CandyLand, no matter how much you play, it's still luck. Consider the difference between the two games, then add one or more rules to CandyLand that keeps it luck-based on a single turn, but skill-based over the play of an entire game

    * Try this game-design game with two or more players. First, select any non-digital game that you have available. Then, have one player choose a mechanic and roll a die (1-2: chance, 3-4: strategic skill, 5-6: twitch skill), rolling again if your die roll matches the mechanic already. Another player then must modify the mechanic to use the new kind of chance/skill based on the die roll, while still keeping the game playable and fun. See how many rules you can modify in this way until something in the game breaks.

# Part III: Writing Game Concepts
## Chapter 9: What is Intellectual Property?

## Chapter 10: Creating Sequels

## Chapter 11: Targeting a Market

## Chapter 12: Learning an Unfamiliar Genre

## Chapter 13: Designing a Game to Tell a Story

# Part IV: Additive and Subtractive Design
## Chapter 14: Adding and Subtracting Mechanics
* Why Add Mechanics?
     * Publisher demand

     * Changes in the marketplace

     * The Game Sucks

     * A sequel

     * The Brainstorm

* Why Cut Mechanics?
     * Ratings

     * To deliver on time

     * Core check

* After the tinkering (iterate, iterate, iterate)

* Challenges

* Challenge 1: Poker and Dragons
     Start with Poker (choose whichever version), add some d4 (at least two) that must be part of the play of the game, modifying the rules as necessary, to include these new components.

     Variant: Choose a different card game than Poker*Rummy, Euchre, Pitch are a few

     Variant: Instead of dice, use a different component. Add a second deck of cards. Or add (or remove) the jokers. Or play with a deck from a different game instead of a standard Poker deck. Or add a single d20 instead of several d4. Or ....

     Variant: Instead of adding components like dice, add a new rule (all players are dealt three hands instead of one, or players are dealt a different number of cards and hands are made from four or six cards instead of five, or there are two pots instead of one and they have different functions during gameplay, or ....

     Variant: Add "instants" to the deck, allowing you to steal cards from other players, swap hands, or draw again.

* Challenge 2: Social Networking: The Game
     Design a game to be added to a social-networking site that takes advantage of the natural competitive tendencies; at minimum, there needs to be some kind of challenge and at least one overall goal. Furthermore, since it's a social network, there must also be gameplay interaction between the players, and not merely a ranking system or sorts. The game must be about more than the high score. The game need not affect the social network itself, but can take advantage of it, much like fantasy football takes advantage of football.

* Challenge 3: Strong Arm Scrabble
     You have Q, U and I, if only you had a T... or could take one from somewhere. Create a home-modified version of Scrabble that allows players to take letters when you need them. In order to do this, add one or more mechanics to the game; where you take the letters from and the consequences for doing that (if any) are variable.

* Challenge 4: Every Cent Counts
     Take an existing game idea and reduce the materials involved in the game. Without adding any game materials, or swapping one material for another, you must remove at least one of the following: all of the dice, all of the cards, all of the cardboard tiles, or the game board.

* Iron Designer Challenge 5: Pick a Mechanic, Any Mechanic
     Making a game from a single mechanic is perhaps the ultimate additive exercise. When a random mechanic is foisted upon an unsuspecting board game, it becomes both an additive and a subtractive challenge. For this challenge, you and another designer will go head to head to create something exceptionally challenging. There are three stages to this challenge:

     * 1. Select a game (preferably one that plays in < 30 minutes)

     * 2. Select a mechanic or play dynamic from BoardGameGeek.com mechanics list

     * 3. Give it to another designer or team of designers to integrate into the game you've selected

* Non-digital shorts

* choose a common board game you consider to be mediocre or terrible; add or subtract one mechanic that improves the game

* alternatively to #1, add as many mechanics as necessary to make the game genuinely fun. Try to do it with as few additions as possible

* alternatively to #1-2, try doing it by subtracting mechanics. Try to succeed  before the game disappears!

* choose a classic 2-player board game (such as Backgammon) and redesign it to be playable by four players

* choose a game you have created from a challenge or non-digital short from a different chapter; select one mechanic from it and redesign the game as if that mechanic had been cut due to publisher disapproval

* choose a common children's game (such as Go Fish) that you can reasonably consider to have an "E" rating; add one mechanic tha twill bump the rating to Teen. Continue as far as you are able, one mechanic per rating level.

* choose a game you have created from a challenge or non-digital short from a different chapter; find three people unfamiliar with the game to suggest a mechanic and then add these to your game without breaking it

* design a means for combat to occur in a turn-based tabletop RPG; now simplify it by taking a mechanic out of it

* select a tile-based building game (like Carcassone), re-theme it to make it your own, and add a new mechanic to it

## Chapter 15: "But Make It Multiplayer"
* Looking Forward

* Being Alone Together: MMOs often keep players on rails together, but essentially "alone together".

* Multiplayer, Multiplatform

* Multiplayer, Multipurpose: Consider the possibilities for collaboration in all kinds of disciplines if virtual worlds were used to their fullest extent

* Social Networking

* Types of Mutliplayer Games

* Quantity-based Distinctions: The design of a game must be approached differently depending on how many players are interacting with one another at a given time. Once a game exceeds four or eight players, it becomes rarer to see free-for-all gameplay where everyone is out for himself; with larger numbers of players, it is more common to have them grouped into teams, which brings a host of team dynamics into the considerations of the game designer. With thousands or millions of players, the designer must answer questions like, "How can a single player feel like he makes a difference" not to mention technical questions like "How can we support this many people simultaneously without the game server dying for lack of bandwidth"

* Play-based Distinctions:
     * Real-time

     * Turn-based

     * Competitive

     * Cooperative

* Time-based Distinctions:
     Real-time games allow players to move simultaneously (synchronous and force players to play together in order for a game to happen, or asynchronous and allow players to play whenever they want, together or alone). Turn-based games force players to take turns when moving or performing other actions. Some games are a mix of real-time and turn-based play styles. Turn-based allow players time to consider their moves*for days if desired. Some games use timers to limit turns, but many games just go on the "show up when you can" model. As play across social networks continues to broaden, these turn-based, social net, multiplayer games are likely to represent the first wave of a new paradigm in casual games.

* Technology-based Distinctions
     * MUDs: Multiuser dungeons, multiplayer text worlds

     * MMO: Massively Multiplayer online games

     * LAN game: Local area network games

     * BBS door: Bulletin board system (BBS) game hosted client-side

     * IP-specific: Services like Valve's, Steam, or Xbox Live

* Issues in Multiplayer game Design

* Dynamic Scalability

* Griefing: the process of attacking or otherwise negatively affecting other players for enjoyment

* Community Formation and Support

* Attract the Old or the New? (players)

* Interface Issues

* Challenges
    * Challenge 1: Old Games, New Life
         A developer's agent has approached: she wants to take a look at these old RPG series games (Wizardry, Might and Magic, Bard's Tale, AD&D) and see if you can envision one as a modern day MMO. Players need to recognize the new MMO as the new, multiplayer incarnation of their old RPG game.

         Variant: Take any casual game that is not presently multiplayer (such as Tetris, Bejeweled, or Diner Dash) and make it playable by more than one player. The addition of multiplayer must change some facet of the game's play, and can't merely be one player taking half of the turns. Consider adding a PvP mode.

    * Challenge 2: "But Make It Multiplayer!"
         Adventure games were once a whole lot of fun for a whole lot of people... until those people wanted to start playing with other people, that is. Complicating this matter, adventure games aren't terribly replayable. Unless the game offers substantially different paths through the story with multiple endings and even multiple beginnings, its replayability is low.

         Take any older adventure game, such as any of the King's Quest or Monkey Island series, Day of the Tentacle, or Grim Fandango, and make the game multiplayer (and multiplatform)

    * Challenge 3: Migratory Herds
         As a designer on a new MMO, it's your job to take on a job called "community capture": figure out what you need to do to capture an existing MMO market into your upcoming game. How do they make their current "home" a home? How have previous companies done it? Why should they come to you and your game instead of someone else's?

    * Challenge 4: Stealth Educational MMO
         You've been brought in by one of the largest educational outfits and have been asked to create a "stealth learning" MMO; a game where the players are learning educational material without realizing that they are learning. This project can be for any level of history, provided the project is realistic and suitable for school-aged children. The MMO needs to teach the following:

         * physical climate and geography

         * social environment

         * socio-political environment

         * economic environment

         While teaching these concepts, the game should not be preachy or layer it on too thick; this is supposed to be a game, and students are supposed to learn while having fun, not by being banged over the head with the topic.

    * Iron Designer Challenge 5: Socialtaire
         Break into teams; each team chooses a Solitaire game that uses a standard deck of cards. Take the game you are assigned/choose and modify the rules so that it is a competitive two-player or multiplayer game

          * Non-digital shorts

          * Take a standard deck of playing cards and create a turn-based game in which teams of two players compete against one another to complete a series of card runs. The individual members of the teams should work together in support of the team while working to defeat the other team.

          * using the same series as in Challenge 1, create a board or tile-based game that up to 20 players can play. Players should be able to come and go as they please and solve missions and function independently of other players or with them, provided they are playing the game simultaneously. As a designer, your biggest challenge will be to determine how the game ends or if it ends at all. How will you provide your players continuing entertainment? What's to stop them from racing through in a single play?

          * non-digital games tend to build up a following as large as digital games. Your goal is to create a non-digital game that is designed to capture players of another popular non-digital game

          * design a game to be played in a well-known public setting, such as a museum or a shopping mall

          * design a board game to be played on two distinct boards in two separate locations. Assume the players at each board cannot meet each other face to face or exchange real-time communication

          * choose a common competitive board game (such as Risk) and redesign it to be cooperative

          * choose a game you have created from a challenge or non-digital short from a different chapter; redesign the game to accommodate twice the number of players for which you originally designed

          * choose a common turn-based board game (such as Parcheesi) and redesign it to include real-time play

          * create a four-to-ten player party game where people are rewarded for coming up with the best stories. the game must include multiple mechanics to create the stories and a means for determining who the winner is

          * create a turn-based tile-based adventure game for two to four players where the story unfolds as the game is played; optionally, you may give the players the ability to change the course of the story

# Part V: Special Topics
## Chapter 16: Creating a User Interface

## Chapter 17: Games as Art

## Chapter 18: Games as a Teaching Tool

## Chapter 19: Serious Games

## Chapter 20: Casual Games

## Chapter 21: Social Networks and Games

