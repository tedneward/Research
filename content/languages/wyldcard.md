title=WyldCard
tags=language, jvm, presentation, low-code
summary=A clone of Apple's HyperCard and HyperTalk scripting language.
~~~~~~

See also:
- [HyperCard](../platforms/hypercard.html)

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

[Branching and Looping](#branching-and-looping) | [Commands](#commands) | [Expressions](#expressions) | [Functions](#functions) | [Menus](#menus) | [Messages and Handlers](#messages-and-handlers) | [Parts](#parts) | [Properties](#properties) | [Searching and Sorting](#searching-and-sorting) | [Special Effects](#special-effects) | [Variables and Containers](#variables-and-containers)

### <a name="branching-and-looping"></a> Branching and Looping
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

### <a name="commands"></a> Commands
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
wait | Waits for the specified condition or for the given amount of time. Follows the syntax `wait { [for] <count> { ticks | seconds }|until <condition> | while <condition> }`. Valid examples include: `wait for 3 seconds`, `wait until the mouse is down`, `wait while the message box contains "hello"`
write | Writes text into a file that was previously opened with open file. Several forms, including write <data> to file <filename> (writes the expression <data> to the file, overwriting the contents of the file), write <data> to file <filename> at end (appends data to the end of the given file; at end can also be specified as at eof), write <data> to file <filename> at <position> (writes data to the file starting at the given <position>). Note that data is not actually written to disk until the file is closed or WyldCard is quit.

### <a name="expressions"></a> Expressions
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

### <a name="functions"></a> Functions
A _function_ directs HyperTalk to perform a task that produces some value. Therefore, functions can appear as a term in an expression. For example, `3 / the average of "1, 2, 3"` is a legal expression.

WyldCard provides a suite of built-in functions plus the ability to script new ones.

## Built-in functions

When invoking a built-in WyldCard function, there are several equivalent syntax forms that can be used:

* Use `the <function>` for built-in functions that don't accept any arguments. For example, `the mouseLoc` or `the screenRect` (the preceding `the` is required for no-argument functions).
* Use `[the] <function> { of | in } <argument>` for built-in functions that accept a single argument. For example, `the number of card buttons` or `sqrt of 25` (`the` is optional). WyldCard also allows this form to be used when invoking a function that accepts a list of arguments, provided the list is contained within quotes. For example, `the max of "1,2,3"` (HyperCard does not support this syntax).
* Use `function(<arg1>, <arg2>, ...)` for any kind of built-in functions. For example, `sum(3,5,9)` or `mouseLoc()` or `sqrt(25)`.

You cannot invoke a function handler defined inside of a script using either of the first two forms. Only WyldCard-provided functions can be invoked as `the <function>` or `<function> of ...`.

WyldCard includes the following built-in functions:

Function        | Description
----------------|-----------------------------------
`abs`           | Returns the absolute value of the given numerical argument.
`atan`          | Returns the trigonometric arctangent of the given argument, represented in radians.
`annuity`       | Given two arguments; an interest rate, and a number of periods, `annuity` returns the total value of an annuity that makes one payment per period at the given interest rate. Equivalent to `(1 - (1 + rate) ^ -periods) / rate`. For example, to calculate the monthly payment on a 30-year mortgage loan of a $100,000 at 3% interest, `100000 / annuity(.03 / 12, 30 * 12)` yields approximately `421.60`.  
`average`       | Returns the statistical mean of a list of numerical items. Example: `the average of "1,2,3,4,5"` (returns 3) or `average (93, 26, 77)` returns `65.33`.
`charToNum`     | Return the numerical _codepoint_ associated with the given character. The actual mapping between characters and numbers will depend on the character encoding used by the system, but `charToNum` is always assured to be the inverse of `numToChar`
`clickH`        | Returns the x-coordinate of the last location the user clicked the mouse.
`clickChunk`    | Returns a HyperTalk expression referring to the chunk of text last clicked in a text field. For example, `char 13 to 18 of background field 2`
`clickLine`     | Returns the line number of where the user last clicked in a text field.
`clickLoc`      | Returns the coordinate of the last location the user clicked the mouse.
`clickText`     | The last word that was clicked in a text field, or the empty string if no text has been clicked. For example, `put "You clicked " & the clickText`.
`clickV`        | Returns the y-coordinate of the last location the user clicked the mouse.
`commandKey`    | Returns the current state of the command key (and/or 'ctrl' key on PC hardware), either `up` or `down`. Also available as `the cmdKey`
`compound`      | Given two arguments; an interest rate, and a number of periods, `compound` returns the value of one unit of principal invested at the given interest rate compounded over the given number of periods. Equivalent to `(1 + rate) ^ periods`. For example, to calculate how much a $1,000 initial investment will be worth assuming a 3% annual rate of return compounded annually and invested over 6 years, `1000 * compound(.03, 6)` yields approximately `1194.05`.
`cos`           | Returns the trigonometric cosine of the given argument, represented in radians.
`date`          | Returns the current date in a variety of formats. Use `the date` or `the short date` to yield a date in the format `07/04/16`; use `the long date` or `the English date` for `Sunday, July 4, 2016`; use `the abbrev date` or `the abbreviated date` for `Sun, Jul 4, 2016`.
`diskSpace`     | Returns the number of free bytes on the filesystem containing WyldCard, or any specified filesystem. For example, `the diskSpace` or `the diskSpace of "/Volumes/Macintosh HD"`. Accepts the path of any disk, folder or file.
`exp`           | Returns the value of _e_ raised to the power of the given argument.
`exp1`          | Returns the value of _1-e_ raised to the number of the given argument.
`exp2`          | Returns the value of _2_ raised to the given argument; for example `the exp2 of 3` is equivalent to `2^3`.
`foundChunk`    | Returns a HyperTalk chunk identifying the currently highlighted search result text (the result of executing the `find` command). For example, `chars 13 to 17 of background field id 8`.
`foundField`    | Returns a HyperTalk expression representing the field containing the highlighted search result text. For example, `background field id 8`.
`foundLine`     | Returns a HyperTalk line chunk expression representing the line and field containing the highlighted search result. For example, `line 4 of background field id 8`.
`foundText`     | Returns the highlighted search result, that is, the text string that is presently box-highlighted on the card.  
`length`        | Returns the number of characters in the value of the given expression. Example: `the length of "Hello World!"` yields `12`.
`ln`            | Returns the natural logarithm of the given argument.
`ln1`           | Returns the natural logarithm of the given argument plus one.
`log2`          | Returns the base-2 logarithm of the given argument.
`max`           | Returns the maximum number passed to the function. For example: `min(3,5,7.24,9)` evaluates to `9`.
`menus`         | Returns a `return`-delimited list of menus appearing in the menu bar.
`message`       | Returns the contents of the message box. For example: `put the message box into aVar`. Also available as `message box` or `message window`
`min`           | Returns the minimum number passed to the function. For example: `min(3,5,7.24,9)` evaluates to `3`.
`mouse`         | Returns the current state of the left mouse button; either `up` or `down`
`mouseClick`    | Returns whether the mouse was pressed at any point since the current handler began executing.
`mouseH`        | Returns the x-coordinate of `the mouseLoc`; the number of pixels the mouse cursor is from the left border of the card.
`mouseLoc`      | Returns the current location of the cursor (in coordinates relative the top-left corner of the card panel), for example: `the mouseLoc` returns `123,55`
`mouseV`        | Returns the y-coordinate of `the mouseLoc`; the number of pixels the mouse cursor is from the top border of the card.
`number of`     | Returns the count of something within a given container. Several usages including: `number of words in <container>`, `number of chars in <container>`, `number of lines in <container>`, `number of items in <container>`, `number of card { buttons / fields / parts}`, `number of background {buttons / fields / parts}`, `number of menuItems in menu <menuName>`, `number of menus`, `number of cards`, `number of marked cards`, `number of backgrounds`, `number of cards in background <background>`.
`numToChar`     | Returns the character value associated with the given character _codepoint_. The actual mapping between numbers and characters will depend on the character encoding used by the system, but `numToChar` is always assured to be the inverse of `charToNum`
`offset`        | Accepts two values as arguments, `text1` and `text2`. Returns `0` if `text1` does not appear in `text2`, otherwise, returns the number of characters in `text2` where `text1` appears, counting from 1. For example, `offset("world", "Hello world")` yields `7`.
`optionKey`     | Returns the current state of the option key (and/or 'meta' key on Unix hardware), either `up` or `down`. For example, `repeat while the optionKey is up`
`param`         | Returns the value of the given numbered parameter (or, more accurately, it returns the parameter's _argument_). Use `0` to retrieve the name of the  handler or function. For example, in the context of the function `myFunction("V1","V2")`, `the param of 1` would yield `V1`; `the param of 0` would yield `myFunction`.
`params`        | Returns a comma-separated list of arguments passed to the given handler or function. For example, in the context of `myFunction(1,2,3)`, `the params` would yield `1, 2, 3`.
`paramCount`    | Returns the number of parameters passed to the current handler of function.
`random`        | Returns a random integer between 0 and the given argument. Example: `the random of 100` or `random(10)`.
`result`        | Accepts no arguments and provides the value returned from a function or message handler, or the error status reported by certain commands.
`screenRect`    | The rectangle of the screen on which the card is displayed, for example `put item 3 of the screenRect into screenWidth`
`seconds`       | Returns the number of seconds since midnight, January 1, 1970 UTC.
`selectedChunk` | Returns a chunk expression in the form `char x to y of container` describing the active text selection; returns `empty` if no selection exists.
`selectedField` | Returns a chunk expression identifying the part containing the active selection, for example `the selectedField` yields `card field id 13`
`selectedLoc`   | Returns the location (in card-relative coordinates) of the text insertion caret last active in a focused text field.
`selectedLine`  | Returns a chunk expression identifying the line or lines in a field containing the active selection. For example, `the selectedLine` yields `line 2 to 7 of background field id 4`
`selectedText`  | Returns the currently selected text within whichever field is in focus, or the empty string if no selection exists. For example, `answer the selectedText`
`shiftKey`      | Returns the current state of the shift key, either `up` or `down`. For example, `wait until the shiftKey is down`
`sin`           | Returns the trigonometric sine of the given argument, represented in radians.
`speech`        | Returns the text currently being spoken via the `speak` command, or `done` if nothing is being spoken.
`sqrt`          | Returns the square root of the given argument or `NaN` of the argument is negative.
`sound`         | Returns the name of the currently playing sound, or `done` if no sound is being played.
`stacks`        | Returns a line delimited list of currently open stacks. HyperCard orders this list by z-order; WyldCard guarantees no ordering.      
`sum`           | Returns the sum of the arguments. For example, `sum(1,3,8)` yields `9`.
`tan`           | Returns the trigonometric tangent of the given argument, represented in radians.
`target`        | Returns a HyperTalk expression referring to the part that first received the current message. For example, `the target` might yield `card button id 13`. Note that `the target` is a function, but `target` is a container.
`themes`        | Returns a comma-separated list of available Java Swing look-and-feels installed on this system. The function does not exist in HyperCard.
`ticks`         | Returns the number of ticks (1/60th second) since the JVM was started.
`time`          | Returns the time of day in a variety of formats. Use `the time`, `the abbrev time`, `the abbreviated time` or `the short time` to yield a time in the format `11:15 AM`; use `the long time` or `the English time` for `11:15:27 AM`.
`tool`          | Returns the name of the currently selected tool. Example: `if the tool is "brush" then answer "Happy painting!"`
`trunc`         | Returns the integer portion of the given numerical argument; for example `the trunc of 8.99` yields `8`.
`value`         | Evaluates the given factor as a HyperTalk expression and returns the result. Example: `the value of ("3" & "*4")` yields `12`.
`voices`        | Returns a list of installed voices. This function is unique to WyldCard and does not exist in HyperCard.
`windows`       | Accepts no arguments and returns a return-delimited list containing the name of every window in alphabetical order (note that HyperCard returns this list in Z-order; WyldCard guarantees no ordering).

## Function handlers

A function handler is a subroutine scripted by the user that performs some action and optionally returns a value. More accurately, all user-defined functions return a value, but those which do not explicitly call `return` implicitly return `empty`.

Note that user-defined function handlers may not...

* Be invoked using the `[the] <function> of ...` syntax (like you'd use with a built-in HyperTalk function)
* Have the same name as another function in the same script, or the same name as a HyperTalk keyword. HyperTalk does not support function overloading (two functions with the same name but having different parameters).
* Be nested inside of other functions or handlers

If a function handler is not defined in the same script in which it is invoked, the message passing order is used to locate the function handler. Thus, if a card button attempts to invoke `myFunction()` and the button's script does not define `function myFunction` then the card's script is searched, then the background's, then the stack's. However, unlike message handlers, invoking a function for which no function handler exists results in a syntax error.

The syntax for defining a function handler is:

```
function <functionName> [<arg1> [, <arg2>] ... [, <argN>]]]
  <statementList>
  [return <expression>]
end <functionName>
```

When calling a user-defined function, use the syntax `<functionName>(<arg1>, <arg2>, ...)`. The number of arguments passed to the function must match the number declared in the handler.

Consider this recursive function for generating the Fibonacci sequence:

```
on mouseUp
  answer fibonacci(empty, 0, 1, 200)
end mouseUp

function fibonacci sequence, lastValue, thisValue, maxValue
  if sequence is empty then put "0" into sequence
  put thisValue + lastValue after the last item of sequence

  if thisValue + lastValue <= maxValue then
    return fibonacci(sequence, thisValue, thisValue + lastValue, maxValue)
  else
    return sequence
  end if

end fibonacci
```

### <a name="menus"></a> Menus
HyperTalk can specify the menus and menu items that appear in the menu bar and define the action taken when a menu item is chosen.

However, changes to the menu bar are not "saved" as part of the stack, nor are they restricted to the current stack. Modifications to the menu bar will not be restored when opening a saved stack, and navigating to a different stack does not restore the menu bar to its default state. Stack authors should use the `on openStack` or `on resumeStack` handlers to configure the menu to a desired state each time the stack is opened or becomes the focused window.

Even though the behavior of a menu is scriptable, menus themselves do not "contain" a script. Nor are they assigned an ID.

The list of menus appearing in the menu bar is retrievable via `the menus` function. For example, `if the menus contains "Edit" then delete menu "Edit"`

#### Referring to menus

A menu or menu item can be addressed by name (`"Edit" menu`, `"Undo" menuItem of menu "Edit"`) or by its position (`the third menu`, `menu 5`, `menuItem 6 of menu "Font"`). When referring to a menu, the resultant value is a line-separated list of menu items that appear in the menu (a single hyphen character, `-`, is used to denote a separator). When referring to a menu item, the value of the item is its name (i.e., `"Undo" menuItem of menu "Edit"` yields `Undo`).

For example,

```
if menu "Objects" contains "Card Info..." then answer "Try choosing 'Card Info...'"
put the second menu into editMenuItems    -- typically all the menu items in the Edit menu
answer the first menuItem of menu "Edit"  -- typically responds with 'Undo'
```

#### Creating menus and menu items

New menus are added to the menu bar using the `create` command and removed using the `delete` command. For example, `create menu "My Custom Menu"` or `if the menus contains "My Custom Menu" then delete menu "My Custom Menu"`. When creating a new menu, it will be added to the end of the menu bar (rightmost position).

You cannot create two menus that share the same name, nor can you delete a menu that does not exist.

The value of each menu is treated as a list. You can add, delete, or modify menu items by mutating items in the menu's value. For example, to replace the contents of a menu `put "Item 1,-,Item 2" into menu "My Custom Menu"`. To append items to a menu, `put "Item 3" after the last line of menu "My Custom Menu"`. To delete a menu item, `delete the second line of menu "Edit"`

Use the `reset menuBar` command to eliminate any changes you've made to the menu bar and restore the default WyldCard menus and menu items.

#### Responding to selections in the menu bar

Menus created by script have no default behavior assigned to them. However, when the user chooses a menu from the menu bar, the `doMenu` message is sent to the current card. A handler placed in the script of the card, background or stack can intercept this message and provide custom behavior. (Note that `popup`-styled buttons do not send the `doMenu` message; only menus in the menu bar send this message).

For example, place the following handler in a stack script to prompt the user to confirm if they really want to edit the background of the card:

```
on doMenu theMenu, theMenuItem
  if theMenu is "Edit" and theMenuItem is "Background" then
    answer "Are you sure you want to edit the background?" with "OK" or "Cancel"
    if it is "OK" then pass doMenu
  else
    pass doMenu  -- Don't interrupt other menu selections
  end if
end doMenu
```

By invoking `pass doMenu` we're letting WyldCard respond to these menu selections. In the case where the user chooses "Background" and does not click "OK" in the dialog box, we are not passing `doMenu` and thereby "trapping" the menu selection and preventing WyldCard from acting upon it.

#### Special considerations

Menus in WyldCard differ from Apple's HyperCard in a few ways:

* In HyperCard, if a script created a menu item with the same name as a HyperCard menu item, the new item would inherit the behavior of HyperCard's original menu item. This is not true in WyldCard.
* WyldCard cannot access or control the behavior of the menus produced by the operating system (such as the Apple or "WyldCard" menu on macOS systems). These menus cannot be deleted or modified, and selecting an item from one of these menus does not produce a `doMenu` message (thus, the stack cannot take action when the user selects an item from them).
* When getting the contents of a menu from the menu bar, the result will be a list of lines (each line being the name of a menu item or `-` to denote a separator). This is true even if the menu items were `put` into the menu as a single-line list of values.

### <a name="messages-and-handlers"></a> Messages and Handlers
A HyperTalk script is a set of _message handlers_ and _function handlers_ that describe how the part reacts when WyldCard sends a message to it. A message handler traps incoming messages. A function handler is a subroutine that can be invoked by a message handler to compute and return a value.

As previously noted, WyldCard automatically sends messages to parts as the user interacts with them. However, messages are not limited to WyldCard's origination: A script can invent its own messages and send them to itself or to other parts.

Simply invoking the name of a message as a statement in a script "sends" the message to the current part. For example, consider this script:

```
on mouseUp
  answer "Hello World" with "Why, thank you."
  mouseUp    -- uh oh, this creates an infinite loop
end mouseUp
```

The result of this code is an infinite loop: After displaying the "hello world" greeting, the button sends itself the `mouseUp` message, which causes the handler to execute again. Press `command-period` (or `control-period`) to abort a runaway script.

To send a message to different part, use the `send` command. For example, `send "mouseUp" to background button 1`.

## Message parameters

Every message has a name (like `mouseUp`) that identifies which handler should handle it. Messages may also contain arguments.

For example, we could define a message called `greet` whose argument defines the name of the person to greet. We'd invoke this message as `greet "Bill"` or `send "greet Bill"`.

Then, a handler to handle this message would be written like:

```
on greet thePerson
  answer "Hi " & thePerson
end greet
```

HyperTalk does not require that the number of message arguments match the number of parameters defined by the handler. If a handler defines more parameters than actual arguments provided with the message, the unspecified parameters are bound to `empty` (`""`). In the previous example, `send greet` is equivalent to `send greet ""`. Both cause the `greet` handler to execute with `thePerson` bound to the empty string.

HyperTalk does not differentiate between handlers that handle the same message but which accept a different number of arguments (known as [overloading](https://en.wikipedia.org/wiki/Function_overloading)). When a script defines two handlers for the same message, only the first handler lexically appearing in the script will ever be used handle the message (subsequent handlers are effectively unreachable).

#### Message passing order

Messages automatically traverse a hierarchy of objects: If a part receives a message and does not have a handler to handle it (or, if its handler invokes the `pass` command), then the message is forwarded to the next part in the sequence.

Messages follow this sequence:

**Buttons** and **fields** pass messages to the **card** or **background** on which they appear; a card passes messages to its **background**; and a background passes messages to its **stack**. If the stack does not trap the message, then the message is passed to **WyldCard** which handles the message itself.

This message passing architecture empowers parts to override system behavior by _trapping_ event messages. For example, add the following script to a field to disallow entry any of any character other than an even number:

```
-- Prevent user from typing anything other than an even number in this field.
on keyDown theKey
  if theKey is a number then
    if theKey mod 2 is 0 then pass keyDown
  end if
end keyDown
```

This works because WyldCard sends the `keyDown` message to the field when a user types a character into it. Because this script declares an `on keyDown` handler, the script traps this message and prevents WyldCard from acting on it (WyldCard's action would be to insert the typed character in the field's text).

However, when the typed character is an even number, the script invokes `pass keyDown` which explicitly forwards the message through the message passing order to WyldCard. Thus, by implementing this handler and only conditionally passing the `keyDown` message back to WyldCard, the script can "steal" these key press events and prevent their normal behavior.

Note that HyperTalk does not short-circuit logical evaluations as many programming languages do. The script cannot be simplified to `if theKey is a number and theKey mod 2 is 0` because in the case of `theKey` being a non-numeric value, the `mod` expression will produce an error.

Anytime a command is executed in HyperTalk, a message of the same name as the command is sent to the current card. The enables the same capacity for trapping the behavior of commands. For example, adding the following script to a card, background or stack prevents the `create` (menu) command from doing its job:

```
on create
  answer "Are you sure you want to create a menu?" with "Yes" or "No"
  if it is "Yes" then pass create
end create
```

#### Messages automatically sent by WyldCard

WyldCard automatically sends the following messages to parts as the user interacts with the stack:

 Event Message      | Description
--------------------|-----------------------------------------------------------------------------
 `arrowKey`         | Sent when an arrow key is pressed; sends the arrow key's direction as an argument to the message (one of `up`, `down`, `left` or `right`).
 `commandKeyDown`   | Sent when the command key (or the _meta_ key, on non-macOS systems) is pressed in conjunction with another key (for example, `cmd-x`); passes the character typed as the argument to the message.
 `controlKey`       | Sent when the control key is pressed in conjunction with another key; passes the character typed as the argument to the handler. This differs from HyperCard's implementation, which passed a numeric keycode as its argument.
 `choose`           | Sent to the current card when the tool selection changes; passes the tool name and tool number as arguments (for example, `choose "Brush", 7`).
 `closeCard`        | Sent to the current card when navigating away from it.
 `deleteCard`       | Sent to the current card just before it is removed from the stack.
 `doMenu`           | Sent to the current card when the user chooses a menu from the menu bar; passes the menu name and menu item name as arguments, for example, `doMenu "Edit", "Undo"`
 `enterKey`         | Sent when the enter key is pressed.
 `enterInField`     | Sent when the enter key is pressed while typing in a field.
 `exitField`        | Sent to editable fields when they lose focus.
 `functionKey`      | Sent when a function (i.e, F1) key is pressed; sends the number of the function key as its argument (`on functionKey whichKey`, where `whichKey` is a number between 1 and 12)
 `idle`             | Periodically sent to the current card when there are no other scripts executing.
 `keyDown`          | Sent when a key is typed over a focused part; sends the key as an argument to the message, for example, `on keyDown theKey`.
 `mouseDoubleClick` | Sent when the mouse is double-clicked over a part.
 `mouseDown`        | Sent when the mouse is pressed over a part.
 `mouseEnter`       | Sent when the cursor enters the bounds of a part. Note that WyldCard sends this message to cards, too, but HyperCard did not.
 `mouseLeave`       | Sent when the cursor leaves the bounds of a part. Note that WyldCard sends this message to cards, too, but HyperCard did not.
 `mouseStillDown`   | Sent when the mouse is long-pressed (held down) over a part.
 `mouseUp`          | Sent when the mouse is pressed and released (clicked) over a part.
 `mouseWithin`      | Send repeatedly to buttons and fields while the mouse is within their bounds.
 `newCard`          | Sent to new cards when they are added to the stack.
 `newButton`        | Sent to buttons when they are first added to a card or background. New buttons will have no script to handle this message (but cut-and-pasted buttons may), plus card and background scripts in the message passing order may respond to this message, too.
 `newField`         | Sent to fields when they are first added to the card or background. See also `newButton`.
 `returnInField`    | Sent when the return key is pressed while typing in a field.
 `returnKey`        | Sent when the return key is pressed.
 `openCard`         | Sent to cards as they are displayed in the stack window (as a user navigates to them).
 `openField`        | Sent to editable fields when they gain focus.
 `openStack`        | Sent to a stack when it is opened in WyldCard.
 `resumeStack`      | Sent to the current card of a stack when it gains focus from another stack window.
 `suspendStack`     | Sent to the current card of a stack when it loses focus to another stack window.
 `tabKey`           | Sent when the tab key is pressed.

Parts do not need to implement a handler for every message they might receive. Messages for which no handler exist are simply ignored.

#### Multithreading in WyldCard

Script execution in HyperCard is essentially single-threaded, but in WyldCard up to eight scripts can execute concurrently. This threading behavior is implicitly managed by WyldCard as there are no constructs in the HyperTalk language to manage threads of execution.

Each time WyldCard sends a message to a part (e.g., `mouseUp`) it attempts to execute that message's handler on one of the eight available threads. If all threads are currently busy executing other scripts, then execution of the handler will be enqueued for processing when one of the other scripts completes.

Any messages generated in the execution of a handler will execute synchronously and on the same thread as the calling handler. In other words, only messages produced by WyldCard can execute on different threads. Once a script starts executing, all messages and functions in its call stack are single-threaded.

### <a name="parts"></a> Parts
A _part_ is a scriptable user interface element.

Buttons, fields, cards, backgrounds and the stack itself are parts. Menus and windows are also controllable via HyperTalk, but you cannot attach a script directly to them. See the section below for details about [controlling the menu bar](#menus).

Every part maintains a set of _properties_ that describe its look-and-feel (like its size, location and style). Modifying a part's [[properties]] changes the way the part looks and behaves.

Parts may be addressed in HyperTalk by their name, number, or ID, and a part can refer to itself as `me`. You can refer to buttons and fields on other cards, other backgrounds, or even in other stacks, too. For example, `get the width of card button "Push Me" of card 3 of background id 2 of stack "Cool Stuff"`.

#### Part IDs

In WyldCard, each part in the stack is assigned a ID (unique to that stack) which never changes and will never be reused (even if the part is deleted). Be aware that HyperCard and WyldCard differ in the way they generate and assign part IDs; WyldCard's IDs might not look exactly like HyperCard's.

For example:

```
hide card button id 0
put "I like IDs" into background field id 22 of card 3
```

#### Part Numbers

A part's _number_ represents its logical order in the collection of other parts of the same type.

For buttons and fields, their part number represents their drawing order (_z-order_) on the card or background on which they appear. Higher numbered parts are drawn before lowered numbered parts and thereby appear behind them. Use the "Bring Closer" or "Send Further" commands in the "Objects" menu to change a button or field's number.

For cards and backgrounds, their number represents their position in the stack. Card number 1 is the first card in the stack, card number 2 is the second, and so forth. Backgrounds are similarly numbered by their first appearance in the stack. You can refer to fields and buttons relative to all other parts on the same layer of the card (`background part 14`) or relative to other parts of the same type (`bkgnd button 13` or `bkgnd field 3`).

For windows, HyperCard assigned their number based on the window's front-to-back position. However, WyldCard assigns windows a number based on their title's alphabetical order (a limitation imposed by the multi-platform windowing systems that WyldCard supports).

You cannot directly change the number of a part by setting its number property. For example, `set the number of this card to 10` is illegal.

A few examples:

```
add 20 to the height of card button 1.
set the name of background part 9 to "Number 9"   -- might be a card or a field
hide window 4
```

Note that `button 1` refers to button _number_ one, whereas `button "1"` refers to the button _named_ "1".

#### Part Names

Every part has a name which can be edited by the stack author or changed via script. Because parts are not required to have unique names, the part with the lowest number will be assumed when referring to a name shared by multiple parts.

```
get the height of background button "My Neat Button"
put "2 * 2 = 4" after card field "Math" of the first card
```

### <a name="properties"></a> Properties
[Common](#common-properties) | [Buttons](#button-properties) | [Fields](#field-properties) | [Text](#text-properties) | [Menus](#menu-properties) | [Cards](#card-and-background-properties) | [Stack](#stack-properties) | [Window](#window-properties) | [WyldCard](#wyldcard-properties)

A property is a HyperTalk-addressable attribute that determines how an object looks, feels, and reacts to user interaction.

Note that WyldCard treats properties as "first class" containers that can be accessed in whole or by chunk the same way you'd access any other value. HyperCard was not quite so flexible; properties always had to be read using the `get` command and written using the `set` command.

For example,

```
set the lockText of field "Not Editable" to true
add 10 to the left of the message box
set the itemDelimiter to "|"
repeat while the mouseLoc is within the rect of me
```

## Common properties

All WyldCard objects share these properties:

Property      | Description
--------------|--------------------------
`bottom`      | Returns or sets the bottom-most border of the part's location, moving the part vertically when changed but not affecting its height.
`bottomRight` | Returns or sets the bottom-right coordinate of the part. When set, this property adjusts the part's position on the card but does not affect its `height` or `width`. This property accepts a _point_ value consisting of a comma-separated _x_ and _y_ coordinate, for example, `set the bottomRight of me to "10, 100"`
`contents`    | Returns or sets the value of this object. For example, `set the contents of cd field 1 to "Hello"` is equivalent to, `put "Hello" into cd field 1`. This property does not exist in HyperCard.
`enabled`     | Returns or sets whether the part is enabled. When disabled, the part appears "grayed out". Note that disabled parts continue to receive user interface generated messages such as `mouseUp` or `mouseEnter`. May also be set with the `enable` and `disable` commands. Not applicable to window, stack, card or background parts.
`height`      | Returns or sets the height of the part (in pixels). Read only when applied to part types whose size cannot be changed (like cards and background).
`id`          | Returns the part's ID. Each part has a globally unique ID that is assigned by WyldCard at creation and cannot be changed.
`left`        | Returns or sets the left-most border of the part's location, moving the part horizontally but not affecting its width.
`location`    | Returns or sets the center-point of the part. Also known as `loc`.
`name`        | Returns or sets the script-addressable name of the part (on buttons, this value determines the label or text that appears drawn on the button).
`number`      | Returns the _number_ of the part, a value representing its order relative to other parts of the same type. This value is read only.
`rectangle`   | Returns or sets the rectangle of the part, equivalent to getting or setting the `top`, `left`, `height` and `width` properties together. This property only accepts a _rectangle_ value, consisting of two, comma-separated point coordinates representing the top-left and bottom-right positions of the part, for example `"10, 10, 100, 100"`. This value is also accessible as `rect`. Read only for parts whose size cannot be changed.
`right`       | Returns or sets the right-most border of the part's location, moving the part horizontally but not affecting its width.
`script`      | Retrieves or replaces the current script of the part.
`top`         | Returns or sets the top-most border of the part's location, moving the part vertically but not affecting its height.
`topLeft`     | Returns or sets the top-left coordinate of the part. When set, this property adjusts the part's position on the card but does not affect its `height` or `width`. This property only accepts a _point_ value consisting of a comma-separated _x_ and _y_ coordinate, for example, `"10, 100"`
`width`       | Returns or sets the width of the part (in pixels). Read only when applied to part types whose size cannot be changed (like cards and background).

#### A note about the script property

In HyperTalk, it's possible to author self-modifying scripts by writing to the `script` property. This was common practice in a few stacks that shipped with HyperCard. However, be aware that if you attempt to reuse self-modifying scripts from these old stacks, you'll likely run into bugs introduced by a nuanced difference in the way this property behaves in WyldCard.

In HyperCard, when setting the value of the `script` property, the HyperCard script editor would pretty-print the text put into this property. That is, anything put into the `script` property might be changed on-the-fly (by HyperCard) so that it appears neatly formatted when viewed in the script editor. In mathematical terms, HyperCard's `script` property violates the reflexive property: The value you `get` reading the `script` property may not equal the value you `put` into it.

WyldCard does not modify text put into the `script` property. Scripts originally written to account for HyperCard's pretty printing behavior will function poorly inside WyldCard.

## Button and field properties

In addition to the properties listed above, all button and field parts share these properties:

Property      | Description
--------------|--------------------------
`selectedText`| For fields, returns the currently selected text. For buttons, returns the selected menu item of `popup`-style buttons or the empty string for all other button styles. This property is read-only; it cannot be set via HyperTalk.
`style`       | Sets or retrieves the style of the part (see the tables below for available button and field styles).
`textAlign`   | Returns or sets the text alignment of the part; one of `left`, `right` or `center`. Assumes `center` if any other value is provided.
`textFont`    | Returns or sets the font (family) of the part. Uses the system default font if the specified font family does not exist.
`textSize`    | Returns or sets the size (in points) of the part's text.
`textStyle`   | Returns or sets the text style attributes of the part. Valid style attributes include `plain`, `bold`, `italic` (plus `strikeThrough`, `underline`, `subscript` and `superscript` when addressing fields). Provide a list to set multiple attributes together (i.e., `set the textStyle of me to "bold, italic"`)
`visible`     | Returns or sets the visibility of the button (a Boolean value). When invisible, the part is not drawn on the screen and receives no messages from WyldCard. This value can also be accessed using the `hide` and `show` commands.

## Button properties

Buttons come in a variety of _styles_ which define their look-and-feel. WyldCard supports the following button styles:

Style              | Name          | Notes
-------------------|---------------|----------------------
Native             | `native`      | A push button whose style matches that of the current operating system.
Classic            | `classic`     | A push button drawn in the style of Mac OS Classic.
Default            | `default`     | A Mac OS Classic push button with a heavy outline (this style was used in MacOS Classic to indicate a button that could be selected by pressing enter).
Round Rect         | `round rect`  | HyperCard's original push button style; drawn as a round-rectangle with a drop shadow.
Shadow             | `shadow`      | A push button drawn with a drop-shadow decoration.
Oval               | `oval` | A push button drawn with an oval border.
Rectangular        | `rectangular` | A push button drawn with a rectangular border.
Transparent        | `transparent` | A push button drawn without any decoration or border; can be placed atop of graphics on the card to make any region of the card "clickable"
Opaque             | `opaque`      | A rectangular push button drawn without a border.
Checkbox           | `checkbox`    | A checkbox drawn in the style provided by the operating system. When `autohilite` is true and the `family` property is an integer value, then clicking this button will cause the `hilite` of all other buttons in the family to become `false` and the `hilite` of this button to become true.
Radio              | `radio`       | A radio button drawn in the style provided by the operating system. When `autohilite` is true and the `family` property is an integer value, then clicking this button will cause the `hilite` of all other buttons in the family to become `false` and the `hilite` of this button to become true.
Popup              | `popup`        | A drop-down (_combo box_) menu drawn in the style provided by the operating system. Each line of the button's contents are rendered as a selectable menu item.

In addition to the properties common to all parts, a button has these additional unique properties:

Property    | Description
------------|------------
`autoHilite`| Returns or sets whether the button's `hilite` property is managed by WyldCard. When `autoHilite` is `true`, checkbox and radio buttons automatically check/uncheck when clicked, and other styles of buttons highlight when the mouse is down within their bounds.
`hilite`    | Returns or sets whether the button is drawn "highlighted"; for checkbox and radio styles, hilite describes whether the checkbox is checked or the radio button is selected; for other styles, `hilite` describes a "pressed" state--a highlight typically drawn while the user holds the mouse down over the part. This property has no effect on `popup` style buttons.
`iconAlign` | Sets the alignment of the icon relative to the button's label (name), one of: `left`, `right`, `top` or `bottom` (default). Has no effect on buttons that do not have an icon. This property did not exist in HyperCard.
`showName`  | Returns or sets the visibility of the button's name (a Boolean value). When false, the button is drawn without a name.

#### Field properties

In WyldCard, fields come in four styles. HyperCard provided a specific style of scrollable text field, but in WyldCard, every style of field is scrollable. (Scrolling can be disabled by setting the `scrolling` property to `false`.)

Style                                            | Name          | Notes
-------------------------------------------------|---------------|-------------------------
![Default](images/rectangle-field.png)       | `rectangle`   | An opaque field drawn with a rectangular border (drawn in the style of the operating system).
![Default](images/shadow-field.png)          | `shadow`      | An opaque field drawn with a drop-shadow border.
![Opaque](images/opaque-field.png)           | `opaque`      | An opaque field drawn without a border.
![Transparent](images/transparent-field.png) | `transparent` | A transparent field drawn without a border.

A field has these unique properties:

Property        | Description
----------------|----------------------
`autoSelect`    | When true, the field behaves as a list; clicking a line in the field automatically hilites (selects) the entire line of text.
`autoTab`       | When true, typing tab in the field causes focus to move to the next focusable UI component; when false, typing tab inserts a tab character into the field contents.
`lockText`      | Returns or sets whether the text contained by the field can be edited by the user.
`showLines`     | Returns or sets whether dotted baselines are drawn underneath the text (imitates ruled notebook paper)
`dontWrap`      | Returns or sets whether text automatically breaks (wraps) at the visible edge of the field. When false, the field will scroll horizontally until a `return` character is reached.
`multipleLines` | Determines if multiple lines of text can be selected in auto-select mode. That is, whether the _list field_ allows multiple selections or not. Has no effect when the `autoSelect` property is `false`.
`scroll`        | The number of pixels that have scrolled from the top of the field; `0` indicates that the first line of text is visible at the top of the field. Has no effect if the field is not scrolling.
`scrolling`     | Enables or disables vertical scrolling in this field. This property does not exist in Apple's HyperCard.
`sharedText`    | When `true`, each card in the background shares the same text in the field. When `false`, each card in the background can place a unique value into the field. Has no effect on card fields.
`wideMargins`   | Returns or sets whether the field is drawn with a wider, 15-pixel margin between its text and border.

#### Text properties

The properties of text within a field can also be addressed in HyperTalk: A script may get or set the font, size and style of a chunk of text within a field.

Property     | Description
-------------|----------------------
`textFont`   | Returns or sets the font family of the identified chunk of text
`textSize`   | Returns or sets the text size of the identified chunk of text
`textStyle`  | Returns or sets the style (`bold`, `italic` or `plain`, `underline`, `strikeThrough`, `superscript` or `subscript`) of the identified range of text.

For example,

```
set the textStyle of the last word of card field "Some Text" to "bold, italic"
add 3 to the textSize of the middle line of field 6
```

#### Menu properties

The name, accelerator key (shortcut), disabled state and checkmark of a menu item can be modified in HyperTalk by referring to these properties.

Menu Property   | Description
----------------|---------------
`name`          | A string value representing the name (text) of the menu item. For example, `set the name of menuItem "Italic" of menu "Style" to "Oblique"`
`commandChar`   | A single character representing the accelerator key (the command or control-key sequence that can be typed to execute the command). Note that only command/control-key accelerators are supported; you cannot combine with shift or other keys. If more than one character is specified, the first character in the value will be used.
`enabled`       | A boolean value representing whether the menu item is enabled (selectable). For example, `set the enabled of menuItem "Back" of menu "Go" to false`. Also available via the `enable` and `disable` commands.
`checkmark`     | A boolean value indicating whether the menu has a checkmark next to it. For example, `set the checkmark of menuItem "Plain" of menu "Style" to not the checkmark of menuItem "Plain" of menu "Style"`

#### Card and background properties

Cards and backgrounds are objects in WyldCard that support these unique properties:

Property     | Description
-------------|----------------------
`marked`     | A general-use, logical-valued "flag" indicating that the card is somehow special; useful for classifying or limiting search and sort results. For example, `sort the marked cards of this stack ...`. (Applies only to cards)
`cantDelete` | A logical value indicating that the card or background cannot be deleted from the stack (without first clearing this flag). When applied to a background, cards in the background may be deleted provided at least one card of the background remains.
`dontSearch` | When true, indicates that fields appearing on this card (or any card sharing this background) will not be searched by the `find` command.
`showPict`   | A logical value specifying if the card or background picture is visible.

#### Stack properties

WyldCard stacks support these properties:

Property     | Description
-------------|-----------------------
`cantPeek`   | When true, holding `command`-`option` will not highlight the outline of buttons and fields, and clicking a highlighted part will not open its script editor.
`resizable`  | Indicates or sets whether the card window can be resized to adjust the dimensions of the stack itself. This property does not exist in HyperCard.

#### Window properties

A window is an addressable object in WyldCard and supports these properties (in addition to the properties common to all objects):

Property     | Description
-------------|----------------------
`zoomed`     | Indicates or sets whether the window has been maximized or zoomed (that is, currently displayed in its largest allowable dimensions).

#### WyldCard properties

Some properties apply globally to WyldCard rather than just an individual part. The syntax for setting or getting a global property is similar to part properties. For example:

```
set the itemDelimiter to ","
get the itemDelimiter
```

WyldCard supports these global properties:

Global Property | Description
----------------|---------------
`address`       | Returns the IP address of the localhost (as defined by Java's `Inet4Address.getLocalHost()` method), or empty, if the IP address cannot be retrieved. Note that HyperCard's `address` property returned the Mac's AppleTalk network address.
`brush`         | An integer value between `0` and `23` indicating the active paintbrush.
`centered`      | A boolean value indicating whether shapes from center out, or corner-to-corner (equivalent to "Draw Centered" in the "Options" menu).
`cursor`        | The name of the cursor to be displayed in place of the default, `hand` cursor; one of `ibeam`, `cross`, `plus` (same as `busy`), `watch`, `hand`, `arrow`, `busy` or `none`. Does not effect paint tool, button tool or field tool cursors. Resets to `hand` on idle. Some cursors may not be supported on all operating systems.
`filled`        | A boolean value indicating whether shapes are being drawn filled (equivalent to "Draw Filled" in the "Options" menu).
`grid`          | A boolean value indicating whether the paint tool grid is enabled. When `true`, enables an eight pixel grid.
`lockMessages`  | When true, the `openCard`, `closeCard` and `openStack` messages will not be sent. Reset to `false` at idle time.
`lockScreen`    | A boolean value indicating whether or not the screen is locked. Reset to `false` at idle. See the "Visual Effects" section for more details.
`itemDelimiter` | A character or string used to mark the separation between items in a list. WyldCard will use this value anywhere it needs to treat a value as a list. For example, `set the itemDelimiter to "***" \n get the second item of "item 1***item 2***item 3" -- yields 'item 2'`. Note that this value has no effect on _point_ or _rectangle_ list items (i.e., when getting or setting the `rect`, `topLeft` or `bottomRight` of a part, the coordinates will always be separated by a comma irrespective of the current `itemDelimiter`).
`lineSize`      | The width, in pixels, of the line/outline drawn by paint tools.
`multiple`      | A boolean value indicating whether shapes are being drawn multiple (equivalent to "Draw Multiple" in the "Options" menu).
`pattern`       | Gets or sets the number of selected paint pattern. Patterns are numbered 0 to 39. Setting to a value outside this range has no effect.
`polySides`     | An integer representing the number of sides drawn using the polygon tool.
`scriptTextFont`| The name of the font family used in the script editor; default is `Monaco`.
`scriptTextSize`| The size, in points, of the text of the script editor; default is `12`.
`systemVersion` | The read-only version number of the Java Virtual Machine executing WyldCard, for example, `1.8.0_131`.
`textArrows`    | When `false`, pressing an arrow key will always navigate between cards in the stack; when `true`, pressing an arrow key will only navigate between cards in the stack if a text field is not in focus (when a text field has focus and `textArrows` is true, the arrow keys move the caret position within the field).
`textFont`      | The currently active font family, as indicated by the selection in the "Font" menu.
`textSize`      | The currently active font size, as indicated by the selection in the "Style" menu.
`textStyle`     | The currently active font style, as indicated by the selection in the "Style" menu.
`theme`         | Sets or get the name of the currently active look-and-feel. Use `the themes` function to determine which themes are available to be used on the current system. This property does not exist in HyperCard.

As noted in the table above, some of these properties are reset to their default values automatically during idle time (when all script handlers have finished executing).

### <a name="searching-and-sorting"></a> Searching and Sorting
HyperTalk provides a powerful and flexible construct for sorting cards in a stack, or the items or lines in a container.

#### Sorting cards

The cards in a stack may be sorted by some expression using the syntax `sort [the] cards [of this stack] by <expression>`. For example:

```
-- Sort all cards based on the contents the first card field
sort the cards of this stack by the first card field
```

Cards are sorted by evaluating `<expression>` in the context of each card (`<expression>` being `the first card field` in the previous example). If the sort expression cannot be evaluated on each card (perhaps because one of the two cards has no fields) then the sort fails and no cards change position.

For example, if a stack has two cards, the contents of `the first card field` from each card will be compared; if the text of the second card's field is alphabetically before that of first card's, then the two card's will be switch positions.

When sorting things, you can specify how HyperTalk should interpret the data it compares. Possible formats are `text` or `international` (alphabetical order), `numeric` (numerical order), or `dateTime` (interpret values as dates or times and order them chronologically). In HyperCard, the `international` sort format had special behavior related to comparing diacriticals and whatnot, but in WyldCard its identical to the `text` format.  

For example,

```
sort cards dateTime by field "Timestamp"    -- Sort chronologically
sort the cards numeric by bottomLine()      -- Sort numerically
```

By default, sorting re-orders things in ascending order (from first to last). You can reverse this order by specifying a sort direction:

```
sort cards descending numeric by the number of card buttons
sort cards ascending by the name of this card  
```

Additionally, a subset of cards identified by background or their `marked` property can be sorted without affecting the order of other cards in the stack (even if those cards are not contiguous).

```
sort the marked cards of this stack by the width of card button 2
sort cards of background id 2 by the random of 2
```

#### Sorting the contents of a container

The contents of a HyperTalk container (or a chunk of a container) can be sorted using the command `sort <chunks> {of | in} <container> [<direction>] [<style>] [by <expression>]` where:

* `<chunks>` is `[the] lines`, `[the] words`, `[the] items`, or `[the] chars` (HyperCard only supports sorting by `items` or `lines`.)
* `<container>` identifies a HyperTalk variable, part, or property
* `<direction>` is either `ascending` or `descending`
* `<style>` is `text`, `numeric`, `dateTime` or `international` (as described earlier)
* `<expression>` is a HyperTalk expression in which `each` contains the value of each `line` or `item` being compared

Consider these examples,

```
sort the lines of menu "Edit"                                    -- alphabetize items of Edit menu
sort the items of the last line of myVar descending numeric
sort the lines of card field "Names" by the last word of each    -- sort names by last name
sort the lines of card field "Names" by the middle word of each  -- or by middle name
```

#### Searching

Use the `find` command to locate text anywhere in the stack or anywhere within a specified field. All searches are case insensitive.

The syntax for searching is `find [<strategy>] [international] <factor> [in <field>] [of marked cards]` where:

* `<strategy>` is one of `word`, `chars`, `whole`, or `string`. When no `<strategy>` value is specified, `whole` is assumed. See the table below for a detailed description of each
* `international` had special meaning in HyperCard (matching diphthongs and diacriticals); it has no meaning in WyldCard but is allowable in the syntax
* `<factor>` is a single-term expression representing the text to find
* `<field>` optionally specifies that the search should only take place within the single, specified field
* `of marked cards` indicates that only marked cards should be searched. Has no effect if only a single field is being searched

Strategy    | Description
------------|-------------------------------------
`word`      | Finds whole words in the searchable text. Search term should not contain any whitespace (if it is expected to match any text). Only whole words will match; substrings contained within a word will not.
`chars`     | Finds a substring that occurs entirely within the bounds of a word (does not cross word boundaries). Search term should not include whitespace (if it is expected to match anything).
`whole`     | Finds a substring that starts at the beginning of a word. Search term may contain whitespace, and search results may cross word boundaries (but will always start at a word boundary).
`string`    | Finds a substring occurring anywhere in the searchable text. Search term may including whitespace, and found-text may cross word boundaries.

Consider these examples,

```
find "Hyper"                             -- Searches the entire stack for occurrences of 'hyper'
find "Hyper" of marked cards             -- Searches only marked cards
find "Hyper" in background field "Card"  -- Searches only this one field
```

### <a name="special-effects"></a> Special Effects
WyldCard supports a nearly identical set special effects as HyperCard, including the ability to animate card changes and transitions, play music and synthesize speech.

#### Visual Effects

WyldCard provides a selection of _visual effects_ that can be applied to card-to-card transitions or when "revealing" changes made by a script.

A script can "lock" the screen to prevent the user from seeing what the script is doing. As long as the screen is locked, the user will see no changes made to the card or stack until WyldCard is idle (has no more pending scripts to execute) or the script invokes the `unlock screen` command.

For example, consider this script which secretly navigates to the next card in the stack, draws a diagonal line on it, and then navigates back. While this script executes, the user has no knowledge that "behind the scenes" we've moved to another card and modified it:

```
on mouseUp
  lock screen
  go to the next card
  choose brush tool
  drag from 50,50 to 200,200
  go prev card
  unlock screen  -- note that screen will unlock automatically on idle
end mouseUp
```

When navigating between cards or unlocking the screen, a visual effect can be applied to animate the change. WyldCard supports these animations:

Visual Effect                                                  | Name                  | Description
---------------------------------------------------------------|-----------------------|--------------------------
![dissolve](images/vfx/DISSOLVE.gif)                       | `dissolve`            | Cross-dissolve from one card image to the next.
![checkerboard](images/vfx/CHECKERBOARD.gif)               | `checkerboard`        | Destination card image appears in a 8x8 matrix.
![venetian blinds](images/vfx/VENETIAN_BLINDS.gif)         | `venetian blinds`     | Destination appears in "louvered" horizontal stripes.
![scroll left](images/vfx/SCROLL_LEFT.gif)                 | `scroll left`         | Scroll from right to left.
![scroll right](images/vfx/SCROLL_RIGHT.gif)               | `scroll right`        | Scroll from left to right.
![scroll up](images/vfx/SCROLL_UP.gif)                     | `scroll up`           | Scroll from bottom to top.
![scroll down](images/vfx/SCROLL_DOWN.gif)                 | `scroll down`         | Scroll from top to bottom.
![wipe left](images/vfx/WIPE_LEFT.gif)                     | `wipe left`           | Slides the resulting image over the source from right to left.
![wipe right](images/vfx/WIPE_RIGHT.gif)                   | `wipe right`          | Slides the resulting image over the source from left to right.
![wipe up](images/vfx/WIPE_UP.gif)                         | `wipe up`             | Slides the resulting image over the source from bottom to top.
![wipe down](images/vfx/WIPE_DOWN.gif)                     | `wipe down`           | Slides the resulting image over the source from top to bottom.
![zoom open](images/vfx/ZOOM_OUT.gif)                      | `zoom open`           | The resulting card image expands over the source in a rectangle aperture.
![zoom close](images/vfx/ZOOM_IN.gif)                      | `zoom close`          | The resulting card collapses over the source in a rectangle aperture.
![iris open](images/vfx/IRIS_OPEN.gif)                     | `iris open`           | The resulting card image expands over the source in a circular aperture.
![iris close](images/vfx/IRIS_CLOSE.gif)                   | `iris close`          | The resulting card image collapses over the source in a circular aperture.
![barn door open](images/vfx/BARN_DOOR_OPEN.gif)           | `barn door open`      | The source image is split horizontally and each side slides out left/right to expose the resulting image.
![barn door close](images/vfx/BARN_DOOR_CLOSE.gif)         | `barn door close`     | The resulting image slides in the from the left/right obscuring the source image.
![shrink to bottom](images/vfx/SHRINK_TO_BOTTOM.gif)       | `shrink to bottom`    | The source image shrinks downward exposing the destination.
![shrink to top](images/vfx/SHRINK_TO_TOP.gif)             | `shrink to top`       | The source image shrinks upward exposing the destination.
![shrink to center](images/vfx/SHRINK_TO_CENTER.gif)       | `shrink to center`    | The source image shrinks from the center of the screen exposing the destination.
![stretch from bottom](images/vfx/STRETCH_FROM_BOTTOM.gif) | `stretch from bottom` | The destination image grows from the bottom obscuring the source underneath it.
![stretch from top](images/vfx/STRETCH_FROM_TOP.gif)       | `stretch from top`    | The destination image grows from the top obscuring the source underneath it.
![stretch from center](images/vfx/STRETCH_FROM_CENTER.gif) | `stretch from center` | The destination image grows from the center of the screen obscuring the source underneath it.

The syntax for specifying a visual effect is:

```
visual [effect] <effect-name> [to <image>] [speed]
```

Where `<effect-name>` is the name of a visual effect (from the table above); `<image>` is one of `card`, `gray`, `black`, `white` or `inverse` (of the destination card) and speed is one of `fast`, `slow`, `slowly`, `very fast` or `very slow`.

A visual effect can be applied when unlocking the screen or when navigating between cards. For example:

```
unlock screen with visual effect dissolve
go next with visual barn door open slowly
go to card 3 with visual effect iris open to black very fast
```

#### Sound Effects

WyldCard has three built-in sounds (`harpsichord`, `flute` and `boing`) that can be played either as a simple sound effect or as a sequence of musical notes with the `play` command. Touch-Tone phone sounds can be produced with the `dial` command, and the system alert sound can be emitted with `beep`.

```
play harpsichord
play boing
play flute
dial "1-800-588-2300"
beep
```

#### Music

To produce music, use the syntax `play <sound> [tempo <speed>] <musical-expression>` where:

* `<sound>` is one of `boing`, `harpsichord` or `flute`.
* `<speed>` is the rate at which notes are played, measured in quarter notes per minute. When not specified, a tempo of `120` is assumed.
* `<musical-expression>` is an expression in which each word is interpreted as a musical note.

Each musical note is written in the format `<name>[<octave>][<accidental>][<duration>]`, where:

* `<name>` is a single character representing the pitch; one of `c`, `d`, `e`, `f`, `g`, `a`, `b` or `r` (for a rest note).
* `<octave>` is a single-digit integer representing the note's octave; higher numbers are higher pitched. One of `0`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, or `8`.
* `<accidental>` is a half-note increase or decrease in pitch; of one `b` (flat, decreased pitch) or `#` (sharp, increased pitch).
* `<duration>` is a single-character representation of the length of the note, plus an optional `.` to represented a dotted-note (played for one and a half times its un-dotted duration). Duration is one of `w` (whole note), `h` (half note), `q` (quarter note), `e` (eighth note), `s` (sixteenth note), `t` (thirty-second note), `x` (sixty-fourth note).

When not explicitly specified, each note "inherits" its duration and octave from the previous note played. The first note in the musical sequence is assumed to be a 4th-octave quarter note (if not explicitly noted). For example, in the musical sequence `"g ce5 d"`, the first note (`g`) is played as a quarter note in the 4th octave, but the third note (`d`) is played as an eighth note in the 5th octave.

For example, to play "Mary Had a Little Lamb" on the harpsichord,

```
play harpsichord "be a g a b b b r a a a r b d5 d r b4 a g a b b b b a a b a g"
```

Use `the sound` function to determine the currently playing sound (returns `done` when no sound is playing). This may be used to cause a script to wait until a sequence of notes has finished playing:

```
play flute "c d e f g"
wait until the sound is done
put "Finally some peace and quiet!"
```

#### Speech

WyldCard can speak text using one of several pre-installed, English-speaking voices. The syntax for speaking text is `speak <text> [ with { <gender> voice } | { voice <name>} ]` where:

* `<text>` is an expression representing the text to be spoken.
* `<gender>` is one of `male`, `female`, `robotic` or `neuter`. If a voice of the requested gender is unavailable, then the default voice will be used.
* `<name>` is the name of an installed voice (an item in `the voices`). If the requested voice is not available, then the default voice will be used.

For example, this script will have each voice introduce itself to you:

```
repeat with v = 1 to the number of items in the voices
  put item v of the voices into theVoice
  speak "Hi, my name is " & theVoice with voice theVoice
end repeat
```

Speaking occurs asynchronously to other script actions (that is, the rest of the script continues to execute while the text is being spoken). Subsequent calls to `speak` will be enqueued and begin "speaking" when the current speech is complete. Use `the speech` function to determine what (if any) text is currently being spoken; `the speech` returns the text currently being spoken or `done` when nothing is being spoken.  

WyldCard utilizes the [MaryTTS library](http://mary.dfki.de) for text-to-speech capabilities and does not delegate to the operating system. Therefore, voices installed on your system are not available to WyldCard. WyldCard provides a function called `the voices` that returns a list of available speaking voices (note that this function does not exist in HyperCard).


### <a name="variables-and-containers"></a> Variables and Containers
A _container_ is anything in WyldCard that you can `put` a value into (an _l-value_, in C parlance): parts, variables, properties, menus, the message box, the selection and the target are all containers. 

Use the HyperTalk command `put` to place a value into a container (`put 10 into x`). HyperTalk does not use the `=` operator for value assignment as is traditional in most programming languages.

#### Variables as containers

In HyperTalk, variables are implicitly declared when a value is `put` into them. Referring to a variable that has had nothing put into it results in the name of the variable itself. 

For example:

```
on mouseDown
  put "Something" into someVariable  -- someVariable contains 'Something'
  answer someVariable                -- Displays 'Something'
  answer nothingHere                 -- Displays 'nothingHere'
end mouseDown
```

Local variables in HyperTalk are lexically scoped and retain their value only within the handler in which they were created.

A variable may be made global by declaring it so with the `global` keyword. Global variables are accessible from any script of any part in any open stack. Once created, a global variable retains its value until the WyldCard application is closed. Be aware that variables not explicitly declared `global` are considered local, even when a global variable of the same name exists.

```
--
-- Global and local variable example script
--

on mouseUp
  global fivr
  put 5 into fivr  -- puts 5 into global variable

  answer local()   -- Displays "fivr"
  answer global()  -- Displays "5"
end mouseUp

function local
  return fivr	   -- returns "fivr"
end f

function global
  global fivr
  return fivr	   -- returns "5"
end y
```

#### Parts as containers

Like variables, a part can also store value. When placing a value into a field, the text of the field is changed. However, when placing a value into a button, card, background or stack, the part's `contents` property is changed (the `contents` of a part can be seen and edited from the "Info..." dialog in the "Objects" menu). Except when dealing with text fields and `popup` styled buttons (combo boxes), the `contents` property does not affect how the part appears on screen.

In HyperCard, a value could only be placed into button or field parts. WyldCard allows values to be placed into cards, backgrounds and stacks, too. Similarly, HyperCard did not provide a `contents` property, but in WyldCard, `put pi into the contents of card field "Math"` is equivalent to `put pi into card field "Math"`

For example:

```
put 35 + 27 into field id 12          -- Changes the text of this field to "62"
put 35 + 27 into button "My Button"   -- Changes the contents property of this button to "62"
put "This is my card" into this card  -- Changes the contents property of this card
put "Yes,No" into button myMenuButton -- Menu-styled button gets two menu items "Yes" and "No"
```

#### Menus as containers

Every menu in the menu bar, as well as buttons of the style `popup`, are special containers whose contents defines the list of menu items that appear in them. The value placed into a menu container is interpreted as a list of items or lines, each of which represents an item in the menu. A single hyphen (`-`) value in the list is interpreted as menu separator (this was not true in HyperCard).

For example:

```
create menu "My Menu"                               -- adds a new menu to the menu bar
put "Item 1,Item 2,-,Other..." into menu "My Menu"  -- adds three items and a separator
```

The result of getting `menu "My Menu"` would produce:

```
Item 1
Item 2
-
Other...
```

#### The message as a container

The _message box_ is a floating window containing a single-line editable text field (you can show or hide this window from the "Go" menu). Text entered into the message is evaluated as a HyperTalk statement when you press enter, and the contents of this field can be read or written as a container. The contents of the message window are addressable in HyperTalk as `[the] message`, `[the] message box` or `[the] message window`.

For example:

```
put " -- Add a comment" after the message box
multiply the message by 3
```

When a container is not explicitly specified in the `put` command, the message box container is used. For example, `put "Hello"` causes the message box to be displayed and for the text "Hello" to appear inside of it.

#### The it container

HyperTalk provides an implicit variable named `it`. Some commands place a value into this variable so that `it` refers to the last computed value. Scripts can change the value of `it` using the `put` command, but this is not advised as values placed into `it` may be overwritten by subsequent commands.

For example:

```
on mouseUp
  get 2 * 3
  answer it   -- Responds with 6
end mouseUp
```

#### The selection as a container

The active selection of text (created by dragging and highlighting editable text in a field or the message box) can be used as a container. When a value is `put` into `the selection`, the selected text itself is changed.

Modern windowing systems typically allow multiple selections of text to exist concurrently (in different fields, for example). HyperCard did not allow concurrent selections of text, but in WyldCard multiple selections of text can exist simultaneously. In this situation, `the selection` refers to the last selection made.

For example,

```
if the selection is a number then multiply the selection by 10
put "[redacted]" into the selection
```

#### The target as a container

The `target` is both a HyperTalk function (when used with `the`, as in `the target`) and also a part. The built-in function `the target` returns a string expression referring to the part that the current message was originally sent to, but `target` refers to the part itself.

For example, consider the behavior of this script when added to a card field:

```
on mouseUp
  answer the target   -- displays 'card field id x'
  answer target       -- displays the text of this field
end mouseUp
```

