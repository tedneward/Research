title=Open-Source Linux Games
tags=gamedev
summary=A collection of Linux open-source games; capturing them here for play and research purposes.
~~~~~~

From [Part 1](https://github.blog/2021-08-25-30-free-and-open-source-linux-games-part-1/) [Part 2](https://github.blog/2021-08-26-30-free-and-open-source-linux-games-part-2/) and [Part 3](https://github.blog/2021-08-27-30-free-and-open-source-linux-games-part-3/)

* [Oolite](http://www.oolite.org/) ([Source](https://github.com/OoliteProject/oolite)): Billed as an open-word space opera, Oolite is inspired by David Braben’s classic game Elite—a game I spent many an hour playing on my school’s BBC Micro. Forge your own path in the galaxy by becoming a feared pirate, a dodgy trader, a gun for hire, or a washed-up software engineer searching the galaxy for coin. (Obj-C)

* [Cataclysm: Dark Days Ahead](https://cataclysmdda.org/) ([Source](https://github.com/CleverRaven/Cataclysm-DDA)): aAroguelike game set in a procedurally generated, post-apocalyptic world. Think zombies, nuclear waste grounds, that sorta thing. Like most roguelikes games, it’s primarily text-based, but there are tilesets available. (C++)

* [Wesnoth](https://www.wesnoth.org/) ([Source](https://github.com/wesnoth/wesnoth)): A turn-based strategy game with a variety of campaigns involving elves, dwarves, orcs, trolls, humans, and more. Speaking of humans, hundreds of them have contributed maps, campaigns, features, and bug-fixes to the project. (C++)

* [Warzone: 2100](https://wz2100.net/) ([Source](https://github.com/Warzone2100/warzone2100)): A malfunction in Earth’s new strategic defense system causes a series of nuclear strikes that take out almost every inhabitant on Earth. Your job is to help rebuild civilization, but as you can imagine, there are a few barriers to overcome first. Originally developed by Pumpkin Studios and released in 1999, Warzone 2100 was open sourced in 2004 under a GNU GPL v2.0 or later license. Now the project is entirely community-driven and still sees plenty of updates from hundreds of contributors. If you like real time strategy games, you’ll like this. (C++)

* [OpenTTD](https://www.openttd.org/) ([Source](https://github.com/OpenTTD/OpenTTD/)): Did you ever play Transport Tycoon Deluxe back in the day? OpenTTD, as the name suggests, is an open source game based on it. In addition to mimicking the original game, it offers significant new features, like multiplayer mode for up to 255 players, waaay bigger maps, and the ability to build on slopes and coasts! (C++)

* [Free Orion](https://www.freeorion.org/index.php/Main_Page) ([Source](https://github.com/freeorion/freeorion)): FreeOrion is a 4X (that’s Xplore, eXpand, eXploit, and eXterminate) turn-based, space empire and galactic conquest strategy game. It’s inspired by the Master of Orion games but is neither a clone nor a remake of the original game. Explore the randomly-generated galaxy, colonize planets, research new technologies, and prepare to battle with diverse and formidable species. With the game’s support for scripting with FOCS (FreeOrion Content Script) files, the community has an easy way to customize mechanics, presentation, and pretty much everything in the universe. Here’s an example for a small Krill space monster:

    ```
    MonsterFleet
        name = "SM_KRILL_1"
        ships = [
            "SM_KRILL_1"
        ]
        spawnrate = 0.5
        spawnlimit = 9999
        location = And [
            Not Contains Monster
            Not WithinStarlaneJumps jumps = 2 condition = Contains And [
                Planet
                OwnedBy affiliation = AnyEmpire
            ]
        ]
    ```

    (C++)

* [Nethack](https://www.nethack.org/) ([Source](https://github.com/NetHack/NetHack)): NetHack is a roguelike game—a fork of the 1982 game Hack. Choose from one of the character classes, and fight your way through the usual procedurally-generated dungeon foes in search of the elusive Amulet of Vendor. It’s not a trivial game to get into, but it is very rewarding. (C++)

* [Freeciv](http://www.freeciv.org/) ([Source](https://github.com/freeciv/freeciv)): A free and open source, turn-based, empire-building strategy game supporting up to 126 players (or 500 on the web version). With over 500 nations and 50 playable units, you’re bound to find something that interests you as you lead your empire out of the stone age and into the space age. (C)

* [Endless Sky](https://endless-sky.github.io/) ([Source](https://github.com/endless-sky/endless-sky)): Explore the galaxy, and follow your dreams of becoming an intergalactic space trader, dreaded space pirate, gun for hire, etc. In Endless Sky, you’ll need to make quite a bit of coin to pay off your loan (for your starter spacecraft), and later purchase new spacecrafts, upgrade weapons, and tweak your engines …you get the idea.

* [Unknown Horizons](https://unknown-horizons.org/) ([Source](https://github.com/unknown-horizons/unknown-horizons)): Expand your small settlement and build a healthy colony in Unknown Horizons, a real-time economy simulation game based on the [Anno game series](https://en.wikipedia.org/wiki/Anno_(series)). Expand your settlement beyond the horizon, collect taxes, and keep your inhabitants happy and healthy. (Java)

* [Vega Strike](https://www.vega-strike.org/) ([Source](https://github.com/vegastrike/Vega-Strike-Engine-Source)): Vega Strike is a 3D space flight simulator putting you in the cockpit to explore, fight, and trade throughout the galaxy. It is similar to Freelancer, but free! (C++)

* [Dungeon Crawl Stone Soup](https://crawl.develz.org/) ([Source](https://github.com/crawl/crawl)): Another roguelike game. Download it, build it from source, or telnet/SSH to a server, and play it that way. You can actually watch players around the world exploring the dungeons live via the website. Magic. Speaking of magic, the latest release has lots of new spells and spell books, plus a few new maps too.

* [Open RA](https://www.openra.net/) ([Source](https://github.com/OpenRA/OpenRA)): If you ever played Dune 2000, Command and Conquer, or Red Alert then OpenRA is for you. It’s basically those games remade for modern computers with updated gameplay, new campaigns, user-created and curated maps, and online play. (C#)

* [Pioneer](https://pioneerspacesim.net/) ([Source](https://github.com/pioneerspacesim/pioneer)): Pioneer is a space trading and combat simulator video game inspired by Frontier: Elite 2. Players can explore millions of star systems, trade, or turn to a life of crime, piracy, smuggling, and more. (C++)

* [Shattered Pixel Dungeon](https://shatteredpixel.com/) ([Source](https://github.com/00-Evan/shattered-pixel-dungeon)): Shattered Pixel Dungeon, a pixel-perfect roguelike RPG started life as mod for Pixel Dungeon and was only supposed to be a project lasting a few months back in 2014. Thanks to the overwhelmingly positive reaction from the community, it has since evolved into its own game but still shares some code and other assets with its predecessor. This game offers lots of variety, lots of playability (and difficulty!), and will keep you coming back for just more game. (Java)

* [C Dogs SDL](https://cxong.github.io/cdogs-sdl/) ([Source](https://cxong.github.io/cdogs-sdl/)): C-Dogs SDL is a 4-player run and gun game where you …well, run and gun with or against the other players. The release notes are always chock full of pixely goodness. The latest update shipped with AI updates, and weapon sprites to see what your enemies are holding. (C)

* [Zero-K](https://zero-k.info/) ([Source](https://github.com/ZeroK-RTS/Zero-K)): Zero-K  is an RTS game fought over land, air, and sea with hundreds of maps and units at your disposal. Play in single-player campaign mode, multiplayer with friends, or powerful AI. (Lua)

* [Wyrmsun](http://andrettin.github.io/) ([Source](https://github.com/Andrettin/Wyrmsun)): Wyrmsun is a real-time strategy game based on history, mythology, and the lore of other open source games, like Battle for Wesnoth (featured in the first blog post in this series). There’s even an in-game encyclopedia, describing the units, buildings, as well as their historical and mythological sources of inspiration. If you liked Warcraft II, you’ll love this. (Lua)

* [Mindustry](https://anuke.itch.io/mindustry) ([Source](https://github.com/Anuken/Mindustry)): What happens when you cross a tower defense game with a factory game? You get Mindustry—a beautiful hybrid of both created by game developer @Anuken. Create elaborate supply chains of conveyor belts, feed ammo into your turrets, and produce materials to use for building to help stop wave upon wave upon wave upon wave of enemies. (Java)


