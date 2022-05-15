title=adventurelib
tags=gamedev, python, interactive fiction
summary=Basic functionality for writing text-based adventure games, with the aim of making it easy enough for young teenagers to do.
~~~~~~

[Website](https://adventurelib.readthedocs.io/en/stable/#) | [Source](https://github.com/lordmauve/adventurelib)

Install: `python -m pip install adventurelib`

### RealPython basic example
adventurelib_game.py:
```python
"""
Complete game written in adventurelib

This program is designed to demonstrate the capabilities
of adventurelib. It will:
- Create a large world in which to wander
- Contain several inventory items
- Set contexts for moving from one area to another
- Require some puzzle-solving skills
"""

# Import the library contents
# from adventurelib import *
import adventurelib as adv

# Import your rooms, which imports your items and characters
import adventurelib_game_rooms

import adventurelib_game_items

# For your battle sequence
from random import randint

# To allow you to exit the game
import sys

# Set the first room
current_room = adventurelib_game_rooms.home
current_room.visited = False

# How many HP do you have?
hit_points = 20

# How many HP does the giant have?
giant_hit_points = 50

# Your current inventory
inventory = adv.Bag()

# Some basic item commands
@adv.when("inventory")
@adv.when("inv")
@adv.when("i")
def list_inventory():
    if inventory:
        print("You have the following items:")
        for item in inventory:
            print(f"  - {item.description}")
    else:
        print("You have nothing in your inventory.")

@adv.when("look at ITEM")
def look_at(item: str):
    """Prints a short description of an item if it is either:
    1. in the current room, or
    2. in our inventory

    Arguments:
        item {str} -- the item to look at
    """

    global inventory, current_room

    # Check if the item is in the room
    obj = current_room.items.find(item)
    if not obj:
        # Check if the item is in your inventory
        obj = inventory.find(item)
        if not obj:
            print(f"I can't find {item} anywhere.")
        else:
            print(f"You have {item}.")
    else:
        print(f"You see {item}.")

@adv.when("describe ITEM")
def describe(item: str):
    """Prints a description of an item if it is either:
    1. in the current room, or
    2. in your inventory

    Arguments:
        item {str} -- the item to look at
    """

    global inventory, current_room

    # Check if the item is in the room
    obj = current_room.items.find(item)
    if not obj:
        # Check if the item is in your inventory
        obj = inventory.find(item)
        if not obj:
            print(f"I can't find {item} anywhere.")
        else:
            print(f"You have {obj.description}.")
    else:
        print(f"You see {obj.description}.")

@adv.when("take ITEM")
@adv.when("get ITEM")
@adv.when("pickup ITEM")
@adv.when("pick up ITEM")
@adv.when("grab ITEM")
def take_item(item: str):
    global current_room

    obj = current_room.items.take(item)
    if not obj:
        print(f"I don't see {item} here.")
    else:
        print(f"You now have {obj.description}.")
        inventory.add(obj)

@adv.when("eat ITEM")
def eat(item: str):
    global inventory

    # Make sure you have the thing first
    obj = inventory.find(item)

    # Do you have this thing?
    if not obj:
        print(f"You don't have {item}.")

    # Is it edible?
    elif obj.edible:
        print(f"You savor every bite of {obj.description}.")
        inventory.take(item)

    else:
        print(f"How do you propose we eat {obj.description}?")

@adv.when("wear ITEM")
@adv.when("put on ITEM")
def wear(item: str):
    global inventory

    # Make sure you have the thing first
    obj = inventory.find(item)

    # Do you have this thing?
    if not obj:
        print(f"You don't have {item}.")

    # Is it wearable?
    elif obj.wearable:
        print(f"The {obj.description} makes a wonderful fashion statement!")

    else:
        print(
            f"""This is no time for avant garde fashion choices!
            Wear a {obj.description}? Really?"""
        )

# Some character-specific commands
@adv.when("talk to CHARACTER")
def talk_to(character: str):
    global current_room

    char = current_room.characters.find(character)

    # Is the character there?
    if not char:
        print(f"Sorry, I can't find {character}.")

    # It's a character who is there
    else:
        # Set the context, and start the encounter
        adv.set_context(char.context)
        adv.say(char.greeting)

@adv.when("yes", context="elder")
def yes_elder():
    global current_room

    adv.say(
        """
    It is not often one of our number leaves, and rarer still if they leave
    to defend our Home. Go with our blessing, and our hope for a successful
    journey and speedy return. To help, we bestow three gifts.

    The first is one of knowledge. There is a blacksmith in one of the
    neighboring villages. You may find help there.

    Second, seek a wizard who lives as a hermit, who may be persuaded to
    give aid. Be wary, though! The wizard does not give away his aid for
    free. As he tests you, remember always where you started your journey.

    Lastly, we don't know what dangers you may face. We are peaceful people,
    but do not wish you to go into the world undefended. Take this meager
    offering, and use it well!
    """
    )
    inventory.add(adventurelib_game_items.wooden_sword)
    current_room.locked_exits["south"] = False

@adv.when("thank you", context="elder")
@adv.when("thanks", context="elder")
def thank_elder():
    adv.say("It is we who should thank you. Go with our love and hopes!")

@adv.when("yes", context="blacksmith")
def yes_blacksmith():
    global current_room

    adv.say(
        """
        I can see you've not a lot of money. Usually, everything here
        if pretty expensive, but I just might have something...

        There's this steel sword here, if you want it. Don't worry --- it
        doesn't cost anything! It was dropped off for repair a few weeks
        ago, but the person never came back for it. It's clean, sharp,
        well-oiled, and will do a lot more damage than that
        fancy sword-shaped club you've got. I need it gone to clear some room.

        If you want, we could trade even up --- the wooden sword for the
        steel one. I can use yours for fire-starter. Deal?
        """
    )
    adv.set_context("blacksmith.trade")

@adv.when("yes", context="blacksmith.trade")
def trade_swords_yes():
    print("Great!")
    inventory.take("wooden sword")
    inventory.add(adventurelib_game_items.steel_sword)

@adv.when("no", context="blacksmith.trade")
def trade_swords_no():
    print("Well, that's all I have within your budget. Good luck!")
    adv.set_context(None)

@adv.when("yes", context="wizard")
def yes_wizard():
    global current_room

    adv.say(
        """
    I can make your weapon more powerful than it is, but only if
    you can answer my riddle:

    What has one head...
        One foot...
            But four legs?
    """
    )

    adv.set_context("wizard.riddle")

@adv.when("bed", context="wizard.riddle")
@adv.when("a bed", context="wizard.riddle")
def answer_riddle():
    adv.say("You are smarter than you believe yourself to be! Behold!")

    obj = inventory.find("sword")
    obj.bonus = 2
    obj.description += ", which glows with eldritch light"

    adv.set_context(None)
    current_room.locked_exits["west"] = False

@adv.when("fight CHARACTER", context="giant")
def fight_giant(character: str):

    global giant_hit_points, hit_points

    sword = inventory.find("sword")

    # The player gets a swing
    player_attack = randint(1, sword.damage + 1) + sword.bonus
    print(f"You swing your {sword}, doing {player_attack} damage!")
    giant_hit_points -= player_attack

    # Is the giant dead?
    if giant_hit_points <= 0:
        end_game(victory=True)

    print_giant_condition()
    print()

    # Then the giant tries
    giant_attack = randint(0, 5)
    if giant_attack == 0:
        print("The giant's arm whistles harmlessly over your head!")
    else:
        print(
            f"""
            The giant swings his mighty fist,
            and does {giant_attack} damage!
            """
        )
        hit_points -= giant_attack

    # Is the player dead?
    if hit_points <= 0:
        end_game(victory=False)

    print_player_condition()
    print()

def print_giant_condition():

    if giant_hit_points < 10:
        print("The giant staggers, his eyes unfocused.")
    elif giant_hit_points < 20:
        print("The giant's steps become more unsteady.")
    elif giant_hit_points < 30:
        print("The giant sweats and wipes the blood from his brow.")
    elif giant_hit_points < 40:
        print("The giant snorts and grits his teeth against the pain.")
    else:
        print("The giant smiles and readies himself for the attack.")

def print_player_condition():

    if hit_points < 4:
        print("Your eyes lose focus on the giant as you sway unsteadily.")
    elif hit_points < 8:
        print(
            """
            Your footing becomes less steady
            as you swing your sword sloppily.
            """
        )
    elif hit_points < 12:
        print(
            """
            Blood mixes with sweat on your face
            as you wipe it from your eyes.
            """
        )
    elif hit_points < 16:
        print("You bite down as the pain begins to make itself felt.")
    else:
        print("You charge into the fray valiantly!")

def end_game(victory: bool):
    if victory:
        adv.say(
            """
        The giant falls to his knees as the last of his strength flees
        his body. He takes one final swing at you, which you dodge easily.
        His momentum carries him forward, and he lands face down in the dirt.
        His final breath escapes his lips as he succumbs to your attack.

        You are victorious! Your name will be sung for generations!
        """
        )

    else:
        adv.say(
            """
        The giant's mighty fist connects with your head, and the last
        sound you hear are the bones in your neck crunching. You spin
        and tumble down, your sword clattering to the floor
        as the giant laughs.
        Your eyes see the giant step towards you, his mighty foot
        raised to crash down on you.
        Oblivion takes over before you experience anything else...

        You have been defeated! The giant is free to ravage your town!
        """
        )

    sys.exit()

@adv.when("flee", context="giant")
def flee():
    adv.say(
        """
    As you turn to run, the giant reaches out and catches your tunic.
    He lifts you off the ground, grabbing your dangling sword-arm
    as he does so. A quick twist, and your sword tumbles to the ground.
    Still holding you, he reaches his hand to your throat and squeezes,
    cutting off your air supply.

    The last sight you see before blackness takes you are
    the rotten teeth of the evil grin as the giant laughs
    at your puny attempt to stop him...

    You have been defeated! The giant is free to ravage your town!
    """
    )

    sys.exit()

@adv.when("goodbye")
@adv.when("bye")
@adv.when("adios")
@adv.when("later")
def goodbye():

    # Are you fighting the giant?
    if adv.get_context() == "giant":
        # Not so fast!
        print("The giant steps in front of you, blocking your exit!")

    else:
        # Close the current context
        adv.set_context(None)
        print("Fare thee well, traveler!")

# Define some basic commands
@adv.when("look")
def look():
    """Print the description of the current room.
    If you've already visited it, print a short description.
    """
    global current_room

    if not current_room.visited:
        adv.say(current_room)
        current_room.visited = True
    else:
        print(current_room.short_desc)

    # Are there any items here?
    for item in current_room.items:
        print(f"There is {item.description} here.")

@adv.when("describe")
def describe_room():
    """Print the full description of the room."""
    adv.say(current_room)

    # Are there any items here?
    for item in current_room.items:
        print(f"There is {item.description} here.")

# Define your movement commands
@adv.when("go DIRECTION")
@adv.when("north", direction="north")
@adv.when("south", direction="south")
@adv.when("east", direction="east")
@adv.when("west", direction="west")
@adv.when("n", direction="north")
@adv.when("s", direction="south")
@adv.when("e", direction="east")
@adv.when("w", direction="west")
def go(direction: str):
    """Processes your moving direction

    Arguments:
        direction {str} -- which direction does the player want to move
    """

    # What is your current room?
    global current_room

    # Is there an exit in that direction?
    next_room = current_room.exit(direction)
    if next_room:
        # Is the door locked?
        if (
            direction in current_room.locked_exits
            and current_room.locked_exits[direction]
        ):
            print(f"You can't go {direction} --- the door is locked.")
        else:
            # Clear the context if necessary
            current_context = adv.get_context()
            if current_context == "giant":
                adv.say(
                    """Your way is currently blocked.
                    Or have you forgotten the giant you are fighting?"""
                )
            else:
                if current_context:
                    print("Fare thee well, traveler!")
                    adv.set_context(None)

                current_room = next_room
                print(f"You go {direction}.")
                look()

    # No exit that way
    else:
        print(f"You can't go {direction}.")

# Define a prompt
def prompt():
    global current_room

    # Get possible exits
    exits_string = get_exits(current_room)

    # Are you in battle?
    if adv.get_context() == "giant":
        prompt_string = f"HP: {hit_points} > "
    else:
        prompt_string = f"({current_room.title}) > "

    return f"""({exits_string}) {prompt_string}"""

def no_command_matches(command: str):
    if adv.get_context() == "wizard.riddle":
        adv.say("That is not the correct answer. Begone!")
        adv.set_context(None)
        current_room.locked_exits["west"] = False
    else:
        print(f"What do you mean by '{command}'?")

def get_exits(room):
    exits = room.exits()

    exits_string = ""
    for exit in exits:
        exits_string += f"{exit[0].upper()}|"

    return exits_string[:-1]

# Start the game
if __name__ == "__main__":
    # No context is normal
    adv.set_context(None)

    # Set the prompt
    adv.prompt = prompt

    # What happens with unknown commands
    adv.no_command_matches = no_command_matches

    # Look at your starting room
    look()

    # Start the game
    adv.start()
```

adventurelib_game_rooms.py:
```python
"""
Rooms for the adventurelib game
"""

# Import the library contents
import adventurelib as adv

# Import your items as well
import adventurelib_game_items

# And your characters
import adventurelib_game_characters

# Create a subclass of Rooms to track some custom properties
class GameArea(adv.Room):
    def __init__(self, description: str):

        super().__init__(description)

        # All areas can have locked exits
        self.locked_exits = {
            "north": False,
            "south": False,
            "east": False,
            "west": False,
        }
        # All areas can have items in them
        self.items = adv.Bag()

        # All areas can have characters in them
        self.characters = adv.Bag()

        # All areas may have been visited already
        # If so, you can print a shorter description
        self.visited = False

        # Which means each area needs a shorter description
        self.short_desc = ""

        # Each area also has a very short title for the prompt
        self.title = ""

# Your home
home = GameArea(
    """
You wake as the sun streams in through the single
window into your small room. You lie on your feather bed which
hugs the north wall, while the remains of last night's
fire smolders in the center of the room.

Remembering last night's discussion with the council, you
throw back your blanket and rise from your comfortable
bed. Cold water awaits you as you splash away the night's
sleep, grab an apple to eat, and prepare for the day.
"""
)
home.title = "Home"
home.short_desc = "This is your home."

# Hamlet
hamlet = GameArea(
    """
From the center of your small hamlet, you can see every other
home. It doesn't really even have an official name --- folks
around here just call it Home.

The council awaits you as you approach. Elder Barron beckons you
as you exit your home.
"""
)
hamlet.title = "Hamlet"
hamlet.short_desc = "You are in the hamlet."

# Fork in road
fork = GameArea(
    """
As you leave your hamlet, you think about how unprepared you
really are. Your lack of experience and pitiful equipment
are certainly no match for whatever has been stealing
the villages livestock.

As you travel, you come across a fork in the path. The path of
the livestock thief continues east. However, you know
the village of Dunhaven lies to the west, where you may
get some additional help.
"""
)
fork.title = "Fork in road"
fork.short_desc = "You are at a fork in the road."

# Village of Dunhaven
village = GameArea(
    """
A short trek up the well-worn path brings you the village
of Dunhaven. Larger than your humble Home, Dunhaven sits at
the end of a supply route from the capitol. As such, it has
amenities and capabilities not found in the smaller farming
communities.

As you approach, you hear the clang-clang of hammer on anvil,
and inhale the unmistakable smell of the coal-fed fire of a
blacksmith shop to your south.
"""
)
village.title = "Village of Dunhaven"
village.short_desc = "You are in the village of Dunhaven."

# Blacksmith shop
blacksmith_shop = GameArea(
    """
As you approach the blacksmith, the sounds of the hammer become
clearer and clearer. Passing the front door, you head towards
the sound of the blacksmith, and find her busy at the furnace.
"""
)
blacksmith_shop.title = "Blacksmith Shop"
blacksmith_shop.short_desc = "You are in the blacksmith shop."

# Side path away from fork
side_path = GameArea(
    """
The path leads away from the fork to Dunhaven. Fresh tracks of
something big, dragging something behind it, lead away to the south.
"""
)
side_path.title = "Side path"
side_path.short_desc = "You are standing on a side path."

# Wizard's Hut
wizard_hut = GameArea(
    """
The path opens into a shaded glen. A small stream wanders down the
hills to the east and past an unassuming hut. In front of the hut,
the local wizard Trent sits smoking a long clay pipe.
"""
)
wizard_hut.title = "Wizard's Hut"
wizard_hut.short_desc = "You are at the wizard's hut."

# Cave mouth
cave_mouth = GameArea(
    """
The path from Trent's hut follows the stream for a while before
turning south away from the water. The trees begin closing overhead,
blocking the sun and lending a chill to the air as you continue.

The path finally terminates at the opening of a large cave. The
tracks you have been following mix and mingle with others, both
coming and going, but all the same. Whatever has been stealing
your neighbor's livestock lives here, and comes and goes frequently.
"""
)
cave_mouth.title = "Cave Mouth"
cave_mouth.short_desc = "You are at the mouth of large cave."

# Cave of the Giant
giant_cave = GameArea(
    """
You take a few tentative steps into the cave. It feels much warmer
and more humid than the cold sunless forest air outside. A steady
drip of water from the rocks is the only sound for a while.

You begin to make out a faint light ahead. You hug the wall and
press on, as the light becomes brighter. You finally enter a
chamber at least 20 meters across, with a fire blazing in the center.
Cages line one wall, some empty, but others containing cows and
sheep stolen from you neighbors. Opposite them are piles of the bones
of the creatures unlucky enough to have already been devoured.

As you look around, you become aware of another presence in the room.
"""
)
giant_cave.title = "Cave of the Giant"
giant_cave.short_desc = "You are in the giant's cave."

# Set up the paths between areas
home.south = hamlet
hamlet.south = fork
fork.west = village
fork.east = side_path
village.south = blacksmith_shop
side_path.south = wizard_hut
wizard_hut.west = cave_mouth
cave_mouth.south = giant_cave

# Lock some exits, since you can't leave until something else happens
hamlet.locked_exits["south"] = True
wizard_hut.locked_exits["west"] = True

# Place items in different areas
# These are just for flavor
home.items.add(adventurelib_game_items.apple)
fork.items.add(adventurelib_game_items.cloak)
cave_mouth.items.add(adventurelib_game_items.slug)

# Place characters where they should be
hamlet.characters.add(adventurelib_game_characters.elder_barron)
blacksmith_shop.characters.add(adventurelib_game_characters.blacksmith)
wizard_hut.characters.add(adventurelib_game_characters.wizard_trent)
giant_cave.characters.add(adventurelib_game_characters.giant)
```

adventurelib_game_items.py:
```python
"""
Items for the adventurelib Game
"""

# Import the adventurelib library
import adventurelib as adv

# All items have some basic properties
adv.Item.color = "undistinguished"
adv.Item.description = "a generic thing"
adv.Item.edible = False
adv.Item.wearable = False

# Create your "flavor" items
apple = adv.Item("small red apple", "apple")
apple.color = "red"
apple.description = "a small ripe red apple"
apple.edible = True
apple.wearable = False

cloak = adv.Item("wool cloak", "cloak")
cloak.color = "grey tweed"
cloak.description = (
    "a grey tweed cloak, heavy enough to keep the wind and rain at bay"
)
cloak.edible = False
cloak.wearable = True

slug = adv.Item("slimy brown slug", "slug")
slug.color = "slimy brown"
slug.description = "a fat, slimy, brown slug"
slug.edible = True
slug.wearable = False

# Create the real items you need
wooden_sword = adv.Item("wooden sword", "sword")
wooden_sword.color = "brown"
wooden_sword.description = (
    "a small wooden practice sword, not even sharp enough to cut milk"
)
wooden_sword.edible = False
wooden_sword.wearable = False
wooden_sword.damage = 4
wooden_sword.bonus = 0

steel_sword = adv.Item("steel sword", "sword")
steel_sword.color = "steely grey"
steel_sword.description = (
    "a finely made steel sword, honed to a razor edge, ready for blood"
)
steel_sword.edible = False
steel_sword.wearable = False
steel_sword.damage = 10
steel_sword.bonus = 0
```

adventurelib_game_characters.py:
```python
"""
Characters for the adventurelib Game
"""

# Import the adventurelib library
import adventurelib as adv

# All characters have some properties
adv.Item.greeting = ""
adv.Item.context = ""

# Your characters
elder_barron = adv.Item("Elder Barron", "elder", "barron")
elder_barron.description = """Elder Barron, a tall distinguished member
of the community. His steely grey hair and stiff beard inspire confidence."""
elder_barron.greeting = (
    "I have some information for you. Would you like to hear it?"
)
elder_barron.context = "elder"

blacksmith = adv.Item("Alanna Smith", "Alanna", "blacksmith", "smith")
blacksmith.description = """Alanna the blacksmith stands just 1.5m tall,
and her strength lies in her arms and heart"""
blacksmith.greeting = (
    "Oh, hi! I've got some stuff for sale. Do you want to see it?"
)
blacksmith.context = "blacksmith"

wizard_trent = adv.Item("Trent the Wizard", "Trent", "wizard")
wizard_trent.description = """Trent's wizardly studies have apparently
aged him past his years, but they have also preserved his life longer than
expected."""
wizard_trent.greeting = (
    "It's been a long time since I've had a visitor? Do you seek wisdom?"
)
wizard_trent.context = "wizard"

giant = adv.Item("hungry giant", "giant")
giant.description = """Almost four meters of hulking brutish strength
stands before you, his breath rank with rotten meat, his mangy hair
tangled and matted"""
giant.greeting = "Argh! Who dares invade my home? Prepare to defend yourself!"
giant.context = "giant"
```

Run: `python adventurelib/adventurelib_game.py`