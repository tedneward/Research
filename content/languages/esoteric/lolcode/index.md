title=LOLCODE
tags=language, esoteric
summary=Programming in l33tsp33k
~~~~~~

[Website](http://www.lolcode.org/) | [Interpreter Github](https://github.com/justinmeza/lci) | [Another reference](https://github.com/leyarotheconquerer/lolcode-reference)

There is a specification which currently rests at [1.2](https://github.com/justinmeza/lolcode-spec/blob/master/v1.2/lolcode-spec-v1.2.md) ([local copy](../specification-1.2)). If you can believe that.

The specificaction on the [Esolang's wiki](http://esolangs.org/wiki/LOLCODE)

```
HAI 1.2
  CAN HAS STDIO?
  VISIBLE "HAI WORLD!!!1!"
KTHXBYE
```

### Implementations

* Java: [LOLCODE using JavaCC/JJTree](https://code.google.com/archive/p/lolcode-java/)
* Java: [Another implementation](https://github.com/nikitagrygoriev/LOLCODE_Compiler)
* CLR: [CLR version cached copy](../lolcode/LOLCode-r36.net.zip)
* [Parallel and Distributed Computing with LOLCODE](https://parallella.org/2017/04/01/parallel-and-distributed-computing-with-lolcode/) ([Source](https://github.com/browndeer/lcc)) ([PDF](https://arxiv.org/pdf/1703.10242.pdf))

[A ray tracer in LOLCODE](https://github.com/LoganKelly/LOLTracer)

## [Learn X in Y minutes Quick Intro](https://learnxinyminutes.com/docs/LOLCODE/)
LOLCODE is an esoteric programming language designed to resemble the speech of [lolcats](https://upload.wikimedia.org/wikipedia/commons/a/ab/Lolcat_in_folder.jpg?1493656347257).

```
BTW This is an inline comment
BTW All code must begin with `HAI <language version>` and end with `KTHXBYE`

HAI 1.3
CAN HAS STDIO? BTW Importing standard headers

OBTW
     ==========================================================================
     ================================= BASICS =================================
     ==========================================================================
TLDR

BTW Displaying text:
VISIBLE "HELLO WORLD"

BTW Declaring variables:
I HAS A MESSAGE ITZ "CATZ ARE GOOD"
VISIBLE MESSAGE

OBTW
    (This is a codeblock.) Variables are dynamically typed so you don't need to
    declare their type. A variable's type matches its content. These are the
    types:
TLDR

I HAS A STRING  ITZ "DOGZ ARE GOOOD" BTW type is YARN
I HAS A INTEGER ITZ 42               BTW type is NUMBR
I HAS A FLOAT   ITZ 3.1415           BTW type is NUMBAR
I HAS A BOOLEAN ITZ WIN              BTW type is TROOF
I HAS A UNTYPED                      BTW type is NOOB

BTW Accepting user input:
I HAS A AGE
GIMMEH AGE
BTW The variable is stored as a YARN. To convert it into NUMBR:
AGE IS NOW A NUMBR

OBTW
     ==========================================================================
     ================================== MATH ==================================
     ==========================================================================
TLDR

BTW LOLCODE uses polish notation style math.

BTW Basic mathematical notation:

SUM OF 21 AN 33         BTW 21 + 33
DIFF OF 90 AN 10        BTW 90 - 10
PRODUKT OF 12 AN 13     BTW 12 * 13
QUOSHUNT OF 32 AN 43    BTW 32 / 43
MOD OF 43 AN 64         BTW 43 modulo 64
BIGGR OF 23 AN 53       BTW max(23, 53)
SMALLR OF 53 AN 45      BTW min(53, 45)

BTW Binary notation:

BOTH OF WIN AN WIN           BTW and: WIN if x=WIN, y=WIN
EITHER OF FAIL AN WIN        BTW or: FAIL if x=FAIL, y=FAIL
WON OF WIN AN FAIL           BTW xor: FAIL if x=y
NOT FAIL                     BTW unary negation: WIN if x=FAIL
ALL OF WIN AN WIN MKAY   BTW infinite arity AND
ANY OF WIN AN FAIL MKAY  BTW infinite arity OR

BTW Comparison:

BOTH SAEM "CAT" AN "DOG"             BTW WIN if x == y
DIFFRINT 732 AN 184                  BTW WIN if x != y
BOTH SAEM 12 AN BIGGR OF 12 AN 4     BTW x >= y
BOTH SAEM 43 AN SMALLR OF 43 AN 56   BTW x <= y
DIFFRINT 64 AN SMALLR OF 64 AN 2     BTW x > y
DIFFRINT 75 AN BIGGR OF 75 AN 643    BTW x < y

OBTW
     ==========================================================================
     ============================== FLOW CONTROL ==============================
     ==========================================================================
TLDR

BTW If/then statement:
I HAS A ANIMAL
GIMMEH ANIMAL
BOTH SAEM ANIMAL AN "CAT", O RLY?
    YA RLY
        VISIBLE "YOU HAV A CAT"
    MEBBE BOTH SAEM ANIMAL AN "MAUS"
        VISIBLE "NOM NOM NOM. I EATED IT."
    NO WAI
        VISIBLE "AHHH IS A WOOF WOOF"
OIC

BTW Case statement:
I HAS A COLOR
GIMMEH COLOR
COLOR, WTF?
    OMG "R"
        VISIBLE "RED FISH"
        GTFO
    OMG "Y"
        VISIBLE "YELLOW FISH"
        BTW Since there is no `GTFO` the next statements will also be tested
    OMG "G"
    OMG "B"
        VISIBLE "FISH HAS A FLAVOR"
        GTFO
    OMGWTF
        VISIBLE "FISH IS TRANSPARENT OHNO WAT"
OIC

BTW For loop:
I HAS A TEMPERATURE
GIMMEH TEMPERATURE
TEMPERATURE IS NOW A NUMBR
IM IN YR LOOP UPPIN YR ITERATOR TIL BOTH SAEM ITERATOR AN TEMPERATURE
    VISIBLE ITERATOR
IM OUTTA YR LOOP

BTW While loop:
IM IN YR LOOP NERFIN YR ITERATOR WILE DIFFRINT ITERATOR AN -10
    VISIBLE ITERATOR
IM OUTTA YR LOOP

OBTW
     =========================================================================
     ================================ Strings ================================
     =========================================================================
TLDR

BTW Linebreaks:
VISIBLE "FIRST LINE :) SECOND LINE"

BTW Tabs:
VISIBLE ":>SPACES ARE SUPERIOR"

BTW Bell (goes beep):
VISIBLE "NXT CUSTOMER PLS :o"

BTW Literal double quote:
VISIBLE "HE SAID :"I LIKE CAKE:""

BTW Literal colon:
VISIBLE "WHERE I LIVE:: CYBERSPACE"

OBTW
     =========================================================================
     =============================== FUNCTIONS ===============================
     =========================================================================
TLDR

BTW Declaring a new function:
HOW IZ I SELECTMOVE YR MOVE BTW `MOVE` is an argument
    BOTH SAEM MOVE AN "ROCK", O RLY?
        YA RLY
            VISIBLE "YOU HAV A ROCK"
        NO WAI
            VISIBLE "OH NO IS A SNIP-SNIP"
    OIC
    GTFO BTW This returns NOOB
IF U SAY SO

BTW Declaring a function and returning a value:
HOW IZ I IZYELLOW
    FOUND YR "YELLOW"
IF U SAY SO

BTW Calling a function:
I IZ IZYELLOW MKAY

KTHXBYE
```

And finally, courtesy of [justinmeza](https://github.com/justinmeza/httpd.lol/blob/master/httpd.lol), a LOLCODE HTTP server (but apparently written in 1.4, which I don't see a spec for anywhere...?):
```lolcode
OBTW
    httpd.lol -- a minimal HTTP server written in LOLCODE
    example:
        ./lci httpd.lol
        point your favorite HTTP-getter to http://127.0.0.1:13337/lol.html
        ...
        profit?
    by Justin J. Meza, 2014
TLDR
HAI 1.4
    CAN HAS STDIO?
    CAN HAS SOCKS?
    CAN HAS STRING?

    HOW IZ I parse YR header
        I HAS A len ITZ I IZ STRING'Z LEN YR header MKAY
        I HAS A readin ITZ FAIL
        I HAS A file ITZ ""
        IM IN YR loop UPPIN YR index TIL BOTH SAEM index AN len
            I HAS A char ITZ I IZ STRING'Z AT YR header AN YR index MKAY
            BOTH OF BOTH SAEM char AN " " AN readin
            O RLY?
                YA RLY, FOUND YR file
            OIC
            readin, O RLY?, YA RLY, file R SMOOSH file AN char MKAY, OIC
            BOTH OF BOTH SAEM char AN "/" AN NOT readin
            O RLY?
                YA RLY, readin R WIN
            OIC
        IM OUTTA YR loop
        FOUND YR ""
    IF U SAY SO

    BTW bind to a local port
    I HAS A sock
    sock R I IZ SOCKS'Z BIND YR "127.0.0.1" AN YR 13337 MKAY

    IM IN YR loop
        BTW receive a connection
        I HAS A conn
        conn R I IZ SOCKS'Z LISTN YR sock MKAY

        BTW get a command
        I HAS A cmd
        cmd R I IZ SOCKS'Z GET YR sock AN YR conn AN YR 1024 MKAY
        VISIBLE "CMD IZ " AN cmd

        BTW parse the file name
        I HAS A name ITZ I IZ parse YR cmd MKAY
        VISIBLE "FIEL IZ " AN name

        I HAS A reply ITZ ""

        BTW get the file contents
        I HAS A file ITZ I IZ STDIO'Z OPEN YR name AN YR "r" MKAY
        I IZ STDIO'Z DIAF YR file MKAY, O RLY?
        YA RLY
            VISIBLE "FIEL NOT FOUND"
            reply R "HTTP/1.1 404 Not Found:3:):3:)"
        NO WAI
            VISIBLE "FIEL FOUND!"
            I HAS A data ITZ I IZ STDIO'Z LUK YR file AN YR 1024 MKAY
            I HAS A len ITZ I IZ STRING'Z LEN YR data MKAY
            I IZ STDIO'Z CLOSE YR file MKAY
            VISIBLE "LEN IZ " AN len
            VISIBLE "DATA IZ " AN data

            reply R SMOOSH "HTTP/1.1 200 OK:3:)"...
                    AN "Server: httpd.lol/0.1 (lci):3:)"...
                    AN "Context-Type: text/html:3:)"...
                    AN "Content-Length: :{len}:3:):3:)"...
                    AN ":{data}:3:)" MKAY
        OIC

	BTW serve it up
	VISIBLE "REPLY IZ " AN reply
	I IZ SOCKS'Z PUT YR sock AND YR conn AN YR reply MKAY

        BTW buh-bye
        I IZ SOCKS'Z CLOSE YR conn MKAY
    IM OUTTA YR loop
KTHXBYE
```
