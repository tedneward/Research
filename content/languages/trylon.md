title=Trylon
tags=language, object, native
summary=Language which looks like a cross between Python and Smalltalk -- indentation is significant, expressions are like Smalltalk (but with operator precedence); object-oriented, garbage collected, compiles down to binaries via C.
~~~~~~

[Source](https://github.com/stevefolta/trylon)

Hello world:
```
	trylon hello-world

	main: arguments
		send: "Hello world!"
```

Or, using a new class:
```
	trylon hello-world

	class Halloer
		say-it
			send: "Hello!"
	
	main: arguments
		halloer = Halloer new
		halloer say-it

```

