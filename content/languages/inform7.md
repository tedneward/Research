title=Inform 7
tags=language, gamedev, literate
summary=A programming language for creating interactive fiction, using natural language syntax.
~~~~~~

"Using natural language and drawing on ideas from linguistics and from literate programming, Inform is widely used as a medium for literary writing, as a prototyping tool in the games industry, and in education, both at school and university level (where Inform is often assigned material for courses on digital narrative). It has several times ranked in the top 100 most influential programming languages according to the TIOBE index."

[Source](https://github.com/ganelson/inform) | [Source](https://ganelson.github.io/inform-website/) | [Inform7 Resources](https://intfiction.org/t/inform-7-documentation-and-resources/3311)

## [Learn X in Y minutes Quick Intro](https://learnxinyminutes.com/docs/inform7/)

Inform 7 is a natural language based language created by Graham Nelson and Emily Short for writing text adventures, but also potentially usable for other text based applications, especially data backed ones.

```
"LearnInform" by Hyphz

[This is a comment.]

[Inform 7 is a language designed for building text adventures.
It can be used for other purposes too, although the default 
library builds a text adventure. Inform 7 is object oriented.]

[This creates a class by subclassing. "Value" is the universal subclass,
but "object" is the most basic that behaves like an OO object.]
A datablock is a kind of object. 

[Classes can have properties.]
A datablock can be broken. [This creates a boolean property.]
A datablock is usually not broken. [This sets its default value.]
A datablock can be big or small. [This creates an enumerated property.]
A datablock is usually small. [This sets its default value.]
A datablock has a number called the sequence number. [This creates a typed property.]
A datablock has some text called the name. ["Some text" means a string.]
A datablock has a datablock called the chain. [Declared classes become types.]

[This creates a global named instance.]
Block1 is a datablock.
The sequence number of Block1 is 1.
The name of Block1 is "Block One."

[Functions and procedures are defined as "phrases".]
To do the thing everyone does with their first program:
	say "Hello World.". [Full stop indicates the end, indent indicates the scope.]
	
To dump (the block - a datablock): [That's how we create a parameter.]
	say the sequence number of the block;
	say the name of the block;
	if the block is broken, say "(Broken)".
		
To toggle (the block - a datablock):
	if the block is broken: [Conditional.]
		now the block is not broken; [Updating a property.]
	else:
		now the block is broken.
		
[Multiple parameters.]
To fix (the broken block - a datablock) using (the repair block - a datablock):
	if the broken block is not broken, stop; [Comma for a non indented single command.]
	if the repair block is broken, stop;
	now the sequence number of the broken block is the sequence number of the repair block;
	now the broken block is not broken.

[Because of its text adventure origins, Inform 7 doesn't generally allow objects
to be created dynamically, although there's a language extension that enables it.]	
Block2 is a datablock. 
Block2 is broken.
The sequence number of Block2 is 2.
The name of Block2 is "Block two."

To demonstrate calling a phrase with two parameters:
	Let the second block be block2; [Local pointer variable.]
	fix the second block using Block1;
	say the sequence number of the second block. [1.]
	
[Lists.]	
To show how to use list types:
	let the list be a list of datablocks;
	add Block1 to the list;
	add Block2 to the list;
	say the list; ["Block1 and Block2"]
	[Membership.]
	if Block1 is listed in the list:
		say "Block1 is there.";
	[Loop.]
	repeat with the block running through the list:
		dump the block;  [1 Block One. 1 Block Two.]
		[Remember block two's sequence number was changed above.]
	let X be entry 2 of the list; [Counting starts at 1.]
	dump X; ["1 Block two."]
	remove X from the list;
	say the list. [Block1]
		
[Here's how we define a function and do arithmetic.]

To decide which number is the sum of all numbers up to (X - a number) (this is summing up):
	let the total so far be a number;
	repeat with the current number running from 1 to X:
		now the total so far is the total so far + the current number;
	decide on the total so far. [This is the return statement.]
	
[ We have higher order functions too. ]

To demonstrate a higher order function:
	say summing up applied to {1, 2, 3, 4}.

To decide which number is the result of applying (phrase - phrase A -> A) twice to (B - a value of kind A):
	let b1 be phrase applied to B;
	let b2 be phrase applied to b1;
	decide on b2.
	
To demonstrate defining a higher order function:
	let X be 5;
	say the result of applying summing up twice to X.

[ Rulebooks allow a number of functions which apply to the same type under different conditions to be stacked. ]

Datablock validation rules is a datablock based rulebook.

A datablock validation rule for a broken datablock: rule fails.
A datablock validation rule for a datablock (called the block): 
	dump the block;
	rule succeeds.
		
To demonstrate invoking a rulebook:
	follow datablock validation rules for Block1;
	follow datablock validation rules for Block2.
	
[ Objects can also have relations, which resemble those in a relational database. ]
A dog is a kind of thing.
Rover is a dog.
The kennel is a container. [This is a built in base class.]
Rover is in the kennel. [This creates an inbuilt relation called "containment".]

[We can create relations by declaring their type.]

Guide dog ownership relates one dog to one person. [One-to-one.]
Property ownership relates various things to one person. [Many-to-one.]
Friendship relates various people to various people.  [Many-to-many.]

[To actually use them we must assign verbs or prepositions to them.]

The verb to own means the property ownership relation.
The verb to be the guide dog of means the guide dog ownership relation.
The verb to be guided by means the reversed guide dog ownership relation. 
The verb to be friends with means the friendship relation.

Edward is a person. A person can be blind. Edward is blind.
Edward is guided by Rover.
Benny is a person. Edward is friends with Benny.

To demonstrate looking something up with a relation:
	repeat with the dog running through things that are the guide dog of Edward:
		say the dog;
	repeat with the friend running through things that are friends with Edward:
		say the friend.

[We can also define relations that exist procedurally.]

Helpfulness relates a person (called the helper) to a person (called the helpee) when the helpee is blind and the helper is not blind.
The verb to be helpful to means the helpfulness relation.
To demonstrate using a procedural relation:
	repeat with the helper running through people that are helpful to Edward:
		say the helper.
	

[ Interface to the text adventure harness to allow the above code to be run. ]
Tutorial room is a room. 
"A rather strange room full of buttons. Push them to run the exercises, or turn on the robot to run them all."
A button is a kind of thing. A button is fixed in place. 

The red button is a button in tutorial room. 
Instead of pushing the red button, do the thing everyone does with their first program.
The green button is a button in tutorial room. 
Instead of pushing the green button, demonstrate calling a phrase with two parameters.
The blue button is a button in tutorial room. 
Instead of pushing the blue button, show how to use list types.
The cyan button is a button in tutorial room.
Instead of pushing the cyan button, say the sum of all numbers up to 5.
The purple button is a button in tutorial room.
Instead of pushing the purple button, demonstrate a higher order function.
The black button is a button in tutorial room.
Instead of pushing the black button, demonstrate defining a higher order function.
The white button is a button in tutorial room.
Instead of pushing the white button, demonstrate invoking a rulebook.
The puce button is a button in tutorial room.
Instead of pushing the puce button, demonstrate looking something up with a relation.
The orange button is a button in tutorial room.
Instead of pushing the orange button, demonstrate using a procedural relation.

The robot is an object in tutorial room.
Instead of switching on the robot:
	say "The robot begins to frantically flail its arms about.";
	repeat with button running through buttons in the tutorial room:
		say "The robot randomly hits [the button].";
		try pushing button.
```

[Glass](https://github.com/I7-Examples/Glass/tree/main) - An Inform7 standard example
```
"Glass" by Emily Short

The release number is 3.

The story genre is "Fairy Tale". The story headline is "A fractured fairy tale". The story description is "The Prince sits awkwardly on the couch, holding his glass slipper and trying to keep it from crushing. Lucinda and Theodora have the ends of the same couch, and they are taking turns seeing who can bend lowest and show off the most cleavage; while the old lady, in her wing chair, carries on about nonsense...

Glass is a conversation-oriented fairy tale, taking place in one room. It was written to demonstrate one approach to handling conversation in Inform 7.

Features a variety of additional verbs, non-player characters with an agenda, and narrative with multiple endings." The story creation year is 2006.

Release along with [a solution,] source text, a website, an interpreter, cover art, a file of "Walkthrough" called "Walkthrough.txt", a file of "Making of..." called "Overview.html".

Use the serial comma, and American dialect.

Include Singing Reloaded by Shin. Include Swearing Reloaded by Shin.


Chapter 1 - Mechanics of Speech

[An overview:

In Glass, conversation consists, not of static things to say about specific topics, but of moves from one conversation topic to another.

Any pair of ideas can have some specific dialogue associated with it, so that when we ask about marriage, we get a different answer if we are coming to the subject from the masquerade ball than if we are coming to it from the king's health (for instance). So we will define some conversation topics, called "subjects", and also provide tables of what may be said in moving from one subject to the next.

The player is allowed to try to move from any subject to any other, but non-player characters -- the other people in the room -- will only make conversational connections that "make sense": subjects that suggest related subjects. So we define a suggestion relation to connect one subject to others. 

Non-player characters are also trying to reach specific conversation outcomes, so they will seek the best path from the current subject to their goal subject, and keep the conversation moving in that direction. Only the player's intervention (or a change of goal) will knock this off course.]

Section 1 - Subjects

A subject is a kind of thing. The current subject is a thing that varies. Blank is a subject. The printed name of blank is "whatever comes to mind".

Suggestion relates subjects to each other. The verb to suggest (it suggests, they suggest, it is suggested) implies the suggestion relation.

Section 2 - Something to Talk About

[Here we assemble all the subjects one might discuss:]

The king's health is a subject. Understand "father's" or "father" or "king" or "ailing" or "sickness" or "doctor" or "kingdom" or "spanish doctor" as the king's health. The king's health suggests heirs. Understand "heir" and "succession" and "inheritance" and "prince" as heirs. Heirs suggests the marriage. Marriage suggests the ball. Understand "rumors" and "woman" and "lady" and "bride" and "wife" and "princess" and "face" as marriage. The ball suggests the shoe. Understand "terrace" or "chaperone" or "chaperones" or "impropriety" or "mask" or "masquerade"  as the ball. 

Understand "glass" or "slipper" or "glassy" or "glinting" or "pocket" or "boot" or "boots" or "laces" or "bootlaces" or "ankle" or "heel" or "toe" or "foot" as the shoe. The shoe suggests Cinderella.  Understand "cinders" or "cindy" as Cinderella.

Theo is a subject. Understand "Theodora" as Theo. Lucinda is a subject. Understand "Lucy" as lucinda.  Theo and Lucinda suggest heirs. Understand "children" or "child" or "offspring" or "baby" or "babies" or "siblings" or "family" as heirs. Stepmother is a subject. Understand "lady" or "old lady" or "stepmother" or "mother" or "mom" or "harridan" as the old lady. Stepmother suggests heirs.

Love suggests marriage. Understand "ladies" or "smoochies" or "seduction" or "romance" or "heart" or "hearts" or "cupid" or "kiss" or "romantic" as love. Blood is a subject. Understand "pain" or "cut" or "dripping"  or "drenched" or "sliced" or "slicing" or "knife" as blood. Understand "pillow" as blood when Lucinda Endgame is happening.

Magic is a subject. Understand "enchantment" or "glamour" or "glamor" or "magical" or "crime" or "death" or "witch" or "witchcraft" as magic. Magic suggests the ball. Understand "departure" or "midnight" as magic when Fitting is happening.

 God is a subject. God suggests the marriage. Understand "church" or "christ" or "jesus" or "christian" or "religion" or "faith" or "theology" or "theological" as god. Birds is a subject. Understand "bird" or "parrot" or "me" or "polly" or "alex" as the birds. 

Rule for printing the name of birds while constructing the status line:
	say "you"

Rule for printing the name of birds when mentioning birds:
	say "[nice word] bird"

[Here we establish where the conversation starts and where it is going during the first segment:]

The current subject is health. The last subject is a subject that varies. The last subject is health.

The target subject is a subject that varies. The target subject is shoe.

Section 3 - Non-player Goal-seeking

[And here we provide the non-player characters with the instructions for how to make conversational "moves".]

[At different scenes of the game, we will be using different conversation sets, so we need to account for this as well:]

Conversation set is a table-name that varies. The conversation set is Table of Prologue Remarks.

Definition: a subject is fruitful if it produces conversation.

[This rather bare-looking routine runs through the current conversation table and checks to see whether a given subject would be interested if someone selected it.]

To decide whether (next subject - a subject) produces conversation:
	repeat through conversation set
	begin;
		if the starting entry is current subject or starting entry is blank 
		begin;
			if the final entry is next subject or final entry is blank, yes;
		end if;
	end repeat;
	no. 
	
[And here we look through the conversation set to see if we can find some appropriate conversation for the change of subject that just occurred, and (if so) print the dialogue.]
	
To relate (initial subject - a subject) with (next subject - a subject), directly or pausing first:
	repeat through conversation set
	begin;
		if the starting entry is initial subject or starting entry is blank 
		begin;
			if the final entry is next subject or final entry is blank
			begin;
				if pausing first, say "There is a long thoughtful silence. "; 
				say "[comment entry][paragraph break]";
				blank out the whole row;
				rule succeeds;
			end if;
		end if;
	end repeat. 
	
A person can be active or passive. [* This is just a marker to keep track of whether the old lady (or any of the others) have already spoken during a turn; if so, we don't want them moving the dialogue on their own. One of my discoveries in previous conversation games is that it is usually best to limit non-player characters to one piece of dialogue behavior per turn -- either responding to something the player said OR advancing an idea of their own. If one allows them to do both, the conversation is controlled primarily by the game rather than the player, and many players find this frustrating.]

Every turn when the old lady is active: 
	if Theodora Endgame is happening, rule succeeds;
	if Lucinda Endgame is happening, rule succeeds;
	let pause be "blank";
	let segue be the next step via the suggestion relation from the current subject to the target subject;
	if segue is a subject
	begin;
		while segue is not the target subject and segue is not fruitful
		begin;
			let segue be the next step via the suggestion relation from the segue to the target subject;
			let pause be "There's a long, thoughtful sort of pause. ";
		end while;
		if pause is not "blank", 
			relate the current subject with the segue, pausing first;
		otherwise relate the current subject with the segue, directly;
		now last subject is current subject;
		now current subject is segue;
	otherwise; 
		now the current subject is last subject;
		if Fitting has happened
		begin;
			make no decision;
		end if;
		say "There's an uncomfortable silence as everyone tries to think of a sensible direction for the conversation to take from here.
		
'Mm, we were speaking of [current subject],' says [a random visible person who is not the player].";
	end if.
	
Every turn: now the old lady is active. [* This rule reactivates the old lady each turn, but after the spontaneous speaking rule above has already been tried.]


Chapter 2 - Grammar of Speech Commands

[Now we provide the commands for the player to use to change the subject. This gets a little complicated because we have a lot of existing behavior to override. 

The default behavior of the library allows the player to ASK any person ABOUT a subject; we don't want the player to be able to specify one person to talk to, since that would cause needless complexity. Anything he says should be heard by the whole group. We also are just allowing the player to speak keywords, so we don't want to distinguish between ASK and TELL, another feature of the standard library. 

So we need to replace both ASK SOMEONE ABOUT SOMETHING and TELL SOMEONE ABOUT SOMETHING with one standard action that directs the player's speech to the whole group. We'll call this Mentioning.]

Section 1 - Understanding

Understand the command "ask" as something new. Understand the command "tell" as something new. Understand the command "say" as something new. Understand the command "speak" as something new. Understand the command "shout" as something new. Understand the command "answer" as something new. Understand the command "scream" as something new. 

Understand "mention no" as saying no. Understand "mention yes" as saying yes. Understand "mention sorry" or "apologize" as saying sorry. Understand "refuse" or "disagree" as saying no. Understand "approve" or "agree" as saying yes.

Understand "mention awk/awwk/awwwk/squawk" as squawking.

Understand "ask about [any subject]" as mentioning. Understand "tell about [any subject]" as mentioning. Understand "a [any subject]" as mentioning. Understand "t [any subject]" as mentioning. Understand "answer [any subject]" as mentioning.

[Just for fun, let's make the game understand a wide range of parrot-appropriate squawkings, too:]

Understand "mention [any subject]" as mentioning. Understand the commands "caw" and "croak" and "squawk" and "awk" and "awwk" and "speak" and "say" and "talk" and "shout" and "scream" and "shriek" and "yell" and "screech" as "mention". 

[Now having given the parrot this range of expression, let's make it so that we can print that exact text back later:]
To say exact verb:
	(- print (address) verb_word; -)

[But of course, if the player uses t or a the results will come out a bit strange. Therefore:]
After reading a command: if the player's command includes "t ", replace the matched text with "say "; if the player's command includes "a ", replace the matched text with "say "; if the player's command includes "mention ", replace the matched text with "say "; if the player's command includes "speak ", replace the matched text with "say ".

Instead of asking someone to try mentioning something: try mentioning the noun instead.  

[Here we handle the error case wherein someone does try to speak to a specific individual:]  

Understand "ask [someone] about [text]" as directed speech (with nouns reversed). Understand "tell [someone] about [text]" as directed speech (with nouns reversed). Understand "answer [text] to [someone]" as directed speech.

Instead of answering someone that something: say "You can only squawk things for everyone to hear."
	
[And finally, to cover the case where the player types something like SQUAWK "KING":]

Include Punctuation Removal by Emily Short.

After reading a command: 
	remove stray punctuation; [* A phrase provided by the foregoing extension, which removes all quotation marks, exclamation points, and question marks from input before attempting to parse]
	if the player's command includes "&", replace the matched text with "and".
	 

Section 2 - Correcting Less-useful Input

Directed speech is an action applying to one topic and one thing.

Carry out directed speech: say "You can only squawk things for everyone to hear."

Understand "squawk" as squawking. Squawking is an action applying to nothing. Carry out squawking: do nothing. Report squawking: say "'[awwk]!' you squawk."

[And now a refinement. Suppose the player tries to mention something that isn't on our short list of topics? We don't want "you can't see any such thing" or even "that noun makes no sense..." as a result. So we make a catch-all response for this situation:]
 
Understand "mention [text]" or "ask about [text]" or "tell about [text]" or "a [text]" or "t [text]" as jungle crying.

Jungle crying is an action applying to one topic.

Instead of jungle crying a topic listed in the Table of Reactions: 
	if there is a reaction rule entry
	begin;
		say "[response entry]";
		abide by reaction rule entry;
	otherwise;
		say "[response entry][paragraph break]";
	end if.
		
Carry out jungle crying:
	do nothing.

Report jungle crying:
	say "You stumble over that unfamiliar term and it just comes out a birdlike cry."

Table of Awwkwardness
response
"Awwk"
"Awk"
"Awwwk"
"Squawk"
"Squaw-awk"

To say awwk:
	choose a random row in the table of Awwkwardness;
	say "[response entry]".

Asking it about the subject is an action applying to one thing and one visible thing.

Carry out asking it about the subject: 
	try mentioning the second noun.

Section 3 - Handling Legitimate Remarks

[And now at last we define the "mentioning" action.]
	
Mentioning is an action applying to one visible thing.

Carry out mentioning:
	say "'[awwk]!' you [exact verb]. '[The noun][if a random chance of 1 in 3 succeeds]! [The noun][end if]!'"; 
	
[The default behavior is to print the parrot's speech (in carry out, because this is one of those rare circumstances where the action involves generating some text -- just as examining prints the description in carry out). Then the non-player characters respond by trying to fit this outcry into the flow of their conversation. We make them silent at that point ("now the old lady is passive") so that their regular flow of every-turn conversation will be interrupted to deal with your intrusion.]

Report mentioning:
	now the old lady is passive;
	relate the current subject with the noun, directly;
		now last subject is current subject;
	now the current subject is the noun.
	
[We can also override this behavior by giving constant responses to specific remarks:]

Instead of mentioning blank: try squawking.

Instead of mentioning God for the first time:
	say "'God!' you exclaim. All eyes turn slowly towards you.
	
'Heavens,' says the Prince mildly. 'A pet with theological leanings. How unusual. You're most fortunate in your domesticated animals, madam.'

The old lady gives you a long, narrow-eyed look. Apparently she does not share the Prince's feelings on that topic."	

Instead of mentioning God for the third time:
	say "'God!' you [exact verb] again. 'Christ? Buddha? Zeus?'
	
'Show-off,' Theodora mutters under her breath.

'That will be enough from you,' says the old lady, looking at you with eyes almost as beady as your own."
	
Carry out mentioning heirs when the current subject is king's health:
	say "'NEED BABIES,' you [exact verb]. 'Heirs to the kingdom, heirs to the kingdom!'" instead.

After mentioning the King's Health for the first time:
	say "The Prince glances your way and offers you a small, smiling salute."

After mentioning heirs for the first time:
	say "Blood rushes up into the Prince's cheeks. He doesn't look your way."

[And what happens if the player squawks something that the characters are already discussing?]

Report mentioning the current subject:
	repeat through Table of Bad Bird Excuses
	begin;
		say "[response entry][paragraph break]";
		blank out the whole row;
		now the player is disgraced;
		rule succeeds;
	end repeat.

	
Table of Bad Bird Excuses
response
"'Don't mind our parrot,' says the lady, smiling at the Prince. 'It has very bad manners.' 

The Prince glances at you. 'I imagine any manners at all would be above average for a bird.'

Lucinda smirks."
"'It just repeats things it hears,' says Lucinda."
"'Ssh,' says Lucinda to you."
"'Honestly,' says Lucy. 

'It was raised by sailors,' the old lady says.

'Pirates,' Theodora embellishes. She likes pirates.

The old lady kicks her ankle."
	

Section 4 - Conversation Not Deserving Its Own Subject
[Here we provide a small range of responses to things the player might say that do not deserve subjects of their own (they're not part of the conversation of the non-player characters and will not contribute to conversational flow) but which are still notable enough that the characters ought to have some reaction. These include outbursts of obscenity or other parrot catch-phrases that the player might try.]
	
Table of Reactions
topic	response	reaction rule
"[obscenity]"	""	obscenity reaction rule  
"[mild obscenity]"	""	mild reaction rule 
"cracker/polly" or "polly wanna cracker"	"'Polly wanna cracker!' you announce. But they've grown tired of that one."
"um seven" or "seven"	"'Um, seven?' you inquire brightly. Everyone pretends you didn't speak."
"silence"	"'Silence!' you squawk. 

'Not with you around,' snaps Lucinda."
"wisdom/thought/thinking"	"'Wisdom,' you intone. 

No one seems to think you know much about that."	
"kindness"	"'[awwk]! Kindness!' 

Sadly this produces no almonds for you. "
"corknut/corknuts/almond/almonds/cork nut" or "candied almond"	"'Almond!' you hint. No one takes you up on it."
"pirate/pirates/piracy" or "pieces of eight"	"You squawk a short piratical ditty, not quite fit for polite company... 

'Cut that out,' says Lucinda."	obscenity reaction rule
"cheese"	"Everyone turns to look at you. 

'I didn't know birds ate dairy products,' says the Prince.

The old lady shrugs."
"fire/help/earthquake/flood/famine" or "stock market crash"	"The prince looks puzzled. 

'It likes to make itself seem important by pretending there's a disaster,' Lucinda explains. 

'Stock market crash?' you squawk. 

Theo giggles."
"cleavage"	"'[Nice word] cleavage!' you squawk. '[Nice word]!' 

Both Lucinda and Theodora snap upright as though someone had poked a ruler into their lower backs. " 
"prying/pry"	"'Prying!' you awwk. 'Inquire impertinently, be curious, ferret out, nose around!' 

The old lady's mouth quirks at the corner, but she represses it.

'Snoop! Listen in!' you add. But the Prince looks too daft to pick up your hint."

This is the obscenity reaction rule: try swearing obscenely instead. This is the mild reaction rule: try swearing mildly instead.

Section 5 - Speech Acts
[Yes, no, swearing, and saying sorry are accounted for in the basic library, and we should re-map these as well:]

Instead of asking someone to try swearing mildly: try swearing mildly.

Instead of swearing mildly:
	say "[A random visible woman] giggles faintly."

Understand "shit" or "fuck" or "damn" or "sod" as "[obscenity]". [* We have more or less preserved Inform's default understanding of obscenity, though testers tried a range of other interesting words.]

Understand "swear" or "curse" or "mention obscenities" as swearing obscenely.

Understand "bother" or "curses" or "drat" or "darn" as "[mild obscenity]".	
Instead of swearing obscenely for the first time:
	now the player is disgraced;
	say "You squawk very loudly.
	
'If that happens again,' says the old woman to you, 'we will sell you to the first man with an earring we can find.'

Lucinda's cheeks go pink."

Swearing obscenely is speech. Swearing mildly is speech. Saying yes is speech. Saying no is speech. Saying sorry is speech.

Instead of asking someone to try doing something:
	if asking someone to try speech, continue the action;
	say "No one in this house obeys you at all."

Instead of asking someone to try swearing obscenely: try swearing obscenely.
	
Instead of swearing obscenely:
	say "'Right,' says the old lady. And she rings for a servant to remove you from the room.";
	end the story saying "You are sold to pirates and have a glorious career on the open sea".

A person can be disgraced or approved. A person is usually approved.

Bird trouble is a scene. Bird trouble begins when the player is disgraced. Bird trouble ends when time since bird trouble began is 2 minutes. When Bird trouble ends: now the player is approved.

Instead of asking someone to try saying sorry: try saying sorry.

Instead of answering someone that "sorry", try saying sorry.

Instead of saying sorry:
	say "'Oops!' you squawk. 'Sorry! Oops, sorry!'
	
[if player is disgraced]'Just mind your beak from now on, that's all,' says the old lady sternly. 'And stop interrupting.'

Everyone turns back to the human conversation.[otherwise]They all ignore you.[end if]"

Instead of asking someone to try saying yes: try saying yes. Instead of answering someone that "yes", try saying yes.

Instead of saying yes:
	say "'[awwk]! Yes!'"

Instead of asking someone to try saying yes: try saying no. Instead of answering someone that "no", try saying no.

Instead of saying no:
	say "'No!' you squawk. 'No no!'
	
[The random visible person who is not the player] frowns in your direction."

[Now we've set up the conversation model; time to provide some actors.]

	 
Chapter 3 - The World
[Because most of what goes on here is conversation rather than interaction with objects, our setting is quite simple and most of it consists of the characters:]

Stage is a room.  

The old lady is a woman in the Stage. Understand "mother" or "stepmother" as the old lady.  The old lady is active. The description of the lady is "She looks plucked: thin neck with folds of skin exposed, nose beaky, lips white. Perhaps when her fortunes are mended her cosmetics too will improve."

The Prince is a man in the Stage. The description of the prince is "He's tolerably attractive, in his flightless way. It's hard not to pity him a little." The prince carries a glass slipper. The glass slipper is wearable. Understand "shoe" or "heel" or "toe" or "foot" as the slipper. The description of the slipper is "It is very small for an adult woman's foot." 

Lucy and Theodora are women in the Stage. The printed name of Lucy is "Lucinda". Understand "Lucinda" as Lucy. Understand "Theo" as Theodora.[* The complication here is that we have both a person object and a subject object for each of these, and we want to avoid overlapping names.]  The description of Theodora is "Soft, round, in every sense yielding: she eats too many candied almonds herself, but never grudges sharing them. No character worth mentioning." The description of Lucy is "More compact than Theodora, and with more self-control." 

The sofa is scenery in the stage. It is an enterable supporter. The description is "They never let you stand on it." Some pillows are on the sofa. Understand "pillow" as the pillows. The description of the pillows is "Not as pretty as you." The pillows are scenery.

The wing chair is scenery in the stage. It is an enterable supporter. The description is "Pitiful wings, really." Understand "wingchair" or "seat" as the chair.

Instead of doing anything other than examining when the noun is a thing and the noun is scenery: say "That would not help matters, even if you could reach."

The perch is in the stage. It is scenery. The description is "It's adequately comfortable for your purposes."

Instead of doing something other than examining to the slipper: say "It's not yours."

Before wearing the slipper: say "There is no part of your body on which that slipper would fit." instead.


Chapter 4 - Your Behavior
 
Section 1 - Looking and Waiting

[Because this game relies minimally on interaction with physical objects, the usual looking rules, and rules for movement, are modified to focus the player's attention on the flow of conversation. 

In particular, we begin by overriding the default behavior that prints room descriptions at the outset of the game, and re-writing LOOK so that it doesn't actually give any information. 

Since we're also changing the status bar, the player will never see the fact that we've labeled our location "Stage".]

The room description heading rule is not listed in any rulebook.  Rule for printing the name of the Stage: do nothing.

Instead of looking for the first time:
	if turn count is 1
	begin;
		say paragraph break;
		say "The Prince sits awkwardly on the couch, holding his glass slipper and trying to keep it from crushing. Lucinda and Theodora have the ends of the same couch, and they are taking turns seeing who can bend lowest and show off the most cleavage; while the old lady, in her wing chair, carries on about nonsense. For instance:
	
'Do tell me about your father's health,' she says, leaning toward the Prince. 'Is he still ailing? Has the Spanish doctor been able to do anything for him?'

The Prince looks uncomfortable: this line of reason leads directly to the problem of heirs. 'I believe so, madam,' he replies, with a bit of constraint.[line break]"; [* This bit of conversation might conventionally have gone before the banner in a When play begins... passage; but since we have no room descriptions in this game, this would mean having a banner immediately followed by a command prompt. So I decided instead to go with a null prologue and put this bit of  chat after the banner but before the command prompt.]
	end if.

Instead of looking: 
	say "You give the place a once-over with your right eye. Then you turn your head and look at everything through your left eye. It doesn't make any difference. The farther parts of the room remain out of focus."
	
Instead of examining the player:
	say "It's hard to have a good look at the moment, but everything feels in order, properly preened, feathers lying as they ought."

Instead of waiting:
	choose a random row in the Table of Waiting;
	say "[response entry][paragraph break]".

Table of Waiting
response
"You hold your peace."
"You shift your weight from claw to claw."
"You walk down to the other end of the perch."
"You turn your head and look at everyone out of the other eye, for a change."
"You stretch your useless wings and fold them again."
"You yawn."
"Outside on the street something rattles by."
"The floorboards creak overhead. No one looks up."

Section 2 - Replacement Responses to Actions that Do Nothing

[One of the unusual qualities of this game is the fact that the player is a parrot, so we need to systematically replace default library answers that would be inappropriate, and supply ones that work more effectively with the current scenario.]

Instead of taking inventory:
	say "You are holding onto your perch with both claws."	
	
Instead of going nowhere: say "You can't escape your perch.".

Instead of buying something: say "Commerce is beneath you."

Instead of kissing someone: say "Alas, you have no lips."

Instead of singing: say "You're not one of those intolerable songbirds."

Instead of listening: say "You keep your beak shut and attend to the conversation."

Instead of jumping: say "You hop gracefully down to the other end of the perch."

Understand "flap" or "flap wings" as waving hands.

Instead of waving or waving hands: say "You flap one wing uselessly."

Instead of climbing: say "You have already reached the most comfortable position in the room."

Instead of thinking:
	say "Related ideas flit through your brain: [list of subjects suggested by the current subject]."

Instead of drinking: say "Sadly, no one has thought to provide you with your water dish."

Instead of tying something to something: say "An activity too complicated for you to manipulate yourself."

Instead of sleeping: say "You have had a full eighteen hours of sleep, and are refreshed at the moment."

Instead of waking up: say "You are fully alert."

Instead of burning or cutting something: say "You leave these sorts of tool-wielding behavior to the descendants of primates."

Instead of tasting or eating the player: say "Ah, the urban air has begun to unravel your wits." Instead of tasting or eating something: say "[The noun] does not look like it is made of candied almond, so there's no point."


Section 3 - Insults and Compliments

[The ability to insult or compliment characters arose from changes to the ATTACK command, where we decided to make ATTACK into a verbal assault rather than a physical one. It then seemed only reasonable to provide a way to make up to a person, as well.]


Instead of attacking someone: now the player is disgraced;
	say "'[rude word] [noun]!' you shriek. '[if a random chance of 1 in 2 succeeds][Awwk]! [end if][if a random chance of 1 in 3 succeeds][rude word]! [end if][rude word]!'

[The noun] glares at you."

Instead of attacking the prince for the first time:
	now the player is disgraced;
	say "'[rude word] [noun]!' you shriek. '[if a random chance of 1 in 2 succeeds][Awwk]! [end if][if a random chance of 1 in 3 succeeds][rude word]! [end if][rude word]!'

'What a quaint conversation piece your pet is,' remarks the Prince, unruffled.

'Oh, that's not the only curious thing we keep around the house,' says Lucinda."

To say rude word:
	choose a random row in the Table of Insults; say "[response entry]".
	
Table of Insults
response
"Fool"
"Nitwit"
"Lamebrain"
"Coward"
"Twit"
"Baggage"
"Cutpurse"
"Pinchpenny"
"Lickspittle"
"Moldy rogue"
"Scurvy companion"
"Canker-blossom"
"Stinky"
"Lack-linen"
"Frog-face"

Understand the commands "insult" or "offend" or "reprimand" or "upbraid" as "attack".

Instead of attacking something: say "Not even the ferocious grip of your claws would make much difference."

[But, having provided this other meaning for "attack", we don't want to misunderstand the commands that suggest a strictly physical approach:]

Understand the command "kill" as something new. Understand the command "hit" as something new. Understand the command "murder" as something new.

Understand "kill [text]" as a mistake ("Invective is your only weapon."). Understand "murder [text]" as a mistake ("Invective is your only weapon.").  Understand "hit [text]" as a mistake ("Invective is your only weapon.").

Understand "compliment [someone]" or "flatter [someone]" or "seduce [someone]" as complimenting. Complimenting is an action applying to one visible thing. Carry out complimenting: do nothing.

Report complimenting:
	say "'[nice word] [noun]!' you squawk coaxingly. '[if a random chance of 1 in 2 succeeds][Awwk]! [end if][if a random chance of 1 in 3 succeeds][nice word]! [end if][nice word]!'

[The noun] ignores you." 

Instead of complimenting the player: try mentioning birds.

Instead of complimenting someone when the player is disgraced:
	say "'[nice word] [noun]!' you squawk coaxingly. '[if a random chance of 1 in 2 succeeds][Awwk]! [end if][if a random chance of 1 in 3 succeeds][nice word]! [end if][nice word]!'

'Pretty,' remarks [the noun], 'but you will not earn your way back into our good graces that easily.'

You hide your head under your wing sulkily.". 

To say nice word:
	choose a random row in the Table of Flattery;
	say "[response entry]".
	
Table of Flattery
response	
"Darling"
"Sweeting"
"Pretty"
"Nice"
"Sugarplum"
"Splendid"
"Adorable"

	
Section 4 - New Actions for Parrots

[...and, of course, a parrot might try some other actions than those standard for adventurers. Some of these ideas arose from beta-testing: unless it demands a lot of work, providing answers to whimsical beta-tester commands is usually a good idea, making the game feel richer and more fully fleshed-out.]
	
Understand "fly" as a mistake ("But the old lady has clipped your wings.").

Understand "peck [text]" or "bite [text]" as a mistake ("Your known propensity for pecking people is probably the reason your perch is on the far side of the room, out of reach of everything.").

Understand "lay egg" or "lay eggs" or "lay an egg" as a mistake ("You're not in the family way.").

Understand "poop" as pooping. Pooping is an action applying to nothing. Carry out pooping: do nothing. Report pooping: say "You lift your tail and do your birdlike functions. Everyone pretends not to see." Understand the commands "crap" or "defecate" as "poop". Understand "poop on [text]" as aimed pooping. Aimed pooping is an action applying to one topic. Carry out aimed pooping: do nothing. Report aimed pooping: say "You can't aim horizontally." [* It is important to humor one's testers.]

Understand "preen" as preening. Preening is an action applying to nothing. Carry out preening: do nothing. Report preening: say "You attend to your wing-feathers."
	
Instead of preening when the current subject is birds:
	say "'It just likes attention,' remarks Lucinda, watching you fluff yourself. 'Don't mind it.'"
	
Understand "parrot [someone]" or "imitate [someone]" as imitating. Imitating is an action applying to one visible thing. Instead of imitating someone: say "You give a scarily convincing rendition of [the noun]'s voice. Everyone stares at you uncomfortably."	


Chapter 5 - Plot by Scene
[Now we have actors, a location, and rules of interaction, but we still need some content for the story. Part of the plan is to control the flow of conversation with a series of scenes; in each scene, different conversation is possible and the characters have different conversational goals.

What follows is a set of scenes, each with its own conversation set.]

Section 1 - Scene Aesthetics
[This is just a decorative nicety: we're removing the room-name and score and turn count from the status bar, so we should replace it with some other hint of the game state. What might be useful? Well, perhaps something that tells us what the conversation is currently about, and also gives some indication of the tone in the room. So:]

Current action is some text that varies. The current action is "Idly".

When play begins:
	now the left hand status line is "[current action] discussing [the current subject]";
	now the right hand status line is " ";

Section 2 - Prologue
[...In which we lead up to the subject of the Prince's having fallen in love.

As promised, each conversation set contains responses for moves the player (or NPCs) might make: from one subject to another. Each response is removed from the table after use, to prevent any repetition; if we want that move to provide interesting dialogue even if it is repeated exactly, we provide several entries for it (see the king's health to heirs move, below, which has two responses). The first one will be used the first time that move occurs; the second the second time; and so on.

"blank" is a stand-in subject, a kind of wild-card that will match anything. We will use this on occasions where we do not want to specify both the "from" and "to" parts of the move.]

Table of Prologue Remarks
starting	final	comment
king's health	heirs	"'It's so fortunate,' says the old lady. 'That you're of an age -- that is, that the King has been so blessed with an heir who can follow in his footsteps when the time comes, which we all hope will be--' 

Realizing she has led herself into a diplomatic difficulty, she sighs. 'God has truly blessed our little kingdom.'"
king's health	heirs	"'When the time comes, which will be when God wills it, you will be a fine King,' says the old lady firmly."
blank	king's health	"'I think the king is less concerned than the rest of us are,' says the Prince. 'But he has always been very brave, and philosophical. I believe he would meet death with a Socratic--' 

Seeing that he has left behind his entire audience, including the old lady, he changes tack. '--with true Christian fortitude.'

There is a collective sigh of relief at a pious thought so comprehensibly expressed."
blank	king's health	"'I know very well how hard it will be to emulate my father's command,' says the Prince. 'He has a knowledge of how to speak to people which I do not.' 

'Pssht,' says the old lady. You notice she does not actually contradict him." 
blank	king's health	"'May he live long,' says Lucinda softly."
blank	king's health	"'You must try not to worry too desperately,' Lucinda says to the Prince in a comforting tone. 'I have heard only the best things about the doctors.' 

'We would hardly have sent for a doctor with any but the best reputation,' says the Prince, with a half-smile. 'But doctors are human, and fallible.'"
heirs	king's health	"'It would have been better for us all if I had siblings,' says the Prince. 'My father feels it, I know.'"
heirs	marriage	"'Now I have heard a rumor,' says the old lady, pretending that this conversation topic just now occurred to her, rather than being the object of her determined pursuit for the last half hour. 'A rumor that you yourself were planning to wed, in the very near future.' 

Theodora leans closer to the Prince, who tucks his hands more protectively around the slipper. 

'There are a great many rumors,' he says."
heirs	marriage	"'I think I am not expressing a unique opinion,' says the old lady, brushing at her skirt with her gloves, 'when I say that the whole kingdom will be delighted to see your family increase yet further.'"
marriage	ball	"'It's true, you know, that my father threw the ball in the hope that I would-- that is, that it would lead to a greater acquaintance--' The Prince stops again, rattled, and glares down at the small shoe cradled in his hands. 'I had not been very attentive to ladies in my youth.' 

The old lady looks very strange at that remark. 'Well-- my dear boy--' she begins. 'I am glad you feel comfortable-- that is, I will not mention-- if you feel you prefer--'

He blinks thick girlish lashes, and you see why she is worried. 'No, I didn't mean that I have a preference for boys, madam,' he remarks, more at his ease now that she is uncomfortable. 'Only that I have been very much occupied with other concerns, and not...'

He gestures. The shoe almost slips off its pillow. He catches it just in time."
blank	love	"A look of unexpected sweetness crosses the face of the Prince. The old lady watches this with interest."
blank	shoe	"[if not mentioning shoe]'I'm sure it's nothing surprising,' remarks the old lady, 'if you didn't meet anyone at the ball that you felt immediately you could marry. Such short acquaintances... there's much more to an alliance than that. One must feel at ease with the family, for instance.' 

The Prince opens his mouth, then closes it again. 'I did meet someone,' he admits. 'But I know nothing of her family. It hardly matters to me, however. [otherwise]The Prince gives you an odd, almost grateful look. 'In fact I have chosen a wife,' he says. 'At the ball my father gave. [end if]It will be the woman who can wear this shoe.' "
blank	ball	"The Prince sighs. 'Yes,' he says. 'The ball, I meant to tell you...' 

He stops."
marriage	Theo	"Theodora blushes with sudden consciousness. The Prince glances at her piercingly. 

'Out of the mouths of birds,' remarks the old lady, smiling."
marriage	birds	"'Do you suppose it means that marriage is for the birds?' asks Lucinda. 

'It has a certain Delphic inscrutability,' says the Prince, grinning at her."
blank	birds	"'I suppose it wishes to advocate a greater interest in aviary concerns?' the Prince asks, looking at you with curiosity. 

'I wouldn't credit it with nearly that much intelligence,' says the old lady. Witch."
Theo	heirs	"'Ah, Theodora... I'm so fortunate in my own children,' the old lady goes on. 'You can never understand what a great pleasure there is in them until you have your own.' 

'Indeed, so I have heard,' the Prince says."
God	Lucinda	"'Lucinda is thinking about becoming a nun,' says Theodora. 

Lucinda gives Theodora a look of passionate dislike. 'That was when I was younger,' she says.

The Prince raises his eyebrows. 'Surely a serious vocation could manifest itself even in a child?' he says. 'I would not be too quick to reject the possibility, if--' 

Lucinda is leaning forward at him again. 

'--if you think it is what you were meant for,' he finishes weakly. 'Then again, it might have been a childish whim.'"
blank	heirs	"'How sad that your dear mother did not live along enough to give you siblings,' says the old lady, dabbing the edge of her eye with one finger. 

'You probably don't remember your mother -- such a sweet woman -- a wonderful friend to me at that time.' She sighs. 'I know I talk so much nonsense to you, Prince, but it is for her sake. I cannot help thinking that she would have wanted me to take a little concern for you.'"
love	marriage	"'It is a pity,' says the old lady. 'But love and marriage often have so little to do with one another, at the upper levels of society. And certainly when matters of state intervene.' 

'So my father reminds me,' says the Prince. 'He considers me a romantic and says I have been reading too much Byron.'

'And have you?' asks the old lady curiously.

'I cannot abide Byron and am devoted to Sir Philip Sidney, and the difference between my father and me is that I have paid enough attention to have a taste in these matters.' He smiles briefly. 'So you see he loses the battle and wins the war.'"
blank	love	"'I think the feelings at the outset of a marriage are nearly irrelevant,' says Lucinda. 'If there is commitment and good intention, then you can learn to live with the person, and if there isn't... no amount of affection, or, or...' 

'Physical attraction, is what my sister means to say,' Theodora cuts in.

'Or that, yes-- none of those things will count.'

Theodora makes a face. 'I bet they count a bit more than you want to admit.'"
blank	stepmother	"The old lady glares at you."


The Prologue is a scene. The Prologue begins when play begins. The Prologue ends when the current subject is the shoe.

When Prologue ends:
	say "The old woman laughs slightly. 'How beautifully romantic! But -- she didn't give you her name?'
	
The Prince shakes his head, looking embarrassed again.

'...but you would recognize her, at least,' the lady says, looking down carefully at her hands folded on her skirt. 'As soon as you saw her face--'

'I can't be sure,' the Prince replies.

There is a thick silence. The old lady frowns, suggesting very rapid and dangerous thought. Theodora lies back against the pillows, interested in the story and too stupid to realize it has to do with her. Lucinda-- but Lucinda's thoughts are always the hardest to read."

[Every turn: say conversation set; ]


Section 3 - About the Ball
[In which we work toward the discovery that the beloved is -- or was -- under a spell.]

Wondering is a scene. Wondering begins when Prologue ends. When Wondering begins: now conversation set is Table of Wondering Remarks; now the target subject is ball; now the current action is "Curiously".

Table of Wondering Remarks
starting	final	comment 
blank	birds	"'At least we can rule out the parrot as a possible wearer of the shoe,' says the old lady, twinkling."
blank	shoe	"'I-- managed to rescue the shoe when she ran off,' says the Prince, a little embarrassed-looking. 

'It's fortunate she left behind such a distinctive token,' says the old lady, her eyebrows raised in mischief."
blank	magic	"Unless you are mistaken, the old lady flinches."
blank	Theodora	"Theodora starts. 'I didn't have anything to do with it,' she remarks. 'That is--' 

'That's enough, Theo,' says the old lady. 'No one said that you did.'"
blank	Lucinda	"'Yes, Parrot?' asks Lucinda, looking up at you rather coldly. She's always made it clear she thinks you possessed. Theo is much nicer."
blank	heirs	"'And I suppose this is a suitable young woman for -- that is, your father will think her a good mother to his grandchildren?' 

'I'm sure she comes of good family,' says the Prince. 'Everything about her spoke of breeding.'

The old lady exchanges a glance with Lucinda; two little smiles of quiet smugness, even if they neither of them would like to say why.

'Very appropriate,' says the old lady."
blank	marriage	"'It's marvelous that you were so drawn to a young lady that you want to marry her even though you can't remember what she looks like,' remarks the old woman. 

The Prince glances at her sidelong, but she does not meet his eye.

'She was very pretty.'

'As you recall,' the old lady says.

'Yes, as I recall,' he says. 'I wrote down some notes at the end of the evening. Everything I could remember about her, everything I recalled her saying to me. I believe I noted that she was pretty.'

The old lady casts about for something to say to that."
blank	love	"'Do you--' begins the old lady. 'Oh, dear, this is such a delicate question, and there is no tactful way to put it. Do you have reason to think she reciprocates your regard?' 

'Mama, he's the Prince!' exclaims Theo, looking scandalized.

'I know, dear,' says the old lady. 'But it is possible that she does not feel the same way he does, and one-sided love-matches are worse, I think, than marriages of pure convenience on both sides.'

The Prince's cheeks go a little pink. 'She told me-- that is, she put it very delicately, but she gave the impression that she had admired me for some time.'

'Ah,' says the old lady."
love	marriage	"'If she does love you,' Lucinda says, 'I wonder why she was not more straightforward? Deception has no part in true love.' 

The old lady shoots her a look of the uttermost exasperation. 'You're very young,' she says. 'Leave the platitudes and generalities to those who have seen a little more of the world.'"
marriage	stepmother	"'I was so fortunate in my own alliances,' says the old lady, startled into a reminiscent mood. 'The dear captain -- Lucinda and Theodora's father -- was so handsome! and then...' 

She trails off before mentioning that her second husband was so rich and socially prominent. There is a tactful silence."
blank	ball	"'It wasn't a masked ball,' the old lady says. 'It wasn't even badly lit. Your father did not stint on the candles at all.' 

The Prince opens his mouth.

'Oh, dear, dear, I am being odiously prying. I'm so sorry. Perhaps you met this young lady out on the terrace...' She trails off, suggesting the very faintest disapproval of young ladies who linger on terraces, out of sight of chaperones, to hold conversations with Princes, and never tell their names.

'I met her in candlelight,' says the Prince, goaded. 'But she left me at midnight.'

The effect of this comment is like the shattering of glass: for a moment you wonder if he dropped the shoe...? No. It is merely that he has admitted, or near-as-admitted, that his chosen bride is one who appeared to him under a glamor, a magical enchantment. A crime punishable by death under his father's law.

Everyone remains very very quiet." 


Wondering ends when the current subject is the ball. 

Section 4 - Fitting
[In which we work towards the idea that someone here should try the shoe (and for lack of a better idea, we will assume that person is Theo.)]

Fitting is a scene. Fitting begins when Wondering ends. When Fitting begins: now conversation set is Table of Fitting Remarks; now the target subject is Theo; now marriage suggests Theo; now the current action is "Nervously".

Table of Fitting Remarks
starting	final	comment 
ball	shoe	"'Midnight,' repeats the old lady. 'Well, well.' She smiles at the Prince. 'Good luck to you. It was quick thinking taking the shoe.' 

He blushes. 'She left it on the stairs; I thought it was the only thing I was going to have left of her.'

'Mm. Love.' She smiles at him. 'I do wish your mother were alive.'"
shoe	ball	"'That was a good ball,' says Theodora, out of nowhere. 'It was the nicest ball I've ever been to.' 

The Prince chuckles. 'Me too,' he says. 'Oddly.'"
blank	stepmother	"The old lady starts. 'That is a good point,' she says. 'For a bird. Are you intending to interview the older ladies as well? Oh, I don't mean myself, of course!' She manages an almost natural laugh. 'But how do you know that your intended is a young lady?' 

The prince looks thunderstruck.

'She might be anyone -- my friend Lady Carpwell for instance--'

'I'm sure she was a young woman,' he says firmly, gathering strength again. 'There were references in her conversation that -- things she said which --'

'Naturally, if truthful.'"
blank	Theo	"[if mentioning Theodora]Theodora blushes. 'Stupid bird,' she says. 

'Must start somewhere,' says the Prince, shrugging. [otherwise]Theodora leans closer to the Prince. [end if]'I can go first, if you want,' she says. Without any shyness, she lifts her skirt slightly and slips her feet out of her afternoon slippers, wiggling her feet on the soft carpet.

'So strange,' she says, giggling. 'Taking off my shoes in the presence of a man!'

'I won't tell anyone,' the Prince assures her. "
blank	Lucinda	"[if mentioning Lucinda]'Might as well start there as anywhere,' says the Prince, shrugging. [otherwise]The Prince licks his lips. [end if]'Miss Lucinda, would you mind trying the slipper? You needn't -- that is, please do not regard this in the nature of a royal request, if you would rather not.' 

The old lady catches Lucinda's eye, and jerks her head slightly: a command.

'It would be a pleasure,' Lucinda says, though her eyes cloud a little as the Prince kneels at her feet and begins to untie the laces of her boot. Theodora watches the proceedings curiously. "
ball	magic	"[if mentioning magic]The Prince's eye goes to you. 'Your bird, madam, is freakishly percipient. Positively unnatural.' 

'Yes,' she says. 'Though I promise you it arrived in that condition and was not made so by anyone in this house.' She sighs. [end if]'You are in a difficult situation,' says the old lady. 'You are too intelligent not to have considered the problem thoroughly, and all the risks involved in choosing someone under those circumstances.'

Lucinda's lips tighten. 'Magic is abhorrent to God,' she says.

'That is certainly the opinion of some,' the old lady agrees. 'I myself wonder whether He would have encompassed in His creation any power which He considered wholly evil. But that is a private philosophy, and does not excuse a violation of the law.' She glances at the Prince. 'Forgive me: I stray from your problem.'"
magic	shoe	"'Perhaps the shoe itself is--' begins Theo thoughtfully. 

Lucinda scoots a little way from the pillow.

'It hasn't done anything magical,' comments the prince, frowning at the slipper in his hands."
magic	birds	"All eyes turn to you. 'I have heard,' the Prince says tentatively, 'about creatures who are possessed...' 

The old lady makes a face. 'But what demon would desire to possess a household bird?'

The Prince frowns, as though he feels the logic is flawed but can't quite find the point of his objection."
blank	magic	"'The creature gets redundant,' says the old lady. 'I'm afraid it has a taste for melodrama.'"
magic	ball	"'I have considered the problem,' says the Prince. 'Very closely. I have not been able to sleep for considering it.' 

'Do you know,' asks the old lady, 'why she...?'

The Prince shakes his head. 'Until she fled I had no hint that she was not simply as she appeared.'

'Extraordinarily beautiful, no doubt,' remarks the old lady, with a hint of a curling smile; and Lucinda titters.

'And kind, and wise,' the Prince replies, refusing to be drawn. 'Do you know whether magic can counterfeit those qualities as well?'

'Wisdom rarely and kindness never at all,' says the old lady."
ball	marriage	"'Maybe,' Lucinda suggests, 'she thought it would be wrong to deceive you about what she was, and chose this way to, to make it known.' 

A spark of comprehension comes into Theo's eyes. 'Yes,' she says. 'She might have thought that-- I mean, I can imagine...'

The old lady glares at her. The Prince looks back and forth, confused."
blank	marriage	"'It seems to me,' says the old lady, after a long thoughtful moment, 'that you have no choice but to try this shoe on every eligible young woman, and determine who she was. And if I were you, I would also invent an explanation for this extraordinary method of bride-selection that will satisfy the people at large.' 

He chuckles, but nods."
marriage	shoe	"'Yes, the shoe,' says Lucinda to you; and to her mother: 'Do you think we could send it back to bird school?' 

'It knows far too much already and requires no further education,' snaps the old lady."
blank	love	"'Are you sure that it wasn't just an infatuation?' the old lady asks gently. 'Such a short acquaintance-- forgive me, but you've always seemed so level-headed.' 

The Prince smiles without humor. 'I would have said the same. But after meeting her, I am... very sure. It's strange that this is possible, I know.'"
blank	magic	"'Do you agree with your father's views?' asks Theodora. 'On magic, I mean.' 

'I have not had an opportunity to study his reasoning,' says the Prince, stiffly. 'And in any case it is not for me to challenge his laws.'"

Section 5 - Lucinda Being Tried
[Now a scene for what happens if Lucinda gets a chance...]

Checking Lucinda is a scene. 

Checking Lucinda begins when Prince unties boots. Fitting ends when Checking Lucinda begins. When Checking Lucinda begins: 
		now left hand status line is "Trying the slipper on Lucinda";
		now last subject is current subject; now the current subject is Lucinda; now the target subject is Lucinda; now the conversation set is Table of Lucinda Checking Remarks.

Every turn during Checking Lucinda:
	repeat through Table of Lucinda Checks
	begin;
		say "[response entry][paragraph break]";
		blank out the whole row;
		rule succeeds;
	end repeat.

Checking Lucinda ends when the number of filled rows in the Table of Lucinda Checks is 0.

When Checking Lucinda ends:
	say "The Prince stares at the shoe. Then he looks up. 'You?' he repeats. 'I mean -- you seemed -- I thought for certain that you weren't -- the way you -- I thought you would be good practice because--'

Lucinda smiles, a strange, sad smile. 'My love,' she whispers.

Something is wrong. Lucinda's hand is clenched, her nails digging into the pillow where only you can see. You smell blood."



Table of Lucinda Checking Remarks
starting	final	comment
blank	Theodora	"'I'll get to her later,' the Prince says. 'If necessary,' he adds, under his breath."
blank	birds	"'I do believe the parrot is jealous,' remarks Theo. 

'Green with envy, in fact,' says the old lady, eying your plumage."

Table of Lucinda Checks
response
"The old lady folds her hands in her lap."
"The Prince tugs at the bootlaces. 'I do apologize,' he says breathlessly. 'I'm afraid I am not used to undoing ladies' shoes.' 

'It is quite all right,' says Lucinda, warming slightly."
"The Prince removes the boot and sets it aside. 'There,' he says, smiling up into Lucinda's face. 'You have the dubious honor of being first, you see. By the time I have checked the five-hundredth maiden I will be quite proficient at this.' 

She chuckles. 'Let us hope you are not put to so much trouble.'

They both seem to become aware at the same moment that he is clasping her ankle in an unseemly fashion. He lets go.

The old lady looks like a cat." 
"The Prince picks up the shoe and holds it up, and Lucinda slides her stockinged foot in easily."

To decide whether Prince unties boots:
	if Fitting is happening and Lucinda is the current subject, yes;
	otherwise no.
	
Lucinda Endgame is a scene. Lucinda Endgame begins when Checking Lucinda ends.

Lucinda Endgame ends in Lucinda Marriage when the time since Lucinda Endgame began is two minutes. 

Instead of smelling when Lucinda Endgame is happening:
	say "The smell is coppery and impossible to miss."

Instead of waiting when Lucinda Endgame is happening:
	say "You hold your peace. A smile grows across the old lady's face."

Instead of mentioning blood during Lucinda Endgame:
	say "'Blood!' you shriek. 'Blood, blood, blood!'
	
The Prince stiffens. He puts his hand to the back of Lucinda's ankle, and draws it away again. 'Mother of God,' he says. He passes a hand over his lips, looking as though he is going to vomit; stands up in one abrupt movement. Lucinda's eyes follow him but she does not even try to stand.

'What did you hope to gain?' he asks, turning back. 'Don't you think I would have realized sooner or later?'

'But you might have realized too late,' Lucinda says, closing her eyes, pallid. 'I think, knowing you, you would not repudiate a woman after you had made her your wife in the eyes of God and Church.'

He looks down.

'It was worth a try,' Lucinda says.

'You want to be Queen so badly?' he demands. 'What possible--'

'Calm yourself,' says the old lady, rising. 'Don't torture her. Lucinda wants nothing but a convent and a narrow bed. She's a simple girl and her ambitions are simple. But she does also know her duty, when it is spoken to her plainly by her mother.'

'I don't understand why,' says the Prince. 'I thought you friends.'

The old lady's jaw clenches, and you see a hint of the steel in her. Her closeness to the royal household has been life's blood to her these twenty years, and now she sees it end; she could explain, but does not choose that particular betrayal. 'Check the rest of your maidens,' she says. 'Good luck finding your bride. You will not discover her in this house.'

'Thank Providence for that,' he says, snatching up the glass slipper. 

You watch him go, and think of the third daughter, waiting, in her bedroom, with the door locked.";
	end the story saying "The Prince departs in anger"

When Lucinda Endgame ends in Lucinda Marriage: 
	say "The Prince gives a great sigh and puts his head down on Lucinda's lap. 'I was sure I wouldn't find you,' he says. 'It seemed impossible.'
	
She exchanges a glance, over his head, with the old lady.

'You have me now,' she says, and puts her hand on the back of his neck. He does not ask, perhaps because he does not dare, why she did not explain herself sooner. And so they sit for a long moment, while Theodora slips out of the room, and the old lady rings for brandy...";
	end the story saying "Lucinda and the Prince are married".

Section 6 - Theodora Being Tried

Checking Theodora is a scene. 

Checking Theodora begins when Prince unties Theo boots. Fitting ends when Checking Theodora begins. When Checking Theodora begins:
		now left hand status line is "Trying the slipper on Theodora";
		now last subject is current subject; now the current subject is Theo; now the target subject is Theo; now the conversation set is Table of Theodora Checking Remarks.

Every turn during Checking Theodora:
	repeat through Table of Theodora Checks
	begin;
		say "[response entry][paragraph break]";
		blank out the whole row;
		rule succeeds;
	end repeat.

Checking Theodora ends when the number of filled rows in the Table of Theodora Checks is 0.

When Checking Theodora ends:
	say "The Prince is silent for a moment, looking at the shoe. 'It's you,' he says. 'It's you, Theodora! Why didn't you tell me?'

The old lady turns away, tucking something into her pocket: something glassy and glinting.";
	move the pocket to the old lady.

The pocket is a thing. The description of the pocket is "It bulges with something shaped like a shoe."

Table of Theodora Checking Remarks
starting	final	comment
blank	Lucinda	"'One at a time, bird,' mutters the Prince. Theodora giggles."
blank	shoe	"'Yes,' says Lucinda to you. 'You're very smart.'"


Table of Theodora Checks
response
"The old lady slips her hands into the pockets of her skirt and leans back."
"The Prince drops to kneel at Theo's feet. He looks dubiously at the shoe. 'Do you happen to know whether this goes on the left foot, or the right one?' he asks. 'It's very--'

'You can try it on both,' says Theodora. 'If you want.'

He begins to slip it onto her left foot. It won't go, not at all. 'That's certainly not it,' he says, smiling at her quickly.

She twitches her skirt, giving him -- you imagine, since you are at the wrong angle -- a passing view of quite a lot more than her ankles. He blinks once but does not allow himself comment."
"'Right,' he says. 'Other foot now.' He slides the shoe on, and it does go considerably further. 'Tell me if I'm hurting you,' he says.

'You're not, not at all,' Theo assures him on a wince.

'Shoes are worn tight this year,' puts in the old lady."
"The Prince stops his work with the shoe. 'I can't -- this must not be --' 

'Oh, for pity's sake,' says the old lady. 'You haven't the least idea how women dress. Let me.' And she kneels at Theodora's feet, shooing the Prince aside, and gives a firm tap to the heel of the shoe; at which point it slides on.

'Bless me,' she says."

To decide whether Prince unties Theo boots:
	if Fitting is happening and Theo is the current subject, yes;
	if Fitting is happening and time since Fitting began is 4 minutes
	begin;
		say "'I can start if you like,' says Theo at last. 'You can try it on me.'";
		yes;
	end if;
	no.
	
Theodora Endgame is a scene. Theodora Endgame begins when Checking Theodora ends.

Theodora Endgame ends in Theodora Marriage when the time since Theodora Endgame began is two minutes.  

Instead of mentioning during Theodora Endgame:
	say "'[noun]!' you [exact verb].

Theodora blows you a little kiss."

Instead of mentioning Theo during Theodora Endgame:
	say "'Theodora! Congrat-- awwk!'
	
Theodora nods prettily in your direction. Oh yes, it will be a golden cage for you, soon enough..."

Instead of mentioning shoe during Theodora Endgame:
	say "'Slipper!' you screech. 'Wrong slipper! Wrong slipperslipper! In the pocket! Old lady!' It's the most complicated thing you've had to say in years, and your head aches by the time you're done.
	
The Prince looks at you for a long moment, then turns to the old lady; who shrugs, as though to say that she knows the game is up. Fishing in her pocket she draws out the true slipper. 'The other one is only a little larger,' she says, handing the real one over. 'Theodora's feet are quite dainty, on the whole.'

'You are a harridan,' says the Prince. 'A conniving, treacherous, beastly woman with no knowledge of love...'

'You could still try the shoe on Lucinda,' she suggests mildly.

He snorts. 'I thank you, I do not want to find my bride here. I imagine everyone under this roof is tainted with a little of the same venom.'

'That is the truth,' Lucinda murmurs; but he is already going, going, gone.";
	end the story saying "The Prince departs in anger"
 

When Theodora Endgame ends in Theodora Marriage: 
	say "The Prince pulls Theodora toward him. 'You are a woman of unexpected depths,' he says softly. 'All these years I have known you, seen you here and there, and thought that you were such a simple straightforward creature...'
	
She blinks at him, then says, 'I hope you are not angry.'

He laughs, and touches her cheek; and she kisses him.

Lucinda bites her lip. 'Well,' says the old lady briskly, standing. 'How many unexpected turns life brings to us.' And she pulls the bellpull with unnecessary force.";
	end the story saying "Theodora and the Prince are married".
	
Every turn when Theodora Endgame is happening and the time since Theodora Endgame began is 1 minute:
	say "There is an odd silence, as though no one is sure what to do or say now. But it will break momentarily."

Instead of waiting when Theodora endgame is happening for the first time:
	say "You do nothing. The old lady stares at you, and you stare back."
	
Instead of waiting when Theodora endgame is happening for the second time:
	say "A slow smile crosses the old lady's face."
	

Section 7 - Cinderella Being Tried

Checking Cinderella is a scene. Cindy is a woman. The description of Cindy is "She has a curious pointed chin, and a mouth that is too narrow, but there is a captivating quality about her as well.". Understand "Cinderella" or "cinders" as Cindy. Fitting ends when Checking Cinderella begins. 

Checking Cinderella begins when Cinderella gets mentioned. When Checking Cinderella begins:
	now last subject is current subject; now the current subject is Cinderella; now the target subject is magic; now the conversation set is Table of Cinderella Checking Remarks;
	move Cindy to location;
	say "There is the crack of a summoning: and there she stands, in the doorway, the secret daughter, the enchantress.
	
'May I present my third daughter,' says the old lady, very dryly.

The Prince fumbles to his feet.

'Do you recognize her?' the old lady asks.

'I-- we've never met,' says the Prince, looking puzzled. 'I would have thought, as long as I have known your family, I would have--'

'She likes to keep to herself. Except, of course, when she surprises us all, and goes out. Come in, Cinderella,' says the lady. Lucinda squirms on the sofa.

And in she walks, looking a little as though she has just been woken. The color rises in her cheeks when she looks at the Prince.". 

Checking Cinderella ends in disaster when the current subject is magic.

Checking Cinderella ends in peace when the time since Checking Cinderella began is 4 minutes and the current subject is not magic.

When Checking Cinderella ends in peace:
	say "The Prince frowns at Cinderella a little longer, then seems to reach some decision.
	
'This business of the shoe is nonsense,' he remarks. 'I've no business to be choosing a wife so arbitrarily.'

'And all your heirs would have such small feet,' Theodora contributes.

'Yes, that would be-- terrible,' the Prince says. 'In fact, I think--' He turns and hurls the slipper against the wall, where it splinters into dozens of sparkling pieces. There is a great sigh in the room, and the old lady actually laughs.

The Prince's gaze lingers on Cinderella. She looks back at him, her chin tilted up. 'There are things my father need not know. Though I also would not lie to him about anything that I knew for certain.'

'A commendable attitude,' says the old lady briskly. 'And now I am having a brandy. Would anyone else care for a nip?'";
	end the story saying "Cinderella and the Prince are (eventually) wed".

When Checking Cinderella ends in disaster: 
	say "Cinderella puts it on, turning her ankle to watch the effect. The change sweeps up through her, making her taller, more perfect, almost inhumanly beautiful.

The Prince drops his hand.

'You need not have done that,' he says. 'You could have broken it. Lied to me. Remained hidden.' His jaw works. 'Didn't you understand that--'

'She understands,' says the old lady, rising from her chair. 'I told her. We all told her. She hoped that you would understand her secret but have the wit not to put her to the test.' Her fingers dig into the chairback. 'I'm afraid the rest of us -- not being in love with you, you see -- we had less faith in your intuition. We thought perhaps we might distract you with one of the other two. One of the plainly... non-magical ones.'

The Prince swallows. He is crying: not very man-like. 'You see I cannot conceal this; it would be treason, now I have seen this witchcraft with my own eyes...'

Cinderella backs away. 'I have no truck with devils,' she says. 'I was gifted or cursed in my nature, that is all. I cannot make it go away -- the power remains with me.'

'It's true,' says Lucinda. 'We poured holy water on her every day for a year.'

'But the law,' says the Prince.

'You're an idiot,' says the old lady. 'You knew what you might find. If you loved her at all, you would not have come looking.'";
	end the story saying "Cinderella is executed"

Table of Cinderella Checking Remarks
starting	final	comment
blank	Theodora	"'No time for that now,' says the Prince."
blank	Lucinda	"The Prince shakes his head, ignoring you." 
blank	ball	"The Prince frowns at Cinderella. 'I don't recall seeing you at the ball.' 

'No?' she asks, with that funny triangular smile of hers. 'We were introduced. Perhaps I did not make an impression.'

He frowns, and you can see that he is considering asking her to try the shoe. The silence is sharp. But he realizes -- or does he? -- that her face is wrong. 

She waits."
blank	ball	"'In any case,' says the Prince. 'This ball -- I should check, you see, I'm having everyone try on a shoe...' 

'In theory, he is,' says Lucinda.

'Yes, he hasn't tried us yet,' says Theodora.

'And we were here first,' Lucinda adds, her voice full of meaning."
blank	marriage	"'I held the ball to look for someone to-- someone that I might marry,' the Prince explains to Cinderella. 

'I went looking for the same thing,' she says, tilting her head, the way you would. 'And did you find what you were looking for?'

'I am not sure,' he says. 'Did you?'

'He has not told me yet,' Cinderella answers."
blank	love	"The Prince and Cinderella both look up at you. Cinderella puts one little finger to her lips, and winks, but you are afraid. 

'I met someone at the ball,' he says, after a minute. 'I felt for her. I thought to recognize her again by her shoe.'

Cinderella tilts her head and looks at the shoe. 'If that is the only way you can identify her, I think you are better off avoiding such a wife, hm?'"
blank	birds	"Cinderella smiles, and comes over to where you are, and pets the top of your head and whispers cossetting things in a language only you understand. Your heart is filled with sweetness."
blank	magic	"[if mentioning magic]'Magic magic magic,' you sing. 'Witch, enchantress...' 

Cinderella swallows, but the Prince shrugs impatiently. 'I had guessed as much,' he says to you. And to her: 'I suppose you have looked-- another way than this?'[otherwise]'Would you mind trying this shoe?' the Prince asks, quite politely. [end if]

She nods, and takes the glass slipper from his hand.

'Don't,' says the old lady, reaching for her wrist; missing. 'They can't-- without proof they won't...'"

To decide whether Cinderella gets mentioned:
	if Fitting is happening and Cinderella is the current subject, yes;
	otherwise no.
	
Instead of mentioning Cinderella when Fitting is not happening:
	say "'Cinde--'
	
'Ssh,' says Lucinda, glaring at you."

	
Chapter 6 - Out of World Elements
[And finally a little housekeeping. Because the game is so simple, the help does not go very far.]

Understand "help" or "hint" or "hints" or "about" or "info" as asking for help.

Asking for help is an action out of world.
	
Carry out asking for help:
	say "This story may strike you as familiar, which means that you already have some idea of the ways it can end up. 

Most of the interference available to you is in the form of speech: SAY (something) will work to bring up a new topic of conversation. You can also THINK to come up with a few topics related to the current discussion."

[And because it is rude not to thank one's testers:]

Understand "credits" as asking for credits.

Asking for credits is an action out of world.
	
Carry out asking for credits:
	say "Inform 7 is the work of Graham Nelson, and [story title] was compiled using Andrew Hunter's compiler for Mac OS X.

Sam Kabo Ashwell, Dan Shiovitz, and A. Short offered beta-testing feedback."
```