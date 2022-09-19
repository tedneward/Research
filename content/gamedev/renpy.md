title=Ren'Py
tags=gamedev, python
summary=A visual novel engine that helps you use words, images, and sounds to tell interactive stories that run on computers and mobile devices. These can be both visual novels and life simulation games.
~~~~~~

[Website](https://www.renpy.org/) | [Source](http://www.github.com/renpy/renpy)

### Examples
[Simple game "The Question"](https://github.com/renpy/renpy/tree/master/the_question):
```
define s = Character(_("Sylvie"), color="#c8ffc8")
define m = Character(_("Me"), color="#c8c8ff")

# This is a variable that is True if you've compared a VN to a book, and False
# otherwise.
default book = False


# The game starts here.
label start:

    # Start by playing some music.
    play music "illurock.opus"

    scene bg lecturehall
    with fade

    "It's only when I hear the sounds of shuffling feet and supplies being put away that I realize that the lecture's over."

    "Professor Eileen's lectures are usually interesting, but today I just couldn't concentrate on it."

    "I've had a lot of other thoughts on my mind...thoughts that culminate in a question."

    "It's a question that I've been meaning to ask a certain someone."

    scene bg uni
    with fade

    "When we come out of the university, I spot her right away."

    show sylvie green normal
    with dissolve

    "I've known Sylvie since we were kids. She's got a big heart and she's always been a good friend to me."

    "But recently... I've felt that I want something more."

    "More than just talking, more than just walking home together when our classes end."

    menu:

        "As soon as she catches my eye, I decide..."

        "To ask her right away.":

            jump rightaway

        "To ask her later.":

            jump later


label rightaway:

    show sylvie green smile

    s "Hi there! How was class?"

    m "Good..."

    "I can't bring myself to admit that it all went in one ear and out the other."

    m "Are you going home now? Wanna walk back with me?"

    s "Sure!"

    scene bg meadow
    with fade

    "After a short while, we reach the meadows just outside the neighborhood where we both live."

    "It's a scenic view I've grown used to. Autumn is especially beautiful here."

    "When we were children, we played in these meadows a lot, so they're full of memories."

    m "Hey... Umm..."

    show sylvie green smile
    with dissolve

    "She turns to me and smiles. She looks so welcoming that I feel my nervousness melt away."

    "I'll ask her...!"

    m "Ummm... Will you..."

    m "Will you be my artist for a visual novel?"

    show sylvie green surprised

    "Silence."

    "She looks so shocked that I begin to fear the worst. But then..."

    show sylvie green smile

    menu:

        s "Sure, but what's a \"visual novel?\""

        "It's a videogame.":
            jump game

        "It's an interactive book.":
            jump book


label game:

    m "It's a kind of videogame you can play on your computer or a console."

    m "Visual novels tell a story with pictures and music."

    m "Sometimes, you also get to make choices that affect the outcome of the story."

    s "So it's like those choose-your-adventure books?"

    m "Exactly! I've got lots of different ideas that I think would work."

    m "And I thought maybe you could help me...since I know how you like to draw."

    m "It'd be hard for me to make a visual novel alone."

    show sylvie green normal

    s "Well, sure! I can try. I just hope I don't disappoint you."

    m "You know you could never disappoint me, Sylvie."

    jump marry


label book:

    $ book = True

    m "It's like an interactive book that you can read on a computer or a console."

    show sylvie green surprised

    s "Interactive?"

    m "You can make choices that lead to different events and endings in the story."

    s "So where does the \"visual\" part come in?"

    m "Visual novels have pictures and even music, sound effects, and sometimes voice acting to go along with the text."

    show sylvie green smile

    s "I see! That certainly sounds like fun. I actually used to make webcomics way back when, so I've got lots of story ideas."

    m "That's great! So...would you be interested in working with me as an artist?"

    s "I'd love to!"

    jump marry

label marry:

    scene black
    with dissolve

    "And so, we become a visual novel creating duo."

    scene bg club
    with dissolve

    "Over the years, we make lots of games and have a lot of fun making them."

    if book:

        "Our first game is based on one of Sylvie's ideas, but afterwards I get to come up with stories of my own, too."

    "We take turns coming up with stories and characters and support each other to make some great games!"

    "And one day..."

    show sylvie blue normal
    with dissolve

    s "Hey..."

    m "Yes?"

    show sylvie blue giggle

    s "Will you marry me?"

    m "What? Where did this come from?"

    show sylvie blue surprised

    s "Come on, how long have we been dating?"

    m "A while..."

    show sylvie blue smile

    s "These last few years we've been making visual novels together, spending time together, helping each other..."

    s "I've gotten to know you and care about you better than anyone else. And I think the same goes for you, right?"

    m "Sylvie..."

    show sylvie blue giggle

    s "But I know you're the indecisive type. If I held back, who knows when you'd propose?"

    show sylvie blue normal

    s "So will you marry me?"

    m "Of course I will! I've actually been meaning to propose, honest!"

    s "I know, I know."

    m "I guess... I was too worried about timing. I wanted to ask the right question at the right time."

    show sylvie blue giggle

    s "You worry too much. If only this were a visual novel and I could pick an option to give you more courage!"

    scene black
    with dissolve

    "We get married shortly after that."

    "Our visual novel duo lives on even after we're married...and I try my best to be more decisive."

    "Together, we live happily ever after even now."

    "{b}Good Ending{/b}."

    return

label later:

    "I can't get up the nerve to ask right now. With a gulp, I decide to ask her later."

    scene black
    with dissolve

    "But I'm an indecisive person."

    "I couldn't ask her that day and I end up never being able to ask her."

    "I guess I'll never know the answer to my question now..."

    "{b}Bad Ending{/b}."

    return
```

### [RealPython's basic tutorial](https://realpython.com/top-python-game-engines/)
script.rpy
```
#
# Complete game in Ren'Py
# 
# This game demonstrates some of the more advanced features of
# Ren'Py, including:
# - Multiple sprites
# - Handling user input
# - Selecting alternate outcomes
# - Tracking score and inventory
# 

## Declare characters used by this game. The color argument colorizes the
## name of the character.
define player = Character("Me", color="#c8ffff")
define smith = Character("Miranda, village blacksmith", color="#99ff9c")
define wizard = Character("Endeavor, cryptic wizard", color="#f4d3ff")
define giant = Character("Maull, terrifying giant", color="#ff8c8c")

## Images used in the game
# Backgrounds
image starting path = "BG10a_1280.jpg"
image crossroads = "BG19a01_1280.jpg"

# Items
image wooden sword = "SwordWood.png"
image steel sword = "Sword.png"
image enchanted sword = "SwordT2.png"

## Default settings
# What is the current weapon?
default current_weapon = "wooden sword"

# What is the weapon damage?
# These change when the weapon is upgraded or enchanted
default base_damage = 4
default multiplier = 1
default additional = 0

# Did they cross the bridge to town?
default cross_bridge = False

# You need this for the giant battle later

init python:
    from random import randint

# The game starts here.

label start:

    # Show the initial background.

    scene starting path
    with fade

    # Begin narration

    "Growing up in a small hamlet was boring, but reliable and safe. 
    At least, it was until the neighbors began complaining of missing
    livestock. That's when the evening patrols began."

    "While on patrol just before dawn, your group noticed broken fence
    around a cattle paddock. Beyond the broken fence,
    a crude trail had been blazed to a road leading away from town."

    # Show the current weapon
    show expression current_weapon at left
    with moveinleft

    "After reporting back to the town council, it was decided that you
    should follow the tracks to discover the fate of the livestock.
    You picked up your only weapon, a simple wooden practice sword,
    and set off."

    scene crossroads
    with fade

    show expression current_weapon at left

    "Following the path, you come to a bridge across the river."

    "Crossing the bridge will take you to the county seat,
    where you may hear some news or get supplies.
    The tracks, however, continue straight on the path."

    menu optional_name:
        "Which direction will you travel?"

        "Cross the bridge":
            $ cross_bridge = True
            jump town
        "Continue on the path":
            jump path

    "Your quest is ended!"

    return
```

town.rpy
```
##
## Code for the interactions in town
##

## Backgrounds
image distant town = "4_road_a.jpg"
image within town = "3_blacksmith_a.jpg"

# Characters
image blacksmith greeting = "blacksmith1.png"
image blacksmith confused = "blacksmith2.png"
image blacksmith happy = "blacksmith3.png"
image blacksmith shocked = "blacksmith4.png"

label town:

    scene distant town
    with fade

    show expression current_weapon at left

    "Crossing the bridge, you stride away from the river along a
    well worn path. The way is pleasant, and you find yourself humming
    a tune as you break into a small clearing."

    "From here, you can make out the county seat of Fetheron.
    You feel confident you can find help for your quest here."

    scene within town
    with fade

    show expression current_weapon at left

    "As you enter town, you immediately begin seeking the local blacksmith.
    After asking one of the townsfolk, you find the smithy on the far
    south end of town. You approach the smithy,
    smelling the smoke of the furnace long before you hear
    the pounding of hammer on steel."

    player "Hello! Is the smith in?"

    smith "Who wants to know?"

    show blacksmith greeting

    "The blacksmith appears from her bellows.
    She greets you with a warm smile."

    smith "Oh, hello! You're from the next town over, right?"

    menu:
        "Yes, from the other side of the river.":
            show blacksmith happy

            smith "I thought I recognized you. Nice to see you!"

        "Look, I don't have time for pleasantries, can we get to business?":
            show blacksmith shocked

            smith "Hey, just trying to make conversation"

    smith "So, what can I do for you?"

    player "I need a better weapon than this wooden thing."

    show blacksmith confused

    smith "Are you going to be doing something dangerous?"

    player "Have you heard about the missing livestock in town?"

    smith "Of course. Everyone has. What do you know about it?"

    player "Well, I'm tracking whatever took them from our town."

    smith "Oh, I see. So you want something better to fight with!"

    player "Exactly! Can you help?"

    smith "I've got just the thing. Been working on it for a while,
    but didn't know what to do with it. Now I know."

    "Miranda walks back past the furnace to a small rack.
    On it, a gleaming steel sword rests.
    She picks it up and walks back to you."

    smith "Will this do?"

    menu:
        "It's perfect!":
            show blacksmith happy

            smith "Wonderful! Give me the wooden one -
            I can use it in the furnace!"

            $ current_weapon = "steel sword"
            $ base_damage = 6
            $ multiplier = 2

        "Is that piece of junk it?":
            show blacksmith confused

            smith "I worked on this for weeks.
            If you don't want it, then don't take it."

    # Show the current weapon
    show expression current_weapon at left

    smith "Anything else?"

    player "Nope, that's all."

    smith "Alright. Good luck!"

    scene distant town
    with fade

    show expression current_weapon at left

    "You make your way back through town.
    Glancing back at the town, you wonder if
    you can keep them safe too."

    jump path
```

path.rpy
```
##
## Code for the interactions in town
##

## Backgrounds
image path = "1_forest_a.jpg"
image wizard hut = "BG600a_1280.jpg"

# Characters
image wizard greeting = "wizard1.png"
image wizard happy = "wizard2.png"
image wizard confused = "wizard3.png"
image wizard shocked = "wizard4.png"

label path:

    scene path
    with fade

    show expression current_weapon at left

    "You pick up the tracks as you follow the path through the woods."

    jump giant_battle
```

giant.rpy
```
##
## Code for the giant battle
##

## Backgrounds
image forest = "forest_hill_night.jpg"

# Characters
image giant greeting = "giant1.png"
image giant unhappy = "giant2.png"
image giant angry = "giant3.png"
image giant hurt = "giant4.png"

# Text of the giant encounter
label giant_battle:

    scene forest
    with fade

    show expression current_weapon at left

    "As you follow the tracks down the path, night falls.
    You hear sounds in the distance:
    cows, goats, sheep. You've found the livestock!"

    show giant greeting

    "As you approach the clearing and see your villages livestock,
    a giant appears."

    giant "Who are you?"

    player "I've come to get our livestock back."

    giant "You and which army, little ... whatever you are?"

    show giant unhappy

    "The giant bears down on you - the battle is joined!"

python:

    def show_giant_condition(giant_hp):
        if giant_hp < 10:
            renpy.say(None, "The giant staggers, his eyes unfocused.")
        elif giant_hp < 20:
            renpy.say(None, "The giant's steps become more unsteady.")
        elif giant_hp < 30:
            renpy.say(
                None, "The giant sweats and wipes the blood from his brow."
            )
        elif giant_hp < 40:
            renpy.say(
                None,
                "The giant snorts and grits his teeth against the pain.",
            )
        else:
            renpy.say(
                None,
                "The giant smiles and readies himself for the attack.",
            )

    def show_player_condition(player_hp):
        if player_hp < 4:
            renpy.say(
                None,
                "Your eyes lose focus on the giant as you sway unsteadily.",
            )
        elif player_hp < 8:
            renpy.say(
                None,
                "Your footing becomes less steady as you swing your sword sloppily.",
            )
        elif player_hp < 12:
            renpy.say(
                None,
                "Blood mixes with sweat on your face as you wipe it from your eyes.",
            )
        elif player_hp < 16:
            renpy.say(
                None,
                "You bite down as the pain begins to make itself felt.",
            )
        else:
            renpy.say(None, "You charge into the fray valiantly!")

    def fight_giant():

        # Default values
        giant_hp = 50
        player_hp = 20
        giant_damage = 4

        battle_over = False
        player_wins = False

        # Keep swinging until something happens
        while not battle_over:

            renpy.say(
                None,
                "You have {0} hit points. Do you want to fight or flee?".format(
                    player_hp
                ),
                interact=False,
            )
            battle_over = renpy.display_menu(
                [("Fight!", False), ("Flee!", True)]
            )

            if battle_over:
                player_wins = False
                break

            # The player gets a swing
            player_attack = (
                randint(1, base_damage + 1) * multiplier + additional
            )
            renpy.say(
                None,
                "You swing your {0}, doing {1} damage!".format(
                    current_weapon, player_attack
                ),
            )
            giant_hp -= player_attack

            # Is the giant dead?
            if giant_hp <= 0:
                battle_over = True
                player_wins = True
                break

            show_giant_condition(giant_hp)

            # Then the giant tries
            giant_attack = randint(0, giant_damage)
            if giant_attack == 0:
                renpy.say(
                    None,
                    "The giant's arm whistles harmlessly over your head!",
                )
            else:
                renpy.say(
                    None,
                    "The giant swings his mighty fist, and does {0} damage!".format(
                        giant_attack
                    ),
                )
                player_hp -= giant_attack

            # Is the player dead?
            if player_hp <= 0:
                battle_over = True
                player_wins = False

            show_player_condition(player_hp)

        # Return who died
        return player_wins

    # fight_giant returns True if the player wins.
    if fight_giant():
        renpy.jump("player_wins")
    else:
        renpy.jump("giant_wins")

label player_wins:

    "The giant's eyes glaze over as he falls heavily to the ground.
    The earth shakes as his bulk lands face down,
    and his death rattle fills the air."

    hide giant

    "You are victorious! The land is safe from the giant!"

    return

label giant_wins:

    "The giant takes one last swing, knocking you down.
    Your vision clouds, and you see the ground rising to meet you.
    As you slowly lose consciousness, your last vision is
    the smiling figure of the giant as he advances on you."

    "You have lost!"

    return
```


