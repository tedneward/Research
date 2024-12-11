title=SWI-Prolog
tags=language, logic, prolog
summary=A comprehensive Prolog environment, probably the gold standard of such.
~~~~~~

[Website](http://www.swi-prolog.org/)

> SWI-Prolog offers a comprehensive free Prolog environment.
> Since its start in 1987, SWI-Prolog development has been
> driven by the needs of real world applications.
> SWI-Prolog is widely used in research and education
> as well as commercial applications."

> Its main author is Jan Wielemaker.
> The name SWI is derived from Sociaal-Wetenschappelijke Informatica
> ("Social Science Informatics"), the former name of the group at
> the University of Amsterdam, where Wielemaker is employed.

{% aTargetBlank "https://www.swi-prolog.org", "SWI-Prolog" %}
is implemented in C (48%) and Prolog (39%).

To install the terminal command `swipl` in macOS,
enter `brew install swi-prolog`

To start a SWI-Prolog top level from a terminal, enter `swipl`.

To specify configuration for all top level sessions,
create the file `$HOME/.config/swi-prolog/init.pl`.
For example, this file might set [prolog flags](#prolog-flags).

#### SWI-Prolog Execution

To enter and run Prolog code in a web browser using SWI-Prolog,
browse [SWISH](https://swish.swi-prolog.org).

Enter facts and rules in the left pane.
Enter a query in the lower-right pane.
Press the "Run!" button or ctrl-return to execute the query.

#### SWI-Prolog Conformance

SWI-Prolog adds features beyond the ISO standard,
some of which contradict the standard, making it non-conforming.
One example is the addition of a string type.
Many dedicated predicates are needed to operate on these strings
rather than using list predicates.
Another example is the addition of a custom dict type.

It is very easy to write code that runs in SWI-Prolog,
but does not run in other Prolog implementations.
In addition, some code that is valid according to the ISO standard
does not run in SWI-Prolog.

For a detailed take on this issue, see {% aTargetBlank
"https://www.youtube.com/watch?v=kGQNeeRp4sM", "Preparing Prolog" %}.

Also see {% aTargetBlank
"https://www.complang.tuwien.ac.at/ulrich/iso-prolog/SWI7_and_ISO",
"SWI7 and ISO Prolog" %}.

#### SWI-Prolog Packs

Packs are add-on libraries.

To see a list of known packages, browse {% aTargetBlank
"https://www.swi-prolog.org/pack/list",
"Packs (add-ons) for SWI-Prolog" %}.
Alternatively, enter `pack_list(substring)` where
substring is part of one or more pack names.

To install a pack, enter `pack_install(name)`.
This will download the code and install it.

The "reif" pack (reified if) implements the `if_` predicate
which is similar to the `->` operator, but has some advantages.
See the section "Higher-order Predicates" for examples.

The {% aTargetBlank "https://www.swi-prolog.org/pack/list?p=gvterm",
"gvterm" %} pack generates a graphviz file from a Prolog term.
This is useful for visualizing the tree structure of a term.

#### SWI-Prolog Debugging

For information on using the debugger in SWI-Prolog, see {% aTargetBlank
"https://www.swi-prolog.org/pldoc/man?section=debugoverview",
"Overview of the Debugger" %}.

The `trace` predicate enables tracing of the search to find a query solution.

The following code defines fact about my family and a rule about grandfathers.

```prolog
female(amanda).
female(judi).
female(tami).

male(jeremy).
male(mark).
male(richard).

father(richard, mark).
father(mark, amanda).
father(mark, jeremy).

mother(judi, mark).
mother(tami, amanda).
mother(tami, jeremy).

grandfather_of(X, Y) :-
  father(X, P),
  (father(P, Y); mother(P, Y)).
```

To trace the execution of the query `grandfather_of(richard, X).`,
enter `trace.` and then the query.
The screenshot below shows the output.
After each line in the trace, press the spacebar
to advance to the next term to be evaluated.
After a solution is found, press the semicolon key or the spacebar
to begin searching for the next solution.

<img alt="SWI-Prolog trace" style="width: 60%"
  src="/blog/assets/swi-prolog-trace.png?v={{pkg.version}}"
  title="SWI-Prolog trace">

The `trace` predicate enables both the trace and debug modes.
To disable these, enter `notrace.` and `nodebug.`

#### SWI-Prolog Executables

To compile a Prolog source file to an executable,
enter `swipl -o {exe-name} -c {source-name}.pl`.
For example, `swipl -o sukuko -c suduko.pl`.
Running this executable with `./suduko` starts a top level session
and loads the compiled facts and rules.

### Other SWI-Prolog-related

[Web-Prolog](https://github.com/Web-Prolog/swi-web-prolog) | [Book](https://github.com/Web-Prolog/swi-web-prolog/blob/master/book/web-prolog.pdf)

["Creating Web Applications in SWI-Prolog"](http://www.pathwayslms.com/swipltuts/html/index.html)

["yet another web applications tutorial"](https://swi-prolog.discourse.group/t/yet-another-web-applications-tutorial/566/16) | ["Writing a blog using SWI Prolog"](https://github.com/roblaing/swipl-webapp-howto) storing to Postgresql as the storage.

["How to create a web service easily?"](https://www.swi-prolog.org/howto/http/)
