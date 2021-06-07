title=WyldCard
tags=language, jvm
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

## Language

### Branching and Looping
HyperTalk supports simple conditional branching (if-then-else; but no concept of switch/case), plus a very flexible syntax for looping.

**Conditional branching**
Conditionals have the following syntax:

    if <expression> then
    <statementList>
    [else
    <statementList>]
    end if

For example,

    if 1 < 2 and 3 < 4 then
    answer "This is true!"
    end if
    if the first line of field "Greeting" contains "hello" then
    put "Hello" into the message box
    else
    put "Goodbye" into the message box
    end if

Single-statement branches may appear on the same line as the if or else, clause:

    if the first word of the long date is not "Friday" then answer "Don't you wish it were Friday?"

To address the dangling else problem, HyperTalk does not support a multiline else-if construct. That said, nesting complex conditional logic can be achieved by nesting if statements. For example:

    ask "Yes, no or maybe?" with ""

    if it is "yes" then
    answer "Thank you for your support."
    else
    if it is "maybe" then
        answer "Make up your mind already."
    else
        answer "We never liked you anyway."
    end if
    end if

**Loop Constructs**
HyperTalk provides a variety of looping constructs. The overall syntax for each of them is

    repeat <repeat-condition>
    <statement-list>
    end repeat

At any point in the loop, the next repeat command may be used to terminate the current iteration (that is, skip all subsequent statements in <statement-list>) and continue looping. Similarly, the exit repeat command can be used to terminate the loop entirely, returning control to the next statement in the handler after end repeat.

**Repeat forever**

    repeat forever

Executes the enclosed statement-list forever. Sort of. Type cmd-. or ctrl-. at anytime to break execution of the loop. Note that WyldCard intelligently manages thread priority within an infinite loop; creating an infinite loop does not "lock up" the application.

    -- Count to infinity (and beyond!)
    repeat forever
    add 1 to the message
    end repeat
    Repeat until
    repeat until <boolean-expression>

Executes the enclosed statement-list until the Boolean expression is true; if the expression is initially true, the statement-list will not be executed.

    -- Make this part follow the mouse
    repeat until the mouse is down
    set the location of me to the mouseLoc
    end repeat

**Repeat while**

    repeat while <boolean-expression

Executes the enclosed statement-list as long as the Boolean expression remains true; if the expression is initially false, the statement-list will not be executed.

    -- Repeatedly send message to card while mouse hovers
    repeat while the mouse is within the rect of me
    send hovering to this card
    end repeat

**Repeat for**

    repeat for <numeric-expression> [times]

Executes the enclosed statement-list a pre-determined number of times.

    -- Beep three times
    repeat for 3 times
    beep
    end repeat

**Repeat with**

    repeat with <container> = <expression> [down] to <expression>

Executes the enclosed statement-list for as long as the first expression remains less than the second expression (or vice versa when using down to). Increments the first expression by one each time the loop executes and places the incremented value into the given container (decrements when using down).

    -- Hides all buttons and fields on this card
    repeat with n = 1 to the number of card parts
    hide card part n
    end repeat
    -- Shows all buttons and fields on this card
    repeat with n = the number of card parts down to 1
    show card part n
    end repeat

### Commands
A command is a directive to HyperTalk to perform a task.

A command does not represent a value and cannot be used as a term in an expression, even if the command places a value into the implicit variable, it. For example, (divide x by 3) + 2 is illegal, because divide x by 3 is an imperative and does not represent or return a value.

Note that the execution of a command results in a message of the same name being sent to the current card, enabling the card, background or stack to intercept command messages and trap its behavior as needed. See the section on message passing for more information.

WyldCard provides all of the commands shown in the table below:

Command | Description
------- | -----------
add | Adds a value to a container; for example add 3 to x or add card field id 0 to card field id 1
answer | Produces a dialog box with a message and up to three user-defined buttons. Follows the syntax answer <message> [with <button1> [or <button2>] [or <button3>]]]. Upon completion, it contains the text of the button selected by the user, or the empty string if answer is used without an optional button specifier.
answer file. | Produces a file chooser dialog, prompting the user to select a single file optionally of a specified type. For example, ask file "Choose a file" or ask file "Choose a picture" of type ".png"
arrowKey | Has the same effect as typing an arrow key on the keyboard (the exact behavior of which is determined by focus and the value of the textArrows global property). Accepts a single argument referring to the arrow direction, one of up, down, left or right.
ask | Similar to answer, but produces a dialog box with a message and a user-editable response string. Follows the syntax ask <message> [with <answer>]. Upon completion, it contains the value of the user-editable text field, or the empty string if the user cancelled the dialog.
ask file | Displays a directory chooser in which the user can enter a file name (same as a user would see when choosing 'Save As...' from the 'Edit' menu). The full directory path of the chosen file is put into the variable it. When the user cancels the dialog without making a selection, the result function returns Cancel. For example, ask file "Please choose a file" with "Untitled.txt".
ask password | Prompts the user to enter a password in which each entered character is obscured with a bullet. The value returned in the variable it is the SHA-256 cryptographic hash of the entered value, except when using the clear option (in which case, the plaintext is returned). For example, ask password "Enter your password:" with "p@ssw0rd" or ask password clear "Not keeping this a secret:"
beep | Causes the system to emit an alert/beep sound. Has no effect if the system has no alert sound.
choose | Selects a tool from the tool palette; choose brush tool or choose tool 7. Acceptable tool names and their corresponding numbers are as follows: browse (1), oval (14), brush (7), pencil (6), bucket (13), poly[gon] (18), button (2), rect[angle] (11), curve (15), reg[ular] poly[gon] (17), eraser (8), round rect[angle] (12), field (3), select (4), lasso (5), spray [can] (10), line (9), or text (16).
click | Clicks the mouse at a provided location on the card, while optionally holding down one or more modifier keys; click at "10, 10" or click at "130,220" with shiftKey, commandKey. Valid modifier keys are shiftKey, optionKey and commandKey. For security reasons, some operating systems (like macOS Mojave) require special accessibility permissions to be given to WyldCard to allow scripted mouse or keyboard control.
close file | Closes a previously opened file, writing any changes made via the write command to disk. Has no effect if the file is not open. For example, close file "/Users/matt/myfile.txt"
commandKeyDown | Has the same effect as typing a character (or a string of characters) while holding the command key down. Accepts one argument representing the character or characters to be typed while holding the command key. For example, commandKeyDown 1 is equivalent to typing command-1 (which invokes the "Go First" command from the menu bar).
controlKey | Has the same effect as typing a character (or a string of characters) while holding the control key down. Accepts one argument representing the character or characters to be typed. This differs from how HyperCard's controlKey command worked, which accepted a numeric keycode as its argument.
convert | Converts a date and/or time from one format to another. Syntax is convert { <container> / <value> } [[ from <format>] and <format>] to <format> [ and <format> ] where <format> is one of seconds (an integer value equal to the number of seconds since the epoch, Jan. 1, 1970), dateItems (comma-separated list of integers year, month, day, hour, minute, second, dayNumber), [ <adj> ] date, or [ <adj> ] time where <adj> is one of long, short, abbreviated, abbrev or english. When a value is specified (rather than a container), the conversion result is placed into it.
create menu | Creates a new menu in the menu bar, for example create menu "Help". Use the delete menu command to remove menus or reset menuBar to restore the menubar to its default state.
debug checkpoint | Pauses execution of the script and causes the HyperTalk debugger to open, highlighting this statement. Has no effect when executed from the message window.
dial | Produces the sound of a sequence of DTMF dial tones, for example, dial "1-800-588-2300".
delete menu | Deletes a menu from the menu bar, for example delete menu "File". Use reset menuBar command to restore the menu bar to its default state.
delete | Deletes a part from the card or background, or deletes a chunk of text from a container, for example, delete the last line of card field "My List", delete card button id 0, delete bkgnd field "Report"
disable | Disables a part, menu or menu item causing it to be drawn in a "greyed-out" state; sets the part's enabled property to false. For example, disable card button 3 or disable menuItem "Bold" of menu "Style"
divide | Divides a container by a value; divide x by it
do | Executes a value as if it were a list of statements; do "put 2+3 into the message window" or do the text of field myscript
doMenu | Finds a menu item (in the menubar) matching the given argument and performs the action associated with it (behaves as if the user chose the item from the menubar). Causes the doMenu theMenu, theMenuItem message to be sent to the card. Note that WyldCard searches the menu bar from left-to-right (File, Edit, Go, ...), top-to-bottom when looking for a matching menu item. The first item matching the given name (case insensitive) is invoked. For example, doMenu "Card Info..."
drag | Drags the mouse from one point to another while optionally holding down one or more modifier keys; drag from "35,70" to "200,180" with shiftKey. For security reasons, some operating systems (like macOS Mojave) require special accessibility permissions to be given to WyldCard to allow scripted mouse or keyboard control.
edit script | Displays the script editor of the given part. For example, edit script of button id 3 or edit the script of this card.
enable | Enables a part, menu or menu item; sets the part's enabled property to true. For example, enable menu "Objects".
enterInField | Equivalent to pressing the enter key in the currently focused text field. Has no effect when the focus owner is not a field.
enterKey | Equivalent to pressing the enter key on the keyboard.
exit | Interrupts the flow of execution. Use exit to HyperCard to immediately exit all pending script handlers; exit <message> to break out of a handler or function (for example, exit mouseUp); exit repeat to prematurely end execution of a loop. Note that the exit message is not sent to the card and cannot be trapped in script.
export paint | Saves an image of the displayed card (or the selected graphic, if a selection exists) to a given file. For example, export paint to file "Card Image.png".
find | Finds text in the stack or in a given field. Several forms of the command, see the "Searching & Sorting" section. For example, find chars "blah" of marked cards.
get | Get the value of a part's property and places it into the implicit variable it; get the visible of button id 0
go | Transitions to a new card; go to card 1 or go next or go to the last card
hide | Makes the menu bar, a part, image layer, or window title bar invisible. Syntax is hide <part-factor>, hide {card / background} picture, hide picture of {<card-factor> / <bkgnd-factor>}, hide titleBar, or hide menuBar. For example hide button id 0, hide picture of the last bg, or hide card picture. Note that hiding the menu bar on Mac OS X themed systems has no effect.
import paint | Pastes the graphics from a given file onto the current card's canvas (making the imported graphic the active selection). For example, import paint from file "Card Image.png".
keyDown | Equivalent to pressing the key (or keys) on the keyboard.
lock screen | "Locks" the screen until WyldCard is idle or the screen is unlocked explicitly via the unlock screen command.
mark | Marks cards matching a query or expression. Several forms including, mark <card-expression>, mark all cards, mark cards where <logical-expression>, mark cards by finding <term> [in <field-expression>]
multiply | Multiplies a container by a value; multiply x by 3
unmark | The inverse of 'mark'; unmarks cards matching a query or expression, unmark <card-expression>, unmark all cards, unmark cards where <logical-expression>, unmark cards by finding <term> [in <field-expression>]
open file | Opens a file for reading or writing. Specify either a file name or a path to a file. When only a file name is provided, the file is assumed to be in the "current" directory as returned by the JVM (user.dir system property). For example, open file myfile.txt or open file "/Users/john/Desktop/textfile.txt".
play | Plays a sound (boing, harpsichord or flute) optionally as a series of notes (c d# eh.) and with an optional tempo (play harpsichord tempo 200 "b a g a b b b"). See the Sound and Music section for details.
pop | Pops the identification of the last card pushed and places it into a container. If no container is specified, WyldCard navigates to the popped card. For example, pop card into the message window.
push | Saves the identification of a card or background in a last-in, first-out structure for later retrieval. For example, push card 13, push the next background or push card id 14.
put | Places a value into a container or into a chunk of a container; put "hello" into the third item of mylist. When no container is specified, the message box is implied as the default container. Note that HyperCard does not allow "putting" a value into a property, but WyldCard does. For example, put item 1 of the mouseLoc into item 1 of the location of me is legal in WyldCard but not in HyperCard.
read | Reads text from a file that was previously opened with the open file command into the variable it. Several forms, including read from file <filename> (reads the entire file identified by <filename> into memory), read from file <filename> for <count> (reads <count> characters from the current file position), read from file <filename> at <position> for <count> (reads <count> characters from the file starting at <position>), read file <filename> until <pattern> (reads the file until the given case-insensitive <pattern> is reached).
reset menuBar | Resets the menu bar to its default state; removes any custom menus added with the create menu command and restores any deleted menus to their default state.
reset paint | Resets the paint, pattern,brush, grid, and font selections to their default values.
save | Saves a copy of the current stack, or a specified stack, to a given file. For example, save this stack as "My Stack" or save stack "One Stack" as "Another Stack". If an error occurs, the result will contain an error message.
select | Selects a button or field as if the user had chosen the button or field tool and clicked on the part, or selects a range of text in a field, or moves the selection caret in a field. select <part>, select empty, select { before / after / } text of <part>, select { before / after / } <chunk> of <part>.
send | Send a message with optional arguments to a part; send "mouseUp" to field id 3 or send "myMessage 1,2" to this card
set | Sets the property of a part to a value (set the wrapText of field id 3 to (5 > 3)) or sets a global WyldCard property (set the itemDelimiter to "*"). If no such property exists, the given expression is placed into a container (variable) of that name.
show | Makes the menu bar, a part, image layer, or window title bar visible. Syntax is show <part-factor>, show {card / background} picture, show picture of {<card-factor> / <bkgnd-factor>}, show titleBar, or show menuBar. For example show button "My Button", show picture of card 2, or show card picture.
sort | Sorts the cards in the stack, or the lines or items of a container based on value or expression. See the section on sorting for details.
speak | Speaks text in a default or specified voice. See the "Speech" section for details.
subtract | Subtracts a value from a container; subtract (10 * 3) from item 2 of field "items"
tabKey | Has the same effect as typing tab on the keyboard.
type | Emulates the user typing a sequence of characters at the keyboard. For example, type "Hello world!". Add with commandKey to simulate typing a control sequence, for example, type "v" with commandKey to invoke the "Paste" command from the "Edit" menu.
unlock screen | Unlocks the screen while optionally applying a visual effect to the revealed changes. Use the syntax unlock screen [with visual [effect] <effect-name> [to <image>] [<speed>]] for animated transitions. See the "Visual Effects" section of this document for details.
visual effect | Specifies the visual effect to be used with any subsequent go command within the current handler. If the go command specifies its own visual effect, the go command's visual effect takes precedence. This command only affects navigation that occurs within the function/handler that invokes it.
wait | Waits for the specified condition or for the given amount of time. Follows the syntax wait { [for] <count> { ticks |seconds }|until <condition>| while <condition> }. Valid examples include: wait for 3 seconds, wait until the mouse is down, wait while the message box contains "hello"
write | Writes text into a file that was previously opened with open file. Several forms, including write <data> to file <filename> (writes the expression <data> to the file, overwriting the contents of the file), write <data> to file <filename> at end (appends data to the end of the given file; at end can also be specified as at eof), write <data> to file <filename> at <position> (writes data to the file starting at the given <position>). Note that data is not actually written to disk until the file is closed or WyldCard is quit.

### Expressions
An expression is any fragment of HyperTalk that represents or produces a value.

Literals (`"Hello!"`), constants (`pi`), containers, (`the first line of card field 1`), properties (`the name of me`), operators (`2 + 2`) and functions (`the short date`) are all expressions.

Some examples of valid expressions include:

    item 1 of the mouseLoc < 100 -- true if the mouse is towards the left of the card
    4 * (2 + 3) -- yields 20
    "hello" contains "el" and "goodbye" contains "bye" -- true
    3 * 5 is not 15 -- false
    "Hello" && "World" -- produces "Hello World"
    "Hyper" > "Card" -- true, "Hyper" is alphabetically after "Card"
    not "nonsense" -- syntax error, "nonsense" is not a boolean
    false is not "tr" & "ue" -- true, concatenating 'tr' with 'ue' produces a logical value

**Chunks**
HyperTalk provides a powerful syntax for addressing just a portion of an expression, called a chunk.

That is, a script can get or set any range of words, characters, lines, or comma-separated items of a value by specifying them numerically (`line 3 of`), positionally (`the last line of`, `the middle word of`), randomly (`any item of`), or ordinally (`the third line of`).

For example, consider these chunked expressions:

    the first character of the second word of the last line of field id 24
    character 19 to 27 of the message box
    the second item of "Hello,Goodbye" -- yields "Goodbye"
    the middle word of "one two three" -- yields "two"

When modifying a chunk of an expression, a preposition (before, into, or after) must be included in the put command. For example:

    put word 2 of "Hello Goodbye" into the first word of field id 0
    put "blah" after the third character of the middle item of myVar
    put 29 before the message box

Chunks can be used as terms in an expression to produce powerful and easy-to-understand logic:

    multiply the first character of card field "numbers" by 9
    if item 1 of the mouseLoc > item 2 of the mouseLoc then answer "Move left, captain!"
    sort the lines of bkgnd field 3 by the last word of each

HyperTalk even lets you to modify a chunk-of-a-chunk (or a chunk-of-a-chunk-of-a-chunk). For example:

    put "x" into the second character of the third word of the fourth line of field id 1
    put the first char of the second word of myContainer into the middle item of the last line of y

**Operators**
An operator is an expression that takes one or two values (called operands) and performs some operation on them that yields a new value.

As in mathematics, higher precedence operators are evaluated before lower precedence operators irrespective of their lexical order in the expression. For example, 2 + 3 * 4 yields 14, not 20, because the * operator has higher precedence than the + operator.

HyperTalk provides this suite of mathematical, logical, and string operators:

Precedence | Operator | Description
---------- | -------- | -----------
1 (highest) | `( )` | Grouping
2 | `-` | Negation for numbers (unary)
 | `not` | Negation for logical values (unary)
 | `there is a[n]` | Determines if the expression to the right of the operator refers to an existent stack part (unary)
 | `there is not a[n]`, `there is no` | Negation of object existence (unary)
3 | `^` | Exponentiation for numbers
4 | `*` | Multiplication for numbers
 | `/` | Division for numbers
 | `div` | Division for numbers
 | `mod` | Modulus division for numbers (returns the remainder)
5 | `+` | Addition for numbers
 | `-` | Subtraction for numbers
6 | `&` | Text concatenation; "a" & "b" yeilds ab
 | `&&` | Text concatenation by adding a space between operators; "a" && "b" yeilds a b
7 | `>` | Greater than comparison for numbers and text
 | `<` | Less than comparison for numbers and text
 | `<=`, `≤` | Less than or equal to comparison for numbers and text
 | `>=`, `≥` | Greater than or equal to comparison for numbers and text
 | `contains`, `is in` | Substring comparison for text; "hell" is in "hello" yeilds true
 | `is a[n]` | Determines if the left-hand value is a number, integer, date, point, rect (or rectangle), logical (or boolean, bool). Returns an error if the right-hand value is not an expression yielding one of these types.
 | `is not a[n]` | The logical inverse of is a, is an
8 | `=`, `is` | Equality comparison for text, arithmetic or logical values
 | `is not`, `<>`, `≠` | Negative equality comparison; the inverse of =, is
 | `is within` | Determines if the left-hand point value is contained within the right-hand rectangle value
 | `is not within` | Determines if the left-hand point value is not contained within the right-hand rectangle value
9 | `and` | Logical AND for boolean values
10 (lowest) | `or` | Logical OR for boolean values

**Factors**
A factor is an expression that refers to a part (like a card, button or field), which WyldCard interprets in whatever way is most meaningful to the context of its usage. Factors have the effect of making HyperTalk feel more like English than a computer programming language. Factors "do what I mean, not what I say."

For example, the `go` command expects to "go" to a navigable destination like a card or background. But, if you say `go to cd field 1`, WyldCard will assume that you mean to go wherever the text of that field refers, because a field is not a valid argument to go. Of course, if no such field exists, or if the text contained in that field doesn't actually refer to a navigable destination (such as `card 3 of stack "Fun Games"`) then WyldCard will produce an error.

This behavior is true of other commands that expect a reference to part as an argument.

**How factors work in WyldCard**
When a HyperTalk command expects an argument conforming to a specific object type (like a button), it uses this algorithm to determine how to interpret the factor:

1. If the argument expression is a grouped expression (that is, it has parentheses around it) then the expression inside the parens is evaluated and the resulting value is re-interpreted as a HyperTalk expression. If the re-interpreted expression refers to an object of the expected type, then that object becomes the argument to the command. For example, consider a card in which card field 1 contains the text card button 1. On this card, the command hide card field 1 has the effect of hiding the first card field, but, the command hide (card field 1) hides the button card button 1, not the field.

2. If the expression is an object literal referring directly to the expected object type, then the literal value is accepted as the argument to the command. In the previous example, removing the parentheses from the command causes the field itself to be hidden because card field 1 is an acceptable object literal for the hide command.

3. Finally, if the previous attempts don't produce a usable argument, then the expression is evaluated, and the result is treated as the argument. For example, when executing the command hide x, we find that x is neither a grouped expression, nor is it an object literal. HyperTalk then attempts to evaluate x as an expression. If a variable called x exists, then the value of that variable is treated as the argument to hide.

**Constants and literals**
The table below lists special values that are treated as constants in the language. These are special keywords in the syntax whose unquoted use always evaluates to the specified value. For example, put 3 + ten displays 13 inside the message window.

Constant | Value
-------- | -----
empty | The empty string, equivalent to ""
pi | The first 20 digits of pi, 3.14159265358979323846
quote | A double-quote character, "
return | The newline character (\n in Java)
space | A single space, equivalent to " "
tab | A tab character
formFeed | The form feed character (ASCII 0x0c, \f in Java)
lineFeed | The line feed character (ASCII 0x0a, \r in Java)
comma | The comma character, ,
colon | The colon character, :
zero..ten | The integers 0 to 10

Any single-word unquoted literal that is not a language keyword or an in-scope variable will be interpreted as though it were a quoted string literal. For example, put neat into x is equivalent to put "neat" into x. Multi-word unquoted literals are never allowed in WyldCard (e.g., put hello world results in a syntax error).

### 