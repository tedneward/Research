title=Dialog
tags=language, gamedev
summary=A domain-specific language for creating works of interactive fiction.
~~~~~~

[Website](https://www.linusakesson.net/dialog/) | Source included in the download

Heavily inspired by Inform 7 (Graham Nelson et al. 2006) and Prolog (Alain Colmerauer et al. 1972).

An optimizing compiler, dialogc, translates high-level Dialog code into Z-code, a platform-independent runtime format originally created by Infocom in 1979.

Since Dialog version 0d/01 there's an interactive debugger, and since version 0g/01 there's a separate backend for the Å-machine story format.

The main discussion is happening at the intfiction.org forum, in the Dialog category.

Cloak of Darkness reference game:
```
(story title)	Cloak of Darkness
(story author)	Linus Åkesson
(story noun)	A port of Roger Firth's reference game

(story ifid)
		%% This is the IFID for the Dialog port of Cloak of Darkness:
		A5AA4F02-8F50-4649-A4BD-B1B5C5408B67

(scoring enabled)
(maximum score 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(intro)

		Hurrying through the rainswept November night, you're glad to
		see the bright lights of the Opera House. It's surprising that
		there aren't more people about but, hey, what do you expect in
		a cheap demo game...?

		(banner)
		(enter #foyer)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#foyer

(room *)
(singleton *)
(name *)	foyer of the Opera House

(look *)

		You are standing in a spacious hall, splendidly decorated in
		red and gold, with glittering chandeliers overhead. The
		entrance from the street is to the north, and there are
		doorways south and west.

(prevent [leave * #north])

		You've only just arrived, and besides, the weather outside
		seems to be getting worse.

(from * go #west to #cloakroom)
(from * go #south to #bar)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#cloakroom

(room *)
(singleton *)
(name *)	cloakroom

(look *)

		The walls of this small room were clearly once lined with
		hooks, though now only one remains. The exit is a door to the
		east.

		(notice #hook)

(from * go #east to #foyer)

#hook

(supporter *)
(name *)	small brass hook
(dict *)	peg
(* is #in #cloakroom)

(descr *)

		It's just a small brass hook,
		(collect $Obj) ($Obj is #on *) (into $List)
		(if) (nonempty $List) (then)
			with (a $List) hanging on it.
		(else)
			screwed to the wall.
		(endif)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#bar

(room *)
(singleton *)
(name *)	Foyer Bar
(look *)

		The bar, much rougher than you'd have guessed after the
		opulence of the foyer to the north, is completely empty. There
		seems to be some sort of message scrawled in the sawdust on the
		floor.

		(notice #message)

(from * go #north to #foyer)

(inherently dark *)
		(#cloak is in room *)

(instead of [look #down])
		(current room *)
		(try [examine #message])

#message

(name *)	scrawled message
(dict *)	floor sawdust
(* is #in #bar)

(descr *)
		(if) (message has been trampled) (then)
			The message has been carelessly trampled, making it
			difficult to read. You can just distinguish the
			words...
			(par)
			(bold)\*\*\* You have lost \*\*\*(roman)
		(else)
			(increase score by 1)
			The message, neatly marked in the sawdust, reads...
			(par)
			(bold)\*\*\* You have won \*\*\*(roman)
		(endif)
		(game over)

(prevent $Action)
		(current room #bar)
		~(player can see)
		~(command $Action)
		($Action = [$Verb | $])
		~($Verb is one of [go leave enter look])
		(select)
			In the dark? You could easily disturb something.
		(or)
			Blundering around in the dark isn't a good idea!
			(now) (message has been trampled)
		(stopping)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#player

(current player *)
(* is #in #foyer)

#cloak

(name *)	velvet cloak
(dict *)	dark black satin
(wearable *)
(* is #wornby #player)

(descr *)

		A handsome cloak, of velvet trimmed with satin, and slightly
		splattered with raindrops. Its blackness is so deep that it
		almost seems to suck light from the room.

(prevent [drop *])
		(when dropping outside cloakroom)

(prevent [put * $ $])
		(when dropping outside cloakroom)

(when dropping outside cloakroom)
		~(current room #cloakroom)
		This isn't the best place to leave a smart cloak lying around.

(perform [put * #on #hook])
		~(hook point awarded)
		(increase score by 1)
		(now) (hook point awarded)
		(fail) %% Fall back on default behaviour now.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(understand [hang | $Words] as [put $Obj #on $Dest])
		*(split $Words by [on] into $Left and $Right)
		*(understand $Left as object $Obj preferably held)
		*(understand $Right as single object $Dest)
```
