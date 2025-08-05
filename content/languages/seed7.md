title=Seed7
tags=language
summary=A general purpose programming language transpiling to C and higher-level compared to Ada, C/C++ and Java.
~~~~~~

[Website](http://seed7.sourceforge.net/) | [Source](https://github.com/ThomasMertes/seed7)

* As an extensible programming language it supports user defined statements and operators.
* Types are first class objects (Templates and generics can be defined easily without special syntax).
* Predefined constructs like arrays or for-loops are defined in libraries.
* Object orientation supports interfaces and multiple dispatch.
* Static type checking and the absence of automatic casts help to find errors at compile-time.
* There is an automatic memory management that works without a garbage collection process.
* Exception handling and source code debugging are supported.
* If an integer computation overflows the exception OVERFLOW_ERROR is raised.
* Numbers which have unlimited size are provided with the types bigInteger and bigRational.
* Functions, operators and statements can be overloaded.
* There are various predefined types like array, hash, set, struct, color, time, duration, etc.
* Seed7 programs are source code portable without any need to change the code.
* Seed7 provides a database independent API, which can connect to MySQL, MariaDB, SQLLite, PostgreSQL, Oracle, ODBC, Firebird, Interbase, Db2 and SQL Server databases databases.
* Seed7 runs under Linux, various Unix versions and Windows.

**"What is an extensible programming language?"**
An extensible programming language supports mechanisms to extend the programming language, compiler/interpreter and runtime environment. The programmer is allowed to define new language constructs such as statements, declaration constructs and operators syntactically and semantically. Most programming languages allow user defined variables, functions and types, but they also use constructs which are hard-coded in the compiler/interpreter. An extensible programming language tries to avoid such hard-coded constructs in normal programs.

Extensible programming was an area of active research in the 1960s, but in the 1970s the extensibility movement was displaced by the abstraction movement. Todays software history gives almost no hint that the extensible languages movement had ever occurred. In the historical movement an extensible programming language consisted of a base language providing elementary computing facilities, and a meta-language capable of modifying the base language. A program then consisted of meta-language modifications and code in the modified base language. A popular approach to do language extension was the use of macro definitions. The constructs of the base language were hard-coded.

The design and development of Seed7 is based on independent research, which was done without knowing that the historic extensible programming language movement existed. Although Seed7 has different roots it reaches many of the original extensible programming language goals. Contrary to the historic movement Seed7 does not have a meta-language. In Seed7 a language extension is formulated in Seed7 itself. Seed7 differentiates between syntactic and semantic extensions. Syntactic extensions are described in Chapter 9 (Structured syntax definition) of the manual. The semantic extensions of Seed7 are done by declaring statements and operators as functions. For the body of loops and similar needs statically typed call-by-name parameters are used.



Example: Eliza
```
$ include "seed7_05.s7i";
  include "stdio.s7i";

const array string: keyword_table is [](
    "Can you", "Can I", "You are", "You're", "I don't", "I feel",
    "Why don't you", "Why can't I", "Are you", "I can't", "I am", "I'm ",
    "You ", "I want", "What", "How", "Who", "Where", "When", "Why",
    "Name", "Cause", "Sorry", "Dream", "Hello", "Hi ", "Maybe",
    "No", "Your", "Always", "Think", "Alike", "Yes", "Friend",
    "Computer", "no key found"
  );

const array array string: replace_words is [](
    [](" are ",  " am "),
    [](" were ", " was "),
    [](" you ",  " I "),
    []("your ",  "my "),
    [](" I've ", " you've "),
    [](" I'm ",  " you're "),
    [](" me ",   " !you ")
  );

const array array string: example_sentence is [](
    (* "Can you" *)
    []( "Don't you believe that I can*",
        "Perhaps you would like to be able to*",
        "You want me to be able to*" ),
    (* "Can I" *)
    []( "Perhaps you don't want to*",
        "Do you want to be able to*" ),
    (* "You are" / "You're" *)
    []( "What makes you think I am*",
        "Does it please you to believe I am*",
        "Perhaps you would like to be*",
        "Do you sometimes wish you were*" ),
    (* "I don't" *)
    []( "Don't you really*",
        "Why don't you*",
        "Do you wish to be able to*",
        "Does that trouble you?" ),
    (* "I feel" *)
    []( "Tell me more about such feelings",
        "Do you often feel*",
        "Do you enjoy feeling*" ),
    (* "Why don't you" *)
    []( "Do you really believe I don't*",
        "Perhaps in good time I will*",
        "Do you want me to*" ),
    (* "Why can't I" *)
    []( "Do you think you should be able to*",
        "Why can't you*" ),
    (* "Are you" *)
    []( "Why are you interested in whether or not I am*",
        "Would you prefer if I were not*",
        "Perhaps in your fantasies I am*" ),
    (* "I can't" *)
    []( "How do you know you can't*",
        "Have you tried?",
        "Perhaps you can now*" ),
    (* "I am" / "I'm " *)
    []( "Did you come to me because you are*",
        "How long have you been*",
        "Do you believe it is normal to be*",
        "Do you enjoy being*" ),
    (* "You " *)
    []( "We were discussing you, not me.",
        "Oh, I*",
        "You're not really talking about me, are you?" ),
    (* "I want" *)
    []( "What would it mean to you if you got*",
        "Why do you want*",
        "Suppose you soon got*",
        "What if you never got*",
        "I sometimes also want*" ),
    (* "What" / "How" / "Who" / "Where" / "When" / "Why" *)
    []( "Why do you ask?",
        "Does that question interest you?",
        "What answer would please you the most?",
        "What do you think?",
        "Are such questions on your mind often?",
        "What is it that you really want to know?",
        "Have you asked anyone else?",
        "Have you asked such questions before?",
        "What else comes to mind when you ask that?" ),
    (* "Name" *)
    []( "Names don't interest me.",
        "I don't care about names... please go on." ),
    (* "Cause" *)
    []( "Is that the real reason?",
        "Don't any other reasons come to mind?",
        "Does that reason explain anything else?",
        "What other reasons might there be?" ),
    (* "Sorry" *)
    []( "Please don't apologize!",
        "Apologies are not necessary.",
        "What feelings do you have when you apologize?",
        "Don't be so defensive!" ),
    (* "Dream" *)
    []( "What does that dream suggest to you?",
        "Do you dream often?",
        "What persons appear in your dreams?",
        "Are you disturbed by your dreams?" ),
    (* "Hello" / "Hi " *)
    []( "How do you do. please state your problem." ),
    (* "Maybe" *)
    []( "You don't seem quite certain.",
        "Why the uncertain tone?",
        "Can't you be more positive?",
        "You aren't sure?",
        "Don't you know?" ),
    (* "No" *)
    []( "Are you saying 'no' just to be negative?",
        "You are being a bit negative.",
        "Why not?",
        "Are you sure?",
        "Why no?" ),
    (* "Your" *)
    []( "Why are you concerned about my*",
        "What about your own*" ),
    (* "Always" *)
    []( "Can you think of an example?",
        "When?",
        "What are you thinking of?",
        "Really,...always?" ),
    (* "Think" *)
    []( "Do you really think so?",
        "But you are not sure you*",
        "Do you doubt you*" ),
    (* "Alike" *)
    []( "In what way?",
        "What similarity do you see?",
        "What does the similarity suggest to you?",
        "What other connections do you see?",
        "Could there really be some connection?",
        "How?",
        "You seem quite positive." ),
    (* "Yes" *)
    []( "Are you sure?",
        "Hmmm...I see.",
        "I understand." ),
    (* "Friend" *)
    []( "Do you have any friends?",
        "Do your friends worry you?",
        "Do they pick on you?",
        "Are your friends a source of anxiety?",
        "Do you impose your problems on your friends?",
        "Perhaps your dependence on friends worries you." ),
    (* "Computer" *)
    []( "Do computers worry you?",
        "Are you talking about me in particular?",
        "Are you frightened by machines?",
        "Why do you mention computers?",
        "What do you think machines have to do with your problems?",
        "Don't you think computers can help you?",
        "What is it about machines that worries you?" ),
    (* "no key found" *)
    []( "Do you feel intense psychological stress?",
        "What does that suggest to you?",
        "I see.",
        "I'm not sure I understand you fully",
        "Now, please clarify yourself.",
        "Can you elaborate on that?",
        "That is quite interesting." )
  );

const array integer: keyword_assignment is [](
     1,  2,  3,  3,  4,  5,  6,  7,  8,  9,
    10, 10, 11, 12, 13, 13, 13, 13, 13, 13,
    14, 15, 16, 17, 18, 18, 19, 20, 21, 22,
    23, 24, 25, 26, 27, 28
  );

var array integer: current_sentence is length(keyword_assignment) times 1;


const proc: main is func
  local
    var integer: number is 0;
    var integer: position is 0;
    var string: user_input is "";
    var string: last_input is "";
    var string: keyword_stri is "";
    var string: keyword_found is "";
    var integer: keyword_num is 0;
    var integer: keyword_pos is 0;
    var string: replace1 is "";
    var string: replace2 is "";
    var string: replaced_stri is "";
    var integer: sentence_num is 0;
    var string: sentence is "";
  begin
    for number range 1 to 25 do
      writeln;
    end for;
    writeln("ELIZA - The Computer Psychiatrist");
    writeln("Original ELIZA by Joseph Weizenbaum, MIT, 1965");
    writeln;
    writeln;
    writeln;
    writeln("Why have you requested this session?");
    repeat
      repeat
        write("? ");
        readln(user_input);
        user_input := " " & user_input & "  ";
        (* Lose extraneous input chars *)
        user_input := replace(user_input, "'", "");
        if pos(user_input, "shut") <> 0 then
          writeln("Good-bye!");
          exit(PROGRAM);
        end if;
        if user_input = last_input then
          writeln("Please don't repeat yourself!");
        end if;
      until user_input <> last_input;
      (* Get keywords *)
      keyword_num := 0;
      for number range 1 to length(keyword_table) do
        keyword_stri := keyword_table[number];
        if keyword_num = 0 then
          position := pos(upper(user_input), upper(keyword_stri));
          if position <> 0 then
            keyword_num := number;
            keyword_pos := position;
            keyword_found := keyword_stri;
          end if;
        end if;
      end for;
      if keyword_num = 0 then
        (* No keywords *)
        keyword_num := 36;
      else
        replaced_stri := " " & user_input[keyword_pos + length(keyword_found) ..] & " ";
        for number range 1 to length(replace_words) do
          replace1 := replace_words[number][1];
          replace2 := replace_words[number][2];
          for position range 1 to length(replaced_stri) do
            if replaced_stri[position len length(replace1)] = replace1 then
              replaced_stri := replaced_stri[.. pred(position)] &
                  replace2 & replaced_stri[position + length(replace1) ..];
              position +:= length(replace2);
            elsif replaced_stri[position len length(replace2)] = replace2 then
              replaced_stri := replaced_stri[.. pred(position)] &
                  replace1 & replaced_stri[position + length(replace2) ..];
              position +:= length(replace1);
            end if;
          end for;
        end for;

        if replaced_stri[2] = ' ' then
          replaced_stri := replaced_stri[2 ..];
        end if;

        replaced_stri := replace(replaced_stri, "!", "");
      end if;
      sentence_num := keyword_assignment[keyword_num];
      sentence := example_sentence[sentence_num][current_sentence[keyword_num]];
      incr(current_sentence[keyword_num]);
      if current_sentence[keyword_num] > length(example_sentence[sentence_num]) then
        current_sentence[keyword_num] := 1;
      end if;
      if sentence[length(sentence)] <> '*' then
        writeln(sentence);
      else
        writeln(sentence[.. pred(length(sentence))] <& replaced_stri);
      end if;
      last_input := user_input;
    until FALSE;
  end func;
```
