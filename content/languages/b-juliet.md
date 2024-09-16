title=B-Juliet
tags=language
summary=A fairly minimal event-oriented language. 
~~~~~~

 [Source](https://github.com/catseye/beta-Juliet) MIRRORS [Source](https://codeberg.org/catseye/beta-Juliet)

In β-Juliet, the world is modelled as a set of events which have no inherent organization or order. Each event can be denoted with a symbol, such as DominoFalls, CatMeows, or SunSets, or (in version 2.0) a string of symbols, such as Address Line Six Goes High or Greengrocer Falls Asleep on Subway. Each event can cause other events to occur — these are termed consequences of the event. In addition, this causation may be conditional, but the only condition that is possible to check is: given two events, which one happened more recently?

β-Juliet is a minimal event-oriented language which, as of version 2.0
(see [historical note](#historical-note) below), is probably Turing-complete.

## Description

β-Juliet is a fairly minimal event-oriented language.  In β-Juliet, the world
is modelled as a set of _events_ which have no inherent organization or order.
Each event can be denoted with a _symbol_, such as `DominoFalls`, `CatMeows`,
or `SunSets`, or (in version 2.0) a string of symbols, such as `Address Line
Six Goes High` or `Greengrocer Falls Asleep on Subway`.

Each event can cause other events to occur — these are termed _consequences_
of the event.  In addition, this causation may be conditional, but the only
condition that is possible to check is: _given two events, which one happened
more recently?_

## Example

    // Description of a weather-sensitive robot tarpaulin in beta-Juliet

    event RainBegins;
    event RainEnds;

    event SystemActivated;
    event SystemDeactivated;

    event CloseTarpaulin,
     caused after RainBegins when SystemActivated > SystemDeactivated;

    event OpenTarpaulinTimer,
     duration 10 m,
     caused after RainEnds when SystemActivated > SystemDeactivated;

    event OpenTarpaulin,
     caused after OpenTarpaulinTimer.

## Grammar

The basic grammar of β-Juliet is given here in EBNF.  Version 1.0 uses this
grammar as it stands; version 2.0 extends many of the productions.

    betaJuliet ::= Decl {";" Decl} ".".
    Decl       ::= Event.
    Event      ::= "event" EventDecl {"," Property}.
    EventDecl  ::= Symbol.
    Property   ::= Caused | Causes | Duration.
    Caused     ::= "caused" TimePrep EventAppl {WhenTerm}.
    Causes     ::= "causes" EventAppl ["immediately"] {WhenTerm}
    Duration   ::= "duration" TimeSpec.
    TimePrep   ::= "before" | "after" | "by".
    TimeSpec   ::= RationalNumber TimeUnit.
    TimeUnit   ::= "ms" | "s" | "m" | "h" | "d".
    EventAppl  ::= Symbol.
    WhenTerm   ::= "when" EventAppl ">" EventAppl.
    Symbol     ::= <<one or more alphanumeric characters>>.
    Number     ::= <<rational number in decimal format>>.

### Some Explanations ###

The syntax `A > B` can be read as "`A` has occurred more recently than `B`".
If `A` has occurred but `B` has never occurred, `A > B` is still true;
however, if neither event has ever occurred, both `A > B` and `B > A` are
false.

`caused` and `causes` are two equivalent ways of expressing the causality
rules between events.  If we say one event is `caused by` or `caused after`
some other event, that is equivalent to saying the other event `causes` the
one event.  Similarly, if we say one event is `caused before` some other
event, that is equivalent to saying the other event `causes` the one event
`immediately`.

When we define an event like

    event Foo,
        causes Bar,
        causes Baz.

or like this

    event Bar, caused by Foo;
    event Baz, caused by Foo.

...and during execution, after `Foo` happens, it is not guaranteed that
either `Baz > Bar` or `Bar > Baz` is true; the order in which these two
consequences occur does not necessarily follow source code order.  (But it
is guaranteed that one or the other will be true, as both events will have
happened.)

If you require an ordering guarantee in a case like this, you should use
an intermediate event, like

    event Foo,
        causes Temp,
        causes Bar;
    event Temp,
        causes Baz.

After `Temp` happens, `Baz > Bar` should be true.

### `caused before` ###

Alternately, in theory, you can use `caused before`, as in:

    event Bar, caused before Foo;
    event Baz, caused after Foo.

After `Foo` happens, `Baz > Bar` should be true.

Some words on the purpose of `caused before` are in order.  In the original
vision, `after` and `by` were synonyms, but `before` was meant to actually
cause the event on which the `caused before` clause was attached, strictly
*before* the event named in the clause.

However, unless the event being caused can somehow *cancel* the event that
it's being caused before, there is no semantic difference between `before`
and `after` when it comes to "when" the event is triggered -- except, as we
note here, the ordering guarantee.

So `before` does not now necessarily mean strictly before the event; it could
mean after the event, but before any other consequences that are given in
`after` clauses.

Still, multiple `before` consequences are nondeterministic, so in

    event Bar, caused before Foo;
    event Baz, caused before Foo.

...after `Foo` happens, it is still not guaranteed that either `Baz > Bar`
or `Bar > Baz` is true.

Portia
------

*Portia* is a pre-processor language designed specifically for β-Juliet
version 1.0.  It is solely concerned with expanding parameterized events
into series of concrete events, for example creating events `DominoOneFalls`,
`DominoTwoFalls`, etc., from the generalized event schema
`Domino(N=Domino)Falls` where `Domino` is an _alphabet_ over the range of
dominoes.

This mechanism (in fact, an extended form of it) is included in version 2.0
of the β-Juliet language itself, so no pre-processor is needed for it.

## Computational Power

The state space of a system described in β-Juliet version 1.0 is always
finite, so β-Juliet version 1.0 cannot be Turing-complete.  The state space
of a system described using Portia and β-Juliet version 1.0 may be much,
much bigger than one described using just β-Juliet version 1.0, but it is
still finite.

Since β-Juliet version 2.0 allows unbounded sets of events to be described,
it is more likely that it is Turing-complete.

## Patterns

β-Juliet version 2.0 introduces _event patterns_.  When the name of an event
is given by a string of symbols, some of those symbols may actually be
_parameters_ which act something like wildcards.  Each parameter ranges over
a specified _alphabet_.  When an event occurs which matches the name of an
event, the parameters in that name are bound to the literal symbols in the
occurring event.  These bound parameters may then be used in substitutions in
the consequences.

For example, if we have an alphabet called `Animal` that consists of the
symbols `Dog` `Cat` `Ferret`, we can have an event `(X=Animal) Licks Itself`
which has, as a consequence, `(X) Becomes Clean`.  Here `X` is a parameter.
This event will happen should some other event cause `Cat Licks Itself`, and
in this case, `X` will be bound to `Cat`, and this event will thus
subsequently cause the event `Cat Becomes Clean`.

## Modifiers

Unlike events, alphabets are ordered.  Each symbol (except the first) in an
alphabet has one and only one _predecessor_, and each symbol (except the last)
has one and only one _successor_.

So the range of symbols in an alphabet is bounded.  However, when considering
a string of symbols (which I'll call a _symbol-string_), such as the name of
an event, we can use lexicographic ordering to concoct something resembling
Peano arithmetic to generate an unbounded sequence of symbol-strings, so long
as each symbol in a string is in the same alphabet.

Thus, for some alphabet, every symbol-string has one and only one successor.
Again, though, there is one symbol-string which has no predecessor — the
symbol-string which is one symbol long, where that symbol is the first symbol
of the alphabet.

These concepts are implemented in β-Juliet version 2.0 with _modifiers_.
When a parameter is named in a consequence, it is replaced by the value it is
bound to, and this can be altered by one of the following modifiers:

* `next` — assuming the value is a single symbol, use the next symbol
  in its alphabet instead;
* `prev` — assuming the value is a single symbol, use the previous symbol
  in its alphabet instead;
* `succ` — assuming the value is a symbol-string, use the successor
  symbol-string over its alphabet;
* `pred` — assuming the value is a symbol-string, use the predecessor
  symbol-string over its alphabet instead.

Note that all of these modifiers (except `succ`) can fail.  In this case,
an alternate or `failure-mode` modifier or symbol can be given, and this
will be used instead.

## Extended Grammar

The grammar for β-Juliet version 2.0 builds on the productions from
version 1.0, while replacing or adding the following productions.

First, it allows alphabets as well as events to be declared.  It also
explicitly reserves syntax for implementation-specific pragmas and
system events (but does not define the meaning of any of these itself.)

    Decl          ::= Pragma | Alphabet | Event.
    Pragma        ::= "pragma" <<<implementation-specific>>>.
    Alphabet      ::= "alphabet" AlphabetName {"," Symbol}.
    AlphabetName  ::= Symbol.

It extends the `causes` syntax to include specifying a duration as part
of it, using the `after` keyword.  The `duration` syntax is still supported;
if it is given as a property of an event, the duration specified in it will
be applied to all `causes` clauses on the event which do *not* include their
own `after` delay.

Note also that `caused` clauses do not support an `after` delay.

    Causes        ::= "causes" EventAppl ["after" TimeSpec] {WhenTerm}.

Lastly, it significantly extends the syntax for declaring, and using, an
event, to include multi-symbol events and event patterns.

    EventDecl     ::= EventDeclComp {EventDeclComp}.
    EventDeclComp ::= Symbol | "(" ParamName "=" MatchExpr ")".
    ParamName     ::= Symbol.
    MatchExpr     ::= AlphabetName ["+"].

    EventAppl     ::= EventApplComp {EventApplComp}.
    EventApplComp ::= SymbolName | "(" AlphabetExpr ")".

    AlphabetExpr    ::= AlphabetTerm {"|" AlphabetTerm}.
    AlphabetTerm    ::= "succ" ParamName
                      | "pred" ParamName
                      | "next" ParamName
                      | "prev" ParamName
                      | "first" AlphabetName
                      | "last" AlphabetName
                      | SymbolName
                      .

Extra conditions, however, are placed on `caused by` clauses.  Both the name
of the event which is the cause, and the name of the event which is being
caused, must be literal symbol strings, not patterns.

## Implementations

There is a crude implementation of β-Juliet version 1.0 in the form of a
Perl 5 script.  It does not implement delays, but it does implement the
ordering guarantees between `caused before` and `caused after`.

The reference implementation of β-Juliet version 2.0, called `2iota`, is
written in C.  It implements delays (when compiled as ANSI C they have
second granularity; when compiled as C99 with POSIX, they have millisecond
granularity.)  It does not yet, however, properly implement the ordering
guarantees between `caused before` and `caused after` clauses; nor does it
parse `immediately`.

## Historical Note

In 2012 I decided that the languages β-Juliet and 2Iota are really too similar
to be seperate languages.  So, as of this repo, they've been merged like this:

* This language is called β-Juliet (a.k.a. beta-Juliet).
* The language previously referred to as β-Juliet is now β-Juliet 1.0.
* The language previously referred to as 2Iota (plus minor modifications) is
  now β-Juliet 2.0.
* The reference interpreter for β-Juliet 2.0 is called `2iota`.
* The file extension of a β-Juliet source file is typically `.bj`,
  although you may see `.2i` used as well.  The latter suggests that
  the source relies on features only in version 2.0.
* The optional pre-processor for β-Juliet 1.0 is still called Portia.
  Portia is not needed with β-Juliet 2.0, and may or may not work with it; I
  don't know yet.

