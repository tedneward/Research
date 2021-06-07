title=WyldCard
tags=language
summary=A clone of Apple's HyperCard and HyperTalk scripting language.
~~~~~~

[Source](https://github.com/defano/wyldcard)

WyldCard strives to offer a high-fidelity reproduction of Apple's original HyperCard, not a modernization of it:

* Cards support foreground and background layers; buttons and fields come in a variety of styles similar to HyperCard's; text fields can hold richly-styled text. Multiple stacks can be opened simultaneously in different windows.
* Paint and draw using all the original paint tools, patterns and image transforms (provided by the JMonet library). WyldCard supports full-color graphics and alpha transparency.
* Attach HyperTalk scripts to buttons, fields, cards, backgrounds and stacks; control the menu bar and address windows as objects. Most aspects of the HyperTalk 2.4.1 language have been implemented, including chunk expressions, message passing and context-sensitive evaluation of object factors. Sports a built-in step debugger with variable watching, message watching and in-context script execution.
* Compose music using HyperCard's original sound effects (flute, harpsichord and boing); dial telephone numbers; speak text; and animate cards with one of 23 visual effects provided by the JSegue library.

What's missing?
* No home stack and no ability to inherit behavior from other stacks (i.e., start using ...).
* No concept of user levels and no report printing.
* Some parts of the HyperTalk language, especially those related to obsolete operating system or hardware capabilities (like AppleTalk), are missing.

### The basics
WyldCard is a clone of Apple's HyperCard, written in Java, utilizing the Swing framework for UI components and the Antlr parser generator for HyperTalk language recognition.

WyldCard lets users create and interact with a document called a stack. Like a deck of PowerPoint slides, a stack represents a navigable list of cards containing graphics and interactive user interface elements like buttons and text fields. Each card is comprised of two layers of content: a background, which can be shared between cards, and a foreground that overlays the background and which is unique to each card.

### HyperTalk scripting
HyperCard's native programming language is called HyperTalk, and programs written in this language are known as scripts. Scripts describe the action that should be taken when a user interacts with a user interface element in the stack, called a part. A script might describe what should happen when a user clicks a button, chooses an item from a menu, or simply moves the mouse across the surface of the card.

As a user interacts with a stack's parts, HyperCard sends messages to them describing the nature of the interaction. Stack authors associate actions to parts by attaching a HyperTalk script that contains a message handler for each desired interaction. For example, HyperCard sends the mouseDoubleClick message to a part when the user double-clicks it with the mouse. If the script of the double-clicked part contains a handler for this message then that handler will be executed each time the part is double-clicked. Scripts can also send and respond to messages of their own invention, too.

When a message is sent to a part that has no handler to address it, the unhandled message is forwarded to other parts in the message passing order. For example, a message that's ignored by a button will be passed to the card on which the button appears. If the card also ignores the message, it gets forwarded to the background, then the stack, and finally back to WyldCard (which may provide some default behavior).

A simple script to prompt the user to enter their name then greet them might look like:

    -- This is my first script. It runs when the user clicks this part.

    on mouseUp
    ask "Hi! What's your name?"
    put it into theName
    if theName is not empty then answer "Pleasure to meet you, " & theName & "."
    end mouseUp

HyperTalk is a dynamically typed language. Internally, WyldCard stores each value as a string of characters and interprets it as a number, boolean, list, coordinate or rectangle depending on the context of its use. The language does not allow nonsensical conversions: 5 + "12" yields 17, but 5 + "huh?" produces an error. Some have argued that HyperTalk is an object oriented programming language whose objects are its user interface elements.

Keywords and symbols in the language are case insensitive. Thus, put x into y is the same as PUt x iNTo Y. Comments are preceded by -- and terminate at the end of the line. HyperTalk has no multi-line comment syntax like, /* ... */.

Indentation and most whitespace is ignored, but newlines have special meaning in the syntax and are somewhat analogous to semicolons in C-like languages. Statements must be separated by a newline, and a single statement cannot break across multiple lines.

For example, this is legal:

    answer "How are you today" with "Pretty good" or "Stinky!"

... but this is not:

    answer "How are you today" with
    "Pretty good" or
    "Stinky!"

To improve readability, HyperTalk offers a line-wrap symbol (¬) that can be used to break a long statement across lines. WyldCard also allows the the pipe character (|) to be used for this purpose. Either symbol must be immediately followed by a carriage-return in order to be valid, and a quoted string literal can never be wrapped across lines. For example,

    answer "This is totally acceptable!" |
    with "Love it" ¬
    or "Hate it"

