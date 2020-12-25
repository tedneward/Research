title=pSpaces
tags=distribution, library, jvm, clr, go, nodejs, browser
summary=Implementations of Tuple Spaces (aka object spaces) across several languages/platforms.
~~~~~~

See [Tuple spaces](../tuplespace) for the abstract concept.

[Source](https://github.com/pSpaces/)

Variety of different programming languages (implementations in Java, .NET, JavaScript, Go, Swift, and maybe a few others). It demonstrates "Hello World" in Space as:

1. Create a space named `inbox`:
      C#: `SequentialSpace inbox = new SequentialSpace();`
      Java: `Space inbox = new SequentialSpace();`

2. Put a simple tuple in the space:
      C#: `inbox.Put("Hello world!");`
      Java: `inbox.put("Hello world!");`

3. Retrieve the tuple from the space:
      C#: `ITuple message = inbox.Get(typeof(string));`
      Java: `Object[] tuple = inbox.get(new FormalField(String.class())`

