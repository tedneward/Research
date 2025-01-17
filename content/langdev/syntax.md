title=Language Development Syntax
tags=language development, language
summary=A collection of language syntax examples.
~~~~~~

From [here](https://rigaux.org/language-study/syntax-across-languages.html):

<h2><a name="Vrs">Various</a></h2>
<ul>
<li><a name="VrsCmmnt">commenting</a><p>
until end of line
<table border=1 cellpadding=3>
<tr><td><tt>#</tt></td><td>Awk, BourneShell, CoffeeScript, E, FishShell, GNU-bc, GNU-sed, Icon, Io, Julia, Maple, merd, Perl, Perl6, PHP, Pliant, Python, Ruby, Tcl, YAML</td></tr>
<tr><td><tt>//</tt></td><td>BCPL, C#, C++, C99, Dylan, F#, Go, Io, Java, JavaScript, PHP, Pike, Scilab, YCP, Yorick</td></tr>
<tr><td><tt>--</tt></td><td>Ada, Cecil, Eiffel, Haskell, Lua, Sather, Simula, SQL92</td></tr>
<tr><td><tt>;</tt></td><td>Assembler, Common Lisp, Emacs Lisp, Logo, MUMPS, Rebol, Scheme</td></tr>
<tr><td><tt>%</tt></td><td>Erlang, Matlab, Mercury, Oz, PostScript, Prolog, TeX</td></tr>
<tr><td><tt>rem</tt></td><td>Basic</td></tr>
<tr><td><tt>'</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>"</tt></td><td>Vimscript</td></tr>
<tr><td><tt>\</tt></td><td>Forth</td></tr>
<tr><td><tt>!</tt></td><td>Assembler, Fortran90</td></tr>
<tr><td><tt>NB.</tt></td><td>J</td></tr>
<tr><td><tt>C or * in column 1</tt></td><td>Fortran</td></tr>
</table><p>
nestable
<table border=1 cellpadding=3>
<tr><td><tt>(* ... *)</tt></td><td>Beta, F#, Mathematica, Modula-3, OCaml, Pascal, SML</td></tr>
<tr><td><tt>%( ... %)</tt></td><td>Matlab</td></tr>
<tr><td><tt>/* ... */</tt></td><td>Classic REXX, Dylan, Io, Oz, SQL99</td></tr>
<tr><td><tt>{ ... }</tt></td><td>Pascal, Rebol</td></tr>
<tr><td><tt>{- ... -}</tt></td><td>Haskell</td></tr>
<tr><td><tt>#| ... |#<a href="#1">(1)</a></tt></td><td>Common Lisp, Scheme</td></tr>
<tr><td><tt>#= ... =#</tt></td><td>Julia</td></tr>
<tr><td><tt>#[ ... ]</tt></td><td>Perl6</td></tr>
<tr><td><tt>#if 0 ... #endif</tt></td><td>C</td></tr>
<tr><td><tt>comment { ... }</tt></td><td>Rebol</td></tr>
<tr><td><tt>comment [ ... ]</tt></td><td>Rebol</td></tr>
<tr><td><tt>[ ... ]<a href="#2">(2)</a></tt></td><td>Rebol</td></tr>
<tr><td><tt>--[[ ... ]]</tt></td><td>Lua</td></tr>
</table><p>
non nestable
<table border=1 cellpadding=3>
<tr><td><tt>" ... "</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>/* ... */</tt></td><td>B, C, C#, C++, CSS, GNU-bc, Go, Java, JavaScript, Mercury, PHP, Pike, PL/I, YCP, Yorick</td></tr>
<tr><td><tt>&lt;!-- ... --&gt;</tt></td><td>HTML, XML</td></tr>
<tr><td><tt>( ... )</tt></td><td>Forth</td></tr>
<tr><td><tt><pre>###
...
###</pre></tt></td><td>CoffeeScript</td></tr>
</table><p>
<li><a name="VrsDcmnCmmn">documentation comment</a><p>
until end of line
<table border=1 cellpadding=3>
<tr><td><tt>///</tt></td><td>C#, F#, Java</td></tr>
<tr><td><tt>-- |</tt></td><td>Haskell</td></tr>
<tr><td><tt>-- ^</tt></td><td>Haskell</td></tr>
</table><p>
non nestable
<table border=1 cellpadding=3>
<tr><td><tt>/** ... */<a href="#3">(3)</a></tt></td><td>C, C#, E, Java, JavaScript, PHP</td></tr>
<tr><td><tt>(** ... *)</tt></td><td>F#</td></tr>
</table><p>

<table border=1 cellpadding=3>
<tr><td><tt>{-| ... -}</tt></td><td>Haskell</td></tr>
<tr><td><tt>(** ... *)</tt></td><td>OCaml</td></tr>
<tr><td><tt>/* DOCUMENT ... */</tt></td><td>Yorick</td></tr>
<tr><td><tt>indexing
              identifier: "...";</tt></td><td>Eiffel</td></tr>
<tr><td><tt>someClass comment: '...'</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>rebol [ Note: "..." ]</tt></td><td>Rebol</td></tr>
<tr><td><tt>func ["..." arg] ...</tt></td><td>Rebol</td></tr>
<tr><td><tt><pre>class X:
"""...
"""

def x():
"""...
"""
</pre><a href="#4">(4)</a></tt></td><td>Python</td></tr>
<tr><td><tt>(define (f para1 para2) "..." ...)</tt></td><td>Scheme</td></tr>
<tr><td><tt>(defun f (para1 para2) "..." ...)</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt><pre>=pod
...
=cut</pre><a href="#5">(5)</a></tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt><pre>=begin
...
=end</pre></tt></td><td>Ruby</td></tr>
<tr><td><tt><pre>function MYFUNCTION
%MYFUNCTION the very first comment line is displayed in the help table of contents
%
% the remaining lines are displayed when getting help for MYFUNCTION
%
</pre></tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="VrsnbCLAF">information about the current line and file</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>__LINE__ __FILE__</tt></td><td>C, C++, Perl, PHP, Pike, Ruby</td></tr>
<tr><td><tt>__LINE__ __SOURCE_FILE__</tt></td><td>F#</td></tr>
<tr><td><tt>$?LINE $?FILE</tt></td><td>Perl6</td></tr>
<tr><td><tt>__file__</tt></td><td>Python</td></tr>
<tr><td><tt><pre>(new System.Diagnostics.StackFrame(true)).GetFileLineNumber()
(new System.Diagnostics.StackFrame(true)).GetFileName()</pre></tt></td><td>C#</td></tr>
<tr><td><tt><pre>Thread.currentThread().getStackTrace()[1].getLineNumber();
Thread.currentThread().getStackTrace()[1].getFileName();</pre></tt></td><td>Java</td></tr>
<tr><td><tt>system/script/header/file<a href="#6">(6)</a></tt></td><td>Rebol</td></tr>
<tr><td><tt>SOURCELINE() / parse source OS . SOURCENAME</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>info frame 0</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>thisContext lineNumber / thisContext method source</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>runtime.Caller(0)</tt></td><td>Go</td></tr>
</table><p>
<li><a name="VrsTkns">tokens</a><p>
case-sensitivity (keywords, variable identifiers...)
<table border=1 cellpadding=3>
<tr><td><tt>case-sensitive</tt></td><td>Awk, B, BourneShell, C, C#, C++, CoffeeScript, F#, FishShell, Go, Haskell, Io, Java, JavaScript, Lua, Maple, Mathematica, Matlab, merd, Modula-3, OCaml, Perl, Perl6, Pike, Pliant, Prolog, Python, Ruby, Smalltalk, Tcl, XML, YAML, Yorick</td></tr>
<tr><td><tt>case-insensitive</tt></td><td>Ada, Assembler, Classic REXX, Common Lisp, CSS, Eiffel, Forth, HTML, Logo, Pascal, PL/I, Rebol, SGML, SQL92, Visual Basic</td></tr>
<tr><td><tt>case-sensitive: variables<br>case-insensitive: keywords, functions, constants...</tt></td><td>PHP</td></tr>
<tr><td><tt>case-sensitive: identifiers<br>case-insensitive: keywords</tt></td><td>E</td></tr>
<tr><td><tt>case-sensitive: identifiers<br>case-insensitive: commands</tt></td><td>MUMPS</td></tr>
<tr><td><tt>case-sensitive: upper case disallowed</tt></td><td>GNU-bc</td></tr>
</table><p>
what is the standard way for <a href="http://c2.com/cgi/wiki?CapitalizationRules">scrunching together multiple words</a>
<table border=1 cellpadding=3>
<tr><td><tt>camelCase</tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>CamelCase or camelCase</tt></td><td>C#, E, Go, Haskell, Io, Java, JavaScript, Mathematica, Pascal, Smalltalk, Tcl, Visual Basic</td></tr>
<tr><td><tt>underscores</tt></td><td>FishShell, GNU-bc, merd</td></tr>
<tr><td><tt>dots</tt></td><td>Logo</td></tr>
<tr><td><tt>hyphens</tt></td><td>Common Lisp, Emacs Lisp, Rebol, Scheme</td></tr>
<tr><td><tt>underscores for functions / types, unclear for modules / constructors</tt></td><td>OCaml</td></tr>
<tr><td><tt>UPPER_CASE</tt></td><td>BourneShell</td></tr>
<tr><td><tt>lowercasenoseparator</tt></td><td>Matlab</td></tr>
<tr><td><tt>underscores, UPPER_CASE for class names</tt></td><td>Eiffel</td></tr>
<tr><td><tt>CamelCase for classes, underscores for methods</tt></td><td>Python</td></tr>
<tr><td><tt>CamelCase for types, underscores for functions, variables, ...</tt></td><td>Pliant</td></tr>
<tr><td><tt>CamelCase for methods, types and modules, underscore for functions</tt></td><td>F#</td></tr>
<tr><td><tt>CamelCase for modules and classes, ALL_CAPS for constants, underscores for functions, variables, ...</tt></td><td>Ruby</td></tr>
<tr><td><tt>CamelCase for modules and classes, ALLCAPS for macros, underscores for methods, constants and variables</tt></td><td>Pike</td></tr>
<tr><td><tt>CamelCase for modules, ALL_CAPS for constants, unclear for functions / variables</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>CamelCase for variables, underscores for predicates</tt></td><td>Prolog</td></tr>
<tr><td><tt>usually lowercase or underscores, ALL_CAPS for macros</tt></td><td>C</td></tr>
<tr><td><tt>usually underscores</tt></td><td>C++</td></tr>
<tr><td><tt>Camel_Case</tt></td><td>Ada</td></tr>
</table><p>
variable identifier regexp
<table border=1 cellpadding=3>
<tr><td><tt>[a-zA-Z][a-zA-Z0-9]*</tt></td><td>FishShell, Mathematica, PL/I, Smalltalk</td></tr>
<tr><td><tt>[a-zA-Z][_a-zA-Z0-9]*</tt></td><td>Eiffel, Matlab, Vimscript</td></tr>
<tr><td><tt>[a-zA-Z](_?[a-zA-Z0-9])*</tt></td><td>Ada</td></tr>
<tr><td><tt>[_a-zA-Z][_a-zA-Z0-9]*</tt></td><td>Awk, B, C, C#, C++, E, Go, Maple, PHP, Python, Tcl</td></tr>
<tr><td><tt>[_a-zA-Z0-9]+</tt></td><td>BourneShell, Perl, Perl6</td></tr>
<tr><td><tt>[a-zA-Z0-9]+</tt></td><td>FishShell</td></tr>
<tr><td><tt>[_a-zA-Z][_a-zA-Z0-9]* or '[^']*'</tt></td><td>Pliant</td></tr>
<tr><td><tt>[_a-zA-Z$][_a-zA-Z0-9$]*</tt></td><td>Java</td></tr>
<tr><td><tt>[$A-Za-z_\x7f-\uffff][$\w\x7f-\uffff]*</tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>[a-zA-Z%][a-zA-Z0-9]*</tt></td><td>MUMPS</td></tr>
<tr><td><tt>[_a-z][_a-zA-Z0-9]*</tt></td><td>Ruby</td></tr>
<tr><td><tt>[_a-z][_a-zA-Z0-9]*[!?']*</tt></td><td>merd</td></tr>
<tr><td><tt>[_a-z][_a-zA-Z0-9']*</tt></td><td>Haskell, OCaml, SML</td></tr>
<tr><td><tt>[_a-zA-Z][_a-zA-Z0-9']*</tt></td><td>F#</td></tr>
<tr><td><tt>[_A-Z][_a-zA-Z0-9]*</tt></td><td>Mercury, Prolog</td></tr>
<tr><td><tt>[_a-zA-Z!0&*/:&lt;=&gt;?^][_a-zA-Z!0&*/:&lt;=&gt;?^0-9.+-]*</tt></td><td>Scheme</td></tr>
<tr><td><tt>[a-zA-Z!?@#][a-zA-Z0-9!?@#]*</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>[_a-zA-Z?!.'+*&|=~-][_a-zA-Z0-9?!.'+*&|=~-]* or 
<br>[^0-9[](){}":;/][^ \n\t[](){}":;/]*</tt></td><td>Rebol</td></tr>
<tr><td><tt>[a-z][a-z0-9_]*</tt></td><td>GNU-bc</td></tr>
<tr><td><tt>anything without a space and is not a number</tt></td><td>Common Lisp, Forth</td></tr>
</table><p>
function identifier regexp (if different from variable identifier regexp)
<table border=1 cellpadding=3>
<tr><td><tt>[_a-zA-Z][_a-zA-Z0-9]*[!?]?</tt></td><td>Ruby</td></tr>
<tr><td><tt>[_a-z][_a-zA-Z0-9]*</tt></td><td>Mercury, Prolog</td></tr>
<tr><td><tt>[A-Z][_a-zA-Z0-9]*<a href="#7">(7)</a></tt></td><td>Vimscript</td></tr>
<tr><td><tt>[^ \t\n\r\f]+</tt></td><td>Tcl</td></tr>
<tr><td><tt>[^ \t\n\r\f/]+</tt></td><td>FishShell</td></tr>
</table><p>
keyword regexp (if different from variable identifier regexp)
<table border=1 cellpadding=3>
<tr><td><tt>[A-Z]+</tt></td><td>Modula-3</td></tr>
</table><p>
type regexp (if different from variable identifier regexp)
<table border=1 cellpadding=3>
<tr><td><tt>[_A-Z][_a-zA-Z0-9']*</tt></td><td>Haskell</td></tr>
<tr><td><tt>[_a-z][_a-zA-Z0-9']*</tt></td><td>Mercury, OCaml</td></tr>
</table><p>
constant regexp (if different from variable identifier regexp)
<table border=1 cellpadding=3>
<tr><td><tt>[A-Z][_a-zA-Z0-9]*</tt></td><td>Ruby</td></tr>
<tr><td><tt>[_A-Z][_a-zA-Z0-9']*</tt></td><td>Haskell, OCaml</td></tr>
<tr><td><tt>[_a-z][_a-zA-Z0-9']*</tt></td><td>Mercury</td></tr>
</table><p>
<li><a name="VrsBLsWEOLAOnHSM">breaking lines (useful when end-of-line and/or indentation has a special meaning)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>nothing needed</tt></td><td>Ada, B, C, C#, C++, Common Lisp, D, Eiffel, Emacs Lisp, F#, Forth, Go, Haskell, Java, JavaScript, Maple, Mathematica, OCaml, Oz, Pascal, Perl, Perl6, PHP, PostScript, Rebol, Scheme, Smalltalk, SML, XSLT, YCP</td></tr>
<tr><td><tt>\</tt></td><td>Awk, BourneShell, C, CoffeeScript, E, FishShell, GNU-bc, Io, Python, Ruby, Tcl</td></tr>
<tr><td><tt>_</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>,</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>~</tt></td><td>Logo</td></tr>
<tr><td><tt>...</tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="VrsVrbssgOrDcl">variable assignment or declaration</a><p>
assignment
<table border=1 cellpadding=3>
<tr><td><tt>=</tt></td><td>Awk, B, Basic, BourneShell, C, C#, C++, Classic REXX, Erlang, Go, Icon, Io, Java, JavaScript, Lua, Mathematica, Matlab, Oz, Perl, Perl6, PHP, Pike, YCP, Yorick</td></tr>
<tr><td><tt>:=</tt></td><td>Ada, BCPL, Cecil, Dylan, E, Eiffel, Maple, Mathematica, Modula-3, Pascal, Pliant, Sather, Simula, Smalltalk, SML</td></tr>
<tr><td><tt>&lt;-</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>_<a href="#8">(8)</a></tt></td><td>Squeak</td></tr>
<tr><td><tt>:</tt></td><td>BCPL, Rebol</td></tr>
<tr><td><tt>-&gt;<a href="#9">(9)</a></tt></td><td>Beta</td></tr>
<tr><td><tt>def</tt></td><td>PostScript</td></tr>
<tr><td><tt>setq</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>setf</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>set</tt></td><td>Common Lisp, FishShell, Rebol</td></tr>
<tr><td><tt>SET v=...</tt></td><td>MUMPS</td></tr>
<tr><td><tt>set!</tt></td><td>Scheme</td></tr>
<tr><td><tt>is</tt></td><td>Prolog</td></tr>
<tr><td><tt>make "v e</tt></td><td>Logo</td></tr>
<tr><td><tt>e v !</tt></td><td>Forth</td></tr>
</table><p>
declaration
<table border=1 cellpadding=3>
<tr><td><tt>=</tt></td><td>Haskell, Mercury, Prolog</td></tr>
<tr><td><tt>&lt;-</tt></td><td>Haskell</td></tr>
<tr><td><tt>:-</tt></td><td>Prolog</td></tr>
<tr><td><tt>:=</tt></td><td>Io</td></tr>
<tr><td><tt>let v = e in</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>let val v = e in</tt></td><td>SML</td></tr>
<tr><td><tt>let v = e<a href="#10">(10)</a></tt></td><td>BCPL, F#, Vimscript</td></tr>
<tr><td><tt>def v := e / var v := e</tt></td><td>E</td></tr>
<tr><td><tt>my / our / local / use vars</tt></td><td>Perl</td></tr>
<tr><td><tt>my / our / temp</tt></td><td>Perl6</td></tr>
<tr><td><tt>define</tt></td><td>Dylan, Scheme</td></tr>
<tr><td><tt>let let*</tt></td><td>Common Lisp, Scheme</td></tr>
<tr><td><tt>letrec</tt></td><td>Scheme</td></tr>
<tr><td><tt>flet labels defun defmethod defvar defparameter defsetf ..</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>local V1 = e V2 = e2 in ... end</tt></td><td>Oz</td></tr>
<tr><td><tt>global v1, v2</tt></td><td>Python</td></tr>
<tr><td><tt>global v1 v2</tt></td><td>Matlab, Scilab</td></tr>
<tr><td><tt>:@</tt></td><td>Beta</td></tr>
<tr><td><tt>NEW v</tt></td><td>MUMPS</td></tr>
<tr><td><tt>v: t</tt></td><td>Ada, Eiffel, Pascal</td></tr>
<tr><td><tt>t v</tt></td><td>C, C#, C++, Java</td></tr>
<tr><td><tt>var v t</tt></td><td>Go</td></tr>
<tr><td><tt>| v1 v2 |</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>auto v1, v2; extrn v3, v4;</tt></td><td>B</td></tr>
<tr><td><tt>auto</tt></td><td>GNU-bc</td></tr>
<tr><td><tt>var</tt></td><td>JavaScript, Pliant</td></tr>
<tr><td><tt>gvar</tt></td><td>Pliant</td></tr>
<tr><td><tt>variable v<a href="#11">(11)</a></tt></td><td>Forth</td></tr>
<tr><td><tt>e value v</tt></td><td>Forth</td></tr>
<tr><td><tt>Module[{x, y = v},  ... ]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>Block[{x, y = v}, ... ]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>With[{c1 = v1, c2 = v2, ... }, ...]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>&lt;xsl:variable name="v" select="e"/&gt;</tt></td><td>XSLT</td></tr>
</table><p>
both
<table border=1 cellpadding=3>
<tr><td><tt>=</tt></td><td>CoffeeScript, GNU-bc, merd, Python, Ruby</td></tr>
<tr><td><tt>:=</tt></td><td>Go, merd</td></tr>
<tr><td><tt>set, variable</tt></td><td>Tcl</td></tr>
</table><p>
<li><a name="VrsGrpnxprs">grouping expressions</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>( ... )</tt></td><td>Ada, Awk, B, BCPL, Beta, C, C#, C++, Classic REXX, CoffeeScript, D, E, Eiffel, F#, GNU-bc, Go, Haskell, Io, Java, JavaScript, Julia, Logo, Lua, Maple, Mathematica, Matlab, merd, Modula-3, MSH, MUMPS, OCaml, Oz, Pascal, Perl, Perl6, PHP, Pike, Pliant, Prolog, Python, Rebol, Ruby, Scilab, Smalltalk, SML, SQL92, Tcl, Vimscript, XPath, YCP, Yorick</td></tr>
<tr><td><tt>[ ... ]</tt></td><td>Rebol</td></tr>
<tr><td><tt>indentation</tt></td><td>merd</td></tr>
<tr><td><tt>$ ...</tt></td><td>Haskell</td></tr>
<tr><td><tt>begin ... end</tt></td><td>F#, FishShell, OCaml, Ruby</td></tr>
<tr><td><tt>space<a href="#12">(12)</a></tt></td><td>merd</td></tr>
</table><p>
<li><a name="VrsBGSsWSANx">block (grouping statements, especially when statements are not expressions)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>{ ... }</tt></td><td>Awk, BCPL, BourneShell, GNU-bc, GNU-sed, JavaScript, PHP, Pike, Tcl, Yorick</td></tr>
<tr><td><tt>{ ... }<a href="#13">(13)</a></tt></td><td>B, C, C#, C++, E, Go, Haskell, Java, Modula-3, Perl, Perl6, YCP</td></tr>
<tr><td><tt>( ... )<a href="#13">(13)</a></tt></td><td>BourneShell</td></tr>
<tr><td><tt>[ ... ]<a href="#14">(14)</a></tt></td><td>Logo, Smalltalk</td></tr>
<tr><td><tt>"..."</tt></td><td>Tcl</td></tr>
<tr><td><tt>begin ... end<a href="#13">(13)</a></tt></td><td>Ada, Pascal</td></tr>
<tr><td><tt>(begin ...)</tt></td><td>Scheme</td></tr>
<tr><td><tt>BEGIN ... END</tt></td><td>Modula-3</td></tr>
<tr><td><tt>do ... end</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>do ... end<a href="#13">(13)</a></tt></td><td>Lua, PL/I</td></tr>
<tr><td><tt>indentation</tt></td><td>CoffeeScript, F#, MUMPS, Pliant, Python</td></tr>
<tr><td><tt>indentation<a href="#13">(13)</a></tt></td><td>Haskell, merd</td></tr>
<tr><td><tt>foo ... end  where foo in { if, do, ... }</tt></td><td>Modula-2, Ruby</td></tr>
<tr><td><tt>foo ... end  where foo in { if, for, while, ... }</tt></td><td>Matlab, Scilab</td></tr>
<tr><td><tt>foo ... end  where foo in { if, loop, ... }</tt></td><td>Eiffel</td></tr>
<tr><td><tt>foo ... end foo  where foo in { if, do, ... }</tt></td><td>Ada, Fortran90</td></tr>
<tr><td><tt>(* ... *)<a href="#15">(15)</a></tt></td><td>BCPL</td></tr>
<tr><td><tt>(# ... #)</tt></td><td>Beta</td></tr>
</table><p>
<li><a name="VrsUBARVWSANx">use a block as a return value (when statements are not expressions)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>valof</tt></td><td>BCPL</td></tr>
<tr><td><tt>do</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>proc() .. end proc</tt></td><td>Maple</td></tr>
</table><p>
<li><a name="Vrsqltnqlt">equality / inequality</a><p>
shallow
<table border=1 cellpadding=3>
<tr><td><tt>== !=</tt></td><td>Awk, B, C, C++, CoffeeScript, F#, Go, Io, Java, OCaml, Perl, Perl6, Pike, Yorick</td></tr>
<tr><td><tt>= /=</tt></td><td>Eiffel, Fortran90</td></tr>
<tr><td><tt>= &lt;&gt;</tt></td><td>Forth, Logo, Maple, Modula-2, Pliant, Rebol</td></tr>
<tr><td><tt>= #<a href="#16">(16)</a></tt></td><td>Modula-2, Modula-3</td></tr>
<tr><td><tt>= !=</tt></td><td>BourneShell, FishShell</td></tr>
<tr><td><tt>== === != !==<a href="#17">(17)</a></tt></td><td>JavaScript, PHP</td></tr>
<tr><td><tt>=== !==</tt></td><td>Perl6, PHP5</td></tr>
<tr><td><tt>== ~=</tt></td><td>Lua</td></tr>
<tr><td><tt>== ~~</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>== ~==</tt></td><td>Dylan</td></tr>
<tr><td><tt>= '=</tt></td><td>MUMPS</td></tr>
<tr><td><tt>= ~= neqv<a href="#15">(15)</a></tt></td><td>BCPL</td></tr>
<tr><td><tt>f= f&lt;&gt;</tt></td><td>Forth</td></tr>
<tr><td><tt>is_equal<a href="#18">(18)</a></tt></td><td>Eiffel</td></tr>
<tr><td><tt>eq ne</tt></td><td>Emacs Lisp, PostScript</td></tr>
<tr><td><tt>eq, eql</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>eq? eqv?</tt></td><td>Scheme</td></tr>
<tr><td><tt>.EQ. .NE.</tt></td><td>Fortran</td></tr>
<tr><td><tt>is / is not</tt></td><td>Python</td></tr>
<tr><td><tt>is / isnot</tt></td><td>Vimscript</td></tr>
</table><p>
deep
<table border=1 cellpadding=3>
<tr><td><tt>== !=</tt></td><td>Awk, C#, C++, E, merd, PHP5, Python, Ruby, Tcl, Vimscript, YCP</td></tr>
<tr><td><tt>== &lt;&gt;</tt></td><td>Python</td></tr>
<tr><td><tt>== /=</tt></td><td>Haskell</td></tr>
<tr><td><tt>== \=</tt></td><td>Oz</td></tr>
<tr><td><tt>== \==</tt></td><td>Classic REXX, Prolog</td></tr>
<tr><td><tt>= /=</tt></td><td>Ada</td></tr>
<tr><td><tt>= !=</tt></td><td>Maple, XPath</td></tr>
<tr><td><tt>= &lt;&gt;</tt></td><td>Beta, F#, OCaml, Pascal, Rebol, SML, SQL92, Visual Basic</td></tr>
<tr><td><tt>= ~=</tt></td><td>Dylan, Smalltalk</td></tr>
<tr><td><tt>== ~= eq ne isequal isequalwithequalnans</tt></td><td>Matlab</td></tr>
<tr><td><tt>== ~= eq ne isequal</tt></td><td>Scilab</td></tr>
<tr><td><tt>=@= \=@= / = \= / =:= =\=<a href="#19">(19)</a></tt></td><td>Prolog</td></tr>
<tr><td><tt>=== =!= / == !=<a href="#20">(20)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>.eq</tt></td><td>Logo</td></tr>
<tr><td><tt>equal?</tt></td><td>Scheme</td></tr>
<tr><td><tt>equals</tt></td><td>Java</td></tr>
<tr><td><tt>equal</tt></td><td>Common Lisp, Emacs Lisp, Pike</td></tr>
<tr><td><tt>equalp</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>eqv</tt></td><td>Perl6</td></tr>
<tr><td><tt>deep_is_equal</tt></td><td>Eiffel</td></tr>
<tr><td><tt>isEqual</tt></td><td>Objective-C</td></tr>
</table><p>
<li><a name="VrsCmprs">comparison</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>&lt; &gt; &lt;= &gt;=</tt></td><td>Ada, Awk, Awk, B, Beta, C, C#, C++, Classic REXX, CoffeeScript, Common Lisp, Dylan, E, Eiffel, Emacs Lisp, F#, Forth, Go, Haskell, Io, Java, JavaScript, Logo, Lua, Maple, Mathematica, Matlab, merd, Modula-3, OCaml, Pascal, Perl, Perl6, PHP, Pike, Pliant, Python, Rebol, Ruby, Scheme, Scilab, Smalltalk, SML, SQL92, Tcl, Vimscript, Visual Basic, XPath, YCP, Yorick</td></tr>
<tr><td><tt>&lt; &gt; =&lt; &gt;=</tt></td><td>Mercury, Oz</td></tr>
<tr><td><tt>&lt; &gt; '&gt; '&lt;</tt></td><td>MUMPS</td></tr>
<tr><td><tt>&lt;&lt; &gt;&gt; &lt;&lt;= &gt;&gt;=<a href="#21">(21)</a></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>@&lt; / @=&lt; / @&gt; / @&gt;=</tt></td><td>Prolog</td></tr>
<tr><td><tt>lt gt le ge</tt></td><td>Perl, Perl6, PostScript</td></tr>
<tr><td><tt>-lt -gt -le -ge</tt></td><td>BourneShell, FishShell, MSH</td></tr>
<tr><td><tt>.LT. .GT. .LE. .GE.</tt></td><td>Fortran</td></tr>
<tr><td><tt>u&lt; u&gt; u&lt;= u&gt;=</tt></td><td>Forth</td></tr>
<tr><td><tt>f&lt; f&gt;</tt></td><td>Forth</td></tr>
</table><p>
returns 3 values (i.e. inferior, equal or superior)
<table border=1 cellpadding=3>
<tr><td><tt>a &lt;=&gt; b</tt></td><td>merd, Perl, Perl6, Ruby</td></tr>
<tr><td><tt>cmp</tt></td><td>Perl, Perl6, Python</td></tr>
<tr><td><tt>compare</tt></td><td>F#, Forth, Haskell, Mercury, OCaml, Pliant, Prolog, Smalltalk</td></tr>
<tr><td><tt>strcmp</tt></td><td>C, PHP</td></tr>
<tr><td><tt>three_way_comparison</tt></td><td>Eiffel</td></tr>
<tr><td><tt>string compare</tt></td><td>Tcl</td></tr>
<tr><td><tt>compareTo</tt></td><td>Java</td></tr>
<tr><td><tt>strings.Compare()</tt></td><td>Go</td></tr>
</table><p>
returns 4 values (i.e. inferior, equal, superior or not comparable)
<table border=1 cellpadding=3>
<tr><td><tt>compare</tt></td><td>Pliant</td></tr>
<tr><td><tt>compareTo</tt></td><td>E</td></tr>
</table><p>
min / max (binary or more)
<table border=1 cellpadding=3>
<tr><td><tt>min / max</tt></td><td>Beta, C++, Common Lisp, Dylan, E, Eiffel, F#, Forth, Haskell, Io, Java, Lua, Maple, Matlab, merd, OCaml, PHP5, Pike, Pliant, Prolog, Python, Rebol, Scheme, Scilab, Smalltalk, SQL92, Tcl8.5, Yorick</td></tr>
<tr><td><tt>min minstr / max maxstr<a href="#22">(22)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>Min / Max</tt></td><td>Mathematica, Oz</td></tr>
<tr><td><tt>MIN / MAX</tt></td><td>Classic REXX, Modula-3</td></tr>
<tr><td><tt>measure-object -min / measure-object -max</tt></td><td>MSH</td></tr>
<tr><td><tt>fmin / fmax</tt></td><td>Forth</td></tr>
<tr><td><tt>Integer'min / Integer'max</tt></td><td>Ada</td></tr>
</table><p>
<li><a name="VrsRntmvltn">runtime evaluation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>eval</tt></td><td>BourneShell, Common Lisp, Emacs Lisp, FishShell, JavaScript, Matlab, Perl, Perl6, PHP, Python, Ruby, Scheme, Tcl, YCP</td></tr>
<tr><td><tt>CoffeeScript.eval<a href="#23">(23)</a></tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>exec</tt></td><td>Python</td></tr>
<tr><td><tt>evstr / execstr</tt></td><td>Scilab</td></tr>
<tr><td><tt>dostring</tt></td><td>Lua</td></tr>
<tr><td><tt>doString</tt></td><td>Io</td></tr>
<tr><td><tt>evaluate</tt></td><td>Forth</td></tr>
<tr><td><tt>Compiler evaluate:</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>runtime_compile / compile + execute</tt></td><td>Pliant</td></tr>
<tr><td><tt>Compiler.evalExpression or Compiler.parseOzVirtualString</tt></td><td>Oz</td></tr>
<tr><td><tt>compile_string</tt></td><td>Pike</td></tr>
<tr><td><tt>interpret</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>ToExpression</tt></td><td>Mathematica</td></tr>
<tr><td><tt>run</tt></td><td>Logo</td></tr>
<tr><td><tt>XECUTE</tt></td><td>MUMPS</td></tr>
<tr><td><tt>do / reduce / compose / load</tt></td><td>Rebol</td></tr>
<tr><td><tt>[...]</tt></td><td>Tcl</td></tr>
<tr><td><tt>=..<a href="#24">(24)</a></tt></td><td>Prolog</td></tr>
</table><p>
<li><a name="VrsMnlMmrllc">manual memory allocation</a><p>
allocation
<table border=1 cellpadding=3>
<tr><td><tt>malloc</tt></td><td>C</td></tr>
<tr><td><tt>allocate throw</tt></td><td>Forth</td></tr>
<tr><td><tt>new</tt></td><td>Ada</td></tr>
</table><p>
deallocation
<table border=1 cellpadding=3>
<tr><td><tt>free</tt></td><td>C</td></tr>
<tr><td><tt>free throw</tt></td><td>Forth</td></tr>
</table><p>
<li><a name="VrsFrcGrbCll">force garbage collection</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>doGC</tt></td><td>Beta</td></tr>
<tr><td><tt>GC.start</tt></td><td>Ruby</td></tr>
<tr><td><tt>gc</tt></td><td>Logo, Maple, Pike</td></tr>
<tr><td><tt>System.gc()</tt></td><td>Java</td></tr>
<tr><td><tt>System.gcDo</tt></td><td>Oz</td></tr>
<tr><td><tt>System.GC.Collect()</tt></td><td>C#, F#</td></tr>
<tr><td><tt>gc.collect()</tt></td><td>Python</td></tr>
<tr><td><tt>gc_collect_cycles<a href="#25">(25)</a></tt></td><td>PHP5</td></tr>
<tr><td><tt>full_collect</tt></td><td>Eiffel</td></tr>
<tr><td><tt>garbage_collect</tt></td><td>Mercury, Prolog</td></tr>
<tr><td><tt>collectgarbage</tt></td><td>Lua</td></tr>
<tr><td><tt>Collector collect</tt></td><td>Io</td></tr>
<tr><td><tt>VM.garbageCollect()</tt></td><td>JavaScript</td></tr>
<tr><td><tt>Gc.full_major()</tt></td><td>OCaml</td></tr>
<tr><td><tt>Smalltalk garbageCollect</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>System.Mem.performGC</tt></td><td>Haskell</td></tr>
<tr><td><tt>incremental garbage collection =&gt; not needed</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>recycle</tt></td><td>Rebol</td></tr>
<tr><td><tt>interp.gc()</tt></td><td>E</td></tr>
<tr><td><tt>(ext:gc)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>runtime.GC()</tt></td><td>Go</td></tr>
</table><p>
</ul><hr>
<h2><a name="Fnctn">Functions</a></h2>
<ul>
<li><a name="FnctnFnctCall">function call</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>f(a,b,...)</tt></td><td>Ada, Awk, Awk, B, C, C#, C++, CoffeeScript, CSS, Dylan, E, Eiffel, Erlang, Go, Io, Java, JavaScript, Lua, Maple, Matlab, Mercury, merd, Modula-3, Pascal, Perl, Perl6, PHP, Pike, Prolog, Python, Ruby, XPath, YCP, Yorick</td></tr>
<tr><td><tt>f a b ...</tt></td><td>BourneShell, F#, FishShell, Haskell, Logo, Matlab, MSH, OCaml, Pliant, Rebol, SML, Tcl</td></tr>
<tr><td><tt>f(a,b,...f) or f[a,b,...] depending on the version</tt></td><td>BCPL</td></tr>
<tr><td><tt>(f a b ...) (apply f l)</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>(funcall f a b ...)</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>{f a b}</tt></td><td>Oz</td></tr>
<tr><td><tt>[apply f a b]</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>f[a,b,...]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>f[a,b,...] or f.call(a,b,...)</tt></td><td>Ruby</td></tr>
<tr><td><tt>&$f(a,b,...) or $f-&gt;(a,b,...)</tt></td><td>Perl</td></tr>
<tr><td><tt>$f.(a,b,...)</tt></td><td>Perl6</td></tr>
<tr><td><tt>f a, b, ...</tt></td><td>CoffeeScript, Perl</td></tr>
<tr><td><tt>f, a, b, ...<a href="#26">(26)</a></tt></td><td>Yorick</td></tr>
<tr><td><tt>v = f(a, b, ...) or call f a, b, ...</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>a b ... f</tt></td><td>Forth, PostScript</td></tr>
<tr><td><tt>(a,b,...)-&gt;&f or (a,b,...)-&gt;f</tt></td><td>Beta</td></tr>
<tr><td><tt>f:a<a href="#27">(27)</a></tt></td><td>FL</td></tr>
<tr><td><tt>f@a<a href="#28">(28)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>a // f<a href="#28">(28)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>a ~ f ~ b<a href="#29">(29)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>.. [ f, A, B, ...]</tt></td><td>Prolog</td></tr>
<tr><td><tt><pre>&lt;xsl:call-template name="f"&gt;
    &lt;xsl:with-param name="a" select=a/&gt;
    &lt;xsl:with-param name="b" select=b/&gt;
&lt;/xsl:call-template&gt;</pre></tt></td><td>XSLT</td></tr>
</table><p>
with no parameter
<table border=1 cellpadding=3>
<tr><td><tt>f</tt></td><td>Ada, BourneShell, Eiffel, Forth, Haskell, Io, Logo, Matlab, Mercury, MSH, Pascal, Perl, Perl6, Pliant, PostScript, Prolog, Rebol, Ruby, Tcl, Yorick</td></tr>
<tr><td><tt>f()</tt></td><td>Awk, C, C#, C++, CoffeeScript, E, Erlang, F#, Go, Java, JavaScript, Lua, Maple, merd, OCaml, Perl, PHP, Pike, Python, SML, YCP</td></tr>
<tr><td><tt>(f)</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>(funcall f)</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>{f}</tt></td><td>Oz</td></tr>
<tr><td><tt>f[]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>f[] or f.call</tt></td><td>Ruby</td></tr>
<tr><td><tt>&$f or $f-&gt;()</tt></td><td>Perl</td></tr>
<tr><td><tt>$f.()</tt></td><td>Perl6</td></tr>
<tr><td><tt>v = f()</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>call f</tt></td><td>Classic REXX, Fortran</td></tr>
<tr><td><tt>f value<a href="#30">(30)</a></tt></td><td>Smalltalk</td></tr>
<tr><td><tt>&lt;xsl:call-template name="f"&gt;/</tt></td><td>XSLT</td></tr>
</table><p>
<li><a name="FnctnPpIxBNCIFB"><a href="http://www.haskell.org/hawiki/PartialApplication">partial application</a> (in the examples below, a normal call is "f(a,b)")</a><p>
give the first argument
<table border=1 cellpadding=3>
<tr><td><tt>f a</tt></td><td>F#, Haskell, OCaml, SML</td></tr>
<tr><td><tt>f(a)</tt></td><td>Mercury</td></tr>
<tr><td><tt>f(a,)</tt></td><td>merd</td></tr>
<tr><td><tt>&f.assuming(var_name =&gt; a)</tt></td><td>Perl6</td></tr>
<tr><td><tt>functools.partial(f, a)<a href="#31">(31)</a></tt></td><td>Python</td></tr>
<tr><td><tt>interp alias {} f_a {} f a</tt></td><td>Tcl</td></tr>
</table><p>
give the second argument
<table border=1 cellpadding=3>
<tr><td><tt>f(,b)</tt></td><td>merd</td></tr>
<tr><td><tt>&f.assuming(b =&gt; b)</tt></td><td>Perl6</td></tr>
<tr><td><tt>flip f b<a href="#32">(32)</a></tt></td><td>Haskell</td></tr>
</table><p>
give the first argument to operator ">"
<table border=1 cellpadding=3>
<tr><td><tt>(a &gt;)</tt></td><td>Haskell, merd</td></tr>
<tr><td><tt>(&gt;) a</tt></td><td>F#, OCaml</td></tr>
</table><p>
give the second argument to operator ">"
<table border=1 cellpadding=3>
<tr><td><tt>(&gt; a)</tt></td><td>Haskell, merd</td></tr>
</table><p>
<li><a name="FnctnFnctDfnt">function definition</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>sub f { ... }</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>sub f($para1, $para2, ...) { ... }</tt></td><td>Perl6</td></tr>
<tr><td><tt>def f(para1, para2, ...): ...</tt></td><td>Python</td></tr>
<tr><td><tt>def f(para1, para2, ...) ... end</tt></td><td>Ruby</td></tr>
<tr><td><tt>def f(para1, para2, ...) ... { ... }</tt></td><td>E</td></tr>
<tr><td><tt>f para1 para2 = ...</tt></td><td>Haskell</td></tr>
<tr><td><tt>let f para1 para2 = ...</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>f(para1, para2, ...) = valof $( ... $)</tt></td><td>BCPL</td></tr>
<tr><td><tt>f(para1, para2, ...) = ...</tt></td><td>merd</td></tr>
<tr><td><tt>f[para1_, para2_, ...] := ... para1 ...</tt></td><td>Mathematica</td></tr>
<tr><td><tt>f ...  or  f: para1 ...</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>f: func [para1 para2 ...] ...</tt></td><td>Rebol</td></tr>
<tr><td><tt>/f { ... } def</tt></td><td>PostScript</td></tr>
<tr><td><tt>f := (para1, para2, ...) -&gt; ...</tt></td><td>Maple</td></tr>
<tr><td><tt>f := method(para1, para2, ..., code)</tt></td><td>Io</td></tr>
<tr><td><tt>func f(a, b, c...) { ... }</tt></td><td>Yorick</td></tr>
<tr><td><tt>typ0 f(typ1 para1, typ2 para2, ...) { ... }</tt></td><td>C, C#, C++, Pike, YCP</td></tr>
<tr><td><tt>function f(para1, para2) { ... }</tt></td><td>Awk, JavaScript, PHP5</td></tr>
<tr><td><tt>function f(para1, para2) ... code ... end</tt></td><td>Lua</td></tr>
<tr><td><tt>function f; ...; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>function f { ... }</tt></td><td>KornShell</td></tr>
<tr><td><tt>function f { param(para1, [typ2]para2, ...) ... }</tt></td><td>MSH</td></tr>
<tr><td><tt>(define (f para1 para2) ...)</tt></td><td>Scheme</td></tr>
<tr><td><tt>(defun f (para1 para2) ...)</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>fun { F Para1 Para2 } ... end</tt></td><td>Oz</td></tr>
<tr><td><tt>fun f para1 para2 = ...</tt></td><td>SML</td></tr>
<tr><td><tt>proc f {para1 para2} { ... }</tt></td><td>Tcl</td></tr>
<tr><td><tt><pre>function retval = f(para1, para2)
retval = ...</pre></tt></td><td>Matlab, Scilab</td></tr>
<tr><td><tt><pre>:- func f(typ1, typ2, ...) = typ0.
f(Para1, Para2, ...) = ...</pre></tt></td><td>Mercury</td></tr>
<tr><td><tt><pre>function f(para1 : type1; para2 : typ2; ...) return retval is
begin
   ...
end f;</pre></tt></td><td>Ada</td></tr>
<tr><td><tt><pre>function f para1 para2 -&gt; retval
  arg typ1 para1; arg typ2 para2; arg rettyp retval;
  ...</pre></tt></td><td>Pliant</td></tr>
<tr><td><tt><pre>function f(para1 : typ1, para2 : typ2, ...) : retval;
var retval : typ0;
begin
  ...
end</pre></tt></td><td>Pascal</td></tr>
<tr><td><tt><pre>f (para1 : typ1; para2, para3 : typ2; ...) : rettyp is
do
  ...
end</pre></tt></td><td>Eiffel</td></tr>
<tr><td><tt><pre>&lt;xsl:template name="f"&gt;
    &lt;xsl:param name="para1"/&gt;
    &lt;xsl:param name="para2"/&gt;

    ...
&lt;/xsl:template&gt;</pre></tt></td><td>XSLT</td></tr>
<tr><td><tt>Function f(para1, para2)
...
End Function</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>: f ... ;</tt></td><td>Forth</td></tr>
<tr><td><tt>f() { ... }</tt></td><td>BourneShell, KornShell</td></tr>
<tr><td><tt><pre>f : procedure
  ...
return retval</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt><pre>to f :para1 :para2
   ...
end</pre></tt></td><td>Logo</td></tr>
<tr><td><tt>func f(para1 typ1, para2 typ2, ...) (typ3, ...) { ... }</tt></td><td>Go</td></tr>
</table><p>
procedures
<table border=1 cellpadding=3>
<tr><td><tt><pre>procedure f(para1 : typ1; para2, para3 : typ2);
begin
  ...
end</pre></tt></td><td>Pascal</td></tr>
<tr><td><tt><pre>f (para1 : typ1; para2, para3 : typ2; ...) is
do
  ...
end</pre></tt></td><td>Eiffel</td></tr>
<tr><td><tt><pre>procedure f(para1 : typ1; para2 : MODE type2; ...) is
begin
   ...
end f;

MODE ::= | OUT | IN OUT</pre></tt></td><td>Ada</td></tr>
<tr><td><tt>void f(typ1 para1, typ2 para2, ...) { ... }</tt></td><td>C, C#, C++, Pike</td></tr>
<tr><td><tt>let f(para1, para2, ...) be $( ... $)</tt></td><td>BCPL</td></tr>
<tr><td><tt>proc { F Para1 Para2 } ... end</tt></td><td>Oz</td></tr>
<tr><td><tt>f := proc(para1, para2, ...) ... end proc</tt></td><td>Maple</td></tr>
<tr><td><tt>Sub f(para1, para2)
...
End Sub</tt></td><td>Visual Basic</td></tr>
<tr><td><tt><pre>function f(para1, para2)
...</pre></tt></td><td>Matlab, Scilab</td></tr>
<tr><td><tt><pre>f : procedure
  ...
return</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>func f(para1 typ1, para2 typ2, ...) { ... }</tt></td><td>Go</td></tr>
</table><p>
variable number of arguments
<table border=1 cellpadding=3>
<tr><td><tt>one can use overloading on different number of arguments</tt></td><td>C++, Java</td></tr>
<tr><td><tt>sub f { ... @_ }</tt></td><td>Perl</td></tr>
<tr><td><tt>sub f; ... $argv; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>f() { ... $@ }</tt></td><td>BourneShell</td></tr>
<tr><td><tt>f := ... ## &</tt></td><td>Mathematica</td></tr>
<tr><td><tt>f[params___] := ... params ...</tt></td><td>Mathematica</td></tr>
<tr><td><tt><pre>function f(varargin)
for i=1:nargin
 ...(varargin{i})
end</pre></tt></td><td>Matlab</td></tr>
<tr><td><tt><pre>function f(varargin)
for e=varargin
 ...(e)
end</pre></tt></td><td>Scilab</td></tr>
<tr><td><tt>(args...) -&gt; ...</tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>(lambda x ...) or<a href="#33">(33)</a></tt></td><td>Scheme</td></tr>
<tr><td><tt>f(args ...typ0)<a href="#34">(34)</a></tt></td><td>Go</td></tr>
</table><p>
predicates
<table border=1 cellpadding=3>
<tr><td><tt>f(Para1, Para2, ....) :- ... .</tt></td><td>Prolog</td></tr>
</table><p>
<li><a name="FnctnnnmsFnct">anonymous function</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>sub { my ($a, $b) = @_; ... }</tt></td><td>Perl</td></tr>
<tr><td><tt>{ my ($a, $b) = @_; ... }<a href="#35">(35)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>{ ... } (arguments are in the stack</tt></td><td>PostScript</td></tr>
<tr><td><tt>[ ... ]</tt></td><td>Logo</td></tr>
<tr><td><tt>{ param(para1, [typ2]para2, ...) ... }</tt></td><td>MSH</td></tr>
<tr><td><tt>{|a, b| ... }<a href="#36">(36)</a></tt></td><td>Ruby</td></tr>
<tr><td><tt>[:a :b| ... ]</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>[list {a b} {...}]</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>lambda a, b: ...</tt></td><td>Python</td></tr>
<tr><td><tt>lambda(typ1 para1, typ2, para2, ...) { ... };</tt></td><td>Pike</td></tr>
<tr><td><tt>(a, b) =&gt; ...</tt></td><td>C#3, CoffeeScript</td></tr>
<tr><td><tt>(a, b) -&gt; ...</tt></td><td>CoffeeScript, Maple</td></tr>
<tr><td><tt>a, b -&gt; ...</tt></td><td>merd</td></tr>
<tr><td><tt>-&gt; $a, $b { ... }</tt></td><td>Perl6</td></tr>
<tr><td><tt>\a b -&gt; ...</tt></td><td>Haskell</td></tr>
<tr><td><tt>:noname ...</tt></td><td>Forth</td></tr>
<tr><td><tt>fn (a, b) =&gt; ...</tt></td><td>SML</td></tr>
<tr><td><tt>fun a b -&gt; ...</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>(func(A, B) = C :- ...)</tt></td><td>Mercury</td></tr>
<tr><td><tt>function(a, b) { ... }</tt></td><td>JavaScript, PHP5</td></tr>
<tr><td><tt>function(a, b) use (&$v1, $v2) { ... }<a href="#37">(37)</a></tt></td><td>PHP5</td></tr>
<tr><td><tt>function(a, b) ... end</tt></td><td>Lua</td></tr>
<tr><td><tt>Function[{a, b}, ....]<a href="#38">(38)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>fun(a, b) -&gt; ... end</tt></td><td>Erlang</td></tr>
<tr><td><tt>fun {$ A B} ... end<a href="#39">(39)</a></tt></td><td>Oz</td></tr>
<tr><td><tt>func [a b ...] ...</tt></td><td>Rebol</td></tr>
<tr><td><tt>def _(para1, para2, ...) ... { ... }</tt></td><td>E</td></tr>
<tr><td><tt>proc {|a, b| ...}</tt></td><td>Ruby</td></tr>
<tr><td><tt>lambda {|a, b| ...}</tt></td><td>Ruby</td></tr>
<tr><td><tt>(lambda (a b) ...)</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>inline('...x...y...')<a href="#40">(40)</a></tt></td><td>Matlab</td></tr>
<tr><td><tt>method(a, b, ...)</tt></td><td>Io</td></tr>
<tr><td><tt>method(a, b) ... end method<a href="#41">(41)</a></tt></td><td>Dylan</td></tr>
<tr><td><tt>create_function(',','...')</tt></td><td>PHP</td></tr>
<tr><td><tt>delegate(ta a, tb b) { ... }</tt></td><td>C#2</td></tr>
<tr><td><tt>[](ta a, tb b) { ... }</tt></td><td>C++-0x</td></tr>
<tr><td><tt>[](ta a, tb b) -&gt; typ { ... }</tt></td><td>C++-0x</td></tr>
<tr><td><tt>func(para1 typ1, ...) (typ2, ...) { ... }</tt></td><td>Go</td></tr>
</table><p>
<li><a name="FnctnFncRtrVl">function return value</a><p>
breaks the control flow
<table border=1 cellpadding=3>
<tr><td><tt>return<a href="#42">(42)</a></tt></td><td>Ada, Awk, B, BCPL, BourneShell, C, C#, C++, Classic REXX, CoffeeScript, Common Lisp, E, FishShell, Go, Io, Java, JavaScript, Lua, Maple, Matlab, Perl, Perl6, PHP, Pike, Pliant, Python, Rebol, Ruby, Tcl, Vimscript, YCP, Yorick</td></tr>
<tr><td><tt>Return</tt></td><td>Mathematica, Visual Basic</td></tr>
<tr><td><tt>RETURN</tt></td><td>Modula-3</td></tr>
<tr><td><tt>resultis<a href="#43">(43)</a></tt></td><td>BCPL</td></tr>
<tr><td><tt>return-from xxx</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>^</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Exit Function / Exit Sub</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>exit</tt></td><td>Forth</td></tr>
<tr><td><tt>output</tt></td><td>Logo</td></tr>
</table><p>
function body is the result
<table border=1 cellpadding=3>
<tr><td><tt>no syntax needed<a href="#44">(44)</a></tt></td><td>CoffeeScript, Common Lisp, Dylan, Emacs Lisp, Erlang, F#, Haskell, Io, Maple, Mathematica, Matlab, OCaml, Oz, Perl, Perl6, Rebol, Ruby, Scheme, SML, Tcl</td></tr>
</table><p>
setting the result
<table border=1 cellpadding=3>
<tr><td><tt>Result := val</tt></td><td>Eiffel</td></tr>
<tr><td><tt>&lt;function name&gt; = val</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>&lt;function name&gt; := val</tt></td><td>Pascal</td></tr>
<tr><td><tt>&lt;retvar name&gt; = val;</tt></td><td>Ada, Matlab</td></tr>
</table><p>
<li><a name="FnctnFCWFINDIDL">function called when a function is not defined (in dynamic languages)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>AUTOLOAD</tt></td><td>Perl</td></tr>
<tr><td><tt>AUTOSCALAR, AUTOMETH, AUTOLOAD...</tt></td><td>Perl6</td></tr>
<tr><td><tt>__autoload</tt></td><td>PHP5</td></tr>
<tr><td><tt>__getattr__</tt></td><td>Python</td></tr>
<tr><td><tt>method_missing</tt></td><td>Ruby</td></tr>
<tr><td><tt>doesNotUnderstand</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>__noSuchMethod__<a href="#45">(45)</a></tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>unknown</tt></td><td>Tcl</td></tr>
<tr><td><tt>no-applicable-method</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>doesNotRecognizeSelector</tt></td><td>Objective-C</td></tr>
<tr><td><tt>TryInvokeMember<a href="#46">(46)</a></tt></td><td>C#</td></tr>
<tr><td><tt>match [name, args] { ... }</tt></td><td>E</td></tr>
<tr><td><tt>the predicate fail</tt></td><td>Prolog</td></tr>
<tr><td><tt>forward</tt></td><td>Io</td></tr>
</table><p>
<li><a name="FnctnRntnspCllnfr">runtime inspecting the caller information</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>caller</tt></td><td>Perl, Perl6, Ruby</td></tr>
<tr><td><tt>call</tt></td><td>Io</td></tr>
<tr><td><tt>inspect.stack()[1]</tt></td><td>Python</td></tr>
<tr><td><tt>backtrace</tt></td><td>Pike</td></tr>
<tr><td><tt>debug_backtrace</tt></td><td>PHP5</td></tr>
<tr><td><tt>trace 'I'</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>evalin('caller', ...)</tt></td><td>Matlab</td></tr>
<tr><td><tt>current_predicate</tt></td><td>Prolog</td></tr>
<tr><td><tt>thisContext sender</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>where(2)</tt></td><td>Maple</td></tr>
<tr><td><tt>info level</tt></td><td>Tcl</td></tr>
<tr><td><tt>runtime.Caller(0)</tt></td><td>Go</td></tr>
</table><p>
<li><a name="FnctnFnctCmps">function composition</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>.</tt></td><td>Haskell</td></tr>
<tr><td><tt>~</tt></td><td>merd</td></tr>
<tr><td><tt>o</tt></td><td>SML</td></tr>
<tr><td><tt>@</tt></td><td>Maple</td></tr>
<tr><td><tt>compose</tt></td><td>Dylan</td></tr>
<tr><td><tt>Composition</tt></td><td>Mathematica</td></tr>
<tr><td><tt>&lt;&lt;</tt></td><td>F#</td></tr>
<tr><td><tt>&gt;&gt;</tt></td><td>F#</td></tr>
</table><p>
<li><a name="FnctndnttFnct">identity function</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>id</tt></td><td>Haskell</td></tr>
<tr><td><tt>identity</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>Identity</tt></td><td>Mathematica</td></tr>
<tr><td><tt>yourself</tt></td><td>Smalltalk</td></tr>
</table><p>
</ul><hr>
<h2><a name="CntrFlow">Control Flow</a></h2>
<ul>
<li><a name="CntrFlowSqnc">sequence</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>,</tt></td><td>C, C++, Go, JavaScript, Matlab, Perl, Pike, Prolog, Scilab</td></tr>
<tr><td><tt>.</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>;</tt></td><td>Ada, Awk, B, Beta, BourneShell, C, C#, C++, E, F#, FishShell, GNU-sed, Go, Haskell, Io, Java, JavaScript, Maple, Mathematica, Matlab, merd, Modula-3, OCaml, Pascal, Perl, Perl6, PHP, Pike, PL/I, Pliant, Python, Ruby, SML, Tcl, YCP</td></tr>
<tr><td><tt>:</tt></td><td>Maple</td></tr>
<tr><td><tt>nothing, optionally ;</tt></td><td>Classic REXX, Lua</td></tr>
<tr><td><tt>space</tt></td><td>Eiffel, Rebol</td></tr>
<tr><td><tt>end-of-line</tt></td><td>Assembler, Awk, Basic, BourneShell, CoffeeScript, E, F#, FishShell, Fortran, GNU-sed, Haskell, Io, JavaScript, Lua, Matlab, merd, Pliant, Python, Ruby, Tcl</td></tr>
<tr><td><tt>(begin ...)</tt></td><td>Scheme</td></tr>
<tr><td><tt>(progn ...) (prog1 ...) (prog2 ...)</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>&gt;&gt;</tt></td><td>Haskell</td></tr>
</table><p>
<li><a name="CntrFlowIfThen">if_then</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>if c then ...</tt></td><td>CoffeeScript, F#, merd, OCaml, Pascal, Tcl</td></tr>
<tr><td><tt>if c then ... end</tt></td><td>Eiffel, Lua, Oz, Ruby</td></tr>
<tr><td><tt>if c then ... end if</tt></td><td>Ada, Maple</td></tr>
<tr><td><tt>if c then ... fi</tt></td><td>Maple</td></tr>
<tr><td><tt>if c; then ... fi</tt></td><td>BourneShell</td></tr>
<tr><td><tt>if (c) then ... end</tt></td><td>Dylan</td></tr>
<tr><td><tt>if c do ...</tt></td><td>BCPL</td></tr>
<tr><td><tt>IF c THEN ... END</tt></td><td>Modula-2, Modula-3</td></tr>
<tr><td><tt>if (c) ...</tt></td><td>Awk, B, C, C#, C++, Java, JavaScript, PHP, Pike, YCP</td></tr>
<tr><td><tt>if c: ...</tt></td><td>Python</td></tr>
<tr><td><tt>if c ...</tt></td><td>Pliant, Rebol, Tcl</td></tr>
<tr><td><tt>if (c): ... endif</tt></td><td>PHP</td></tr>
<tr><td><tt>if c {...}</tt></td><td>Go, Perl6</td></tr>
<tr><td><tt>if c [...]</tt></td><td>Logo</td></tr>
<tr><td><tt>if (c) {...}</tt></td><td>E, Perl, Yorick</td></tr>
<tr><td><tt>IF c ...</tt></td><td>MUMPS</td></tr>
<tr><td><tt>c -&gt; ...</tt></td><td>FL</td></tr>
<tr><td><tt>c ... if</tt></td><td>PostScript</td></tr>
<tr><td><tt>... if c</tt></td><td>Perl, Ruby</td></tr>
<tr><td><tt>c if b1 then</tt></td><td>Forth</td></tr>
<tr><td><tt>(if c ...)</tt></td><td>Common Lisp, Scheme</td></tr>
<tr><td><tt>(when c ...)</tt></td><td>Emacs Lisp</td></tr>
<tr><td><tt>c and ...</tt></td><td>Perl, Ruby</td></tr>
<tr><td><tt>if(c, ...)</tt></td><td>Io</td></tr>
<tr><td><tt>If[c, ...]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>if(c) then(...)</tt></td><td>Io</td></tr>
<tr><td><tt>c ifTrue(...)</tt></td><td>Io</td></tr>
<tr><td><tt>c ifTrue: ...</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>&lt;xsl:if test="c"&gt;...&lt;/xsl:if&gt;</tt></td><td>XSLT</td></tr>
<tr><td><tt>if c ... endif</tt></td><td>Vimscript</td></tr>
<tr><td><tt>If c Then ...</tt></td><td>Visual Basic</td></tr>
<tr><td><tt><pre>If c
  ...
End If</pre></tt></td><td>Visual Basic</td></tr>
<tr><td><tt>if c; ... end</tt></td><td>Ruby</td></tr>
<tr><td><tt>if c; ...; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>if c, ..., end</tt></td><td>Matlab</td></tr>
<tr><td><tt><pre>if c
  ...
end</pre></tt></td><td>Matlab, Ruby</td></tr>
<tr><td><tt><pre>if c then ; ...

if c then
  ...

if c then do
  ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>c and ...</tt></td><td>Perl</td></tr>
<tr><td><tt>t label</tt></td><td>GNU-sed</td></tr>
<tr><td><tt><pre>if c
    ...</pre></tt></td><td>CoffeeScript</td></tr>
</table><p>
<li><a name="CntrFlowIfTheEls">if_then_else</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>if c then b1 else b2</tt></td><td>CoffeeScript, F#, Haskell, merd, OCaml, SML</td></tr>
<tr><td><tt>if c then b1 else b2 end</tt></td><td>Eiffel, Lua, Ruby</td></tr>
<tr><td><tt>if c then b1 elsif c2 then b2 else b3 end if</tt></td><td>Ada</td></tr>
<tr><td><tt>if c then b1 elseif c2 then b2 else b3 end</tt></td><td>Eiffel, Oz</td></tr>
<tr><td><tt>if (c) then b1 elseif (c2) then b2 else b3 end</tt></td><td>Dylan</td></tr>
<tr><td><tt>IF c THEN b1 ELSIF c2 THEN b2 ELSE b3 END</tt></td><td>Modula-3</td></tr>
<tr><td><tt>If c Then b1 ElseIf c2 Then b2 Else b3 End If</tt></td><td>Modula-2</td></tr>
<tr><td><tt>if (c) b1 else b2</tt></td><td>Awk, B, C, C#, C++, Java, JavaScript, Pike, YCP</td></tr>
<tr><td><tt>if c b1 elsif c2 b2 b3</tt></td><td>Tcl</td></tr>
<tr><td><tt>if c then b1 elseif c2 then b2 else b3</tt></td><td>Tcl</td></tr>
<tr><td><tt>if c then begin b1 end else begin b2 end</tt></td><td>Pascal</td></tr>
<tr><td><tt>if c b1 eif c2 b2 else b3</tt></td><td>Pliant</td></tr>
<tr><td><tt>if c then b1 elif c2 then b2 else b3 end if</tt></td><td>Maple</td></tr>
<tr><td><tt>if c; then b1; elif c2; then b2; else b3; fi</tt></td><td>BourneShell</td></tr>
<tr><td><tt>if c; b1; else b2; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>if c1, b1, elseif c2, b2, else, b3, end</tt></td><td>Matlab</td></tr>
<tr><td><tt>if (c) b1 elseif (c2) b2 else b3</tt></td><td>PHP</td></tr>
<tr><td><tt>if (c): b1 elseif (c2): b2 else: b3 endif</tt></td><td>PHP</td></tr>
<tr><td><tt>if (c) {b1} elsif (c2) {b2} else {b3}</tt></td><td>Perl</td></tr>
<tr><td><tt>if (c) {b1} else {b2}</tt></td><td>E, Yorick</td></tr>
<tr><td><tt>(if c b1 b2)</tt></td><td>Common Lisp, Scheme</td></tr>
<tr><td><tt>(if c then b1 else b2)</tt></td><td>Mercury</td></tr>
<tr><td><tt>(c -&gt; b1 ; c2 -&gt; b2 ; b3)</tt></td><td>Mercury</td></tr>
<tr><td><tt>c -&gt; b1 ; b2</tt></td><td>FL</td></tr>
<tr><td><tt>if(c, b1, b2)</tt></td><td>Io</td></tr>
<tr><td><tt>If[c, b1, b2]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>if(c) then(b1) else(b2)</tt></td><td>Io</td></tr>
<tr><td><tt>c ifTrue: b1 ifFalse: b2</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>ifelse c [b1] [b2]</tt></td><td>Logo</td></tr>
<tr><td><tt>shunt c b1 c2 b2 b3</tt></td><td>Pliant</td></tr>
<tr><td><tt>either c b1 b2 / if/else c b1 b2</tt></td><td>Rebol</td></tr>
<tr><td><tt>(cond (c b1) (c2 b2) (t b3))</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>(cond (c b1) (c2 b2) (else b3))</tt></td><td>Scheme</td></tr>
<tr><td><tt>Which[c, b1, c2, b2, True, b3]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>c -&gt; b1 ; c2 -&gt; b2 ; b3</tt></td><td>Prolog</td></tr>
<tr><td><tt>case when c; b1 when c2; b2 else b3 end</tt></td><td>Ruby</td></tr>
<tr><td><tt>test c then b1 or b2</tt></td><td>BCPL</td></tr>
<tr><td><tt>e | c = b1 | c2 = b2 | otherwise = b3<a href="#47">(47)</a></tt></td><td>Haskell</td></tr>
<tr><td><tt>c b1 b2 ifelse</tt></td><td>PostScript</td></tr>
<tr><td><tt>c if b1 else b2 then</tt></td><td>Forth</td></tr>
<tr><td><tt>c ? b1 : b2</tt></td><td>Awk, B, C, C#, C++, Java, JavaScript, Perl, PHP, Ruby, Tcl, YCP, Yorick</td></tr>
<tr><td><tt>c ?? b1 !! b2</tt></td><td>Perl6</td></tr>
<tr><td><tt>b1 if c else b2<a href="#31">(31)</a></tt></td><td>Python</td></tr>
<tr><td><tt>$SELECT(c:b1,c2:b2,1:b3)</tt></td><td>MUMPS</td></tr>
<tr><td><tt>c -&gt; b1, b2</tt></td><td>BCPL</td></tr>
<tr><td><tt>(if c then b1 else b2 fi)</tt></td><td>Beta</td></tr>
<tr><td><tt><pre>&lt;xsl:choose&gt;
    &lt;xsl:when test="c"&gt; b1 &lt;/xsl:when&gt;
    &lt;xsl:when test="c2"&gt; b2 &lt;/xsl:when&gt;
    &lt;xsl:otherwise&gt; b3 &lt;/xsl:otherwise&gt;
&lt;/xsl:choose&gt;</pre></tt></td><td>XSLT</td></tr>
<tr><td><tt>if c1 ... elseif c2 ... else ... endif</tt></td><td>Vimscript</td></tr>
<tr><td><tt>If c Then b1 Else b2</tt></td><td>Visual Basic</td></tr>
<tr><td><tt><pre>If c
  b1
Else
  b2
End If</pre></tt></td><td>Visual Basic</td></tr>
<tr><td><tt><pre>if c: 
  b1 
elif c2:
  b2 
else: 
  b3</pre></tt></td><td>Python</td></tr>
<tr><td><tt><pre>if c
  b1
elsif c2
  b2
else
  b3
end</pre></tt></td><td>Ruby</td></tr>
<tr><td><tt><pre>if c
  b1
elseif c2
  b2
else
  b3
end</pre></tt></td><td>Matlab</td></tr>
<tr><td><tt><pre>if c then ; b1 ; else ; b2

if c then
  b1
else
  b2

if c then do
  b1
  ...
end
else do
  b2
  ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt><pre>IF c ...
ELSE ...</pre></tt></td><td>MUMPS</td></tr>
<tr><td><tt><pre>if c
  b1
else if c2
  b2
else
  b3</pre></tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>if c {b1} else if c2 {b2} else {b3}</tt></td><td>Go</td></tr>
</table><p>
<li><a name="CntrFlowfntThenls">ifnot_then (unless)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>unless</tt></td><td>CoffeeScript, Emacs Lisp, Perl</td></tr>
<tr><td><tt>ifFalse</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>if(c) not then(...)</tt></td><td>Io</td></tr>
</table><p>
<li><a name="CntrFlowMltSlcSwt">multiple selection (switch)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt><pre>switch (val) { 
   case v1: ...; break; 
   case v2: case v3: ...; break; 
   default: ...;
 }</pre></tt></td><td>C, C++, Java, JavaScript, PHP, Pike</td></tr>
<tr><td><tt><pre>switch val { 
   case v1: ...; goto done;
   case v2: case v3: ...; goto done; 
 }
 ...;
 done:
 </pre></tt></td><td>B</td></tr>
<tr><td><tt><pre>switch (val) { 
   case v1: ...; break; 
   case v2: case v3: ...; break; 
   default: ...; break;
 }</pre><a href="#48">(48)</a></tt></td><td>C#</td></tr>
<tr><td><tt><pre>switch (val) { 
   match v1 { ... } 
   match v2 { ... } 
   match _ { ... }
}</pre></tt></td><td>E</td></tr>
<tr><td><tt><pre>switchon val  
   case v1: ...
   case v2: ...
   default: ...</pre></tt></td><td>BCPL</td></tr>
<tr><td><tt><pre>switch val
  case v1
    ...
  case v2 v3
    ...
  case '*'
    ...
end</pre></tt></td><td>FishShell</td></tr>
<tr><td><tt><pre>switch val
  case v1
    ...
  case {v2,v3}
    ...
  otherwise
    ...
end</pre></tt></td><td>Matlab</td></tr>
<tr><td><tt><pre>case val of
   v1 : ...; 
   v2, v3 : ...
   else ...
 end</pre></tt></td><td>Pascal</td></tr>
<tr><td><tt><pre>switch val {
    v1 {...} 
    v2 - v3 {...}
    default {...}
}</pre></tt></td><td>Tcl</td></tr>
<tr><td><tt><pre>case val in
   v1) statement1 ;;
   v2|v3) statement23 ;;
   *) statement_else ;;
esac</pre></tt></td><td>BourneShell</td></tr>
<tr><td><tt><pre>(if val
    // v1 then ...
    // v2 then ... 
    else ...
    if)</pre></tt></td><td>Beta</td></tr>
<tr><td><tt><pre>match val with
 | v1 -&gt; ...
 | v2 | v3 -&gt; ...
 | _ -&gt; ...</pre></tt></td><td>F#, OCaml</td></tr>
<tr><td><tt><pre>case val of
   v1 =&gt; ...
 | v2 =&gt; ...
 | _ =&gt; ...</pre></tt></td><td>SML</td></tr>
<tr><td><tt><pre>CASE val OF
   v1 =&gt; ...
 | v2 =&gt; ...
 ELSE =&gt; ... END</pre></tt></td><td>Modula-3</td></tr>
<tr><td><tt><pre>case val of
   v1 -&gt; ...
   v2 -&gt; ...
   _ -&gt; ...</pre></tt></td><td>Haskell</td></tr>
<tr><td><tt><pre>val case
   v1 of ... endof
   v2 of ... endof
   ...
endcase</pre></tt></td><td>Forth</td></tr>
<tr><td><tt><pre>val.
   v1 -&gt; ...
   v2 -&gt; ...
   _ -&gt; ...</pre></tt></td><td>merd</td></tr>
<tr><td><tt><pre>(case val
   ((v1) ...)
   ((v2) ...)
   (otherwise ...))</pre></tt></td><td>Common Lisp</td></tr>
<tr><td><tt><pre>(case val
   ((v1) ...)
   ((v2) ...)
   (else ...))</pre></tt></td><td>Scheme</td></tr>
<tr><td><tt><pre>case val is
   when v1 =&gt; ...
   when v2 | v3 =&gt; ...
   when others =&gt; ...
 end case;</pre></tt></td><td>Ada</td></tr>
<tr><td><tt><pre>case val
   when v1; ...
   when v2, v3; ...
   else ...
 end</pre></tt></td><td>Ruby</td></tr>
<tr><td><tt><pre>inspect val
   when v1 then statement1
   when v2, v3 =&gt; statement23
   else statement_else
 end</pre></tt></td><td>Eiffel</td></tr>
<tr><td><tt><pre>select (val);
   when (v1) statement1;
   when (v2, v3) statement23;
   otherwise statement_else;
 end;</pre></tt></td><td>PL/I</td></tr>
<tr><td><tt><pre>X = val,
(X = v1, ... ; X = v2, ... ; ...)</pre></tt></td><td>Mercury, Prolog</td></tr>
<tr><td><tt><pre>my %case = (
    v1 =&gt; sub { ... },
    v2 =&gt; sub { ... },
); 
if ($case{val}) { $case{val}-&gt;() } else { ... }</pre></tt></td><td>Perl</td></tr>
<tr><td><tt><pre>use Switch;
switch ($val) {
    case v1 { ... }
    case v2 { ... }
    else ...
})</pre><a href="#49">(49)</a></tt></td><td>Perl</td></tr>
<tr><td><tt><pre>given $val {
    when v1 { ... }
    when v2 { ... }
    default { ... }
}</pre></tt></td><td>Perl6</td></tr>
<tr><td><tt><pre>Select val
    Case v1
	...
    Case v2, v3
	...
    Case Else
	...
End Select</pre></tt></td><td>Visual Basic</td></tr>
<tr><td><tt><pre>switch (val) {
    v1 { ... }
    v2 { ... }
    default { ... }
  }</pre></tt></td><td>MSH</td></tr>
<tr><td><tt><pre>switch val [
    v1 [...]
    v2 [...]
]

switch/default [
    v1 [...]
    v2 [...]
][...]</pre></tt></td><td>Rebol</td></tr>
<tr><td><tt>val caseOf: {[v1]-&gt;[...]. [v2]-&gt;[...]} otherwise: ...</tt></td><td>Squeak</td></tr>
<tr><td><tt>Switch[val, v1, ..., v2, ..., _, ...]</tt></td><td>Mathematica</td></tr>
<tr><td><tt><pre>select
  when v1 ...
  when v2 | v3 ...
  otherwise ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt><pre>CASE val
    WHEN v1 THEN ...
    WHEN v2 THEN ...
    ELSE ...
END</pre></tt></td><td>SQL92</td></tr>
<tr><td><tt><pre>switch val {
    case v1, v2, ...:
        ...
        fallthrough
    case v3:
        ...
    default:
        ...
}</pre></tt></td><td>Go</td></tr>
</table><p>
<li><a name="CntrFlowLoop">loop</a><p>
forever loop
<table border=1 cellpadding=3>
<tr><td><tt>loop</tt></td><td>CoffeeScript, merd, Perl6, PostScript, Ruby</td></tr>
<tr><td><tt>loop(...)</tt></td><td>Io</td></tr>
<tr><td><tt>loop ... end loop</tt></td><td>Ada</td></tr>
<tr><td><tt>LOOP ... END</tt></td><td>Modula-3</td></tr>
<tr><td><tt>(loop do ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>cycle (# do ... #)</tt></td><td>Beta</td></tr>
<tr><td><tt>repeat</tt></td><td>Squeak</td></tr>
<tr><td><tt>begin ... again</tt></td><td>Forth</td></tr>
<tr><td><tt>forever</tt></td><td>Logo, Rebol</td></tr>
<tr><td><tt><pre>Do
    ...
Loop</pre></tt></td><td>Visual Basic</td></tr>
<tr><td><tt><pre>do forever
  ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>for {}</tt></td><td>Go</td></tr>
</table><p>
while condition do something
<table border=1 cellpadding=3>
<tr><td><tt>while (c) ...</tt></td><td>Awk, B, C, C#, C++, E, Java, JavaScript, Perl, PHP, Pike, Ruby, YCP, Yorick</td></tr>
<tr><td><tt>while c ...</tt></td><td>CoffeeScript, Perl6, Tcl</td></tr>
<tr><td><tt>while c loop ... end loop</tt></td><td>Ada</td></tr>
<tr><td><tt>while c do ...</tt></td><td>BCPL, Pascal, SML</td></tr>
<tr><td><tt>while c do ... done</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>while c do ... end do</tt></td><td>Maple</td></tr>
<tr><td><tt>while c do ... end</tt></td><td>Lua</td></tr>
<tr><td><tt>WHILE c DO ... END</tt></td><td>Modula-3</td></tr>
<tr><td><tt>while c: ...</tt></td><td>Python</td></tr>
<tr><td><tt>while c; do ...; done</tt></td><td>BourneShell</td></tr>
<tr><td><tt>while c; ...; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>while c, ..., end</tt></td><td>Matlab</td></tr>
<tr><td><tt>while [c][...]</tt></td><td>Rebol</td></tr>
<tr><td><tt>while c [...]</tt></td><td>Logo</td></tr>
<tr><td><tt>while(c, ...)</tt></td><td>Io</td></tr>
<tr><td><tt>While[c, ...]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>do.while [...] c</tt></td><td>Logo</td></tr>
<tr><td><tt>c whileTrue: ...</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>(loop while c do ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>loop (# while ::&lt; (# do c -&gt; value #) do ... #)</tt></td><td>Beta</td></tr>
<tr><td><tt>begin c while ... repeat</tt></td><td>Forth</td></tr>
<tr><td><tt>from until not c loop ... end</tt></td><td>Eiffel</td></tr>
<tr><td><tt><pre>while c
    ...</pre></tt></td><td>Pliant</td></tr>
<tr><td><tt><pre>while c do
    ...</pre></tt></td><td>F#</td></tr>
<tr><td><tt><pre>Do While c 
    ...
Loop</pre></tt></td><td>Visual Basic</td></tr>
<tr><td><tt>while c ... endwhile</tt></td><td>Vimscript</td></tr>
<tr><td><tt><pre>do while c
  ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>for c {...}</tt></td><td>Go</td></tr>
</table><p>
do something until condition
<table border=1 cellpadding=3>
<tr><td><tt>do ... until c</tt></td><td>Perl6</td></tr>
<tr><td><tt>do {...} until c</tt></td><td>Perl</td></tr>
<tr><td><tt>do ... while (!c)</tt></td><td>Awk, C, C#, C++, Java, JavaScript, Pike, Yorick</td></tr>
<tr><td><tt>begin ... end until c</tt></td><td>Ruby</td></tr>
<tr><td><tt>begin ... c until</tt></td><td>Forth</td></tr>
<tr><td><tt>REPEAT ... UNTIL c</tt></td><td>Modula-3</td></tr>
<tr><td><tt>loop (# until ::&lt; (# do c -&gt; value #) do ... #)</tt></td><td>Beta</td></tr>
<tr><td><tt>loop ... exit when c; end loop</tt></td><td>Ada</td></tr>
<tr><td><tt>(loop do ... until c)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>... repeatuntil c</tt></td><td>BCPL</td></tr>
<tr><td><tt>repeat ... until c</tt></td><td>Lua, Pascal</td></tr>
<tr><td><tt>repeat ... until (c)</tt></td><td>YCP</td></tr>
<tr><td><tt>repeat, ..., c</tt></td><td>Prolog</td></tr>
<tr><td><tt>until [... c]</tt></td><td>Rebol</td></tr>
<tr><td><tt>until c [...]</tt></td><td>Logo</td></tr>
<tr><td><tt>do.while [...] c</tt></td><td>Logo</td></tr>
<tr><td><tt>While[...; c]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>[...] whileFalse: [c]</tt></td><td>Smalltalk</td></tr>
<tr><td><tt><pre>Do 
...
Loop Until c</pre></tt></td><td>Visual Basic</td></tr>
</table><p>
for each value in a numeric range, 1 increment (see also the entries about ranges)
<table border=1 cellpadding=3>
<tr><td><tt>for (int i = 1; i &lt;= 10; i++) ...</tt></td><td>C, C#, C++</td></tr>
<tr><td><tt>for (i = 1; i &lt;= 10; i++) ...</tt></td><td>Awk, JavaScript</td></tr>
<tr><td><tt>for ($i = 1; $i &lt;= 10; $i++) ...</tt></td><td>PHP</td></tr>
<tr><td><tt>foreach my $i (1 .. 10) { ... }</tt></td><td>Perl</td></tr>
<tr><td><tt>foreach ($i in 1..10) { ... }</tt></td><td>MSH</td></tr>
<tr><td><tt>for (1 .. 10) -&gt; $i { ... }</tt></td><td>Perl6</td></tr>
<tr><td><tt>for i = 1:10, ..., end</tt></td><td>Matlab</td></tr>
<tr><td><tt>for i = 1, 10 do ... end</tt></td><td>Lua</td></tr>
<tr><td><tt>for i := 1 to 10 do ...</tt></td><td>Pascal</td></tr>
<tr><td><tt>for i = 1 to 10 do ... done</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>For i = 1 To 10 ... Next</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>for i in 1 .. 10 loop ... end loop</tt></td><td>Ada</td></tr>
<tr><td><tt>for i in 1 .. 10 do ... done</tt></td><td>F#</td></tr>
<tr><td><tt>for i in [1..10] ...</tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>for i in xrange(1, 11)</tt></td><td>Python</td></tr>
<tr><td><tt>for i in (seq 10); ...; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>FOR I=1:1:10 ...</tt></td><td>MUMPS</td></tr>
<tr><td><tt>for i from 1 to 10 do ... end do</tt></td><td>Maple</td></tr>
<tr><td><tt>for [i 1 10 +1] [...]</tt></td><td>Logo</td></tr>
<tr><td><tt>for {set i 1} {$i &lt;= 10} {incr i} {...}</tt></td><td>Tcl</td></tr>
<tr><td><tt>1 1 10 ... for</tt></td><td>PostScript</td></tr>
<tr><td><tt>11 1 do ... loop</tt></td><td>Forth</td></tr>
<tr><td><tt>(1..10).each {|i| ... }</tt></td><td>Ruby</td></tr>
<tr><td><tt>1.upto(10) {|i| ... }</tt></td><td>Ruby</td></tr>
<tr><td><tt>1 to(10) foreach(...)</tt></td><td>Io</td></tr>
<tr><td><tt>1 to: 10 do: [...]</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>(loop for i from 1 to 10 do ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>do label i = 1, 10</tt></td><td>Fortran</td></tr>
<tr><td><tt>Do[..., {i, 1, 10}]<a href="#50">(50)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt><pre>do i = 1 for 10
  ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>for i := 1; i &lt;= 10; i++ {...}</tt></td><td>Go</td></tr>
</table><p>
for each value in a numeric range, 1 decrement
<table border=1 cellpadding=3>
<tr><td><tt>for X := 10 downto 1 do ...</tt></td><td>Pascal</td></tr>
<tr><td><tt>for i = 10 downto 1 do ... done</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>for i in reverse 1 .. 10 loop ... end loop</tt></td><td>Ada</td></tr>
<tr><td><tt>for i in 10 .. -1 .. 1 do ... done</tt></td><td>F#</td></tr>
<tr><td><tt>for (int i = 10; i &gt;= 1; i--) ...</tt></td><td>C, C#, C++</td></tr>
<tr><td><tt>for (my $i = 10; $i &gt;= 1; $i--) { ... }</tt></td><td>Perl</td></tr>
<tr><td><tt>loop (my $i = 10; $i &gt;= 1; $i--) { ... }</tt></td><td>Perl6</td></tr>
<tr><td><tt>for (i = 10; i &gt;= 1; i--) ...</tt></td><td>Awk, JavaScript</td></tr>
<tr><td><tt>for ($i = 10; $i &gt;= 1; $i--) ...</tt></td><td>PHP</td></tr>
<tr><td><tt>from i := 10 until i &lt; 1 loop ... i := i - 1 end</tt></td><td>Eiffel</td></tr>
<tr><td><tt>for i = 10:-1:1, ..., end</tt></td><td>Matlab</td></tr>
<tr><td><tt>for i = 10, 1, -1 do ... end</tt></td><td>Lua</td></tr>
<tr><td><tt>For i = 10 To 1 Step -1 ... Next</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>for i in xrange(10, 0, -1)</tt></td><td>Python</td></tr>
<tr><td><tt>for i in `seq 10 -1 1`; do ...; done</tt></td><td>BourneShell</td></tr>
<tr><td><tt>for i in (seq 10 -1 1); ...; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>for i from 10 to 1 by -1 do ... end do</tt></td><td>Maple</td></tr>
<tr><td><tt>for [i 1 10 -1] [...]</tt></td><td>Logo</td></tr>
<tr><td><tt>FOR I=10:-1:1 ...</tt></td><td>MUMPS</td></tr>
<tr><td><tt>for {set i 10} {$i &gt;= 1} {incr i -1} {...}</tt></td><td>Tcl</td></tr>
<tr><td><tt>10 -1 1 ... for</tt></td><td>PostScript</td></tr>
<tr><td><tt>1 10 do ... -1 +loop</tt></td><td>Forth</td></tr>
<tr><td><tt>1 to: 10 by: -1 do: [...]</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>10 to(1) foreach(...)</tt></td><td>Io</td></tr>
<tr><td><tt>10.downto(1) {|i| ... }</tt></td><td>Ruby</td></tr>
<tr><td><tt>(loop for i from 1 to 10 by -1 do ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>do label i = 10, 1, -1</tt></td><td>Fortran</td></tr>
<tr><td><tt>Do[..., {i, 10, 1, -1}]</tt></td><td>Mathematica</td></tr>
<tr><td><tt><pre>do i = 10 to 1 by -1
  ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>for i in [10..1] ...</tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>for i := 10; i &gt;= 1; i-- {...}</tt></td><td>Go</td></tr>
</table><p>
for each value in a numeric range, free increment
<table border=1 cellpadding=3>
<tr><td><tt>for (int i = 1; i &lt;= 10; i += 2) ...</tt></td><td>C, C#, C++, Pike</td></tr>
<tr><td><tt>for (i = 1; i &lt;= 10; i += 2) ...</tt></td><td>Awk, JavaScript</td></tr>
<tr><td><tt>for ($i = 1; $i &lt;= 10; $i += 2) ...</tt></td><td>PHP</td></tr>
<tr><td><tt>for (my $i = 1; $i &lt;= 10; $i += 2) { ... }</tt></td><td>Perl</td></tr>
<tr><td><tt>loop (my $i = 1; $i &lt;= 10; $i += 2) { ... }</tt></td><td>Perl6</td></tr>
<tr><td><tt>from i := 1 until i &gt; 10 loop ... i := i + 2 end</tt></td><td>Eiffel</td></tr>
<tr><td><tt>for i = 1:3:10, ..., end</tt></td><td>Matlab</td></tr>
<tr><td><tt>for i = 1, 10, 2 do ... end</tt></td><td>Lua</td></tr>
<tr><td><tt>For i = 1 To 10 Step 2 ... Next</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>for i in 1 .. 2 .. 10 do ... done</tt></td><td>F#</td></tr>
<tr><td><tt>for i in xrange(1, 11, 2)</tt></td><td>Python</td></tr>
<tr><td><tt>for i in (seq 1 2 10); ...; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>for i from 1 to 10 by 2 do ... end do</tt></td><td>Maple</td></tr>
<tr><td><tt>for [i 1 10 2] [...]</tt></td><td>Logo</td></tr>
<tr><td><tt>FOR I=1:2:10 ...</tt></td><td>MUMPS</td></tr>
<tr><td><tt>for {set i 0} {$i &lt;= 10} {incr i 2} {...}</tt></td><td>Tcl</td></tr>
<tr><td><tt>1 2 10 ... for</tt></td><td>PostScript</td></tr>
<tr><td><tt>11 1 do ... 2 +loop</tt></td><td>Forth</td></tr>
<tr><td><tt>1 to: 10 by: 2 do: [...]</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>(1..10).step(2) {|i| ... }</tt></td><td>Ruby</td></tr>
<tr><td><tt>1 to (9,2) foreach(...)</tt></td><td>Io</td></tr>
<tr><td><tt>(loop for i from 1 to 10 by 2 do ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>do label i = 1, 10, 2</tt></td><td>Fortran</td></tr>
<tr><td><tt>Do[..., {i, 1, 10, 2}]</tt></td><td>Mathematica</td></tr>
<tr><td><tt><pre>do i = 1 to 10 by 2
  ...
end</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>for i in [1..10] by 2 ...</tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>for i := 1; i &lt;= 10; i += 2 {...}</tt></td><td>Go</td></tr>
</table><p>
for "a la C" (while + initialisation)
<table border=1 cellpadding=3>
<tr><td><tt>for</tt></td><td>Awk, C, C#, C++, Go, Java, JavaScript, Mathematica, MSH, Perl, PHP, Pike, Tcl, Yorick</td></tr>
<tr><td><tt>loop</tt></td><td>Perl6</td></tr>
<tr><td><tt>for ((x = 0; x &lt; 10; x++)); do ...; done</tt></td><td>BourneShell</td></tr>
<tr><td><tt>from init_code until c loop ... incr_statement end</tt></td><td>Eiffel</td></tr>
<tr><td><tt>(loop with VAR = INITIAL-VALUE ... while CONDITION finally INCREMENT ...)</tt></td><td>Common Lisp</td></tr>
</table><p>
<li><a name="CntrFlowBrkCntFlo">breaking control flow</a><p>
returning a value
<table border=1 cellpadding=3>
<tr><td><tt>return<a href="#42">(42)</a></tt></td><td>Ada, Awk, B, BCPL, BourneShell, C, C#, C++, Classic REXX, CoffeeScript, Common Lisp, E, FishShell, Go, Io, Java, JavaScript, Lua, Maple, Matlab, Perl, Perl6, PHP, Pike, Pliant, Python, Rebol, Ruby, Tcl, Vimscript, YCP, Yorick</td></tr>
<tr><td><tt>Return</tt></td><td>Mathematica, Visual Basic</td></tr>
<tr><td><tt>RETURN</tt></td><td>Modula-3</td></tr>
<tr><td><tt>resultis<a href="#43">(43)</a></tt></td><td>BCPL</td></tr>
<tr><td><tt>return-from xxx</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>^</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Exit Function / Exit Sub</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>exit</tt></td><td>Forth</td></tr>
<tr><td><tt>output</tt></td><td>Logo</td></tr>
</table><p>
goto (unconditional jump)
<table border=1 cellpadding=3>
<tr><td><tt>goto</tt></td><td>Ada, B, Basic, BCPL, C, C#, C++, Cobol, Fortran, Go, Logo, MUMPS, Pascal, Perl, PHP5, Yorick</td></tr>
<tr><td><tt>Goto</tt></td><td>Mathematica</td></tr>
<tr><td><tt>go throw</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>signal</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>b</tt></td><td>GNU-sed</td></tr>
<tr><td><tt>b, bra, jmp</tt></td><td>Assembler</td></tr>
</table><p>
continue / break
<table border=1 cellpadding=3>
<tr><td><tt>continue / break</tt></td><td>Awk, C, C#, C++, CoffeeScript, E, FishShell, Go, Io, Java, JavaScript, Matlab, PHP, Pike, Python, Tcl, YCP, Yorick</td></tr>
<tr><td><tt>Continue / Break</tt></td><td>Mathematica</td></tr>
<tr><td><tt>next / last</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>next / break<a href="#51">(51)</a></tt></td><td>Maple, Ruby</td></tr>
<tr><td><tt>/ break</tt></td><td>BCPL, Lua</td></tr>
<tr><td><tt>/ break/return</tt></td><td>Rebol</td></tr>
<tr><td><tt>/ exit</tt></td><td>Ada, PostScript</td></tr>
<tr><td><tt>/ stop</tt></td><td>Logo</td></tr>
<tr><td><tt>restart / leave</tt></td><td>Beta, Pliant</td></tr>
<tr><td><tt>/ Exit Do, Exit For</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>/ return-from xxx  or  return</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>iterate / leave</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>/ leave</tt></td><td>Forth</td></tr>
</table><p>
redo / retry
<table border=1 cellpadding=3>
<tr><td><tt>redo/</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>redo / retry</tt></td><td>Io, Ruby</td></tr>
</table><p>
<li><a name="CntrFlowxcptn">exception</a><p>
throwing
<table border=1 cellpadding=3>
<tr><td><tt>raise</tt></td><td>Ada, Eiffel, F#, merd, OCaml, Python, Ruby, Scheme-SRFI34, SML</td></tr>
<tr><td><tt>RAISE</tt></td><td>Modula-3</td></tr>
<tr><td><tt>raise ... end</tt></td><td>Oz</td></tr>
<tr><td><tt>Exception raise</tt></td><td>Io</td></tr>
<tr><td><tt>throw</tt></td><td>C#, C++, CoffeeScript, E, Erlang, Forth, Haskell, Java, JavaScript, Logo, PHP5, Pike, Prolog, Rebol</td></tr>
<tr><td><tt>Throw</tt></td><td>Mathematica</td></tr>
<tr><td><tt>throw/name</tt></td><td>Rebol</td></tr>
<tr><td><tt>die</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>return -code</tt></td><td>Tcl</td></tr>
<tr><td><tt>error</tt></td><td>Common Lisp, Dylan, Emacs Lisp, Lua, Lua, Maple, Matlab, Pliant, Yorick</td></tr>
<tr><td><tt>signal</tt></td><td>Common Lisp, Dylan, Smalltalk</td></tr>
<tr><td><tt>signal predefined_condition_name</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>cerror warn</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>[NSException raise:name ...]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>panic(v)</tt></td><td>Go</td></tr>
</table><p>
catching
<table border=1 cellpadding=3>
<tr><td><tt>try: a except exn: ...</tt></td><td>Python</td></tr>
<tr><td><tt>try a with exn -&gt; ...</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>try a catch (exn) ...</tt></td><td>C#, C++, Java, JavaScript</td></tr>
<tr><td><tt><pre>try a
  ...
catch exn
  ...</pre></tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>try { ... } catch(t $v) { ... }</tt></td><td>PHP5</td></tr>
<tr><td><tt>try a catch exn then ... end</tt></td><td>Oz</td></tr>
<tr><td><tt>try a catch exn: ... end try</tt></td><td>Maple</td></tr>
<tr><td><tt>try(a) ; catch(...)</tt></td><td>Io</td></tr>
<tr><td><tt>try { a CATCH exn { ... } }</tt></td><td>Perl6</td></tr>
<tr><td><tt>TRY a EXCEPT exn =&gt; ... END</tt></td><td>Modula-3</td></tr>
<tr><td><tt>a handle exn =&gt; ...</tt></td><td>SML</td></tr>
<tr><td><tt>a on: exception_name do: [:exn | ...]</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>ifCurtailed</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>rescue</tt></td><td>Eiffel, Ruby</td></tr>
<tr><td><tt>eval {a}; if ($@) ...</tt></td><td>Perl</td></tr>
<tr><td><tt>exception when exception_name =&gt;</tt></td><td>Ada</td></tr>
<tr><td><tt>catch a (\exn -&gt; ...)</tt></td><td>Haskell</td></tr>
<tr><td><tt>catch</tt></td><td>Erlang, Forth, Logo, Prolog, Rebol, Tcl</td></tr>
<tr><td><tt>Catch</tt></td><td>Mathematica</td></tr>
<tr><td><tt>catch/name</tt></td><td>Rebol</td></tr>
<tr><td><tt>catch(...) or catch { ... };</tt></td><td>Pike</td></tr>
<tr><td><tt>if (catch(exn)) { ... } a</tt></td><td>Yorick</td></tr>
<tr><td><tt>pcall</tt></td><td>Lua</td></tr>
<tr><td><tt>with-exception-handler or guard</tt></td><td>Scheme-SRFI34</td></tr>
<tr><td><tt>block a exception(exn) ... end</tt></td><td>Dylan</td></tr>
<tr><td><tt>?, shy, safe</tt></td><td>Pliant</td></tr>
<tr><td><tt>handler-bind handler-case ignore-errors</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>NS_DURING a NS_HANDLER ... NS_ENDHANDLER</tt></td><td>Objective-C</td></tr>
<tr><td><tt><pre>try
  a
catch
  ...
end</pre></tt></td><td>Matlab</td></tr>
<tr><td><tt><pre>signal on predefined_condition_name
...
predefined_condition_name :
  ...
</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt>recover()</tt></td><td>Go</td></tr>
</table><p>
cleanup: code executed before leaving
<table border=1 cellpadding=3>
<tr><td><tt>ensure</tt></td><td>Ruby, Smalltalk</td></tr>
<tr><td><tt>finally</tt></td><td>C#, F#, Java, Maple, Python</td></tr>
<tr><td><tt>FINALLY</tt></td><td>Modula-3</td></tr>
<tr><td><tt>unwind-protect</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>cleanup</tt></td><td>Dylan</td></tr>
<tr><td><tt>dynamic-wind</tt></td><td>Scheme</td></tr>
</table><p>
retrying: after catching an exception, tell the snippet to be re-run
<table border=1 cellpadding=3>
<tr><td><tt>retry</tt></td><td>Eiffel, Ruby, Smalltalk</td></tr>
<tr><td><tt>restart</tt></td><td>Dylan</td></tr>
</table><p>
resume execution where the exception took place
<table border=1 cellpadding=3>
<tr><td><tt>resume</tt></td><td>Smalltalk</td></tr>
</table><p>
<li><a name="CntrFlowCalWitCrrCnt">call-with-current-continuation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>call-with-current-continuation<a href="#52">(52)</a></tt></td><td>Scheme</td></tr>
<tr><td><tt>callcc</tt></td><td>Ruby, SML-NJ</td></tr>
</table><p>
</ul><hr>
<h2><a name="Tps">Types</a></h2>
<ul>
<li><a name="TpsDclrt">declaration</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>typedef t n</tt></td><td>C, C++, Pike</td></tr>
<tr><td><tt>type n is t</tt></td><td>Ada</td></tr>
<tr><td><tt>type n ...</tt></td><td>Pliant</td></tr>
<tr><td><tt>type n = t</tt></td><td>F#, Haskell, OCaml, Pascal, SML</td></tr>
<tr><td><tt>TYPE n = t</tt></td><td>Modula-3</td></tr>
<tr><td><tt>using n = ...</tt></td><td>C#</td></tr>
<tr><td><tt>data n = t</tt></td><td>Haskell</td></tr>
<tr><td><tt>datatype n = t</tt></td><td>SML</td></tr>
<tr><td><tt>newtype n = t</tt></td><td>Haskell</td></tr>
<tr><td><tt>n = t</tt></td><td>merd, Python</td></tr>
<tr><td><tt>n : t</tt></td><td>Beta</td></tr>
<tr><td><tt>(deftype n () 't)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>type n t</tt></td><td>Go</td></tr>
</table><p>
<li><a name="TpsnntOrVrbDcl">annotation (or variable declaration)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>:</tt></td><td>Ada, E, Eiffel, F#, Modula-3, OCaml, Pascal, SML</td></tr>
<tr><td><tt>::</tt></td><td>Dylan, Haskell, Mercury</td></tr>
<tr><td><tt>!!</tt></td><td>merd</td></tr>
<tr><td><tt>t v</tt></td><td>C, C#, C++, Java, Perl6, Pike, Pliant, YCP</td></tr>
<tr><td><tt>(declare (t v))</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>v :@ t</tt></td><td>Beta</td></tr>
<tr><td><tt>_t<a href="#53">(53)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>var n t</tt></td><td>Go</td></tr>
</table><p>
<li><a name="TpsCast">cast</a><p>
upcast
<table border=1 cellpadding=3>
<tr><td><tt>(t) e</tt></td><td>C, C#, C++, Java, PHP</td></tr>
<tr><td><tt>t(e)</tt></td><td>Ada, Pascal</td></tr>
<tr><td><tt>[t] e</tt></td><td>Pike</td></tr>
<tr><td><tt>static_cast&lt;t&gt;(e)</tt></td><td>C++</td></tr>
<tr><td><tt>e :&gt; t</tt></td><td>OCaml</td></tr>
<tr><td><tt>e : t</tt></td><td>F#</td></tr>
<tr><td><tt>upcast e</tt></td><td>F#</td></tr>
<tr><td><tt>CAST(e as t)</tt></td><td>SQL92</td></tr>
<tr><td><tt>typecast(e,t)</tt></td><td>Matlab</td></tr>
<tr><td><tt>(t)(e)</tt></td><td>Go</td></tr>
</table><p>
downcast (need runtime checking)
<table border=1 cellpadding=3>
<tr><td><tt>(t) e</tt></td><td>Java</td></tr>
<tr><td><tt>t(e)</tt></td><td>Ada</td></tr>
<tr><td><tt>e : t</tt></td><td>E</td></tr>
<tr><td><tt>[t] e</tt></td><td>Pike</td></tr>
<tr><td><tt>dynamic_cast&lt;t&gt;(e)</tt></td><td>C++</td></tr>
<tr><td><tt>e as t</tt></td><td>C#</td></tr>
<tr><td><tt>e :?&gt; t</tt></td><td>F#</td></tr>
<tr><td><tt>downcast e<a href="#54">(54)</a></tt></td><td>F#</td></tr>
<tr><td><tt>v ?= e<a href="#55">(55)</a></tt></td><td>Eiffel</td></tr>
<tr><td><tt>NARROW(e, t)</tt></td><td>Modula-3</td></tr>
<tr><td><tt>typecast(e,t)</tt></td><td>Matlab</td></tr>
</table><p>
computed conversion (calls an internal or a user-defined function)
<table border=1 cellpadding=3>
<tr><td><tt>(t) e</tt></td><td>C++, Pike</td></tr>
<tr><td><tt>[t] e</tt></td><td>MSH</td></tr>
<tr><td><tt>t(e)</tt></td><td>C++, Matlab, Python</td></tr>
<tr><td><tt>t e</tt></td><td>F#</td></tr>
<tr><td><tt>e : t</tt></td><td>E</td></tr>
<tr><td><tt>e :: t</tt></td><td>Haskell</td></tr>
<tr><td><tt>cast e t</tt></td><td>Pliant</td></tr>
<tr><td><tt>... cast t</tt></td><td>Pliant</td></tr>
<tr><td><tt>make t e / to t e</tt></td><td>Rebol</td></tr>
</table><p>
<li><a name="TpsMtblCnst">mutability, constness</a><p>
type of a mutable value
<table border=1 cellpadding=3>
<tr><td><tt>mutability is the default</tt></td><td>C, C#, C++, Go, Java, Matlab</td></tr>
<tr><td><tt>val x: T</tt></td><td>Pascal</td></tr>
<tr><td><tt>T ref</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>STRef a T</tt></td><td>Haskell</td></tr>
<tr><td><tt>in out T<a href="#56">(56)</a></tt></td><td>Ada</td></tr>
</table><p>
type of a constant value
<table border=1 cellpadding=3>
<tr><td><tt>const T</tt></td><td>C++, C99</td></tr>
<tr><td><tt>constant T</tt></td><td>Ada</td></tr>
<tr><td><tt>const x: T</tt></td><td>Pascal</td></tr>
<tr><td><tt>constness is the default</tt></td><td>F#, Haskell, OCaml, SML</td></tr>
<tr><td><tt>const e t</tt></td><td>Go</td></tr>
</table><p>
special cases
<table border=1 cellpadding=3>
<tr><td><tt>"readonly" fields<a href="#57">(57)</a></tt></td><td>C#</td></tr>
<tr><td><tt>"final" fields, parameters, local variables<a href="#57">(57)</a></tt></td><td>Java</td></tr>
</table><p>
</ul><hr>
<h2><a name="bjcrntRfl">Object Oriented & Reflexivity</a></h2>
<ul>
<li><a name="bjcrntRflMthdnvct">method invocation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>object.method(para)</tt></td><td>Ada, Beta, C#, C++, Cecil, CoffeeScript, Delphi-Kylix, E, Eiffel, F#, Icon, Java, JavaScript, merd, Modula-3, MSH, Perl6, Python, Ruby, Sather, Visual Basic</td></tr>
<tr><td><tt>object#method para</tt></td><td>OCaml</td></tr>
<tr><td><tt>object:method(para)</tt></td><td>Lua</td></tr>
<tr><td><tt>object method(para)</tt></td><td>Io</td></tr>
<tr><td><tt>object method para</tt></td><td>Pliant, Tcl</td></tr>
<tr><td><tt>object method: para1 method_continuation: para2</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>object &lt;- method(para)<a href="#58">(58)</a></tt></td><td>E</td></tr>
<tr><td><tt>[ object method: para ]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>object-&gt;method(para)</tt></td><td>C++, Perl, PHP, Pike</td></tr>
<tr><td><tt>object["method"](para)</tt></td><td>Pike</td></tr>
<tr><td><tt>object/method para</tt></td><td>Rebol</td></tr>
<tr><td><tt>method object para</tt></td><td>Haskell, Mercury</td></tr>
<tr><td><tt>(method object para)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>method(object, para)</tt></td><td>Ada, Dylan, Matlab</td></tr>
<tr><td><tt>para-&gt;method</tt></td><td>Beta</td></tr>
<tr><td><tt>(send object method para)</tt></td><td>MzScheme</td></tr>
</table><p>
with no parameter
<table border=1 cellpadding=3>
<tr><td><tt>object.method</tt></td><td>Ada, Eiffel, F#, merd, Perl6, Ruby</td></tr>
<tr><td><tt>object.property<a href="#59">(59)</a></tt></td><td>C#</td></tr>
<tr><td><tt>object.method()</tt></td><td>C#, C++, CoffeeScript, E, Java, JavaScript, Python</td></tr>
<tr><td><tt>object#method</tt></td><td>OCaml</td></tr>
<tr><td><tt>object:method</tt></td><td>Pliant</td></tr>
<tr><td><tt>object-&gt;method</tt></td><td>Perl</td></tr>
<tr><td><tt>object-&gt;method()</tt></td><td>PHP5, Pike</td></tr>
<tr><td><tt>object/method</tt></td><td>Rebol</td></tr>
<tr><td><tt>object["method"]()</tt></td><td>Pike</td></tr>
<tr><td><tt>object method</tt></td><td>Io, Smalltalk</td></tr>
<tr><td><tt>[ object method ]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>method object</tt></td><td>Haskell, Mercury</td></tr>
<tr><td><tt>(method object)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>method(object)</tt></td><td>Ada, Dylan, Matlab</td></tr>
<tr><td><tt>(send object method)</tt></td><td>MzScheme</td></tr>
</table><p>
<li><a name="bjcrntRflbjctCrtn">object creation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>new</tt></td><td>PHP, Pliant, Simula</td></tr>
<tr><td><tt>new class_name(...)</tt></td><td>C#, C++, CoffeeScript, F#, Java, JavaScript, Perl, PHP, Visual Basic</td></tr>
<tr><td><tt>new class_name ...</tt></td><td>CoffeeScript, OCaml</td></tr>
<tr><td><tt>class_name.new(...)</tt></td><td>Perl6, Ruby</td></tr>
<tr><td><tt>class_name new</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>class_name(...)</tt></td><td>F#, Matlab, Pike, Python</td></tr>
<tr><td><tt>class_name v(...)</tt></td><td>C++</td></tr>
<tr><td><tt>v : class_name</tt></td><td>Ada</td></tr>
<tr><td><tt>class_name.Create</tt></td><td>Delphi-Kylix</td></tr>
<tr><td><tt>!class_name!constructor_name(...)</tt></td><td>Eiffel</td></tr>
<tr><td><tt>&</tt></td><td>Beta</td></tr>
<tr><td><tt>make-object</tt></td><td>MzScheme</td></tr>
<tr><td><tt>(make-instance class_name ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>[class_name alloc]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>make class_name! ...</tt></td><td>Rebol</td></tr>
<tr><td><tt>def object_name { ... }</tt></td><td>E</td></tr>
</table><p>
<li><a name="bjcrntRflbjctClnn">object cloning</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>o.clone</tt></td><td>Perl6</td></tr>
<tr><td><tt>o.clone<a href="#60">(60)</a></tt></td><td>Eiffel, Ruby</td></tr>
<tr><td><tt>o.deep_clone</tt></td><td>Eiffel</td></tr>
<tr><td><tt>o.clone()</tt></td><td>Java</td></tr>
<tr><td><tt>o.Clone()</tt></td><td>C#</td></tr>
<tr><td><tt>clone $o</tt></td><td>PHP5</td></tr>
<tr><td><tt>o clone</tt></td><td>Io</td></tr>
<tr><td><tt>clone / copy or deepCopy</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Storable::dclone</tt></td><td>Perl</td></tr>
<tr><td><tt>[o copy]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>copy.copy(o)<a href="#61">(61)</a></tt></td><td>Python</td></tr>
<tr><td><tt>purecopy</tt></td><td>Emacs Lisp</td></tr>
<tr><td><tt>{&lt; &gt;}  or  Oo.copy o</tt></td><td>OCaml</td></tr>
<tr><td><tt>o2 = o<a href="#62">(62)</a></tt></td><td>C++, Matlab, PHP</td></tr>
<tr><td><tt>$o2 = $o</tt></td><td>PHP</td></tr>
<tr><td><tt>o2.all := o.all</tt></td><td>Ada</td></tr>
<tr><td><tt>make o []</tt></td><td>Rebol</td></tr>
<tr><td><tt>o_ : T'Class := o<a href="#63">(63)</a></tt></td><td>Ada</td></tr>
</table><p>
<li><a name="bjcrntRflMCAbSD">manually call an object's destructor</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>delete</tt></td><td>C++, JavaScript</td></tr>
<tr><td><tt>destroy</tt></td><td>Pike</td></tr>
<tr><td><tt>DESTROY</tt></td><td>Perl</td></tr>
<tr><td><tt>dealloc</tt></td><td>Objective-C</td></tr>
<tr><td><tt>Dispose</tt></td><td>C#, F#</td></tr>
<tr><td><tt>del, __del__</tt></td><td>Python</td></tr>
<tr><td><tt>__destruct</tt></td><td>PHP5</td></tr>
<tr><td><tt>Requires instantiation of Ada.Unchecked_Deallocation</tt></td><td>Ada</td></tr>
</table><p>
<li><a name="bjcrntRflClssDclr">class declaration</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>class</tt></td><td>C#, C++, CoffeeScript, Haskell, Java, Matlab, MzScheme, OCaml, Perl6, PHP, Pike, Python, Ruby</td></tr>
<tr><td><tt>class c inherit p1 p2 ... feature decl decl ... end</tt></td><td>Eiffel</td></tr>
<tr><td><tt>defclass defstruct</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>subclass</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>struct</tt></td><td>C++</td></tr>
<tr><td><tt>type</tt></td><td>Pliant</td></tr>
<tr><td><tt>type c is tagged record ... end record<a href="#64">(64)</a></tt></td><td>Ada</td></tr>
<tr><td><tt>@interface c { ... } ... @end</tt></td><td>Objective-C</td></tr>
<tr><td><tt>:</tt></td><td>Beta</td></tr>
<tr><td><tt>type c() = class ... end</tt></td><td>F#</td></tr>
<tr><td><tt><pre>type c() =
  ...</pre></tt></td><td>F#</td></tr>
</table><p>
<li><a name="bjcrntRflTstClsMmb">testing class membership</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>isa</tt></td><td>Matlab, Perl</td></tr>
<tr><td><tt>is_a? kind_of?</tt></td><td>Ruby</td></tr>
<tr><td><tt>o.meta.isa</tt></td><td>Perl6</td></tr>
<tr><td><tt>isKindOf<a href="#65">(65)</a></tt></td><td>Smalltalk</td></tr>
<tr><td><tt>isKindOfClass</tt></td><td>Objective-C</td></tr>
<tr><td><tt>dynamic_cast</tt></td><td>C++</td></tr>
<tr><td><tt>instanceof</tt></td><td>CoffeeScript, Java, JavaScript, PHP5</td></tr>
<tr><td><tt>isinstance</tt></td><td>Python</td></tr>
<tr><td><tt>in</tt></td><td>Ada</td></tr>
<tr><td><tt>is</tt></td><td>C#</td></tr>
<tr><td><tt>is_a</tt></td><td>PHP</td></tr>
<tr><td><tt>:?</tt></td><td>F#</td></tr>
<tr><td><tt>Program.inherits or Program.implements</tt></td><td>Pike</td></tr>
<tr><td><tt>entry_type</tt></td><td>Pliant</td></tr>
<tr><td><tt>typep</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>ISTYPE</tt></td><td>Modula-3</td></tr>
<tr><td><tt>object## &lt; classname##</tt></td><td>Beta</td></tr>
<tr><td><tt>type.accepts(object) / object =~ v : type</tt></td><td>E</td></tr>
<tr><td><tt>var ?= val<a href="#66">(66)</a></tt></td><td>Eiffel</td></tr>
</table><p>
<li><a name="bjcrntRflGTCCTAbnV">get the type/class corresponding to an object/instance/value</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>class</tt></td><td>Matlab, Objective-C, Ruby, Smalltalk</td></tr>
<tr><td><tt>__class__</tt></td><td>Python</td></tr>
<tr><td><tt>getClass</tt></td><td>Java</td></tr>
<tr><td><tt>get_class</tt></td><td>PHP</td></tr>
<tr><td><tt>GetType</tt></td><td>F#</td></tr>
<tr><td><tt>typeid</tt></td><td>C++</td></tr>
<tr><td><tt>typeof</tt></td><td>C#, CoffeeScript, JavaScript</td></tr>
<tr><td><tt>type-of</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>type</tt></td><td>Io</td></tr>
<tr><td><tt>ref</tt></td><td>Perl</td></tr>
<tr><td><tt>generator</tt></td><td>Eiffel</td></tr>
<tr><td><tt>meta</tt></td><td>Perl6</td></tr>
<tr><td><tt>object_program</tt></td><td>Pike</td></tr>
<tr><td><tt>getAllegedType</tt></td><td>E</td></tr>
</table><p>
<li><a name="bjcrntRflMthdvlbl">methods available</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>methods</tt></td><td>Matlab, Ruby</td></tr>
<tr><td><tt>get_class_methods</tt></td><td>PHP</td></tr>
<tr><td><tt>getMethods</tt></td><td>Java</td></tr>
<tr><td><tt>get-member</tt></td><td>MSH</td></tr>
<tr><td><tt>indices</tt></td><td>Pike</td></tr>
<tr><td><tt>o.meta.getmethods</tt></td><td>Perl6</td></tr>
<tr><td><tt>dir</tt></td><td>Python</td></tr>
<tr><td><tt>slotNames</tt></td><td>Io</td></tr>
<tr><td><tt>o.GetType().GetMethods()</tt></td><td>F#</td></tr>
<tr><td><tt>o class selectors / o class allSelectors</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>o.__getAllegedType().getMessageTypes()</tt></td><td>E</td></tr>
</table><p>
<li><a name="bjcrntRflnhrtn">inheritance</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>child :&lt; parent</tt></td><td>Beta</td></tr>
<tr><td><tt>class child : parent</tt></td><td>C#, C++</td></tr>
<tr><td><tt>class child &lt; parent end</tt></td><td>Ruby</td></tr>
<tr><td><tt>class child is parent { ... }</tt></td><td>Perl6</td></tr>
<tr><td><tt>class child extends parent</tt></td><td>CoffeeScript, Java, PHP5</td></tr>
<tr><td><tt>class child(parent):</tt></td><td>Python</td></tr>
<tr><td><tt>class child inherit parent end</tt></td><td>Eiffel</td></tr>
<tr><td><tt>parent subclass: child</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>make parent ...</tt></td><td>Rebol</td></tr>
<tr><td><tt>inherit</tt></td><td>OCaml, Pike</td></tr>
<tr><td><tt>def child extends makeSuperObject(parent, ...) { ... }</tt></td><td>E</td></tr>
<tr><td><tt>type child is new parent with record ... end record</tt></td><td>Ada</td></tr>
<tr><td><tt><pre>type child =
  inherit parent
  ...</pre></tt></td><td>F#</td></tr>
<tr><td><tt>(defclass child (parent) ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>@interface child : parent { ... } ... @end</tt></td><td>Objective-C</td></tr>
<tr><td><tt>@ISA = qw(parent1 parent2)</tt></td><td>Perl</td></tr>
<tr><td><tt>clone , setProtos, setProto, prependProto, appendProto</tt></td><td>Io</td></tr>
<tr><td><tt>instance Parent Child where ...</tt></td><td>Haskell</td></tr>
</table><p>
<li><a name="bjcrntRflHasMthd">has the method</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>can</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>respond_to?</tt></td><td>Ruby</td></tr>
<tr><td><tt>respondsTo</tt></td><td>E, Smalltalk</td></tr>
<tr><td><tt>respondsToSelector</tt></td><td>Objective-C</td></tr>
<tr><td><tt>hasattr(obj, "meth")<a href="#67">(67)</a></tt></td><td>Python</td></tr>
<tr><td><tt>object-&gt;method</tt></td><td>Pike</td></tr>
<tr><td><tt>all [in object 'method function? get in object 'method]</tt></td><td>Rebol</td></tr>
<tr><td><tt>find-method</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>ismethod</tt></td><td>Matlab</td></tr>
<tr><td><tt>hasSlot</tt></td><td>Io</td></tr>
<tr><td><tt>try obj.GetType().GetMethod("meth") with ...</tt></td><td>F#</td></tr>
<tr><td><tt>obj.meth? instanceof Function</tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>method_exists</tt></td><td>PHP5</td></tr>
</table><p>
<li><a name="bjcrntRflCrrnnstn">current instance</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>this</tt></td><td>Beta, C#, C++, CoffeeScript, Java, JavaScript, PHP, Pike</td></tr>
<tr><td><tt>THIS</tt></td><td>Simula</td></tr>
<tr><td><tt>self</tt></td><td>Io, Objective-C, Rebol, Ruby, Smalltalk</td></tr>
<tr><td><tt>object_name if defined as: def object_name { ... }</tt></td><td>E</td></tr>
<tr><td><tt>Current</tt></td><td>Eiffel</td></tr>
<tr><td><tt>first parameter<a href="#68">(68)</a></tt></td><td>Matlab, Perl, Pliant, Python</td></tr>
<tr><td><tt>the object variable</tt></td><td>F#</td></tr>
<tr><td><tt>dispatching parameter</tt></td><td>Ada, Common Lisp</td></tr>
<tr><td><tt>Me</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>.</tt></td><td>Perl6</td></tr>
</table><p>
<li><a name="bjcrntRflccsPrnMth">accessing parent method</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>super</tt></td><td>CoffeeScript, E, Java, Objective-C, Ruby, Smalltalk</td></tr>
<tr><td><tt>super(Class, self).meth(args)</tt></td><td>Python</td></tr>
<tr><td><tt>base</tt></td><td>C#</td></tr>
<tr><td><tt>resend</tt></td><td>Io</td></tr>
<tr><td><tt>Precursor</tt></td><td>Eiffel</td></tr>
<tr><td><tt>$o.SUPER::method(...)</tt></td><td>Perl6</td></tr>
<tr><td><tt>$o-&gt;SUPER::method(...)</tt></td><td>Perl</td></tr>
<tr><td><tt>method(parent(dispatching-parameter))</tt></td><td>Ada</td></tr>
<tr><td><tt>parent(dispatching-parameter).method</tt></td><td>Ada</td></tr>
<tr><td><tt>parent::method</tt></td><td>PHP5</td></tr>
<tr><td><tt>call-next-method</tt></td><td>Common Lisp</td></tr>
<tr><td><tt><pre>type foo2 =
  inherit foo as parent
  ...
  member ... = ... parent.meth</pre></tt></td><td>F#</td></tr>
</table><p>
<li><a name="bjcrntRflccsChlMth">accessing child method</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>inner</tt></td><td>Beta</td></tr>
</table><p>
</ul><hr>
<h2><a name="PckgMdl">Package, Module</a></h2>
<ul>
<li><a name="PckgMdlPckgScp">package scope</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>.</tt></td><td>Ada, C#, CoffeeScript, E, F#, Go, Haskell, Java, Modula-3, OCaml, Pascal, Python, Ruby, SML, Squeak</td></tr>
<tr><td><tt>:</tt></td><td>XML</td></tr>
<tr><td><tt>::</tt></td><td>C++, merd, Perl, Ruby, Squeak, Tcl, YCP</td></tr>
<tr><td><tt>: ::<a href="#69">(69)</a></tt></td><td>Common Lisp</td></tr>
<tr><td><tt>:-</tt></td><td>Maple</td></tr>
<tr><td><tt>'</tt></td><td>Perl</td></tr>
<tr><td><tt>`</tt></td><td>Mathematica</td></tr>
<tr><td><tt>__</tt></td><td>Mercury</td></tr>
<tr><td><tt>/</tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="PckgMdlDclr">declare</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>package p;</tt></td><td>Java, Perl</td></tr>
<tr><td><tt>namespace p { ... }</tt></td><td>C#, C++</td></tr>
<tr><td><tt>namespace p ...</tt></td><td>F#</td></tr>
<tr><td><tt>namespace P;</tt></td><td>PHP5</td></tr>
<tr><td><tt>namespace eval p ...</tt></td><td>Tcl</td></tr>
<tr><td><tt>module p where ...</tt></td><td>Haskell</td></tr>
<tr><td><tt>module P ... end</tt></td><td>Ruby</td></tr>
<tr><td><tt>module P = struct ... end</tt></td><td>OCaml</td></tr>
<tr><td><tt>{ module "p"; ... }</tt></td><td>YCP</td></tr>
<tr><td><tt>:- module(p)</tt></td><td>Prolog</td></tr>
<tr><td><tt>p = module() ... end module</tt></td><td>Maple</td></tr>
<tr><td><tt>(defpackage p ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>automatically done based on the file name</tt></td><td>OCaml, Python, Tcl8.5</td></tr>
<tr><td><tt>package declare<a href="#70">(70)</a></tt></td><td>Matlab</td></tr>
<tr><td><tt>Begin["p`"] ... End[]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>BeginPackage["p`"] ... EndPackage[]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>&lt;node xmlns="namespace"&gt; ... &lt;/node&gt;</tt></td><td>XML</td></tr>
<tr><td><tt><pre>package p is
   -- Declare public package members here
private
   -- Declare private package members here
end p;

package body p is
 ... -- Define package implementation here
end p;</pre></tt></td><td>Ada</td></tr>
<tr><td><tt>package p</tt></td><td>Go</td></tr>
</table><p>
selective export
<table border=1 cellpadding=3>
<tr><td><tt>module p (name1, name2, ...) where ...</tt></td><td>Haskell</td></tr>
<tr><td><tt>@ISA = qw(Exporter); @EXPORT = qw(name1 name2 ...);</tt></td><td>Perl</td></tr>
<tr><td><tt>package p is ... end; package body p is ... end;</tt></td><td>Ada</td></tr>
<tr><td><tt>p = module() export name1, name2, ...; ... end module</tt></td><td>Maple</td></tr>
<tr><td><tt>(export 'name1 'name2)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>attached to each name (public, private...)</tt></td><td>Java, Pike</td></tr>
<tr><td><tt>namespace export name1</tt></td><td>Tcl</td></tr>
<tr><td><tt><pre>namespace p
  val name1 : type1
  ...</pre></tt></td><td>F#</td></tr>
<tr><td><tt>append_features</tt></td><td>Ruby</td></tr>
<tr><td><tt><pre>module type PType = sig val name1 : type1 ... end
module P : PType  = struct ... end</pre></tt></td><td>OCaml</td></tr>
<tr><td><tt>all files in package directory are exported. files in /private sub-directory are not exported, but can be used by the package itself</tt></td><td>Matlab</td></tr>
<tr><td><tt>__all__ = [ ... ]</tt></td><td>Python</td></tr>
<tr><td><tt>Identifier is only exported if the first character of its name is an Unicode upper case letter; and the identifier is declared in the package block or it is a field name or method name.  No other identifiers are exported</tt></td><td>Go</td></tr>
</table><p>
<li><a name="PckgMdlmprt">import</a><p>
everything into current namespace
<table border=1 cellpadding=3>
<tr><td><tt>use p<a href="#71">(71)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>uses p</tt></td><td>Pascal</td></tr>
<tr><td><tt>using p</tt></td><td>C#</td></tr>
<tr><td><tt>using namespace p;</tt></td><td>C++</td></tr>
<tr><td><tt>(use-package 'p)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>open p</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>import</tt></td><td>Pike</td></tr>
<tr><td><tt>import p</tt></td><td>Haskell</td></tr>
<tr><td><tt>IMPORT p;</tt></td><td>Modula-2</td></tr>
<tr><td><tt>import p.*</tt></td><td>Java</td></tr>
<tr><td><tt>import "p"</tt></td><td>YCP</td></tr>
<tr><td><tt>from p import *</tt></td><td>Python</td></tr>
<tr><td><tt>with p; use p;</tt></td><td>Ada</td></tr>
<tr><td><tt>namespace import p *</tt></td><td>Tcl</td></tr>
<tr><td><tt>inherit c export {NONE} all end</tt></td><td>Eiffel</td></tr>
<tr><td><tt>include or even extend</tt></td><td>Ruby</td></tr>
<tr><td><tt>do</tt></td><td>Rebol</td></tr>
<tr><td><tt>addpath</tt></td><td>Matlab</td></tr>
<tr><td><tt>. p</tt></td><td>BourneShell</td></tr>
<tr><td><tt>source p</tt></td><td>BourneShell</td></tr>
<tr><td><tt>builtin -f /path/to/lib.so</tt></td><td>KornShell</td></tr>
<tr><td><tt>&lt;&lt; p`</tt></td><td>Mathematica</td></tr>
<tr><td><tt>Get["p`"]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>Needs["p`"]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>use P1\P;</tt></td><td>PHP5</td></tr>
<tr><td><tt>use P1\P as Q;</tt></td><td>PHP5</td></tr>
</table><p>
selectively
<table border=1 cellpadding=3>
<tr><td><tt>import p (name1, name2, ...)</tt></td><td>Haskell</td></tr>
<tr><td><tt>import p.name1; import p.name2</tt></td><td>Java</td></tr>
<tr><td><tt>(import '(p:name1 p:name2))</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>use p qw(name1 name2 ...)</tt></td><td>Perl</td></tr>
<tr><td><tt>from p import name1, name2, ...</tt></td><td>Python</td></tr>
<tr><td><tt>FROM p IMPORT name1, name2, ...;</tt></td><td>Modula-2</td></tr>
<tr><td><tt>namespace import p name1</tt></td><td>Tcl</td></tr>
<tr><td><tt>using p::name1; using p::name2; ...</tt></td><td>C++</td></tr>
<tr><td><tt>with p; use type p.type1; ...</tt></td><td>Ada</td></tr>
<tr><td><tt>with(p[name1, name2,])</tt></td><td>Maple</td></tr>
<tr><td><tt>def name := &lt;import:p.name&gt;</tt></td><td>E</td></tr>
<tr><td><tt>:- use_module(name1, name2, ...)</tt></td><td>Prolog</td></tr>
</table><p>
package (ie. load the package)
<table border=1 cellpadding=3>
<tr><td><tt>import p</tt></td><td>Python</td></tr>
<tr><td><tt>use p;<a href="#72">(72)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>require p</tt></td><td>Perl</td></tr>
<tr><td><tt>require "p"</tt></td><td>Ruby</td></tr>
<tr><td><tt>require, "p"</tt></td><td>Yorick</td></tr>
<tr><td><tt>(require 'p)<a href="#73">(73)</a></tt></td><td>Common Lisp</td></tr>
<tr><td><tt>with p;</tt></td><td>Ada</td></tr>
<tr><td><tt>with(p)</tt></td><td>Maple</td></tr>
<tr><td><tt>package require p</tt></td><td>Tcl</td></tr>
<tr><td><tt>automatically done<a href="#74">(74)</a></tt></td><td>Java, OCaml</td></tr>
<tr><td><tt>import "p"</tt></td><td>Go</td></tr>
</table><p>
</ul><hr>
<h2><a name="Strng">Strings</a></h2>
<ul>
<li><a name="StrngTypeName">type name</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>char[]</tt></td><td>C</td></tr>
<tr><td><tt>char const[]</tt></td><td>C++</td></tr>
<tr><td><tt>string</tt></td><td>C#, C++, F#, Go, Maple, OCaml, Pascal, PHP, Pike, SML, Vimscript, YCP</td></tr>
<tr><td><tt>string!</tt></td><td>Rebol</td></tr>
<tr><td><tt>String</tt></td><td>Ada, C#, CoffeeScript, Haskell, Java, JavaScript, merd, Ruby, Smalltalk, Visual Basic</td></tr>
<tr><td><tt>STRING</tt></td><td>Eiffel</td></tr>
<tr><td><tt>str</tt></td><td>Python, YAML</td></tr>
<tr><td><tt>Str</tt></td><td>Perl6, Pliant</td></tr>
<tr><td><tt>NSString *</tt></td><td>Objective-C</td></tr>
<tr><td><tt>CHAR, VARCHAR(size)</tt></td><td>SQL92</td></tr>
<tr><td><tt>Sequence</tt></td><td>Io</td></tr>
</table><p>
<li><a name="StrngChrTypNam">character type name</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>char</tt></td><td>C, C#, C++, F#, OCaml, SML</td></tr>
<tr><td><tt>char!</tt></td><td>Rebol</td></tr>
<tr><td><tt>Char</tt></td><td>Haskell, merd, Perl6</td></tr>
<tr><td><tt>Character</tt></td><td>Ada, Smalltalk</td></tr>
<tr><td><tt>CHARACTER</tt></td><td>Eiffel</td></tr>
<tr><td><tt>rune</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngChrcZ">character "z"</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>'z'</tt></td><td>Ada, B, C, C#, C++, Classic REXX, E, Eiffel, F#, Go, Haskell, Matlab, OCaml, Pascal, Pike</td></tr>
<tr><td><tt>"z"</tt></td><td>BourneShell, Classic REXX, Maple, merd</td></tr>
<tr><td><tt>"z</tt></td><td>Logo</td></tr>
<tr><td><tt>$z</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>#\z</tt></td><td>Common Lisp, Scheme</td></tr>
<tr><td><tt>#"z"</tt></td><td>Rebol, SML</td></tr>
<tr><td><tt>&z</tt></td><td>Oz</td></tr>
<tr><td><tt>?z</tt></td><td>Emacs Lisp, Ruby</td></tr>
<tr><td><tt>char z, [char] z<a href="#75">(75)</a></tt></td><td>Forth</td></tr>
</table><p>
<li><a name="StrngStrng">strings</a><p>
with no interpolation of variables
<table border=1 cellpadding=3>
<tr><td><tt>'...'</tt></td><td>Beta, BourneShell, Classic REXX, CoffeeScript, CSS, FishShell, JavaScript, Lua, Matlab, Pascal, Perl, Perl6, PHP, Prolog, Python, Ruby, Smalltalk, SQL92, Vimscript, XPath, YAML</td></tr>
<tr><td><tt>"..."</tt></td><td>Ada, Awk, C, C#, C++, Classic REXX, Common Lisp, CSS, Dylan, E, Eiffel, Emacs Lisp, F#, FL, Go, Haskell, Io, Java, JavaScript, Lua, Maple, Mathematica, Modula-3, MUMPS, OCaml, Oz, Pike, Pliant, Prolog, Python, Rebol, Scheme, SML, XPath, YAML, YCP</td></tr>
<tr><td><tt>"...</tt></td><td>Logo</td></tr>
<tr><td><tt>'''...'''</tt></td><td>Python</td></tr>
<tr><td><tt>"""..."""</tt></td><td>Io, Python</td></tr>
<tr><td><tt>[[ ... ]]</tt></td><td>Lua</td></tr>
<tr><td><tt>R"[ ... ]"</tt></td><td>C++-0x</td></tr>
<tr><td><tt>&lt;&lt;'MARK' ... MARK</tt></td><td>BourneShell, Perl, Ruby</td></tr>
<tr><td><tt>&lt;&lt;&lt;'MARK' ... MARK<a href="#76">(76)</a></tt></td><td>PHP5</td></tr>
<tr><td><tt>{...{...}...}</tt></td><td>Tcl</td></tr>
<tr><td><tt>(...)</tt></td><td>PostScript</td></tr>
<tr><td><tt>q(...(...)...), q[...], q{...}, q&lt;...&gt;, q/.../</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>%q(...(...)...), %q[...], %q{...}, %q&lt;...&gt;, %q/.../</tt></td><td>Ruby</td></tr>
<tr><td><tt>q(...(...)...)</tt></td><td>merd</td></tr>
<tr><td><tt>@"...""..."</tt></td><td>C#</td></tr>
<tr><td><tt>s"..."</tt></td><td>Forth</td></tr>
<tr><td><tt>@"..."</tt></td><td>Objective-C</td></tr>
</table><p>
with interpolation of variables
<table border=1 cellpadding=3>
<tr><td><tt>...<a href="#77">(77)</a></tt></td><td>Tcl</td></tr>
<tr><td><tt>"... $v ..."</tt></td><td>BourneShell, FishShell, Perl, Perl6, PHP, Tcl</td></tr>
<tr><td><tt>"... {v} ..."</tt></td><td>merd</td></tr>
<tr><td><tt>"... #{v} ..." "... #$v ..." "... #@v ..." "... #@@v ..."</tt></td><td>CoffeeScript, Ruby</td></tr>
<tr><td><tt>&lt;&lt;MARK ... $v ... MARK</tt></td><td>BourneShell, Perl</td></tr>
<tr><td><tt>&lt;&lt;MARK ... #{v} ... MARK</tt></td><td>Ruby</td></tr>
<tr><td><tt>&lt;&lt;&lt;MARK ... $v ... MARK</tt></td><td>PHP</td></tr>
<tr><td><tt>qq(...(... $v ...)...), qq[...], qq{...}, qq&lt;...&gt;, qq/.../</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>%Q(...(... #{v} ...)...), %Q[...], %Q{...}, %Q&lt;...&gt;, %Q/.../</tt></td><td>Ruby</td></tr>
<tr><td><tt>qq(...(... {v} ...)...)</tt></td><td>merd</td></tr>
<tr><td><tt>"... #{v} ..." interpolate</tt></td><td>Io</td></tr>
<tr><td><tt>"... %(v)s ..." % vars()</tt></td><td>Python</td></tr>
</table><p>
end-of-line (without writing the real CR or LF character)
<table border=1 cellpadding=3>
<tr><td><tt>\n</tt></td><td>Tcl</td></tr>
<tr><td><tt>"\n"</tt></td><td>C, C#, C++, CoffeeScript, FishShell, Go, Haskell, Io, Java, JavaScript, Lua, Maple, Mathematica, OCaml, Perl, Perl6, PHP, Pike, Python, Ruby, YCP, Yorick</td></tr>
<tr><td><tt>"*n"</tt></td><td>B, BCPL</td></tr>
<tr><td><tt>"%N"</tt></td><td>Eiffel</td></tr>
<tr><td><tt>"^/"</tt></td><td>Rebol</td></tr>
<tr><td><tt>"~%"<a href="#78">(78)</a></tt></td><td>Common Lisp</td></tr>
<tr><td><tt>"[lf]"</tt></td><td>Pliant</td></tr>
<tr><td><tt>vb_nl</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>&lt;N&gt;<a href="#79">(79)</a></tt></td><td>Smalltalk</td></tr>
</table><p>
<li><a name="StrngMltLine">multi-line</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>all strings allow multi-line strings</tt></td><td>BourneShell, Common Lisp, E, Emacs Lisp, F#, FishShell, Io, Maple, Mathematica, OCaml, Pascal, Perl, Perl6, PHP, Ruby, Scheme, Smalltalk, YCP</td></tr>
<tr><td><tt>"...", {...}</tt></td><td>Tcl</td></tr>
<tr><td><tt>@"..."</tt></td><td>C#</td></tr>
<tr><td><tt>'''...''', """..."""</tt></td><td>Python</td></tr>
<tr><td><tt>[[ ... ]]</tt></td><td>Lua</td></tr>
<tr><td><tt>{...}</tt></td><td>Rebol</td></tr>
<tr><td><tt><pre>"...\n"
"...\n"</pre></tt></td><td>C</td></tr>
<tr><td><tt><pre>... "...\n\
    \...\n"</pre></tt></td><td>Haskell</td></tr>
<tr><td><tt><pre>"...",
"..."</pre></tt></td><td>Classic REXX</td></tr>
<tr><td><tt><pre>"...%N%
%...%N"</pre></tt></td><td>Eiffel</td></tr>
<tr><td><tt>""" ... """</tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>`...`</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngCSTSSASn">convert something to a string (see also string interpolation)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>show</tt></td><td>Haskell</td></tr>
<tr><td><tt>to_s, to_str, inspect, String()</tt></td><td>Ruby</td></tr>
<tr><td><tt>to_string</tt></td><td>merd, Pliant</td></tr>
<tr><td><tt>tostring</tt></td><td>Lua, YCP</td></tr>
<tr><td><tt>toString</tt></td><td>CoffeeScript, Java, JavaScript</td></tr>
<tr><td><tt>ToString</tt></td><td>C#, F#, Mathematica</td></tr>
<tr><td><tt>String</tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>perl</tt></td><td>Perl6</td></tr>
<tr><td><tt>Dumper</tt></td><td>Perl</td></tr>
<tr><td><tt>"" . e</tt></td><td>Perl</td></tr>
<tr><td><tt>"" ~ e</tt></td><td>Perl6</td></tr>
<tr><td><tt>"" + e</tt></td><td>CoffeeScript, E, Java, JavaScript</td></tr>
<tr><td><tt>string</tt></td><td>Pliant, Vimscript</td></tr>
<tr><td><tt>str, `e`, repr</tt></td><td>Python</td></tr>
<tr><td><tt>out</tt></td><td>Eiffel</td></tr>
<tr><td><tt>cvs</tt></td><td>PostScript</td></tr>
<tr><td><tt>T'Image(e)<a href="#80">(80)</a></tt></td><td>Ada</td></tr>
<tr><td><tt>asString</tt></td><td>Io, Smalltalk</td></tr>
<tr><td><tt>printString</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>as(&lt;string&gt;, e)</tt></td><td>Dylan</td></tr>
<tr><td><tt>(string) e</tt></td><td>PHP, Pike</td></tr>
<tr><td><tt>convert(e,string)</tt></td><td>Maple</td></tr>
<tr><td><tt>(coerce e 'string)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>prin1-to-string</tt></td><td>Emacs Lisp</td></tr>
<tr><td><tt>to string! / to-string / to ""</tt></td><td>Rebol</td></tr>
<tr><td><tt>description</tt></td><td>Objective-C</td></tr>
<tr><td><tt>pr1</tt></td><td>Yorick</td></tr>
<tr><td><tt>unneeded, all values are strings</tt></td><td>Tcl</td></tr>
<tr><td><tt>string(e)</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngSrlzMrsh">serialize (marshalling)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>export-clixml</tt></td><td>MSH</td></tr>
<tr><td><tt>serialize</tt></td><td>Io, PHP</td></tr>
<tr><td><tt>Marshal.to_string</tt></td><td>OCaml</td></tr>
<tr><td><tt>Marshal.dump</tt></td><td>Ruby</td></tr>
<tr><td><tt>Data.Binary.encode</tt></td><td>Haskell</td></tr>
<tr><td><tt>BinaryFormatter.Serialize</tt></td><td>F#</td></tr>
<tr><td><tt>storeBinaryOn</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Storable::store</tt></td><td>Perl</td></tr>
<tr><td><tt>pickle.dump<a href="#81">(81)</a></tt></td><td>Python</td></tr>
<tr><td><tt>(with-standard-io-syntax (write obj stream))</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>T'Output<a href="#80">(80)</a></tt></td><td>Ada</td></tr>
</table><p>
<li><a name="StrngnsrUnMrs">unserialize (un-marshalling)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>import-clixml</tt></td><td>MSH</td></tr>
<tr><td><tt>unserialize</tt></td><td>PHP</td></tr>
<tr><td><tt>Marshal.from_string</tt></td><td>OCaml</td></tr>
<tr><td><tt>Marshal.load</tt></td><td>Ruby</td></tr>
<tr><td><tt>Data.Binary.decode</tt></td><td>Haskell</td></tr>
<tr><td><tt>BinaryFormatter.Deserialize</tt></td><td>F#</td></tr>
<tr><td><tt>readBinaryFrom</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>pickle.load</tt></td><td>Python</td></tr>
<tr><td><tt>(with-standard-io-syntax (read obj stream))</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>Storable::store</tt></td><td>Perl</td></tr>
<tr><td><tt>doString</tt></td><td>Io</td></tr>
<tr><td><tt>T'Input<a href="#80">(80)</a></tt></td><td>Ada</td></tr>
</table><p>
<li><a name="StrngSprnLike">sprintf-like</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>sprintf</tt></td><td>Awk, C, C++, F#, Maple, Matlab, merd, OCaml, Perl, Perl6, PHP, Pike, Ruby</td></tr>
<tr><td><tt>printf</tt></td><td>Haskell</td></tr>
<tr><td><tt>%</tt></td><td>Python, Ruby</td></tr>
<tr><td><tt>format</tt></td><td>Java, Lua, Tcl</td></tr>
<tr><td><tt>format<a href="#82">(82)</a></tt></td><td>Common Lisp, Erlang, Scheme-SRFI28</td></tr>
<tr><td><tt>Format</tt></td><td>C#, F#</td></tr>
<tr><td><tt>putFormat</tt></td><td>Beta</td></tr>
<tr><td><tt>stringWithFormat</tt></td><td>Objective-C</td></tr>
<tr><td><tt>expandMacrosWith<a href="#82">(82)</a></tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Storable::retrieve</tt></td><td>Perl</td></tr>
<tr><td><tt>fmt.Sprintf</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngSmplPrnt">simple print</a><p>
on strings
<table border=1 cellpadding=3>
<tr><td><tt>puts</tt></td><td>C, Dylan, Tcl</td></tr>
<tr><td><tt>print</tt></td><td>Awk, Basic, Java, Maple, merd, PHP, SML</td></tr>
<tr><td><tt>write</tt></td><td>JavaScript, Pascal, Pike, Yorick</td></tr>
<tr><td><tt>putStr</tt></td><td>Haskell</td></tr>
<tr><td><tt>print_string</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>console</tt></td><td>Pliant</td></tr>
<tr><td><tt>writeln</tt></td><td>JavaScript, Pascal</td></tr>
<tr><td><tt>write-string</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>putStrLn</tt></td><td>Haskell</td></tr>
<tr><td><tt>Put_Line</tt></td><td>Ada</td></tr>
<tr><td><tt>display</tt></td><td>Cobol</td></tr>
<tr><td><tt>message</tt></td><td>Emacs Lisp</td></tr>
<tr><td><tt>put_string</tt></td><td>Eiffel</td></tr>
<tr><td><tt>show</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>print_endline<a href="#83">(83)</a></tt></td><td>OCaml</td></tr>
<tr><td><tt>println<a href="#83">(83)</a></tt></td><td>Java, merd</td></tr>
<tr><td><tt>put_chars</tt></td><td>Erlang</td></tr>
<tr><td><tt>echo<a href="#84">(84)</a></tt></td><td>BourneShell, FishShell, PHP</td></tr>
<tr><td><tt>type</tt></td><td>Forth</td></tr>
<tr><td><tt>putText</tt></td><td>Beta</td></tr>
<tr><td><tt>say</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>p or i</tt></td><td>GNU-sed</td></tr>
<tr><td><tt>fmt.Print</tt></td><td>Go</td></tr>
<tr><td><tt>echom</tt></td><td>Vimscript</td></tr>
</table><p>
on simple objects
<table border=1 cellpadding=3>
<tr><td><tt>print</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>say<a href="#83">(83)</a></tt></td><td>Perl6</td></tr>
<tr><td><tt>puts<a href="#83">(83)</a></tt></td><td>Tcl</td></tr>
<tr><td><tt>puts -nonewline</tt></td><td>Tcl</td></tr>
</table><p>
on any objects
<table border=1 cellpadding=3>
<tr><td><tt>print</tt></td><td>Io, Logo, Lua, Ruby</td></tr>
<tr><td><tt>print<a href="#83">(83)</a></tt></td><td>Dylan, Haskell, Python, Rebol</td></tr>
<tr><td><tt>Print</tt></td><td>Mathematica</td></tr>
<tr><td><tt>print e,</tt></td><td>Python</td></tr>
<tr><td><tt>println<a href="#83">(83)</a></tt></td><td>Io</td></tr>
<tr><td><tt>prin</tt></td><td>Rebol</td></tr>
<tr><td><tt>Put</tt></td><td>Ada</td></tr>
<tr><td><tt>p<a href="#83">(83)</a></tt></td><td>Ruby</td></tr>
<tr><td><tt>puts<a href="#85">(85)</a></tt></td><td>Ruby</td></tr>
<tr><td><tt>display</tt></td><td>Scheme</td></tr>
<tr><td><tt>write</tt></td><td>Common Lisp, Io, Prolog, Scheme</td></tr>
<tr><td><tt>writeln<a href="#83">(83)</a></tt></td><td>Io</td></tr>
<tr><td><tt>print</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>printOn</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>princ prin1</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>print_any</tt></td><td>F#</td></tr>
<tr><td><tt>WriteLine</tt></td><td>C#, F#</td></tr>
<tr><td><tt>nothing - just remove ";" at the end of the expression, and it will print it</tt></td><td>Matlab</td></tr>
<tr><td><tt>disp</tt></td><td>Matlab</td></tr>
</table><p>
printf-like
<table border=1 cellpadding=3>
<tr><td><tt>printf</tt></td><td>Awk, C, C++, F#, Haskell, KornShell, Maple, Matlab, merd, OCaml, Perl, PHP, Ruby</td></tr>
<tr><td><tt>write</tt></td><td>Pike</td></tr>
<tr><td><tt>WriteLine</tt></td><td>C#</td></tr>
<tr><td><tt>putFormat</tt></td><td>Beta</td></tr>
<tr><td><tt>format<a href="#82">(82)</a></tt></td><td>Common Lisp, Prolog</td></tr>
<tr><td><tt>fmt.Printf</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngStrqltnql">string equality & inequality</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>eq ne</tt></td><td>Perl, Perl6, Tcl</td></tr>
<tr><td><tt>strcmp</tt></td><td>C, Matlab</td></tr>
<tr><td><tt>== !=(Vimscript: whether or not == and != are case-sensitive depends on user settings.)</tt></td><td>CoffeeScript, Go, JavaScript, Pike, Vimscript</td></tr>
<tr><td><tt>==? !=?<a href="#86">(86)</a></tt></td><td>Vimscript</td></tr>
<tr><td><tt>==# !=#<a href="#87">(87)</a></tt></td><td>Vimscript</td></tr>
<tr><td><tt>== !==</tt></td><td>PHP</td></tr>
<tr><td><tt>== ~=</tt></td><td>Lua</td></tr>
<tr><td><tt>= \=</tt></td><td>Prolog</td></tr>
<tr><td><tt>isEqualToString<a href="#88">(88)</a></tt></td><td>Objective-C</td></tr>
<tr><td><tt>== !=</tt></td><td>Awk, C#, C++, E, Io, merd, Python, Ruby, YCP</td></tr>
<tr><td><tt>== &lt;&gt;</tt></td><td>Python</td></tr>
<tr><td><tt>== /=</tt></td><td>Haskell</td></tr>
<tr><td><tt>== \=</tt></td><td>Oz</td></tr>
<tr><td><tt>= !=</tt></td><td>BourneShell, FishShell, Maple, XPath</td></tr>
<tr><td><tt>= /=</tt></td><td>Ada</td></tr>
<tr><td><tt>= \=</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>= &lt;&gt;</tt></td><td>Beta, F#, OCaml, Pliant, SML, Visual Basic</td></tr>
<tr><td><tt>= ~=</tt></td><td>Dylan, Smalltalk</td></tr>
<tr><td><tt>== \== or = &lt;&gt; \=</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>=== =!= / == !=<a href="#20">(20)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>== ~=</tt></td><td>Matlab</td></tr>
<tr><td><tt>equal?</tt></td><td>Ruby, Scheme</td></tr>
<tr><td><tt>equals</tt></td><td>Java</td></tr>
<tr><td><tt>equal, equalp</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>is_equal</tt></td><td>Eiffel</td></tr>
<tr><td><tt>isEqual</tt></td><td>Objective-C</td></tr>
</table><p>
<li><a name="StrngStrnSize">string size</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>length</tt></td><td>Awk, Beta, C++, CoffeeScript, Common Lisp, Eiffel, F#, Haskell, Java, JavaScript, Maple, Matlab, Objective-C, OCaml, Perl, PostScript, Prolog, Ruby</td></tr>
<tr><td><tt>LENGTH</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>'Length</tt></td><td>Ada</td></tr>
<tr><td><tt>length?</tt></td><td>Rebol</td></tr>
<tr><td><tt>size</tt></td><td>C++, E, Io, Ruby, Smalltalk, SML, YCP</td></tr>
<tr><td><tt>Length</tt></td><td>C#, F#, Modula-3, Oz, Pascal</td></tr>
<tr><td><tt>len</tt></td><td>Go, Pliant, Python, Vimscript, Visual Basic</td></tr>
<tr><td><tt>strlen</tt></td><td>C, PHP, Vimscript</td></tr>
<tr><td><tt>string length</tt></td><td>Tcl</td></tr>
<tr><td><tt>string-length</tt></td><td>Scheme, XPath</td></tr>
<tr><td><tt>StringLength</tt></td><td>Mathematica</td></tr>
<tr><td><tt>sizeof</tt></td><td>Pike</td></tr>
<tr><td><tt>count</tt></td><td>Eiffel, Logo</td></tr>
<tr><td><tt>bytes chars</tt></td><td>Perl6</td></tr>
<tr><td><tt>CHARACTER_LENGTH</tt></td><td>SQL92</td></tr>
<tr><td><tt>atom_length</tt></td><td>Prolog</td></tr>
<tr><td><tt>wc -c</tt></td><td>FishShell</td></tr>
<tr><td><tt>#</tt></td><td>Lua</td></tr>
<tr><td><tt>${#v}</tt></td><td>BourneShell</td></tr>
<tr><td><tt>dup<a href="#89">(89)</a></tt></td><td>Forth</td></tr>
</table><p>
<li><a name="StrngStrnCnct">string concatenation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>+</tt></td><td>C#, C++, CoffeeScript, E, Eiffel, F#, Go, Java, JavaScript, merd, MSH, Pascal, Pike, Pliant, Python, Ruby, YCP</td></tr>
<tr><td><tt>.</tt></td><td>Perl, PHP, Vimscript</td></tr>
<tr><td><tt>..</tt></td><td>Io, Lua</td></tr>
<tr><td><tt>,</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>~</tt></td><td>D, Perl6</td></tr>
<tr><td><tt>&</tt></td><td>Ada, Modula-3, Visual Basic</td></tr>
<tr><td><tt>^</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>_</tt></td><td>MUMPS</td></tr>
<tr><td><tt>||</tt></td><td>Cecil, Classic REXX, Icon, Maple, PL/I, SQL92</td></tr>
<tr><td><tt>++</tt></td><td>Haskell</td></tr>
<tr><td><tt>$a$b</tt></td><td>BourneShell, FishShell, Tcl</td></tr>
<tr><td><tt>concatenate</tt></td><td>Common Lisp, Dylan</td></tr>
<tr><td><tt>string-append</tt></td><td>Scheme</td></tr>
<tr><td><tt>StringJoin</tt></td><td>Mathematica</td></tr>
<tr><td><tt>cat</tt></td><td>Maple</td></tr>
<tr><td><tt>Cat</tt></td><td>Modula-3</td></tr>
<tr><td><tt>strcat</tt></td><td>C</td></tr>
<tr><td><tt>concat</tt></td><td>XPath</td></tr>
<tr><td><tt>append</tt></td><td>Beta, Prolog, Rebol</td></tr>
<tr><td><tt>stringByAppendingString</tt></td><td>Objective-C</td></tr>
<tr><td><tt></tt></td><td>Awk, Classic REXX</td></tr>
<tr><td><tt>[string1 string2]</tt></td><td>Matlab</td></tr>
<tr><td><tt>word</tt></td><td>Logo</td></tr>
</table><p>
<li><a name="StrngDplNTms">duplicate n times</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>*</tt></td><td>Ada, E, Pike, Python, Ruby</td></tr>
<tr><td><tt>x</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>times</tt></td><td>merd</td></tr>
<tr><td><tt>repeat</tt></td><td>Pliant</td></tr>
<tr><td><tt>repeated</tt></td><td>Io</td></tr>
<tr><td><tt>str_repeat</tt></td><td>PHP</td></tr>
<tr><td><tt>string repeat</tt></td><td>Tcl</td></tr>
<tr><td><tt>strrep</tt></td><td>Lua</td></tr>
<tr><td><tt>repmat</tt></td><td>Matlab</td></tr>
<tr><td><tt>insert/dup</tt></td><td>Rebol</td></tr>
<tr><td><tt>COPIES</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>cat(s$n)</tt></td><td>Maple</td></tr>
<tr><td><tt>concat $ replicate</tt></td><td>Haskell</td></tr>
<tr><td><tt>strings.Repeat</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngpprLwrCasChr">upper / lower case character</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>upcase / downcase</tt></td><td>Emacs Lisp, Ruby</td></tr>
<tr><td><tt>uc / lc</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>upper / lower<a href="#90">(90)</a></tt></td><td>Lua, Matlab, Pliant, Python</td></tr>
<tr><td><tt>toUpper / toLower</tt></td><td>Haskell</td></tr>
<tr><td><tt>to_upper / to_lower</tt></td><td>Eiffel</td></tr>
<tr><td><tt>To_Upper / To_Lower</tt></td><td>Ada</td></tr>
<tr><td><tt>toUpperCase / toLowerCase</tt></td><td>CoffeeScript, E, Java, JavaScript</td></tr>
<tr><td><tt>upper_case / lower_case</tt></td><td>Pike</td></tr>
<tr><td><tt>uppercase / lowercase</tt></td><td>F#, Logo, OCaml</td></tr>
<tr><td><tt>strupper / strlower</tt></td><td>Lua</td></tr>
<tr><td><tt>strtoupper / strtolower</tt></td><td>PHP</td></tr>
<tr><td><tt>ToUpper / ToLower</tt></td><td>C#, F#, Oz</td></tr>
<tr><td><tt>toupper / tolower</tt></td><td>Awk, C, C++</td></tr>
<tr><td><tt>string toupper / string tolower</tt></td><td>Tcl</td></tr>
<tr><td><tt>asLowercase / asUppercase</tt></td><td>Io, Smalltalk</td></tr>
<tr><td><tt>upCase / lowCase</tt></td><td>Beta</td></tr>
<tr><td><tt>uppercase form / lowercase form</tt></td><td>Rebol</td></tr>
<tr><td><tt>char-upcase / char-downcase</tt></td><td>Common Lisp, Scheme</td></tr>
<tr><td><tt>char_type(C_, to_upper(C)), char_type(C_, to_lower(C))</tt></td><td>Prolog</td></tr>
<tr><td><tt>\U / \L / \C</tt></td><td>GNU-sed</td></tr>
<tr><td><tt>unicode.ToUpper / unicode.ToLower</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngpprLwrCptStr">uppercase / lowercase / capitalized string</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>upcase / downcase</tt></td><td>Emacs Lisp, Ruby</td></tr>
<tr><td><tt>upper / lower</tt></td><td>Matlab, SQL92</td></tr>
<tr><td><tt>upper / lower / capitalize</tt></td><td>Python</td></tr>
<tr><td><tt>uppercase/lowercase</tt></td><td>F#, Logo, OCaml, Rebol</td></tr>
<tr><td><tt>upcase_atom/downcase_atom</tt></td><td>Prolog</td></tr>
<tr><td><tt>toUpperCase / toLowerCase</tt></td><td>CoffeeScript, E, Java, JavaScript</td></tr>
<tr><td><tt>ToUpperCase / ToLowerCase</tt></td><td>Mathematica</td></tr>
<tr><td><tt>ToUpper / ToLower</tt></td><td>C#, F#</td></tr>
<tr><td><tt>to_upper / to_lower</tt></td><td>Ada, Eiffel</td></tr>
<tr><td><tt>toupper / tolower</tt></td><td>Awk, YCP</td></tr>
<tr><td><tt>uc / lc</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>UpperCase / LowerCase</tt></td><td>Pascal</td></tr>
<tr><td><tt>StringTools[UpperCase] / StringTools[LowerCase] / StringTools[Capitalize]</tt></td><td>Maple</td></tr>
<tr><td><tt>uppercaseString / lowercaseString / capitalizedString</tt></td><td>Objective-C</td></tr>
<tr><td><tt>UCase / LCase</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>strtoupper / strtolower</tt></td><td>PHP, Yorick</td></tr>
<tr><td><tt>strupper / strlower</tt></td><td>Lua</td></tr>
<tr><td><tt>string toupper / string tolower / string totitle</tt></td><td>Tcl</td></tr>
<tr><td><tt>string-upcase / string-downcase</tt></td><td>Common Lisp, Scheme</td></tr>
<tr><td><tt>asLowercase / asUppercase / asUppercaseFirst</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>asLowercase / asUppercase / makeFirstCharacterUppercase</tt></td><td>Io</td></tr>
<tr><td><tt>upcase_atom / downcase_atom</tt></td><td>Prolog</td></tr>
<tr><td><tt>makeLC / makeUC</tt></td><td>Beta</td></tr>
<tr><td><tt>parse upper var in_var out_var / parse lower var in_var out_var</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>strings.ToUpper / strings.ToLower / strings.Title</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngscToChr">ascii to character</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>chr</tt></td><td>F#, Haskell, OCaml, Pascal, Perl, Perl6, PHP, Python, Ruby, SML</td></tr>
<tr><td><tt>chr$</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>char</tt></td><td>Matlab</td></tr>
<tr><td><tt>format %c $c</tt></td><td>Tcl</td></tr>
<tr><td><tt>toChar</tt></td><td>E</td></tr>
<tr><td><tt>strchar</tt></td><td>Lua</td></tr>
<tr><td><tt>from_integer</tt></td><td>Eiffel</td></tr>
<tr><td><tt>fromCharCode</tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>FromCharacterCode</tt></td><td>Mathematica</td></tr>
<tr><td><tt>character</tt></td><td>Pliant</td></tr>
<tr><td><tt>Character value: c</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>asCharacter</tt></td><td>Io</td></tr>
<tr><td><tt>code-char</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>integer-&gt;char</tt></td><td>Scheme</td></tr>
<tr><td><tt>'Val</tt></td><td>Ada</td></tr>
<tr><td><tt>(char) c</tt></td><td>C, C#, C++, Java</td></tr>
<tr><td><tt>to char! / to-char</tt></td><td>Rebol</td></tr>
<tr><td><tt>X2C, D2C</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>$CHAR(s)</tt></td><td>MUMPS</td></tr>
<tr><td><tt>char_code</tt></td><td>Prolog</td></tr>
<tr><td><tt>ascii</tt></td><td>Logo</td></tr>
<tr><td><tt>StringTools[Char]</tt></td><td>Maple</td></tr>
<tr><td><tt>utf8.DecodeRuneInString(s)</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngChrTosc">character to ascii</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>ord</tt></td><td>F#, Haskell, Pascal, Perl, Perl6, PHP, Python, SML</td></tr>
<tr><td><tt>asc</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>getNumericValue</tt></td><td>Java</td></tr>
<tr><td><tt>charCodeAt</tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>asciiValue</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>code</tt></td><td>Eiffel, OCaml</td></tr>
<tr><td><tt>char-code</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>char-&gt;integer</tt></td><td>Scheme</td></tr>
<tr><td><tt>s[0]</tt></td><td>Ruby</td></tr>
<tr><td><tt>s 0 get</tt></td><td>PostScript</td></tr>
<tr><td><tt>s at(0)</tt></td><td>Io</td></tr>
<tr><td><tt>scan $s %c</tt></td><td>Tcl</td></tr>
<tr><td><tt>strbyte</tt></td><td>Lua</td></tr>
<tr><td><tt>toInteger</tt></td><td>E</td></tr>
<tr><td><tt>'Pos</tt></td><td>Ada</td></tr>
<tr><td><tt>number</tt></td><td>Pliant</td></tr>
<tr><td><tt>(int) c</tt></td><td>C, C#, C++, Java</td></tr>
<tr><td><tt>to integer! / to-integer</tt></td><td>Rebol</td></tr>
<tr><td><tt>ToCharacterCode</tt></td><td>Mathematica</td></tr>
<tr><td><tt>C2X, C2D</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>$ASCII(s)</tt></td><td>MUMPS</td></tr>
<tr><td><tt>(done automatically when applying mathematical operations on char, such as +)</tt></td><td>Matlab</td></tr>
<tr><td><tt>char</tt></td><td>Logo</td></tr>
<tr><td><tt>char_code</tt></td><td>Prolog</td></tr>
<tr><td><tt>StringTools[Ord]</tt></td><td>Maple</td></tr>
<tr><td><tt>string(c)</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngccsNThChr">accessing n-th character</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>s[n]</tt></td><td>C, C#, C++, E, Go, Maple, PHP, Pike, Python, Ruby, Vimscript</td></tr>
<tr><td><tt>s(n)</tt></td><td>Ada, Matlab</td></tr>
<tr><td><tt>s:n</tt></td><td>Pliant</td></tr>
<tr><td><tt>s.[n]</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>s !! n</tt></td><td>Haskell</td></tr>
<tr><td><tt>s @ n</tt></td><td>Eiffel</td></tr>
<tr><td><tt>s/:n</tt></td><td>Rebol</td></tr>
<tr><td><tt>string index s n</tt></td><td>Tcl</td></tr>
<tr><td><tt>sub</tt></td><td>SML</td></tr>
<tr><td><tt>char, aref, schar, svref</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>GetChar</tt></td><td>Modula-3</td></tr>
<tr><td><tt>s at(n)</tt></td><td>Io</td></tr>
<tr><td><tt>at<a href="#91">(91)</a></tt></td><td>C++, Smalltalk</td></tr>
<tr><td><tt>aref</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>char(s, i)</tt></td><td>B</td></tr>
<tr><td><tt>charAt</tt></td><td>CoffeeScript, Java, JavaScript</td></tr>
<tr><td><tt>characterAtIndex</tt></td><td>Objective-C</td></tr>
<tr><td><tt>n -&gt; s.inxGet</tt></td><td>Beta</td></tr>
<tr><td><tt>string-ref</tt></td><td>Scheme</td></tr>
<tr><td><tt>StringTake[s, {n}]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>$EXTRACT(s, n)</tt></td><td>MUMPS</td></tr>
<tr><td><tt>item</tt></td><td>Logo</td></tr>
<tr><td><tt>over n chars + c@</tt></td><td>Forth</td></tr>
<tr><td><tt>s/.{n}(.).*/\1/</tt></td><td>GNU-sed</td></tr>
</table><p>
<li><a name="StrngxtrcSbst">extract a substring</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>s[n..m]</tt></td><td>CoffeeScript, Maple, Pike, Ruby</td></tr>
<tr><td><tt>s.[n..m]</tt></td><td>F#</td></tr>
<tr><td><tt>s(n..m)</tt></td><td>Ada</td></tr>
<tr><td><tt>s(n:m)</tt></td><td>Matlab</td></tr>
<tr><td><tt>s(n,m+1)</tt></td><td>E</td></tr>
<tr><td><tt>s[n:m+1]</tt></td><td>Go, Python, Vimscript</td></tr>
<tr><td><tt>s[n,len]</tt></td><td>Ruby</td></tr>
<tr><td><tt>s n len</tt></td><td>Pliant</td></tr>
<tr><td><tt>strndup(s + n, len)</tt></td><td>C</td></tr>
<tr><td><tt>substring</tt></td><td>Eiffel, Java, Scheme, SML, XPath, YCP</td></tr>
<tr><td><tt>Substring</tt></td><td>C#</td></tr>
<tr><td><tt>substr</tt></td><td>C++, Perl, Perl6, PHP</td></tr>
<tr><td><tt>SUBSTR</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>sub</tt></td><td>F#, Lua, OCaml</td></tr>
<tr><td><tt>SUB</tt></td><td>Modula-3</td></tr>
<tr><td><tt>subseq</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>slice</tt></td><td>CoffeeScript, Io, JavaScript</td></tr>
<tr><td><tt>mid$</tt></td><td>JavaScript</td></tr>
<tr><td><tt>string range</tt></td><td>Tcl</td></tr>
<tr><td><tt>StringTake[s, {n, m}]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>strpart(s, n, m)</tt></td><td>Yorick</td></tr>
<tr><td><tt>copy/part at s n len</tt></td><td>Rebol</td></tr>
<tr><td><tt>copy/part at s n at s m</tt></td><td>Rebol</td></tr>
<tr><td><tt>s copyFrom: n to: m</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>(n,m)-&gt;s.sub</tt></td><td>Beta</td></tr>
<tr><td><tt>[s substringWithRange:NSMakeRange(n, len)]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>SUBSTRING(s FROM n len)</tt></td><td>SQL92</td></tr>
<tr><td><tt>$EXTRACT(s, n, m)</tt></td><td>MUMPS</td></tr>
<tr><td><tt>sub_string / sub_atom</tt></td><td>Prolog</td></tr>
<tr><td><tt>(take len . drop n) s</tt></td><td>Haskell</td></tr>
<tr><td><tt>over n chars + len</tt></td><td>Forth</td></tr>
<tr><td><tt>s/.{n}(.{len}).*/\1/</tt></td><td>GNU-sed</td></tr>
</table><p>
<li><a name="StrngLctSbst">locate a substring</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>index</tt></td><td>Ada, Perl, Perl6, Python, Ruby</td></tr>
<tr><td><tt>indexOf</tt></td><td>CoffeeScript, Java, JavaScript</td></tr>
<tr><td><tt>IndexOf</tt></td><td>C#, F#</td></tr>
<tr><td><tt>indexOfString</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>startOf</tt></td><td>E</td></tr>
<tr><td><tt>search</tt></td><td>Common Lisp, Pike, PostScript</td></tr>
<tr><td><tt>StringTools[Search]</tt></td><td>Maple</td></tr>
<tr><td><tt>StringPosition</tt></td><td>Mathematica</td></tr>
<tr><td><tt>strstr strchr</tt></td><td>C</td></tr>
<tr><td><tt>find</tt></td><td>C++, Logo, Lua, Python, Rebol, YCP</td></tr>
<tr><td><tt>findSeq</tt></td><td>Io</td></tr>
<tr><td><tt>findSubstring</tt></td><td>Haskell</td></tr>
<tr><td><tt>strfind</tt></td><td>Matlab, Yorick</td></tr>
<tr><td><tt>strpos</tt></td><td>PHP</td></tr>
<tr><td><tt>$FIND</tt></td><td>MUMPS</td></tr>
<tr><td><tt>index_non_blank / find_token</tt></td><td>Ada</td></tr>
<tr><td><tt>substring_index</tt></td><td>Eiffel</td></tr>
<tr><td><tt>rangeOfString</tt></td><td>Objective-C</td></tr>
<tr><td><tt>POS</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>POSITION(needle IN s)</tt></td><td>SQL92</td></tr>
<tr><td><tt>sub_string / sub_atom</tt></td><td>Prolog</td></tr>
<tr><td><tt>string first</tt></td><td>Tcl</td></tr>
<tr><td><tt>strings.Index</tt></td><td>Go</td></tr>
</table><p>
<li><a name="StrngLctSbsStrAtEnd">locate a substring (starting at the end)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>rindex</tt></td><td>OCaml, Perl, Perl6, Python, Ruby</td></tr>
<tr><td><tt>rfind</tt></td><td>C++, Python</td></tr>
<tr><td><tt>find/last</tt></td><td>Rebol</td></tr>
<tr><td><tt>strrchr</tt></td><td>C</td></tr>
<tr><td><tt>index(Going =&gt; Backward)</tt></td><td>Ada</td></tr>
<tr><td><tt>lastStartOf</tt></td><td>E</td></tr>
<tr><td><tt>lastIndexOf</tt></td><td>CoffeeScript, Java, JavaScript</td></tr>
<tr><td><tt>last_index_of<a href="#92">(92)</a></tt></td><td>Eiffel</td></tr>
<tr><td><tt>LastIndexOf</tt></td><td>C#, F#</td></tr>
<tr><td><tt>lastIndexOfString</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>string last</tt></td><td>Tcl</td></tr>
<tr><td><tt>(search substring string :from-end t)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>[string rangeOfString:substring options:NSBackwardsSearch]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>LASTPOS</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>t=strfind(s,p), t(end)</tt></td><td>Matlab</td></tr>
<tr><td><tt>strrpos</tt></td><td>PHP</td></tr>
<tr><td><tt>StringTools[SearchAll](s,p)[-1]</tt></td><td>Maple</td></tr>
<tr><td><tt>strings.LastIndex</tt></td><td>Go</td></tr>
</table><p>
</ul><hr>
<h2><a name="Blns">Booleans</a></h2>
<ul>
<li><a name="BlnsTypeName">type name</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>Bool</tt></td><td>Haskell, Perl6, Pliant</td></tr>
<tr><td><tt>bool</tt></td><td>C#, C++, C99, F#, Go, OCaml, PHP, Python, SML, YAML</td></tr>
<tr><td><tt>Boolean</tt></td><td>Ada, Lua, Pascal, Smalltalk, Visual Basic</td></tr>
<tr><td><tt>boolean</tt></td><td>CoffeeScript, Common Lisp, Java, JavaScript, Maple, PHP, YCP</td></tr>
<tr><td><tt>BOOLEAN</tt></td><td>Eiffel</td></tr>
<tr><td><tt>logic!</tt></td><td>Rebol</td></tr>
<tr><td><tt>logical</tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="BlnsFlsVl">false value</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>false</tt></td><td>Ada, BCPL, Beta, BourneShell, C#, C++, C99, CoffeeScript, E, F#, FL, Forth, Go, Io, Java, JavaScript, Logo, Lua, Maple, Matlab, OCaml, Oz, Pascal, PHP, Pliant, PostScript, Rebol, Ruby, Smalltalk, SML, Tcl, YAML, YCP</td></tr>
<tr><td><tt>False</tt></td><td>Eiffel, Haskell, Mathematica, merd, Python, Visual Basic</td></tr>
<tr><td><tt>FALSE</tt></td><td>Modula-3, SQL92</td></tr>
<tr><td><tt>false()</tt></td><td>XPath</td></tr>
<tr><td><tt>#f</tt></td><td>Dylan, Scheme</td></tr>
<tr><td><tt>n</tt></td><td>YAML</td></tr>
<tr><td><tt>nil</tt></td><td>Common Lisp, Emacs Lisp, Io, Lua, Ruby</td></tr>
<tr><td><tt>no</tt></td><td>CoffeeScript, Tcl, YAML</td></tr>
<tr><td><tt>No</tt></td><td>Prolog</td></tr>
<tr><td><tt>none</tt></td><td>Rebol</td></tr>
<tr><td><tt>None</tt></td><td>Python</td></tr>
<tr><td><tt>null</tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>NULL</tt></td><td>C, C++, C99, PHP</td></tr>
<tr><td><tt>off</tt></td><td>CoffeeScript, Tcl, YAML</td></tr>
<tr><td><tt>undef</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>undefined</tt></td><td>CoffeeScript, JavaScript</td></tr>
<tr><td><tt>fail</tt></td><td>Prolog</td></tr>
<tr><td><tt>FAIL</tt></td><td>Maple</td></tr>
<tr><td><tt>array containing at least one false value</tt></td><td>Matlab</td></tr>
<tr><td><tt>exit status different from 0</tt></td><td>BourneShell</td></tr>
<tr><td><tt>0<a href="#93">(93)</a></tt></td><td>Awk, B, C, C++, C99, Classic REXX, CoffeeScript, Forth, JavaScript, Matlab, MUMPS, Perl, Perl6, PHP, Pike, Python, Tcl, Visual Basic, XPath, Yorick</td></tr>
<tr><td><tt>0.0</tt></td><td>Matlab, Perl, PHP</td></tr>
<tr><td><tt>NaN</tt></td><td>CoffeeScript, JavaScript, XPath</td></tr>
<tr><td><tt>""</tt></td><td>Awk, CoffeeScript, JavaScript, Perl, Perl6, PHP, Python, XPath</td></tr>
<tr><td><tt>"0"</tt></td><td>Awk, Perl, Perl6, PHP</td></tr>
<tr><td><tt>''</tt></td><td>CoffeeScript, Matlab, Perl</td></tr>
<tr><td><tt>'\0'</tt></td><td>C, C++, C99</td></tr>
<tr><td><tt>()</tt></td><td>Perl, Perl6, Python</td></tr>
<tr><td><tt>[]</tt></td><td>Matlab, Python</td></tr>
<tr><td><tt>{}</tt></td><td>Matlab, Python</td></tr>
<tr><td><tt>array()</tt></td><td>PHP</td></tr>
</table><p>
<li><a name="BlnsTrueVl">true value</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>TRUE</tt></td><td>Modula-3, SQL92</td></tr>
<tr><td><tt>True</tt></td><td>Eiffel, Haskell, Mathematica, merd, Python, Visual Basic</td></tr>
<tr><td><tt>true</tt></td><td>Ada, BCPL, Beta, BourneShell, C#, C++, CoffeeScript, E, F#, FL, Forth, Go, Io, Java, JavaScript, Logo, Maple, OCaml, Oz, Pascal, PHP, Pliant, PostScript, Prolog, Rebol, Ruby, Smalltalk, SML, Tcl, YAML, YCP</td></tr>
<tr><td><tt>true()</tt></td><td>XPath</td></tr>
<tr><td><tt>t</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>#t</tt></td><td>Dylan, Scheme</td></tr>
<tr><td><tt>y</tt></td><td>YAML</td></tr>
<tr><td><tt>yes</tt></td><td>CoffeeScript, Tcl, YAML</td></tr>
<tr><td><tt>Yes</tt></td><td>Prolog</td></tr>
<tr><td><tt>on</tt></td><td>CoffeeScript, Tcl, YAML</td></tr>
<tr><td><tt>exit status 0</tt></td><td>BourneShell</td></tr>
<tr><td><tt>anything not false</tt></td><td>Awk, B, C, C++, Common Lisp, Dylan, Emacs Lisp, Matlab, MUMPS, Perl, Perl6, Pike, Python, Rebol, Ruby, Scheme, XPath, Yorick</td></tr>
<tr><td><tt>1</tt></td><td>Classic REXX, MUMPS</td></tr>
<tr><td><tt>non zero number</tt></td><td>Tcl</td></tr>
<tr><td><tt>non-zero-numbers</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>-1</tt></td><td>Forth</td></tr>
</table><p>
<li><a name="BlnsLgclNot">logical not</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>!</tt></td><td>Awk, B, C, C#, C++, CoffeeScript, E, Go, Java, JavaScript, Mathematica, Perl, Perl6, PHP, Pike, Ruby, Tcl, Vimscript, YCP, Yorick</td></tr>
<tr><td><tt>not<a href="#94">(94)</a></tt></td><td>Ada, Beta, CoffeeScript, Common Lisp, Eiffel, Emacs Lisp, F#, Haskell, Io, Logo, Lua, Maple, merd, OCaml, Pascal, Perl, Perl6, Pliant, PostScript, Prolog, Python, Rebol, Ruby, Scheme, Smalltalk, SML, XPath</td></tr>
<tr><td><tt>Not</tt></td><td>Oz, Visual Basic</td></tr>
<tr><td><tt>NOT</tt></td><td>Modula-3</td></tr>
<tr><td><tt>~</tt></td><td>BCPL, Dylan, Matlab, PL/I</td></tr>
<tr><td><tt>^</tt></td><td>PL/I</td></tr>
<tr><td><tt>'</tt></td><td>MUMPS</td></tr>
<tr><td><tt>\</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>=0</tt></td><td>Forth</td></tr>
</table><p>
<li><a name="BlnsLgcOrAnd">logical or / and</a><p>
short circuit
<table border=1 cellpadding=3>
<tr><td><tt>|| / &&</tt></td><td>Awk, C, C#, C++, CoffeeScript, E, F#, Go, Haskell, Java, JavaScript, Mathematica, Matlab, merd, OCaml, Perl, Perl6, PHP, Pike, Ruby, Tcl, Vimscript, YCP, Yorick</td></tr>
<tr><td><tt>| / &</tt></td><td>B, BCPL, Dylan</td></tr>
<tr><td><tt>or / and</tt></td><td>CoffeeScript, Common Lisp, Emacs Lisp, Io, Logo, Lua, Modula-2, Perl, Perl6, PHP, Pliant, Python, Ruby, Scheme, Smalltalk</td></tr>
<tr><td><tt>OR / AND</tt></td><td>Modula-3</td></tr>
<tr><td><tt>or / &<a href="#95">(95)</a></tt></td><td>Modula-2</td></tr>
<tr><td><tt>any / all</tt></td><td>Rebol</td></tr>
<tr><td><tt>orelse / andalso</tt></td><td>SML</td></tr>
<tr><td><tt>orelse / andthen</tt></td><td>Oz</td></tr>
<tr><td><tt>or else / and then</tt></td><td>Ada, Eiffel</td></tr>
<tr><td><tt>; / ,</tt></td><td>Prolog</td></tr>
<tr><td><tt>& / !</tt></td><td>MUMPS</td></tr>
</table><p>
non short circuit (always evaluates both arguments)
<table border=1 cellpadding=3>
<tr><td><tt>| / &</tt></td><td>C#, Classic REXX, Java, Matlab, Smalltalk</td></tr>
<tr><td><tt>or / and</tt></td><td>Ada, Beta, Eiffel, Maple, Pascal, PostScript, Rebol, SML, XPath</td></tr>
<tr><td><tt>Or / And<a href="#96">(96)</a></tt></td><td>Oz, Visual Basic</td></tr>
<tr><td><tt>\/ / /\<a href="#15">(15)</a></tt></td><td>BCPL</td></tr>
<tr><td><tt>?| /</tt></td><td>Perl6</td></tr>
</table><p>
</ul><hr>
<h2><a name="BagAndLst">Bags and Lists</a></h2>
<ul>
<li><a name="BagAndLstTypeName">type name</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>seq</tt></td><td>YAML</td></tr>
<tr><td><tt>a list</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>[a]</tt></td><td>Haskell</td></tr>
<tr><td><tt>a[]</tt></td><td>C#</td></tr>
<tr><td><tt>list</tt></td><td>Maple, Python</td></tr>
<tr><td><tt>List</tt></td><td>Io, Mathematica, Pliant</td></tr>
<tr><td><tt>Array or List</tt></td><td>Perl6</td></tr>
<tr><td><tt>ARRAY or LINKED_LIST</tt></td><td>Eiffel</td></tr>
<tr><td><tt>Array or OrderedCollection</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>ARRAY</tt></td><td>Perl</td></tr>
<tr><td><tt>array</tt></td><td>PHP</td></tr>
<tr><td><tt>cell</tt></td><td>Matlab</td></tr>
<tr><td><tt>vector</tt></td><td>C++</td></tr>
<tr><td><tt>Containers.Vectors.Vector or Ada.Containers.Doubly_Linked_Lists.List</tt></td><td>Ada</td></tr>
<tr><td><tt>[]a</tt></td><td>Go</td></tr>
</table><p>
<li><a name="BagAndLstListCnct">list concatenation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>+</tt></td><td>E, Eiffel, merd, PHP, Pike, Python, Ruby, Vimscript</td></tr>
<tr><td><tt>,</tt></td><td>Maple, Matlab, Perl, Smalltalk</td></tr>
<tr><td><tt>@</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>~</tt></td><td>D</td></tr>
<tr><td><tt>&</tt></td><td>Ada</td></tr>
<tr><td><tt>++</tt></td><td>Haskell</td></tr>
<tr><td><tt>|||</tt></td><td>Icon</td></tr>
<tr><td><tt>array_merge</tt></td><td>PHP</td></tr>
<tr><td><tt>merge</tt></td><td>YCP</td></tr>
<tr><td><tt>concat</tt></td><td>CoffeeScript, JavaScript, Tcl</td></tr>
<tr><td><tt>concatenate</tt></td><td>Dylan</td></tr>
<tr><td><tt>nconc</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>append</tt></td><td>Beta, Common Lisp, Emacs Lisp, Go, Prolog, Rebol, Scheme</td></tr>
<tr><td><tt>Append</tt></td><td>Oz</td></tr>
<tr><td><tt>appendSeq</tt></td><td>Io</td></tr>
<tr><td><tt>arrayByAddingObjectsFromArray</tt></td><td>Objective-C</td></tr>
<tr><td><tt>sentence</tt></td><td>Logo</td></tr>
<tr><td><tt>Join</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstListFltt">list flattening</a><p>
one level depth
<table border=1 cellpadding=3>
<tr><td><tt>concat</tt></td><td>F#, Haskell, Mercury, SML</td></tr>
<tr><td><tt>flatten</tt></td><td>F#, Io, merd, OCaml, Prolog, YCP</td></tr>
<tr><td><tt>Flatten</tt></td><td>Oz</td></tr>
<tr><td><tt>eval concat</tt></td><td>Tcl</td></tr>
<tr><td><tt>ListTools[FlattenOnce]</tt></td><td>Maple</td></tr>
<tr><td><tt>{*}$l</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>"$l"</tt></td><td>FishShell</td></tr>
</table><p>
recursive
<table border=1 cellpadding=3>
<tr><td><tt>flatten</tt></td><td>Pike, Ruby</td></tr>
<tr><td><tt>ListTools[Flatten]</tt></td><td>Maple</td></tr>
<tr><td><tt>Flatten</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstListCnst">list constructor</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>[ a, b, c ]<a href="#97">(97)</a></tt></td><td>CoffeeScript, E, Haskell, JavaScript, Maple, Matlab, merd, Perl, Perl6, PHP5, PostScript, Prolog, Python, Ruby, SML, Vimscript, YAML, YCP</td></tr>
<tr><td><tt>( a, b, c )</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>{ a, b, c }<a href="#98">(98)</a></tt></td><td>C, C++, Lua, Mathematica</td></tr>
<tr><td><tt>#(a, b, c)</tt></td><td>Dylan</td></tr>
<tr><td><tt>#(a b c)<a href="#99">(99)</a></tt></td><td>Smalltalk</td></tr>
<tr><td><tt>{ a. b. c }</tt></td><td>Squeak</td></tr>
<tr><td><tt>[ a ; b ; c ]</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>[ a b c ]</tt></td><td>Logo, Oz, Rebol</td></tr>
<tr><td><tt>({ a, b, c })</tt></td><td>Pike</td></tr>
<tr><td><tt>'(a b c)</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>&lt;&lt; a, b, c &gt;&gt;</tt></td><td>Eiffel</td></tr>
<tr><td><tt>list(a, b, c)</tt></td><td>Io</td></tr>
<tr><td><tt>list</tt></td><td>Common Lisp, Dylan, Emacs Lisp, Scheme, Tcl</td></tr>
<tr><td><tt>array(a, b, c)</tt></td><td>PHP</td></tr>
<tr><td><tt>new t[] { a, b, c }</tt></td><td>C#</td></tr>
<tr><td><tt>new[] { a, b, c }</tt></td><td>C#3</td></tr>
<tr><td><tt>new List&lt;t&gt; { a, b, c}</tt></td><td>C#3</td></tr>
<tr><td><tt>Array(a, b, c)<a href="#100">(100)</a></tt></td><td>JavaScript</td></tr>
<tr><td><tt>[NSArray arrayWithObjects:a, b, c, nil]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>set l a b c</tt></td><td>FishShell</td></tr>
<tr><td><tt><pre>  - a
  - b
  - c</pre></tt></td><td>YAML</td></tr>
<tr><td><tt>[]t{a, b, c}</tt></td><td>Go</td></tr>
</table><p>
<li><a name="BagAndLstLisrrndx">list/array indexing</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>a[i]</tt></td><td>B, BourneShell, C, C#, C++, CoffeeScript, Dylan, E, FishShell, Go, Java, JavaScript, KornShell, Lua, Maple, merd, Modula-3, MSH, Pascal, Perl, Perl6, PHP, Pike, Python, Ruby, Vimscript</td></tr>
<tr><td><tt>a*[i] or a!i or a*(i) depending on the version</tt></td><td>BCPL</td></tr>
<tr><td><tt>a[[i]]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>a[i]:default</tt></td><td>YCP</td></tr>
<tr><td><tt>a(i)</tt></td><td>Ada, Matlab</td></tr>
<tr><td><tt>a:i</tt></td><td>Pliant</td></tr>
<tr><td><tt>a/:i</tt></td><td>Rebol</td></tr>
<tr><td><tt>a.(i)</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>a.[i]</tt></td><td>F#</td></tr>
<tr><td><tt>a !! i</tt></td><td>Haskell, Mercury</td></tr>
<tr><td><tt>a @ i</tt></td><td>Eiffel</td></tr>
<tr><td><tt>a i get<a href="#101">(101)</a></tt></td><td>PostScript</td></tr>
<tr><td><tt>a at(i)</tt></td><td>Io</td></tr>
<tr><td><tt>at<a href="#102">(102)</a></tt></td><td>C++, Smalltalk</td></tr>
<tr><td><tt>lindex</tt></td><td>Tcl</td></tr>
<tr><td><tt>nth</tt></td><td>Common Lisp, Emacs Lisp, OCaml</td></tr>
<tr><td><tt>Nth</tt></td><td>Oz</td></tr>
<tr><td><tt>aref</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>nth0 / nth1</tt></td><td>Prolog</td></tr>
<tr><td><tt>list-ref / vector-ref</tt></td><td>Scheme</td></tr>
<tr><td><tt>element</tt></td><td>Dylan</td></tr>
<tr><td><tt>slice</tt></td><td>Ruby</td></tr>
<tr><td><tt>node[i]</tt></td><td>XPath</td></tr>
<tr><td><tt>objectAtIndex</tt></td><td>Objective-C</td></tr>
<tr><td><tt>item</tt></td><td>Logo</td></tr>
<tr><td><tt>a i cells + @ (for write access: o a i cells + !</tt></td><td>Forth</td></tr>
</table><p>
<li><a name="BagAndLstdAlABLC">adding an element at the beginning (list cons)</a><p>
return the new list (no side-effect)
<table border=1 cellpadding=3>
<tr><td><tt>:</tt></td><td>Haskell, merd</td></tr>
<tr><td><tt>::</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>|</tt></td><td>Oz</td></tr>
<tr><td><tt>[ e | l ]</tt></td><td>Erlang, Prolog</td></tr>
<tr><td><tt>[e l[]]</tt></td><td>Maple</td></tr>
<tr><td><tt>[e l]</tt></td><td>Matlab</td></tr>
<tr><td><tt>cons</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>pair</tt></td><td>Dylan</td></tr>
<tr><td><tt>fput</tt></td><td>Logo</td></tr>
<tr><td><tt>Prepend</tt></td><td>Ada, Mathematica</td></tr>
</table><p>
side-effect
<table border=1 cellpadding=3>
<tr><td><tt>unshift</tt></td><td>CoffeeScript, JavaScript, Perl, Perl6, Ruby</td></tr>
<tr><td><tt>prepend</tt></td><td>YCP</td></tr>
<tr><td><tt>push_front</tt></td><td>C++</td></tr>
<tr><td><tt>addFirst</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>insert</tt></td><td>Rebol</td></tr>
<tr><td><tt>put_first</tt></td><td>Eiffel</td></tr>
<tr><td><tt>push</tt></td><td>Common Lisp, Io</td></tr>
<tr><td><tt>array_unshift</tt></td><td>PHP</td></tr>
<tr><td><tt>PrependTo</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstddnAnlmnAtndx">adding an element at index</a><p>
return the new list (no side-effect)
<table border=1 cellpadding=3>
<tr><td><tt>linsert l i e</tt></td><td>Tcl</td></tr>
<tr><td><tt>Insert</tt></td><td>Ada, Mathematica</td></tr>
</table><p>
side-effect
<table border=1 cellpadding=3>
<tr><td><tt>[a insertObject:e atIndex:i]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>a.insert(i, e)</tt></td><td>Python, Ruby</td></tr>
<tr><td><tt>a insertAt(e, i)</tt></td><td>Io</td></tr>
<tr><td><tt>a add: e beforeIndex: i / a add: e afterIndex: i</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>splice(@a, $i, 0, $e)</tt></td><td>Perl</td></tr>
</table><p>
<li><a name="BagAndLstddnAnlmnAtEnd">adding an element at the end</a><p>
return the new list (no side-effect)
<table border=1 cellpadding=3>
<tr><td><tt>[l e]</tt></td><td>Matlab</td></tr>
<tr><td><tt>push</tt></td><td>merd</td></tr>
<tr><td><tt>arrayByAddingObject</tt></td><td>Objective-C</td></tr>
<tr><td><tt>lput</tt></td><td>Logo</td></tr>
<tr><td><tt>linsert l end e</tt></td><td>Tcl</td></tr>
<tr><td><tt>Append</tt></td><td>Ada, Mathematica</td></tr>
</table><p>
side-effect
<table border=1 cellpadding=3>
<tr><td><tt>push</tt></td><td>CoffeeScript, JavaScript, Perl, Perl6, Ruby</td></tr>
<tr><td><tt>push_back</tt></td><td>C++</td></tr>
<tr><td><tt>append</tt></td><td>Go, Io, Pliant, Python, Rebol</td></tr>
<tr><td><tt>AppendTo</tt></td><td>Mathematica</td></tr>
<tr><td><tt>lappend</tt></td><td>Tcl</td></tr>
<tr><td><tt>+=</tt></td><td>Pliant</td></tr>
<tr><td><tt>add</tt></td><td>Java, Smalltalk, YCP</td></tr>
<tr><td><tt>put_last</tt></td><td>Eiffel</td></tr>
<tr><td><tt>array_push</tt></td><td>PHP</td></tr>
<tr><td><tt>addObject</tt></td><td>Objective-C</td></tr>
</table><p>
<li><a name="BagAndLstFrstlmnt">first element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>head</tt></td><td>Haskell</td></tr>
<tr><td><tt>Head</tt></td><td>F#</td></tr>
<tr><td><tt>hd</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>car</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>first</tt></td><td>Eiffel, Io, Logo, Pliant, Rebol, Smalltalk</td></tr>
<tr><td><tt>First<a href="#103">(103)</a></tt></td><td>Mathematica</td></tr>
<tr><td><tt>First_Element</tt></td><td>Ada</td></tr>
</table><p>
iterator
<table border=1 cellpadding=3>
<tr><td><tt>head</tt></td><td>Beta</td></tr>
<tr><td><tt>begin</tt></td><td>C++</td></tr>
<tr><td><tt>First</tt></td><td>Ada</td></tr>
</table><p>
<li><a name="BagAndLstAllButFrslmn">all but the first element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>tail</tt></td><td>Haskell</td></tr>
<tr><td><tt>Tail</tt></td><td>F#</td></tr>
<tr><td><tt>tl</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>cdr</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>Rest</tt></td><td>Mathematica</td></tr>
<tr><td><tt>butfirst</tt></td><td>Logo</td></tr>
<tr><td><tt>allButFirst</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>l[1:]</tt></td><td>Go, Python</td></tr>
<tr><td><tt>a(2:end)</tt></td><td>Matlab</td></tr>
<tr><td><tt>L = [_|ButFirst]</tt></td><td>Prolog</td></tr>
<tr><td><tt>lrange l 1 end</tt></td><td>Tcl</td></tr>
</table><p>
<li><a name="BagAndLstLastlmnt">last element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>last</tt></td><td>E, Eiffel, Haskell, Io, Logo, Pliant, Prolog, Rebol, Scheme, Smalltalk</td></tr>
<tr><td><tt>Last</tt></td><td>Mathematica, Oz</td></tr>
<tr><td><tt>lastObject</tt></td><td>Objective-C</td></tr>
<tr><td><tt>a[-1]</tt></td><td>Perl, Pike, Python, Ruby</td></tr>
<tr><td><tt>a(end)</tt></td><td>Matlab</td></tr>
<tr><td><tt>node[last()]</tt></td><td>XPath</td></tr>
<tr><td><tt>(car (last l))</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>lindex l end</tt></td><td>Tcl</td></tr>
<tr><td><tt>Last_Element</tt></td><td>Ada</td></tr>
<tr><td><tt>l[len(l)-1:]</tt></td><td>Go</td></tr>
</table><p>
iterator
<table border=1 cellpadding=3>
<tr><td><tt>Last</tt></td><td>Ada</td></tr>
</table><p>
<li><a name="BagAndLstAllButLaslmn">all but the last element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>Most</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstGFlARI">get the first element and remove it</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>shift</tt></td><td>CoffeeScript, JavaScript, Perl, Perl6, Ruby</td></tr>
<tr><td><tt>shift!</tt></td><td>merd</td></tr>
<tr><td><tt>pop</tt></td><td>Common Lisp, Logo</td></tr>
<tr><td><tt>removeFirst</tt></td><td>Io, Smalltalk</td></tr>
<tr><td><tt>array_shift</tt></td><td>PHP</td></tr>
</table><p>
<li><a name="BagAndLstGLlARI">get the last element and remove it</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>pop</tt></td><td>CoffeeScript, E, Io, JavaScript, Perl, Perl6, Python, Ruby</td></tr>
<tr><td><tt>pop!</tt></td><td>merd</td></tr>
<tr><td><tt>array_pop</tt></td><td>PHP</td></tr>
<tr><td><tt>removeLast</tt></td><td>Io, Smalltalk</td></tr>
<tr><td><tt>dequeue</tt></td><td>Logo</td></tr>
</table><p>
<li><a name="BagAndLstForEaclmnDoSmt">for each element do something</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>each</tt></td><td>merd, Pliant, Ruby</td></tr>
<tr><td><tt>for v in l ...</tt></td><td>CoffeeScript, E, Maple, Ruby</td></tr>
<tr><td><tt>for v in l: ...</tt></td><td>Python</td></tr>
<tr><td><tt>for v in l; do ...; done</tt></td><td>BourneShell</td></tr>
<tr><td><tt>for v in l do ...</tt></td><td>F#</td></tr>
<tr><td><tt>for v in l; ...; end</tt></td><td>FishShell</td></tr>
<tr><td><tt>for (v in l) ...</tt></td><td>Awk, Dylan</td></tr>
<tr><td><tt>for (var v in l) { ... }</tt></td><td>JavaScript</td></tr>
<tr><td><tt>For Each v in l
...
Next</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>for v in range loop .. end loop</tt></td><td>Ada</td></tr>
<tr><td><tt>for</tt></td><td>Perl</td></tr>
<tr><td><tt>foreach</tt></td><td>Logo, Lua, Perl, PHP, Pike, Rebol, Tcl</td></tr>
<tr><td><tt>foreach (t v in l) ...</tt></td><td>C#</td></tr>
<tr><td><tt>foreach (v in l) ...</tt></td><td>C#3</td></tr>
<tr><td><tt>foreach ($v in l) ...</tt></td><td>MSH</td></tr>
<tr><td><tt>foreach(t v, l, { ... })</tt></td><td>YCP</td></tr>
<tr><td><tt>l foreach(v, ...)</tt></td><td>Io</td></tr>
<tr><td><tt>for_each</tt></td><td>C++</td></tr>
<tr><td><tt>for-each</tt></td><td>Scheme</td></tr>
<tr><td><tt>forall</tt></td><td>PostScript, Prolog</td></tr>
<tr><td><tt>ForAll</tt></td><td>Oz</td></tr>
<tr><td><tt>iter</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>do</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>do_all</tt></td><td>Eiffel</td></tr>
<tr><td><tt>app</tt></td><td>SML</td></tr>
<tr><td><tt>mapc</tt></td><td>Emacs Lisp</td></tr>
<tr><td><tt>mapM_</tt></td><td>Haskell</td></tr>
<tr><td><tt>Scan</tt></td><td>Mathematica</td></tr>
<tr><td><tt>(dolist (v l) ...)  (loop for v in l do ...)  mapc</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>list.iterate (# do current ... #)</tt></td><td>Beta</td></tr>
<tr><td><tt>l.Iterate(...)</tt></td><td>F#</td></tr>
<tr><td><tt>Iterate</tt></td><td>Ada</td></tr>
<tr><td><tt>for i, v := range l {...}</tt></td><td>Go</td></tr>
</table><p>
<li><a name="BagAndLstTLOBInO">transform a list (or bag) in another one</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>map</tt></td><td>Dylan, F#, Haskell, Io, Maple, Mercury, merd, OCaml, Perl, Pike, Python, Ruby, Scheme, SML</td></tr>
<tr><td><tt>Map</tt></td><td>F#, Mathematica, Oz</td></tr>
<tr><td><tt>mapcar</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>maplist</tt></td><td>Prolog, YCP</td></tr>
<tr><td><tt>sublist</tt></td><td>Prolog</td></tr>
<tr><td><tt>map / map.se</tt></td><td>Logo</td></tr>
<tr><td><tt>for-each</tt></td><td>XSLT</td></tr>
<tr><td><tt>foreach or selected</tt></td><td>MSH</td></tr>
<tr><td><tt>collect</tt></td><td>Ruby, Smalltalk</td></tr>
<tr><td><tt>transform</tt></td><td>C++</td></tr>
<tr><td><tt>array_map</tt></td><td>PHP</td></tr>
<tr><td><tt>/@</tt></td><td>Mathematica</td></tr>
<tr><td><tt>[ f x | x &lt;- l ]<a href="#104">(104)</a></tt></td><td>Haskell</td></tr>
<tr><td><tt>[ f(x) for x in l ]<a href="#104">(104)</a></tt></td><td>Python</td></tr>
<tr><td><tt>magical: sin(x) computes sin on each element</tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="BagAndLstTrnTwoLstInPrl">transform two lists in parallel</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>map2</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>zipWith</tt></td><td>Haskell</td></tr>
<tr><td><tt>Zip</tt></td><td>Maple, Oz</td></tr>
<tr><td><tt>map</tt></td><td>Dylan, Logo, Python, Scheme</td></tr>
<tr><td><tt>map.se</tt></td><td>Logo</td></tr>
<tr><td><tt>mapcar</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>maplist2</tt></td><td>Prolog</td></tr>
<tr><td><tt>l1 with: l2 collect: ...</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>transform</tt></td><td>C++</td></tr>
<tr><td><tt>ListPair.map</tt></td><td>SML</td></tr>
<tr><td><tt>magical: a binary function or operator is appliied on each element</tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="BagAndLstFinAnlmn">find an element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>find</tt></td><td>C++, Common Lisp, F#, Haskell, merd, OCaml, Rebol, Ruby, Scheme-SRFI1, SML, YCP</td></tr>
<tr><td><tt>Find</tt></td><td>Ada</td></tr>
<tr><td><tt>find_if</tt></td><td>C++</td></tr>
<tr><td><tt>find-if</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>first<a href="#22">(22)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>detect</tt></td><td>Ruby, Smalltalk</td></tr>
<tr><td><tt>search</tt></td><td>Pike</td></tr>
<tr><td><tt>ListTools[Search]</tt></td><td>Maple</td></tr>
<tr><td><tt>lsearch -exact</tt></td><td>Tcl</td></tr>
<tr><td><tt>index</tt></td><td>Python</td></tr>
<tr><td><tt>indexOf</tt></td><td>Io</td></tr>
<tr><td><tt>indexOfObject, indexOfObjectIdenticalTo</tt></td><td>Objective-C</td></tr>
<tr><td><tt>find(a == 3)</tt></td><td>Matlab</td></tr>
<tr><td><tt>Position</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstKeeplmnt">keep elements</a><p>
matching
<table border=1 cellpadding=3>
<tr><td><tt>find_all</tt></td><td>F#, OCaml, Ruby</td></tr>
<tr><td><tt>filter</tt></td><td>F#, Haskell, Mercury, merd, OCaml, Pike, Python, Scheme-SRFI1, SML, YCP</td></tr>
<tr><td><tt>filter!</tt></td><td>Scheme-SRFI1</td></tr>
<tr><td><tt>Filter</tt></td><td>Oz</td></tr>
<tr><td><tt>grep</tt></td><td>Perl, Perl6</td></tr>
<tr><td><tt>where</tt></td><td>MSH</td></tr>
<tr><td><tt>select</tt></td><td>Io, Maple, Ruby, Smalltalk</td></tr>
<tr><td><tt>Select / Case</tt></td><td>Mathematica</td></tr>
<tr><td><tt>selectInPlace</tt></td><td>Io</td></tr>
<tr><td><tt>remove-if-not delete-if-not</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>choose</tt></td><td>Dylan</td></tr>
<tr><td><tt>array_filter</tt></td><td>PHP5</td></tr>
<tr><td><tt>[ x | x &lt;- l, p x ]<a href="#104">(104)</a></tt></td><td>Haskell</td></tr>
<tr><td><tt>[ x for x in l if p(x) ]<a href="#104">(104)</a></tt></td><td>Python</td></tr>
<tr><td><tt>a(a == 3)</tt></td><td>Matlab</td></tr>
</table><p>
non matching
<table border=1 cellpadding=3>
<tr><td><tt>remove-if delete-if</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>reject</tt></td><td>Ruby</td></tr>
</table><p>
<li><a name="BagAndLstPLlMlNM">partition a list: elements matching, elements non matching</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>partition</tt></td><td>F#, Haskell, merd, OCaml, Ruby, Scheme-SRFI1, SML</td></tr>
<tr><td><tt>partition!</tt></td><td>Scheme-SRFI1</td></tr>
<tr><td><tt>Partition</tt></td><td>Oz</td></tr>
</table><p>
<li><a name="BagAndLstSpltList">split a list</a><p>
in 2 based on a predicate
<table border=1 cellpadding=3>
<tr><td><tt>break</tt></td><td>Haskell</td></tr>
<tr><td><tt>span</tt></td><td>Haskell</td></tr>
</table><p>
into sublists delimited by elements matching a predicate
<table border=1 cellpadding=3>
<tr><td><tt>split-sequence<a href="#105">(105)</a></tt></td><td>Common Lisp</td></tr>
<tr><td><tt>ListTools[Split]</tt></td><td>Maple</td></tr>
</table><p>
into a list of lists of same value
<table border=1 cellpadding=3>
<tr><td><tt>group</tt></td><td>Haskell</td></tr>
<tr><td><tt>Split</tt></td><td>Mathematica</td></tr>
</table><p>
into sublists based on a predicate
<table border=1 cellpadding=3>
<tr><td><tt>groupBy</tt></td><td>Haskell</td></tr>
<tr><td><tt>Split</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstIsAnlmnInLis">is an element in the list</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>member?</tt></td><td>Dylan, merd, Ruby</td></tr>
<tr><td><tt>include?</tt></td><td>Ruby</td></tr>
<tr><td><tt>mem</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>member</tt></td><td>Common Lisp, Prolog, Scheme</td></tr>
<tr><td><tt>Member</tt></td><td>Oz</td></tr>
<tr><td><tt>MemberQ</tt></td><td>Mathematica</td></tr>
<tr><td><tt>memq memv</tt></td><td>Scheme</td></tr>
<tr><td><tt>memberp / member?</tt></td><td>Logo</td></tr>
<tr><td><tt>contains</tt></td><td>E, Io, YCP</td></tr>
<tr><td><tt>containsObject</tt></td><td>Objective-C</td></tr>
<tr><td><tt>in</tt></td><td>CoffeeScript, JavaScript, Python, SQL92, Tcl8.5</td></tr>
<tr><td><tt>in_array</tt></td><td>PHP</td></tr>
<tr><td><tt>includes</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>elem</tt></td><td>Haskell, Mercury</td></tr>
<tr><td><tt>has</tt></td><td>Eiffel</td></tr>
<tr><td><tt>has_value</tt></td><td>Pike</td></tr>
<tr><td><tt>ismember</tt></td><td>Matlab</td></tr>
<tr><td><tt>/elt/</tt></td><td>GNU-sed</td></tr>
</table><p>
<li><a name="BagAndLstIPTFAl">is the predicate true for an element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>any<a href="#31">(31)</a></tt></td><td>Haskell, Matlab, Mercury, Python, Scheme-SRFI1</td></tr>
<tr><td><tt>any?</tt></td><td>Dylan, Ruby</td></tr>
<tr><td><tt>anySatisfy</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>exists</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>exists?</tt></td><td>merd</td></tr>
<tr><td><tt>some</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>Some</tt></td><td>Oz</td></tr>
<tr><td><tt>ormap</tt></td><td>Maple</td></tr>
<tr><td><tt>detect</tt></td><td>Io</td></tr>
</table><p>
<li><a name="BagAndLstIPTFvl">is the predicate true for every element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>all<a href="#31">(31)</a></tt></td><td>Haskell, Mercury, Python, SML</td></tr>
<tr><td><tt>All</tt></td><td>Oz</td></tr>
<tr><td><tt>all?</tt></td><td>merd, Ruby</td></tr>
<tr><td><tt>allSatisfy</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>every</tt></td><td>Common Lisp, Scheme-SRFI1</td></tr>
<tr><td><tt>every?</tt></td><td>Dylan</td></tr>
<tr><td><tt>for_all</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>andmap</tt></td><td>Maple</td></tr>
</table><p>
<li><a name="BagAndLstSmlBgglmn">smallest / biggest element</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>min / max</tt></td><td>Common Lisp, Eiffel, Io, Java, Maple, Matlab, Perl6, PHP5, Pike, Prolog, Python, Ruby, Scheme, Smalltalk</td></tr>
<tr><td><tt>Min / Max</tt></td><td>Mathematica</td></tr>
<tr><td><tt>minimum / maximum</tt></td><td>Haskell, Mercury, merd</td></tr>
<tr><td><tt>minimum-of / maximum-of</tt></td><td>Rebol</td></tr>
<tr><td><tt>min minstr / max maxstr<a href="#22">(22)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>min_element / max_element</tt></td><td>C++</td></tr>
</table><p>
<li><a name="BagAndLstJLOSISsGS">join a list of strings in a string using a glue string</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>join(s, l)</tt></td><td>Perl, Perl6, PHP</td></tr>
<tr><td><tt>String.Join(s, l)</tt></td><td>C#</td></tr>
<tr><td><tt>s.join(l)</tt></td><td>Python</td></tr>
<tr><td><tt>l.join(s)</tt></td><td>CoffeeScript, JavaScript, Perl6, Ruby</td></tr>
<tr><td><tt>l asStringWith: s</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>join l s</tt></td><td>Tcl</td></tr>
<tr><td><tt>implode(s, l)</tt></td><td>PHP</td></tr>
<tr><td><tt>ListTools[Join]</tt></td><td>Maple</td></tr>
<tr><td><tt>rjoin</tt></td><td>E</td></tr>
<tr><td><tt>join</tt></td><td>Io</td></tr>
<tr><td><tt>concat</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>strcat</tt></td><td>Matlab</td></tr>
<tr><td><tt>concat_atom</tt></td><td>Prolog</td></tr>
<tr><td><tt>l * s</tt></td><td>Pike, Ruby</td></tr>
<tr><td><tt>(mapconcat 'identity l s)</tt></td><td>Emacs Lisp</td></tr>
<tr><td><tt>componentsJoinedByString</tt></td><td>Objective-C</td></tr>
<tr><td><tt>intercalate</tt></td><td>Haskell</td></tr>
<tr><td><tt>StringJoin @@ Riffle[l, s]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>strings.Join</tt></td><td>Go</td></tr>
</table><p>
<li><a name="BagAndLstListSize">list size</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>size</tt></td><td>C++, Dylan, E, Io, Java, Matlab, merd, Pliant, Ruby, Scilab, Smalltalk, YCP</td></tr>
<tr><td><tt>sizeof</tt></td><td>Pike</td></tr>
<tr><td><tt>length</tt></td><td>C#, CoffeeScript, Common Lisp, Emacs Lisp, F#, Haskell, Java, JavaScript, Matlab, Mercury, OCaml, PostScript, Prolog, Ruby, Scheme, SML</td></tr>
<tr><td><tt>Length</tt></td><td>Ada, F#, Mathematica, Oz</td></tr>
<tr><td><tt>length?</tt></td><td>Rebol</td></tr>
<tr><td><tt>len</tt></td><td>Python, Vimscript</td></tr>
<tr><td><tt>llength</tt></td><td>Tcl</td></tr>
<tr><td><tt>$LENGTH</tt></td><td>MUMPS</td></tr>
<tr><td><tt>elems</tt></td><td>Perl6</td></tr>
<tr><td><tt>getn</tt></td><td>Lua</td></tr>
<tr><td><tt>count</tt></td><td>Eiffel, FishShell, Objective-C, PHP, SQL92, XPath</td></tr>
<tr><td><tt>numel</tt></td><td>Matlab</td></tr>
<tr><td><tt>scalar @l</tt></td><td>Perl</td></tr>
<tr><td><tt>nops</tt></td><td>Maple</td></tr>
<tr><td><tt>#</tt></td><td>Lua</td></tr>
<tr><td><tt>len(l)</tt></td><td>Go</td></tr>
</table><p>
<li><a name="BagAndLsttrtWitndx">iterate with index</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>each_with_index</tt></td><td>merd, Ruby</td></tr>
<tr><td><tt>enumerate(l)</tt></td><td>Python</td></tr>
<tr><td><tt>foreach($l as $i =&gt; $v)</tt></td><td>PHP</td></tr>
<tr><td><tt>a foreach(i, e, ...)</tt></td><td>Io</td></tr>
<tr><td><tt>for i =&gt; v in l</tt></td><td>E</td></tr>
<tr><td><tt>for (v in l, i from 0) ... end</tt></td><td>Dylan</td></tr>
<tr><td><tt>forAllInd</tt></td><td>Oz</td></tr>
<tr><td><tt>foreachi</tt></td><td>Lua</td></tr>
<tr><td><tt>foreach(l; typ0 i; typ1 v) { ... }</tt></td><td>Pike</td></tr>
<tr><td><tt>withIndexDo</tt></td><td>Squeak</td></tr>
<tr><td><tt>iteri</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>IterateIndexed</tt></td><td>F#</td></tr>
<tr><td><tt>MapIndexed</tt></td><td>Mathematica</td></tr>
<tr><td><tt>(loop for v in l as i upfrom 0 do ...)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>for v,i in l ...</tt></td><td>CoffeeScript</td></tr>
<tr><td><tt>for i, v := range l {...}</tt></td><td>Go</td></tr>
</table><p>
<li><a name="BagAndLstRmvDplc">remove duplicates</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>uniq</tt></td><td>merd, Perl6, Pike, Ruby</td></tr>
<tr><td><tt>uniq!</tt></td><td>Ruby</td></tr>
<tr><td><tt>uniq2</tt></td><td>Pike</td></tr>
<tr><td><tt>unique<a href="#106">(106)</a></tt></td><td>C++, Io, Matlab, Rebol</td></tr>
<tr><td><tt>nub</tt></td><td>Haskell</td></tr>
<tr><td><tt>array_unique</tt></td><td>PHP</td></tr>
<tr><td><tt>ListTools[MakeUnique]</tt></td><td>Maple</td></tr>
<tr><td><tt>delete-duplicates</tt></td><td>Common Lisp, Scheme-SRFI1</td></tr>
<tr><td><tt>delete-duplicates!</tt></td><td>Scheme-SRFI1</td></tr>
<tr><td><tt>remove-duplicates</tt></td><td>Common Lisp, Dylan</td></tr>
<tr><td><tt>lsort -unique</tt></td><td>Tcl</td></tr>
<tr><td><tt>toset</tt></td><td>YCP</td></tr>
<tr><td><tt>distinct</tt></td><td>SQL92</td></tr>
<tr><td><tt>set</tt></td><td>Python</td></tr>
<tr><td><tt>Union</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstSort">sort</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>sort<a href="#107">(107)</a></tt></td><td>C#, C++, CoffeeScript, Common Lisp, E, Eiffel, F#, Haskell, Io, Java, JavaScript, Lua, Maple, Matlab, merd, OCaml, Perl, Perl6, PHP, Pike, Prolog, Python, Rebol, Ruby, Scheme, XSLT, YCP</td></tr>
<tr><td><tt>sort!</tt></td><td>Ruby</td></tr>
<tr><td><tt>sorted</tt></td><td>Python</td></tr>
<tr><td><tt>Sort</tt></td><td>Mathematica, Oz</td></tr>
<tr><td><tt>sort_by</tt></td><td>merd, Ruby</td></tr>
<tr><td><tt>sortBy</tt></td><td>Haskell, Io, Smalltalk</td></tr>
<tr><td><tt>order by</tt></td><td>SQL92</td></tr>
<tr><td><tt>lsort</tt></td><td>Tcl</td></tr>
<tr><td><tt>asort</tt></td><td>Awk</td></tr>
<tr><td><tt>sort-object</tt></td><td>MSH</td></tr>
<tr><td><tt>sortedArrayUsingSelector, sortUsingSelector</tt></td><td>Objective-C</td></tr>
<tr><td><tt>predsort / keysort / mergesort</tt></td><td>Prolog</td></tr>
</table><p>
<li><a name="BagAndLstRvrs">reverse</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>reverse</tt></td><td>C++, CoffeeScript, Common Lisp, Dylan, Emacs Lisp, Haskell, Io, Java, JavaScript, Logo, Mercury, merd, Perl, Perl6, Pike, Prolog, Python, Rebol, Ruby, Scheme</td></tr>
<tr><td><tt>Reverse</tt></td><td>C#, Mathematica, Oz</td></tr>
<tr><td><tt>reversed</tt></td><td>Python, Smalltalk</td></tr>
<tr><td><tt>reverse_copy</tt></td><td>C++</td></tr>
<tr><td><tt>rev</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>Reverse_Elements</tt></td><td>Ada</td></tr>
<tr><td><tt>lreverse</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>array_reverse</tt></td><td>PHP</td></tr>
<tr><td><tt>ListTools[Reverse]</tt></td><td>Maple</td></tr>
<tr><td><tt>fliplr flipud...</tt></td><td>Matlab</td></tr>
<tr><td><tt>l[::-1]</tt></td><td>Python</td></tr>
</table><p>
<li><a name="BagAndLstLOCF2L">list of couples from 2 lists</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>combine</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>zip</tt></td><td>F#, Haskell, Maple, merd, Perl6, Python, Ruby, Scheme-SRFI1, SML</td></tr>
<tr><td><tt>pairlis<a href="#108">(108)</a></tt></td><td>Common Lisp</td></tr>
<tr><td><tt>transpose</tt></td><td>Ruby</td></tr>
<tr><td><tt>Transpose</tt></td><td>Mathematica</td></tr>
<tr><td><tt>[a b]</tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="BagAndLst2LFLOC">2 lists from a list of couples</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>split</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>unzip</tt></td><td>F#, Haskell, merd, SML</td></tr>
<tr><td><tt>unzip2</tt></td><td>Scheme-SRFI1</td></tr>
<tr><td><tt>transpose</tt></td><td>Ruby</td></tr>
<tr><td><tt>Transpose</tt></td><td>Mathematica</td></tr>
<tr><td><tt>zip(*l)</tt></td><td>Python</td></tr>
<tr><td><tt>a(1,:), a(2,:)</tt></td><td>Matlab</td></tr>
</table><p>
<li><a name="BagAndLstLAlIsL">lookup an element in a association list</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>lookup</tt></td><td>Haskell</td></tr>
<tr><td><tt>assoc</tt></td><td>Common Lisp, Emacs Lisp, F#, OCaml, Ruby, Scheme</td></tr>
<tr><td><tt>assq</tt></td><td>Emacs Lisp, Scheme</td></tr>
<tr><td><tt>assv</tt></td><td>Scheme</td></tr>
<tr><td><tt>get_assoc</tt></td><td>Prolog</td></tr>
<tr><td><tt>select</tt></td><td>Rebol</td></tr>
<tr><td><tt>a.(e)</tt></td><td>Matlab</td></tr>
<tr><td><tt>a[e]</tt></td><td>Maple</td></tr>
<tr><td><tt>gprop</tt></td><td>Logo</td></tr>
<tr><td><tt>/.</tt></td><td>Mathematica</td></tr>
</table><p>
<li><a name="BagAndLstLisOutOfBag">list out of a bag</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>to_a</tt></td><td>Ruby</td></tr>
<tr><td><tt>toArray</tt></td><td>Java</td></tr>
<tr><td><tt>asArray</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>to_list</tt></td><td>merd</td></tr>
<tr><td><tt>list</tt></td><td>Python</td></tr>
<tr><td><tt>map-as(&lt;list&gt;, bag)</tt></td><td>Dylan</td></tr>
<tr><td><tt>[a.(:)]</tt></td><td>Matlab</td></tr>
<tr><td><tt>array get</tt></td><td>Tcl</td></tr>
</table><p>
<li><a name="BagAndLstFFFIEEE">f(... f(f(init, e1), e2) ..., en)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>foldl</tt></td><td>Haskell, Maple, Mercury, merd, SML</td></tr>
<tr><td><tt>FoldL</tt></td><td>Oz</td></tr>
<tr><td><tt>fold_left</tt></td><td>OCaml</td></tr>
<tr><td><tt>fold</tt></td><td>F#, Scheme-SRFI1</td></tr>
<tr><td><tt>Fold</tt></td><td>Mathematica</td></tr>
<tr><td><tt>reduce<a href="#109">(109)</a></tt></td><td>Common Lisp, Dylan, Io, Perl, Perl6, Pike, Python</td></tr>
<tr><td><tt>inject</tt></td><td>Ruby</td></tr>
<tr><td><tt>inject into</tt></td><td>Smalltalk</td></tr>
</table><p>
<li><a name="BagAndLstFEFEFEI">f(e1, f(e2, ... f(en, init) ...))</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>foldr</tt></td><td>Haskell, Maple, Mercury, merd, SML</td></tr>
<tr><td><tt>FoldR</tt></td><td>Oz</td></tr>
<tr><td><tt>fold-right</tt></td><td>Scheme-SRFI1</td></tr>
<tr><td><tt>fold_right</tt></td><td>OCaml</td></tr>
<tr><td><tt>foldBack</tt></td><td>F#</td></tr>
<tr><td><tt>rreduce</tt></td><td>Pike</td></tr>
<tr><td><tt>(reduce f '(e1 e2 ... en) :from-right t :initial-value init)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>reverseReduce</tt></td><td>Io</td></tr>
</table><p>
</ul><hr>
<h2><a name="VrsDatTps">Various Data Types</a></h2>
<ul>
<li><a name="VrsDatTpsTplType">tuple type</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>typ1 * ... * typn</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>(typ1, ..., typn)</tt></td><td>Haskell</td></tr>
<tr><td><tt>typ1, ..., typn</tt></td><td>merd</td></tr>
<tr><td><tt>tuple</tt></td><td>Python</td></tr>
<tr><td><tt>tuple!</tt></td><td>Rebol</td></tr>
<tr><td><tt>Tuple[Typ1, Typ2, Typ3]</tt></td><td>E</td></tr>
<tr><td><tt>tuple&lt; typ1, ..., typn &gt;</tt></td><td>C++-0x</td></tr>
</table><p>
<li><a name="VrsDatTpsTplCnst">tuple constructor</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>a, b, c</tt></td><td>F#, Lua, merd, OCaml, Python, Ruby</td></tr>
<tr><td><tt>( a, b, c )</tt></td><td>Ada, C++-0x, Haskell, Perl, Prolog, SML</td></tr>
<tr><td><tt>{ a. b. c }</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>{ a, b, c }</tt></td><td>Matlab</td></tr>
<tr><td><tt>[ a, b, c ]</tt></td><td>E</td></tr>
<tr><td><tt>a . b . c</tt></td><td>Rebol</td></tr>
<tr><td><tt>(cons a b)</tt></td><td>Common Lisp</td></tr>
</table><p>
<li><a name="VrsDatTpsCTTAKOmLPSRIPP">computable tuple (these are a kind of immutable lists playing a special role in parameter passing)</a><p>
empty tuple
<table border=1 cellpadding=3>
<tr><td><tt>()</tt></td><td>merd, Perl, Perl6, Python</td></tr>
<tr><td><tt>[]</tt></td><td>Ruby</td></tr>
<tr><td><tt>{}</tt></td><td>Matlab, Smalltalk</td></tr>
<tr><td><tt>#()</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Nothing</tt></td><td>Prolog</td></tr>
</table><p>
1-uple
<table border=1 cellpadding=3>
<tr><td><tt>a or [a]</tt></td><td>Ruby</td></tr>
<tr><td><tt>a,</tt></td><td>Perl6, Python</td></tr>
<tr><td><tt>tuple([a])</tt></td><td>Python</td></tr>
<tr><td><tt>(a)</tt></td><td>Perl</td></tr>
<tr><td><tt>((a))</tt></td><td>merd</td></tr>
<tr><td><tt>{a}</tt></td><td>Smalltalk</td></tr>
</table><p>
using a tuple for a function call
<table border=1 cellpadding=3>
<tr><td><tt>t</tt></td><td>merd, Perl</td></tr>
<tr><td><tt>*t</tt></td><td>Python, Ruby</td></tr>
<tr><td><tt>t{:}</tt></td><td>Matlab</td></tr>
<tr><td><tt>f @@ t</tt></td><td>Mathematica</td></tr>
<tr><td><tt>L =.. [ F | Args ], call(L)</tt></td><td>Prolog</td></tr>
</table><p>
<li><a name="VrsDatTpsRfrnPntr">reference (pointer)</a><p>
creation
<table border=1 cellpadding=3>
<tr><td><tt>&</tt></td><td>B, C, C#, C++, Go</td></tr>
<tr><td><tt>\</tt></td><td>Perl</td></tr>
<tr><td><tt>AddressOf</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>addr<a href="#110">(110)</a></tt></td><td>Pascal</td></tr>
<tr><td><tt>@<a href="#110">(110)</a></tt></td><td>Pascal</td></tr>
<tr><td><tt>lv</tt></td><td>BCPL</td></tr>
<tr><td><tt>ref</tt></td><td>C#, F#, OCaml, SML</td></tr>
<tr><td><tt>newSTRef</tt></td><td>Haskell</td></tr>
<tr><td><tt>NewCell</tt></td><td>Oz</td></tr>
<tr><td><tt>variable</tt></td><td>Forth</td></tr>
<tr><td><tt>'access</tt></td><td>Ada</td></tr>
<tr><td><tt>:&gt; :&gt;&gt;</tt></td><td>Pliant</td></tr>
<tr><td><tt>''</tt></td><td>Maple</td></tr>
</table><p>
dereference
<table border=1 cellpadding=3>
<tr><td><tt>*<a href="#111">(111)</a></tt></td><td>B, C, C#, C++, Go</td></tr>
<tr><td><tt>$ @ % &<a href="#111">(111)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>-&gt;[...] -&gt;{...} -&gt;(...)<a href="#112">(112)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>-&gt;<a href="#113">(113)</a></tt></td><td>C, C++</td></tr>
<tr><td><tt>^<a href="#112">(112)</a></tt></td><td>Modula-3, Pascal</td></tr>
<tr><td><tt>!<a href="#111">(111)</a></tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>rv</tt></td><td>BCPL</td></tr>
<tr><td><tt>readSTRef</tt></td><td>Haskell</td></tr>
<tr><td><tt>Access</tt></td><td>Oz</td></tr>
<tr><td><tt>.[all]</tt></td><td>Ada</td></tr>
<tr><td><tt>@</tt></td><td>Forth</td></tr>
<tr><td><tt>eval</tt></td><td>Maple</td></tr>
<tr><td><tt>(reg)</tt></td><td>Assembler</td></tr>
</table><p>
assigning (when dereferencing doesn't give a lvalue)
<table border=1 cellpadding=3>
<tr><td><tt>writeSTRef</tt></td><td>Haskell</td></tr>
<tr><td><tt>Assign</tt></td><td>Oz</td></tr>
<tr><td><tt>:=</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>!</tt></td><td>Forth</td></tr>
</table><p>
<li><a name="VrsDatTpsptnlVl">optional value</a><p>
null value
<table border=1 cellpadding=3>
<tr><td><tt>0<a href="#114">(114)</a></tt></td><td>C++, Forth</td></tr>
<tr><td><tt>0 nullptr<a href="#114">(114)</a></tt></td><td>C++-0x</td></tr>
<tr><td><tt>NULL</tt></td><td>C, Maple, SQL92</td></tr>
<tr><td><tt>nil</tt></td><td>Common Lisp, Emacs Lisp, Io, Lua, Objective-C, Ruby, Smalltalk</td></tr>
<tr><td><tt>null</tt></td><td>C#, CoffeeScript, Java, JavaScript</td></tr>
<tr><td><tt>Null<a href="#115">(115)</a></tt></td><td>Ada, Mathematica</td></tr>
<tr><td><tt>undef</tt></td><td>Perl</td></tr>
<tr><td><tt>None</tt></td><td>F#, OCaml, Python</td></tr>
<tr><td><tt>NONE</tt></td><td>SML</td></tr>
<tr><td><tt>Nothing</tt></td><td>Haskell</td></tr>
<tr><td><tt>Void</tt></td><td>Eiffel</td></tr>
<tr><td><tt>#f ()</tt></td><td>Emacs Lisp</td></tr>
<tr><td><tt>(empty) / ~ / null</tt></td><td>YAML</td></tr>
</table><p>
value
<table border=1 cellpadding=3>
<tr><td><tt>v</tt></td><td>Ada, C#, CoffeeScript, Common Lisp, Eiffel, Emacs Lisp, Java, JavaScript, Lua, Perl, Perl, Python, Ruby, Scheme, Smalltalk</td></tr>
<tr><td><tt>*v<a href="#114">(114)</a></tt></td><td>C, C++</td></tr>
<tr><td><tt>Just v</tt></td><td>Haskell</td></tr>
<tr><td><tt>Some v</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>SOME v</tt></td><td>SML</td></tr>
</table><p>
type name
<table border=1 cellpadding=3>
<tr><td><tt>option</tt></td><td>F#, OCaml, SML</td></tr>
<tr><td><tt>Maybe</tt></td><td>Haskell</td></tr>
</table><p>
null coalescing
<table border=1 cellpadding=3>
<tr><td><tt>COALESCE</tt></td><td>SQL92</td></tr>
<tr><td><tt>?:</tt></td><td>PHP</td></tr>
<tr><td><tt>||</tt></td><td>JavaScript, Perl, Ruby</td></tr>
<tr><td><tt>//<a href="#116">(116)</a></tt></td><td>Perl</td></tr>
<tr><td><tt>??</tt></td><td>C#</td></tr>
<tr><td><tt>if(a, b)</tt></td><td>Visual Basic</td></tr>
<tr><td><tt>or</tt></td><td>Python, Scheme</td></tr>
</table><p>
<li><a name="VrsDatTpsRcrd">record</a><p>
type declaration
<table border=1 cellpadding=3>
<tr><td><tt>struct { typ1 n1; typ2 n2; ... }</tt></td><td>C, C++</td></tr>
<tr><td><tt>type typ = { n1 : typ1; n2 : typ2 }</tt></td><td>OCaml, SML</td></tr>
<tr><td><tt>data Typ = N0 { n1, n2 :: typ1, n3 :: typ3, ... }</tt></td><td>Haskell</td></tr>
<tr><td><tt><pre>type Typ is record
  N1 : Typ1;
  N2 : Typ2 := default_val;
  ...
end record;</pre></tt></td><td>Ada</td></tr>
<tr><td><tt>type typ struct{ n1 typ1; n2 typ2; }</tt></td><td>Go</td></tr>
</table><p>
selector
<table border=1 cellpadding=3>
<tr><td><tt>.</tt></td><td>Ada, Beta, C, C#, C++, CoffeeScript, E, Eiffel, F#, Go, Java, JavaScript, Lua, Matlab, Modula-2, Modula-3, OCaml, Oz, Pascal, Python, Ruby</td></tr>
<tr><td><tt>::</tt></td><td>XPath</td></tr>
<tr><td><tt>%</tt></td><td>Fortran90</td></tr>
<tr><td><tt>'<a href="#117">(117)</a></tt></td><td>Ada</td></tr>
<tr><td><tt>^</tt></td><td>Mercury</td></tr>
<tr><td><tt>r { field }</tt></td><td>merd</td></tr>
<tr><td><tt>r:field</tt></td><td>Pliant</td></tr>
<tr><td><tt>field r</tt></td><td>Haskell</td></tr>
<tr><td><tt>-&gt;</tt></td><td>C, C++</td></tr>
<tr><td><tt>r[field]</tt></td><td>Maple</td></tr>
<tr><td><tt>r["field"]</tt></td><td>JavaScript</td></tr>
<tr><td><tt>#field r</tt></td><td>SML</td></tr>
<tr><td><tt>normal function call</tt></td><td>Common Lisp, Dylan, Haskell, Io, Smalltalk</td></tr>
</table><p>
<li><a name="VrsDatTpsnnTypDcl">union type declaration</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>union { typ1 n1; typ2 n2; ... }</tt></td><td>C, C++</td></tr>
<tr><td><tt>data Typ = N1 typ1 | N2 typ2 | ...</tt></td><td>Haskell</td></tr>
<tr><td><tt>type typ = N1 of typ1 | N2 of typ2 | ...</tt></td><td>OCaml</td></tr>
<tr><td><tt>datatype typ = N1 of typ1 | N2 of typ2 | ...</tt></td><td>SML</td></tr>
<tr><td><tt><pre>type Typ (Choice : Discrete_Type) is record
  case Choice is
     when Choice_1 =&gt;
         N1 : Typ1;
         ...
     when Choice_2 | Choice_3 =&gt;
         ...
     when others =&gt;
        ...
  end case;
end record;</pre></tt></td><td>Ada</td></tr>
</table><p>
<li><a name="VrsDatTpsnmrTypDcl">enumerated type declaration</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>enum typ { n1; n2; ... }<a href="#118">(118)</a></tt></td><td>C, C#, C++, Java</td></tr>
<tr><td><tt><pre>Enum typ
   n1
   n2
End Enum</pre></tt></td><td>Visual Basic</td></tr>
<tr><td><tt>(n1, n2, ...)</tt></td><td>Pascal</td></tr>
<tr><td><tt>type typ is<a href="#119">(119)</a></tt></td><td>Ada</td></tr>
<tr><td><tt>data Typ = N1 | N2 | ...</tt></td><td>Haskell</td></tr>
<tr><td><tt>type typ = N1 | N2 | ...</tt></td><td>OCaml</td></tr>
<tr><td><tt>datatype typ = N1 | N2 | ...</tt></td><td>SML</td></tr>
</table><p>
<li><a name="VrsDatTpsDctnr">dictionary</a><p>
type name
<table border=1 cellpadding=3>
<tr><td><tt>map</tt></td><td>Go, YAML</td></tr>
<tr><td><tt>Map</tt></td><td>F#, Io</td></tr>
<tr><td><tt>std::map</tt></td><td>C++</td></tr>
<tr><td><tt>dict</tt></td><td>Python</td></tr>
<tr><td><tt>Dictionary</tt></td><td>Pliant, Smalltalk</td></tr>
<tr><td><tt>dictionary</tt></td><td>Vimscript</td></tr>
<tr><td><tt>Hash</tt></td><td>Perl6, Ruby</td></tr>
<tr><td><tt>HASH</tt></td><td>Perl</td></tr>
<tr><td><tt>HASH_TABLE</tt></td><td>Eiffel</td></tr>
<tr><td><tt>HashTable</tt></td><td>Java</td></tr>
<tr><td><tt>Hashtbl</tt></td><td>F#</td></tr>
<tr><td><tt>Hashtbl.t</tt></td><td>OCaml</td></tr>
<tr><td><tt>struct</tt></td><td>Matlab</td></tr>
<tr><td><tt>table</tt></td><td>Maple</td></tr>
<tr><td><tt>array</tt></td><td>PHP</td></tr>
<tr><td><tt>Data.Map, Data.HashTable</tt></td><td>Haskell</td></tr>
<tr><td><tt>Containers.Ordered_Maps.Map</tt></td><td>Ada</td></tr>
</table><p>
constructor
<table border=1 cellpadding=3>
<tr><td><tt>[ a =&gt; b, c =&gt; d ]</tt></td><td>E</td></tr>
<tr><td><tt>array( a =&gt; b, c =&gt; d )</tt></td><td>PHP</td></tr>
<tr><td><tt>{ a =&gt; b, c =&gt; d }</tt></td><td>Perl, Perl6, Ruby</td></tr>
<tr><td><tt>{ a, b, c, d }</tt></td><td>Perl, Ruby</td></tr>
<tr><td><tt>{ a: b, c: d }</tt></td><td>CoffeeScript, JavaScript, Python, Vimscript, YAML</td></tr>
<tr><td><tt>{ a: b; c: d }</tt></td><td>CSS</td></tr>
<tr><td><tt>$[ a: b, c: d ]</tt></td><td>YCP</td></tr>
<tr><td><tt>{ a-&gt;b. c-&gt;d }</tt></td><td>Squeak</td></tr>
<tr><td><tt>{ a = b, c = d }</tt></td><td>Lua</td></tr>
<tr><td><tt>@{ a = b; c = d }</tt></td><td>MSH</td></tr>
<tr><td><tt>([ a:b, c:d ])</tt></td><td>Pike</td></tr>
<tr><td><tt>([a]=b [c]=d)</tt></td><td>KornShell</td></tr>
<tr><td><tt>&lt;&lt; a b c d &gt;&gt;</tt></td><td>PostScript</td></tr>
<tr><td><tt>struct(a, b, c, d)</tt></td><td>Matlab</td></tr>
<tr><td><tt>Hash[ a, b, c, d ]</tt></td><td>Ruby</td></tr>
<tr><td><tt>Map.of_list [a, b; c, d]</tt></td><td>F#</td></tr>
<tr><td><tt>Hashtbl.of_list [a, b; c, d]</tt></td><td>F#</td></tr>
<tr><td><tt>table([a=b, c=d])</tt></td><td>Maple</td></tr>
<tr><td><tt>define table foo a =&gt; b; c =&gt; d end</tt></td><td>Dylan</td></tr>
<tr><td><tt>dict create a b c d</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>new t { {a, b}, {c, d} }</tt></td><td>C#</td></tr>
<tr><td><tt>fromList</tt></td><td>Haskell</td></tr>
<tr><td><tt>[NSDictionary dictionaryWithObjectsAndKeys:b, a, d, c, nil]</tt></td><td>Objective-C</td></tr>
<tr><td><tt><pre>  a: b
  c: d</pre></tt></td><td>YAML</td></tr>
<tr><td><tt>map[typ0]typ1{ a: b, c: d }</tt></td><td>Go</td></tr>
</table><p>
access: read/write
<table border=1 cellpadding=3>
<tr><td><tt>h[k]</tt></td><td>Awk, C#, C++, CoffeeScript, Dylan, E, Go, JavaScript, Lua, Maple, MSH, PHP, Python, Ruby, Vimscript</td></tr>
<tr><td><tt>$h{k}</tt></td><td>Perl</td></tr>
<tr><td><tt>%h{k} or %h&lt;s&gt;</tt></td><td>Perl6</td></tr>
<tr><td><tt>h(k)</tt></td><td>Tcl</td></tr>
<tr><td><tt>h.[k]</tt></td><td>F#</td></tr>
<tr><td><tt>h.k</tt></td><td>CoffeeScript, JavaScript, Lua, Matlab</td></tr>
<tr><td><tt>h:k</tt></td><td>Pliant</td></tr>
<tr><td><tt>h["k"] or h-&gt;k</tt></td><td>Pike</td></tr>
<tr><td><tt>(gethash k h)</tt></td><td>Common Lisp</td></tr>
</table><p>
access: read
<table border=1 cellpadding=3>
<tr><td><tt>h k get</tt></td><td>PostScript</td></tr>
<tr><td><tt>find</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>fetch</tt></td><td>Ruby</td></tr>
<tr><td><tt>get</tt></td><td>Java</td></tr>
<tr><td><tt>dict get</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>at</tt></td><td>Io, Smalltalk</td></tr>
<tr><td><tt>h@k or h.at(k)</tt></td><td>Eiffel</td></tr>
<tr><td><tt>h[k]:default</tt></td><td>YCP</td></tr>
<tr><td><tt>${h[k]}</tt></td><td>KornShell</td></tr>
<tr><td><tt>h.get(k, returned_value_when_k_unfound)</tt></td><td>Python</td></tr>
<tr><td><tt>objectForKey</tt></td><td>Objective-C</td></tr>
<tr><td><tt>lookup</tt></td><td>Haskell</td></tr>
<tr><td><tt>Element</tt></td><td>Ada</td></tr>
</table><p>
access: write
<table border=1 cellpadding=3>
<tr><td><tt>h k o put</tt></td><td>PostScript</td></tr>
<tr><td><tt>put</tt></td><td>Eiffel, Java</td></tr>
<tr><td><tt>add, replace</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>store</tt></td><td>Ruby</td></tr>
<tr><td><tt>dict set</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>h[k]</tt></td><td>KornShell, YCP</td></tr>
<tr><td><tt>atPut</tt></td><td>Io</td></tr>
<tr><td><tt>h at: k put: o</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>[h setObject:o forKey:k]</tt></td><td>Objective-C</td></tr>
<tr><td><tt>insert</tt></td><td>Haskell</td></tr>
<tr><td><tt>Replace_Element</tt></td><td>Ada</td></tr>
</table><p>
has the key ?
<table border=1 cellpadding=3>
<tr><td><tt>exists $h{k}</tt></td><td>Perl</td></tr>
<tr><td><tt>exists</tt></td><td>Perl6, Pliant</td></tr>
<tr><td><tt>dict exists</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>has</tt></td><td>Eiffel</td></tr>
<tr><td><tt>haskey</tt></td><td>YCP</td></tr>
<tr><td><tt>hasKey</tt></td><td>Io</td></tr>
<tr><td><tt>has_key</tt></td><td>Python, Vimscript</td></tr>
<tr><td><tt>has_key?, include?, key?, member?</tt></td><td>Ruby</td></tr>
<tr><td><tt>Contains</tt></td><td>Ada, C#, F#</td></tr>
<tr><td><tt>containsKey</tt></td><td>Java</td></tr>
<tr><td><tt>includesKey</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>k in h</tt></td><td>CoffeeScript, JavaScript, Python</td></tr>
<tr><td><tt>k not in h</tt></td><td>Python</td></tr>
<tr><td><tt>in</tt></td><td>Awk</td></tr>
<tr><td><tt>mem</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>member</tt></td><td>Haskell</td></tr>
<tr><td><tt>isfield</tt></td><td>Matlab</td></tr>
<tr><td><tt>find<a href="#120">(120)</a></tt></td><td>C++</td></tr>
<tr><td><tt>h[k]</tt></td><td>Pike</td></tr>
<tr><td><tt>(gethash k h)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>maps</tt></td><td>E</td></tr>
<tr><td><tt>known</tt></td><td>PostScript</td></tr>
<tr><td><tt>isset(h[k]), array_key_exists(k, h)</tt></td><td>PHP</td></tr>
<tr><td><tt>v, exists := h[k]</tt></td><td>Go</td></tr>
</table><p>
remove by key
<table border=1 cellpadding=3>
<tr><td><tt>delete $h{k}</tt></td><td>Perl</td></tr>
<tr><td><tt>del h[k]</tt></td><td>Python</td></tr>
<tr><td><tt>unset(h[k])</tt></td><td>PHP</td></tr>
<tr><td><tt>remove</tt></td><td>Eiffel, F#, Java, OCaml, YCP</td></tr>
<tr><td><tt>Remove</tt></td><td>C#, F#</td></tr>
<tr><td><tt>dict remove</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>removeAt</tt></td><td>Io</td></tr>
<tr><td><tt>removeKey</tt></td><td>E, Smalltalk</td></tr>
<tr><td><tt>remhash</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>delete</tt></td><td>CoffeeScript, Haskell, JavaScript, Perl6, Ruby</td></tr>
<tr><td><tt>Delete</tt></td><td>Ada</td></tr>
<tr><td><tt>erase</tt></td><td>C++</td></tr>
<tr><td><tt>m_delete</tt></td><td>Pike</td></tr>
<tr><td><tt>removeObjectForKey</tt></td><td>Objective-C</td></tr>
<tr><td><tt>undef</tt></td><td>PostScript</td></tr>
<tr><td><tt>rmfield</tt></td><td>Matlab</td></tr>
<tr><td><tt>delete(h, k)</tt></td><td>Go</td></tr>
</table><p>
list of keys
<table border=1 cellpadding=3>
<tr><td><tt>keys</tt></td><td>Haskell, Io, Maple, MSH, Perl, Perl6, Python, Ruby, Smalltalk</td></tr>
<tr><td><tt>dict keys</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>keySet</tt></td><td>Java</td></tr>
<tr><td><tt>allKeys</tt></td><td>Objective-C</td></tr>
<tr><td><tt>AllKeys</tt></td><td>C#</td></tr>
<tr><td><tt>indices</tt></td><td>Pike</td></tr>
<tr><td><tt>current_keys</tt></td><td>Eiffel</td></tr>
<tr><td><tt>getKeys</tt></td><td>E</td></tr>
<tr><td><tt>array_keys</tt></td><td>PHP</td></tr>
<tr><td><tt>fieldnames</tt></td><td>Matlab</td></tr>
<tr><td><tt>findall(Key, item(Key, _), Keys)</tt></td><td>Prolog</td></tr>
<tr><td><tt>${!h[@]}</tt></td><td>KornShell</td></tr>
</table><p>
list of values
<table border=1 cellpadding=3>
<tr><td><tt>values</tt></td><td>Io, Java, Perl, Perl6, Pike, Python, Ruby, Smalltalk</td></tr>
<tr><td><tt>dict values</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>getValues</tt></td><td>E</td></tr>
<tr><td><tt>content</tt></td><td>Eiffel</td></tr>
<tr><td><tt>array_values</tt></td><td>PHP</td></tr>
<tr><td><tt>struct2cell</tt></td><td>Matlab</td></tr>
<tr><td><tt>entries</tt></td><td>Maple</td></tr>
<tr><td><tt>elems</tt></td><td>Haskell</td></tr>
<tr><td><tt>${h[@]}</tt></td><td>KornShell</td></tr>
</table><p>
merge
<table border=1 cellpadding=3>
<tr><td><tt>merge<a href="#121">(121)</a></tt></td><td>Ruby</td></tr>
<tr><td><tt>array_merge<a href="#121">(121)</a></tt></td><td>PHP</td></tr>
<tr><td><tt>union<a href="#122">(122)</a></tt></td><td>Haskell</td></tr>
<tr><td><tt>update<a href="#121">(121)</a></tt></td><td>Python, Ruby</td></tr>
<tr><td><tt>putAll<a href="#121">(121)</a></tt></td><td>Java</td></tr>
<tr><td><tt>insert<a href="#122">(122)</a></tt></td><td>C++</td></tr>
<tr><td><tt>(%h1, %h2)<a href="#121">(121)</a></tt></td><td>Perl</td></tr>
</table><p>
<li><a name="VrsDatTpsRng">range</a><p>
inclusive .. inclusive
<table border=1 cellpadding=3>
<tr><td><tt>a .. b</tt></td><td>Ada, E, merd, MSH, Pascal, Perl, Ruby</td></tr>
<tr><td><tt>a:b</tt></td><td>Matlab</td></tr>
<tr><td><tt>[ a .. b ]</tt></td><td>CoffeeScript, F#, Haskell</td></tr>
<tr><td><tt>to</tt></td><td>Io, Smalltalk</td></tr>
<tr><td><tt>seq a b / jot - a b<a href="#123">(123)</a></tt></td><td>BourneShell, FishShell</td></tr>
<tr><td><tt>{a..b}</tt></td><td>KornShell</td></tr>
<tr><td><tt>range</tt></td><td>PHP</td></tr>
<tr><td><tt>range(from: a, to: b, by: step)</tt></td><td>Dylan</td></tr>
<tr><td><tt>Range</tt></td><td>Mathematica</td></tr>
<tr><td><tt>Range with</tt></td><td>Io</td></tr>
<tr><td><tt>List.number A B Step</tt></td><td>Oz</td></tr>
<tr><td><tt>numlist / between</tt></td><td>Prolog</td></tr>
<tr><td><tt>iseq</tt></td><td>Logo</td></tr>
<tr><td><tt>k, v := range h</tt></td><td>Go</td></tr>
</table><p>
inclusive .. exclusive
<table border=1 cellpadding=3>
<tr><td><tt>a ... b</tt></td><td>CoffeeScript, Ruby</td></tr>
<tr><td><tt>a ..! b</tt></td><td>E</td></tr>
<tr><td><tt>range</tt></td><td>Python</td></tr>
</table><p>
</ul><hr>
<h2><a name="Mthmt">Mathematics</a></h2>
<ul>
<li><a name="MthmtTypeName">type name</a><p>
integers
<table border=1 cellpadding=3>
<tr><td><tt>short, int, long</tt></td><td>C, C#</td></tr>
<tr><td><tt>int</tt></td><td>OCaml, PHP, SML, YAML</td></tr>
<tr><td><tt>Int</tt></td><td>Perl6</td></tr>
<tr><td><tt>Int, uInt, Int8, Int16...</tt></td><td>Pliant</td></tr>
<tr><td><tt>int, long<a href="#124">(124)</a></tt></td><td>Python</td></tr>
<tr><td><tt>integer</tt></td><td>Maple, PHP</td></tr>
<tr><td><tt>INTEGER, INT, SMALLINT</tt></td><td>SQL92</td></tr>
<tr><td><tt>INTEGER, INTEGER_8, NATURAL_8...</tt></td><td>Eiffel</td></tr>
<tr><td><tt>int8, uint8, int16, uint16, ...64</tt></td><td>Go, Matlab</td></tr>
<tr><td><tt>int8_t, uint8_t, int16_t, uint16_t, ...64</tt></td><td>C99</td></tr>
<tr><td><tt>int, int8, uint8, int16, uint16, int32, uint32, int64, uint64, bigint, bignum</tt></td><td>F#</td></tr>
<tr><td><tt>Int, Integer, Int8, Int16, Int32, Int64</tt></td><td>Haskell</td></tr>
<tr><td><tt>Integer, FixNum, BigNum</tt></td><td>Ruby</td></tr>
<tr><td><tt>Integer, SmallInteger, LargeInteger</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Integer</tt></td><td>Mathematica</td></tr>
<tr><td><tt>type T is range Low...High;</tt></td><td>Ada</td></tr>
<tr><td><tt>number</tt></td><td>Vimscript</td></tr>
</table><p>
floating point
<table border=1 cellpadding=3>
<tr><td><tt>float, double, long double</tt></td><td>C</td></tr>
<tr><td><tt>float, double</tt></td><td>C#</td></tr>
<tr><td><tt>float</tt></td><td>Maple, OCaml, PHP, SML, Vimscript, YAML</td></tr>
<tr><td><tt>Float</tt></td><td>Ruby</td></tr>
<tr><td><tt>float, float32</tt></td><td>F#</td></tr>
<tr><td><tt>Float, Float32, Float64</tt></td><td>Pliant</td></tr>
<tr><td><tt>NUMERIC, DECIMAL, DOUBLE PRECISION</tt></td><td>SQL92</td></tr>
<tr><td><tt>Rat</tt></td><td>Perl6</td></tr>
<tr><td><tt>DOUBLE, REAL</tt></td><td>Eiffel</td></tr>
<tr><td><tt>single, double</tt></td><td>Matlab</td></tr>
<tr><td><tt>Float, Double, Ratio</tt></td><td>Haskell</td></tr>
<tr><td><tt>Float, Double, Fraction, FixedPoint</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>float, decimal.Decimal</tt></td><td>Python</td></tr>
<tr><td><tt>Real, Rational</tt></td><td>Mathematica</td></tr>
<tr><td><tt>Number</tt></td><td>Io</td></tr>
<tr><td><tt>type T is digits N range Low..High;</tt></td><td>Ada</td></tr>
<tr><td><tt>type T is delta S digits N range Low..High;<a href="#125">(125)</a></tt></td><td>Ada</td></tr>
<tr><td><tt>float32, float64</tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtNmbrSntx">numbers syntax</a><p>
integers
<table border=1 cellpadding=3>
<tr><td><tt>1000</tt></td><td>Awk, B, BourneShell, C, C#, C++, CoffeeScript, E, Eiffel, F#, Forth, Go, Haskell, Io, Java, JavaScript, Logo, Maple, Mathematica, merd, OCaml, Oz, Pascal, Perl, Perl6, PHP, Pike, Pliant, Prolog, Python, Rebol, Ruby, Scheme, Smalltalk, SQL92, Tcl, Yorick</td></tr>
<tr><td><tt>1000, 1000.</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>1000, 1000., 1000.0</tt></td><td>Awk, Matlab</td></tr>
<tr><td><tt>1000, '1000'D</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>1000, 1E3</tt></td><td>Ada</td></tr>
</table><p>
integers in base 2, octal and hexadecimal
<table border=1 cellpadding=3>
<tr><td><tt>0b1, 07, 0xf<a href="#126">(126)</a></tt></td><td>CoffeeScript, Oz, Perl, PHP5, Pike, Ruby</td></tr>
<tr><td><tt>0b1, 0o7, 0xf</tt></td><td>F#, OCaml, Perl6</td></tr>
<tr><td><tt>07, 0xf</tt></td><td>Awk, C, C++, JavaScript, Python, Tcl</td></tr>
<tr><td><tt>0xf</tt></td><td>C#, E, Go, Io, Yorick</td></tr>
<tr><td><tt>07</tt></td><td>B</td></tr>
<tr><td><tt>0o7, 0xf</tt></td><td>Haskell</td></tr>
<tr><td><tt>1b</tt></td><td>Eiffel</td></tr>
<tr><td><tt>2#1#, 8#7#, 16#f#</tt></td><td>Ada</td></tr>
<tr><td><tt>2#{1}, #{F}</tt></td><td>Rebol</td></tr>
<tr><td><tt>#b1, #o7, #xf</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>2^^1, 8^^7, 16^^f</tt></td><td>Mathematica</td></tr>
<tr><td><tt>2r1, 8r7, 16rf</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>#2r1, #8r7, #16rf</tt></td><td>Common Lisp, Emacs Lisp</td></tr>
<tr><td><tt>1b, Fh</tt></td><td>Pliant</td></tr>
<tr><td><tt>'1'B, 'F'X</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>B'1', X'F'</tt></td><td>SQL92</td></tr>
<tr><td><tt>$f</tt></td><td>Forth</td></tr>
</table><p>
integer thousand-separator
<table border=1 cellpadding=3>
<tr><td><tt>1_000, 10_00, 100_0</tt></td><td>Ada, E, Eiffel, OCaml, Perl, Perl6, Ruby</td></tr>
<tr><td><tt>1'000, 10'00, 100'0</tt></td><td>Rebol</td></tr>
<tr><td><tt>1_000</tt></td><td>merd</td></tr>
</table><p>
floating point
<table border=1 cellpadding=3>
<tr><td><tt>1000., 1E3</tt></td><td>C, C++, Classic REXX, CoffeeScript, E, F#, Go, Java, JavaScript, Logo, Maple, OCaml, Python, Scheme, SQL92, Tcl</td></tr>
<tr><td><tt>1000., 1E3, 1,0</tt></td><td>Rebol</td></tr>
<tr><td><tt>1000., 1.E3</tt></td><td>Eiffel, Oz</td></tr>
<tr><td><tt>1000.0, 1E3</tt></td><td>C#, Common Lisp, Emacs Lisp, PHP, Pike, Prolog, Ruby, Smalltalk</td></tr>
<tr><td><tt>1000.0, 1.0E3</tt></td><td>Ada, Haskell</td></tr>
<tr><td><tt>1000, 1000.0, 1E3<a href="#127">(127)</a></tt></td><td>Awk, merd, Perl, Perl6</td></tr>
<tr><td><tt>1000., 1*^3, 1000`</tt></td><td>Mathematica</td></tr>
<tr><td><tt>1000e, 1e3</tt></td><td>Forth</td></tr>
</table><p>
<li><a name="MthmtddtSbtMltDvs">addition / subtraction / multiplication / division</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>+ / - / * / /</tt></td><td>BourneShell, C, C#, C++, Classic REXX, CoffeeScript, Common Lisp, D, Eiffel, Emacs Lisp, F#, Forth, Go, Haskell, Io, Java, JavaScript, Logo, Maple, Matlab, merd, MUMPS, Perl, Perl6, PHP, Pliant, Prolog, Python, Ruby, Scheme, Smalltalk, SQL92, Tcl, Vimscript, Yorick</td></tr>
<tr><td><tt>+ / - / * or nothing / /</tt></td><td>Mathematica</td></tr>
<tr><td><tt>+ +. / - -. / * *. / / /.<a href="#128">(128)</a></tt></td><td>OCaml</td></tr>
<tr><td><tt>sum / difference / product / quotient</tt></td><td>Logo</td></tr>
<tr><td><tt>add / sub / mul / idiv div</tt></td><td>PostScript</td></tr>
<tr><td><tt>f+ / f- / f* / f/</tt></td><td>Forth</td></tr>
</table><p>
<li><a name="MthmtPwr">exponentiation (power)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>**</tt></td><td>Ada, Classic REXX, E, F#, Fortran, Io, merd, OCaml, Perl, Perl6, PL/I, Prolog, Python, Rebol, Ruby, Tcl8.5</td></tr>
<tr><td><tt>^</tt></td><td>Awk, Dylan, Eiffel, Lua, Mathematica, Matlab, Pliant, Yorick</td></tr>
<tr><td><tt>*<a href="#129">(129)</a></tt></td><td>APL</td></tr>
<tr><td><tt>**, ^</tt></td><td>Maple</td></tr>
<tr><td><tt>^^</tt></td><td>D</td></tr>
<tr><td><tt>**, ^ and ^^<a href="#130">(130)</a></tt></td><td>Haskell</td></tr>
<tr><td><tt>f**</tt></td><td>Forth</td></tr>
<tr><td><tt>pow</tt></td><td>C, C++, CoffeeScript, Java, JavaScript, PHP, Pike, Python, SML, Tcl</td></tr>
<tr><td><tt>Pow</tt></td><td>C#, Oz</td></tr>
<tr><td><tt>power</tt></td><td>Delphi-Kylix, Logo, Rebol</td></tr>
<tr><td><tt>exp</tt></td><td>PostScript</td></tr>
<tr><td><tt>expt</tt></td><td>Common Lisp, Emacs Lisp, Scheme</td></tr>
<tr><td><tt>raisedTo</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>math.Pow</tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtNgtn">negation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>-</tt></td><td>Ada, Awk, B, BCPL, BourneShell, C, C#, C++, Classic REXX, CoffeeScript, Common Lisp, D, E, Eiffel, Emacs Lisp, F#, Go, Haskell, Io, Java, JavaScript, Logo, Maple, Mathematica, Matlab, merd, MUMPS, Perl, Perl6, PHP, Pike, Pliant, Prolog, Python, Rebol, Ruby, Scheme, Smalltalk, Tcl, Vimscript, Yorick</td></tr>
<tr><td><tt>- -.</tt></td><td>OCaml</td></tr>
<tr><td><tt>~</tt></td><td>Oz, SML</td></tr>
<tr><td><tt>neg</tt></td><td>PostScript</td></tr>
<tr><td><tt>negate</tt></td><td>Forth, Rebol</td></tr>
<tr><td><tt>fnegate</tt></td><td>Forth</td></tr>
<tr><td><tt>minus</tt></td><td>Logo</td></tr>
</table><p>
<li><a name="MthmtRndm">random</a><p>
random number
<table border=1 cellpadding=3>
<tr><td><tt>rand</tt></td><td>C, Maple, Matlab, Perl, Perl6, PHP, Ruby, Tcl</td></tr>
<tr><td><tt>random</tt></td><td>Common Lisp, Logo, Prolog, Python, Yorick</td></tr>
<tr><td><tt>$RANDOM</tt></td><td>MUMPS</td></tr>
<tr><td><tt>randomR</tt></td><td>Haskell</td></tr>
<tr><td><tt>Random<a href="#131">(131)</a></tt></td><td>Ada</td></tr>
<tr><td><tt>Random.int</tt></td><td>OCaml</td></tr>
<tr><td><tt>Random, RandomReal, RandomInteger</tt></td><td>Mathematica</td></tr>
<tr><td><tt>Random value</tt></td><td>Io</td></tr>
<tr><td><tt>Random new nextInteger</tt></td><td>Smalltalk</td></tr>
<tr><td><tt><pre>r: RANDOM
create r.make
r.start
r.item</pre></tt></td><td>Eiffel</td></tr>
<tr><td><tt><pre>Random ran = new Random();
ran.Next(...);</pre></tt></td><td>C#</td></tr>
<tr><td><tt><pre>let r = System.Random()
r.Next()</pre></tt></td><td>F#</td></tr>
<tr><td><tt>mt_rand</tt></td><td>PHP</td></tr>
<tr><td><tt>rand.Read<a href="#132">(132)</a></tt></td><td>Go</td></tr>
</table><p>
seed the pseudo random generator
<table border=1 cellpadding=3>
<tr><td><tt>srand</tt></td><td>C, Perl, Perl6, PHP, Ruby, Tcl</td></tr>
<tr><td><tt>set_seed</tt></td><td>Eiffel</td></tr>
<tr><td><tt>random.seed</tt></td><td>Python</td></tr>
<tr><td><tt>Random setSeed</tt></td><td>Io</td></tr>
<tr><td><tt>Random.init, Random.self_init</tt></td><td>OCaml</td></tr>
<tr><td><tt>rand('state',...)</tt></td><td>Matlab</td></tr>
<tr><td><tt>rerandom</tt></td><td>Logo</td></tr>
<tr><td><tt>RandomTools[MersenneTwister][SetState]</tt></td><td>Maple</td></tr>
<tr><td><tt>Random new setSeed</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>SeedRandom</tt></td><td>Mathematica</td></tr>
<tr><td><tt>mkStdGen</tt></td><td>Haskell</td></tr>
<tr><td><tt>make-random-state</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>Reset</tt></td><td>Ada</td></tr>
<tr><td><tt>rand.Seed<a href="#133">(133)</a></tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtprtPrrAndssc">operator priorities and associativities</a><p>
addition vs multiplication
<table border=1 cellpadding=3>
<tr><td><tt>mathematical</tt></td><td>BourneShell, C, C#, C++, Classic REXX, Eiffel, F#, Go, Haskell, Io, Java, Maple, Mathematica, Matlab, merd, Perl, Perl6, PHP, Python, Ruby, Tcl, Yorick</td></tr>
<tr><td><tt>same priorities</tt></td><td>MUMPS, Smalltalk</td></tr>
</table><p>
exponentiation vs negation (is -3^2 equal to 9 or -9)
<table border=1 cellpadding=3>
<tr><td><tt>mathematical</tt></td><td>Classic REXX, Eiffel, Haskell, Io, Maple, Mathematica, Matlab, Perl, Perl6, Python, Ruby</td></tr>
<tr><td><tt>negation first</tt></td><td>F#, OCaml</td></tr>
</table><p>
<li><a name="MthmtSRExbV">square root / e-exponential / absolute value</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>sqrt / exp / abs</tt></td><td>Ada, C, C++, CoffeeScript, Common Lisp, E, Eiffel, Emacs Lisp, F#, Haskell, Io, Java, JavaScript, Lua, Maple, OCaml, Pascal, Perl, Perl6, PHP, Prolog, Python, Ruby, Scheme, Smalltalk, SML, Tcl, Yorick</td></tr>
<tr><td><tt>sqrt realsqrt / exp / abs</tt></td><td>Matlab</td></tr>
<tr><td><tt>sqrt / exp /</tt></td><td>Awk, Logo</td></tr>
<tr><td><tt>Sqrt / Exp / Abs</tt></td><td>C#, Mathematica, Oz</td></tr>
<tr><td><tt>sqrt / / abs</tt></td><td>PostScript</td></tr>
<tr><td><tt>Sqrt / / ABS</tt></td><td>Modula-3</td></tr>
<tr><td><tt>/ exp / abs</tt></td><td>Pliant</td></tr>
<tr><td><tt>sqrt / /</tt></td><td>Pike</td></tr>
<tr><td><tt>square-root / exp / abs or absolute</tt></td><td>Rebol</td></tr>
<tr><td><tt>Sqrt / Exp / ABS</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>sqrt,isqrt / exp / abs</tt></td><td>Tcl8.5</td></tr>
<tr><td><tt>fsqrt / fexp / abs,fabs</tt></td><td>Forth</td></tr>
<tr><td><tt>math.Sqrt</tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtTrgnm">trigonometry</a><p>
basic
<table border=1 cellpadding=3>
<tr><td><tt>sin / cos / tan</tt></td><td>Ada, C, C++, CoffeeScript, Common Lisp, E, Emacs Lisp, F#, Haskell, Io, Java, JavaScript, Lua, Maple, Matlab, OCaml, Pascal, Perl, Perl6, PHP, Pike, Pliant, Prolog, Python, Ruby, Scheme, Smalltalk, SML, Tcl, Yorick</td></tr>
<tr><td><tt>Sin / Cos / Tan</tt></td><td>C#, Classic REXX, Mathematica, Oz</td></tr>
<tr><td><tt>sin / cos /</tt></td><td>Awk, PostScript</td></tr>
<tr><td><tt>sine / cosine / tangent</tt></td><td>Eiffel, Rebol</td></tr>
<tr><td><tt>radsin / radcos / radtan</tt></td><td>Logo</td></tr>
<tr><td><tt>fsin / fcos / ftan</tt></td><td>Forth</td></tr>
<tr><td><tt>math.Sin / math.Cos / math.Tan</tt></td><td>Go</td></tr>
</table><p>
inverse
<table border=1 cellpadding=3>
<tr><td><tt>asin / acos / atan<a href="#134">(134)</a></tt></td><td>Ada, C, C++, CoffeeScript, Common Lisp, F#, Haskell, Io, JavaScript, Matlab, OCaml, Perl, Perl6, Pike, Pliant, Prolog, Python, Ruby, Scheme, Tcl, Yorick</td></tr>
<tr><td><tt>Asin / Acos / Atan</tt></td><td>C#, Oz</td></tr>
<tr><td><tt>ASin / ACos / ATan</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>arcsin / arccos / arctan</tt></td><td>Maple</td></tr>
<tr><td><tt>arcSin / arcCos / arcTan</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>ArcSin / ArcCos / ArcTan</tt></td><td>Mathematica</td></tr>
<tr><td><tt>arcsine / arccosine / arctangent</tt></td><td>Rebol</td></tr>
<tr><td><tt>arc_sine / arc_cosine / arc_tangent</tt></td><td>Eiffel</td></tr>
<tr><td><tt> / / atan</tt></td><td>PostScript</td></tr>
<tr><td><tt> / / radarctan</tt></td><td>Logo</td></tr>
<tr><td><tt>fasin / facos / fatan</tt></td><td>Forth</td></tr>
<tr><td><tt>math.Asin / math.Acos / math.Atan</tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtLgrth">logarithm</a><p>
base e
<table border=1 cellpadding=3>
<tr><td><tt>ln</tt></td><td>Delphi-Kylix, Logo, Maple, Pascal, PostScript, Smalltalk, SML</td></tr>
<tr><td><tt>log</tt></td><td>Awk, C, C++, CoffeeScript, Common Lisp, E, Eiffel, Emacs Lisp, F#, Io, Java, JavaScript, Lua, Maple, Matlab, OCaml, Perl, Perl6, PHP, Pike, Pliant, Prolog, Python, Ruby, Scheme, Tcl, Yorick</td></tr>
<tr><td><tt>Log</tt></td><td>Ada, C#, Classic REXX, Mathematica, Oz</td></tr>
<tr><td><tt>log 10</tt></td><td>Haskell</td></tr>
<tr><td><tt>log-e</tt></td><td>Rebol</td></tr>
<tr><td><tt>fln</tt></td><td>Forth</td></tr>
<tr><td><tt>math.Log</tt></td><td>Go</td></tr>
</table><p>
base 10
<table border=1 cellpadding=3>
<tr><td><tt>log10</tt></td><td>C, C++, Delphi-Kylix, Eiffel, F#, Io, Logo, Lua, Matlab, OCaml, Perl, Perl6, PHP, Pliant, Prolog, Python, Ruby, Tcl, Yorick</td></tr>
<tr><td><tt>Log10</tt></td><td>C#, Classic REXX</td></tr>
<tr><td><tt>log</tt></td><td>PostScript, SML</td></tr>
<tr><td><tt>log: 10</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>log-10</tt></td><td>Rebol</td></tr>
<tr><td><tt>log[10]</tt></td><td>Maple</td></tr>
<tr><td><tt>Log[10, val]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>logBase 10</tt></td><td>Haskell</td></tr>
<tr><td><tt>Log(X =&gt; val, Base =&gt; 10.0)</tt></td><td>Ada</td></tr>
<tr><td><tt>(log x 10)</tt></td><td>Common Lisp</td></tr>
<tr><td><tt>flog</tt></td><td>Forth</td></tr>
<tr><td><tt>math.Log10</tt></td><td>Go</td></tr>
</table><p>
base 2
<table border=1 cellpadding=3>
<tr><td><tt>log2</tt></td><td>Matlab</td></tr>
<tr><td><tt>log-10 / log-2</tt></td><td>Rebol</td></tr>
<tr><td><tt>Log(X =&gt; val, Base =&gt; 2.0)</tt></td><td>Ada</td></tr>
<tr><td><tt>log(val, 2)</tt></td><td>Python</td></tr>
<tr><td><tt>Log[2, val]</tt></td><td>Mathematica</td></tr>
<tr><td><tt>frexp</tt></td><td>C</td></tr>
<tr><td><tt>math.Log2</tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtcDBQAM">euclidean division (both quotient and modulo)</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>divmod</tt></td><td>Python, Ruby</td></tr>
<tr><td><tt>divMod</tt></td><td>Haskell</td></tr>
<tr><td><tt>div ldiv lldiv</tt></td><td>C</td></tr>
<tr><td><tt>IntInf.quotrem</tt></td><td>SML</td></tr>
<tr><td><tt>floor</tt></td><td>Common Lisp, Dylan</td></tr>
<tr><td><tt>/mod</tt></td><td>Forth</td></tr>
<tr><td><tt>Div<a href="#135">(135)</a></tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtMdl">modulo</a><p>
modulo of -3 / 2 is 1
<table border=1 cellpadding=3>
<tr><td><tt>%</tt></td><td>Classic REXX, Perl, Perl6, Pike, Python, Ruby, Tcl</td></tr>
<tr><td><tt>%%</tt></td><td>E</td></tr>
<tr><td><tt>\\</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>mod</tt></td><td>Ada, Common Lisp, Emacs Lisp, Haskell, Matlab, Prolog, SML</td></tr>
<tr><td><tt>Mod</tt></td><td>Mathematica</td></tr>
<tr><td><tt>MOD</tt></td><td>Modula-3</td></tr>
<tr><td><tt>modulo</tt></td><td>Dylan, Logo, Ruby</td></tr>
<tr><td><tt>rem</tt></td><td>Prolog</td></tr>
</table><p>
modulo of -3 / 2 is -1
<table border=1 cellpadding=3>
<tr><td><tt>%</tt></td><td>Awk, B, C, C#, C++, CoffeeScript, E, F#, Go, Io, Java, JavaScript, PHP, Pliant, Yorick</td></tr>
<tr><td><tt>#</tt></td><td>MUMPS</td></tr>
<tr><td><tt>mod</tt></td><td>F#, Forth, Lua, OCaml, Oz, Pascal, PostScript, Prolog, XPath</td></tr>
<tr><td><tt>remainder</tt></td><td>Logo, Ruby, Scheme</td></tr>
<tr><td><tt>rem</tt></td><td>Ada, BCPL, Haskell, Matlab, Smalltalk</td></tr>
<tr><td><tt>//</tt></td><td>Classic REXX, Rebol</td></tr>
<tr><td><tt>\\</tt></td><td>Eiffel</td></tr>
</table><p>
<li><a name="MthmtTrnRndFlrCei">truncate / round / floor / ceil</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>trunc / round / floor / ceil</tt></td><td>C, C++, Maple, Matlab</td></tr>
<tr><td><tt>truncate / round / floor / ceiling</tt></td><td>Common Lisp, Haskell, Perl6, PostScript, Prolog, Scheme</td></tr>
<tr><td><tt>int / round / floor / ceil</tt></td><td>CoffeeScript, JavaScript, Pike, Python</td></tr>
<tr><td><tt>int / round / /</tt></td><td>Logo</td></tr>
<tr><td><tt>to_i, Integer() / round / floor / ceil</tt></td><td>Ruby</td></tr>
<tr><td><tt>TRUNC / FORMAT / Floor / Ceil</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>Float'Truncation / Float'Rounding / Float'Floor / Float'Ceiling<a href="#136">(136)</a></tt></td><td>Ada</td></tr>
<tr><td><tt>/ round / floor / ceil</tt></td><td>E, Io, Java, Lua, PHP, SML, Tcl</td></tr>
<tr><td><tt>/ Round / Floor / Ceiling</tt></td><td>C#</td></tr>
<tr><td><tt>/ Round / Floor / Ceil</tt></td><td>Oz</td></tr>
<tr><td><tt>/ round / floor / ceiling</tt></td><td>Dylan, Emacs Lisp, PostScript, XPath</td></tr>
<tr><td><tt>/ ROUND / FLOOR / CEILING</tt></td><td>Modula-3</td></tr>
<tr><td><tt>/ rounded / floor / ceiling</tt></td><td>Eiffel, Smalltalk</td></tr>
<tr><td><tt>int / / floor / ceil</tt></td><td>F#, Perl</td></tr>
<tr><td><tt>int_of_float / / floor / ceil</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt> / / floor / ceil</tt></td><td>Lua, Yorick</td></tr>
<tr><td><tt>IntegerPart / Round / Floor / Ceiling</tt></td><td>Mathematica</td></tr>
<tr><td><tt> / Rounding / Floor / Ceiling</tt></td><td>Ada</td></tr>
<tr><td><tt>to-integer / / /</tt></td><td>Rebol</td></tr>
<tr><td><tt>/ fround / /</tt></td><td>Forth</td></tr>
<tr><td><tt>math.Trunc / / math.Floor / math.Ceil</tt></td><td>Go</td></tr>
</table><p>
<li><a name="MthmtBtwsprtr">bitwise operators</a><p>
and / or / xor
<table border=1 cellpadding=3>
<tr><td><tt>& / | / ^</tt></td><td>C, C#, C++, CoffeeScript, E, Eiffel, Go, Java, JavaScript, Perl, PHP, Pike, Python, Ruby, Tcl</td></tr>
<tr><td><tt>& / | / ~</tt></td><td>Yorick</td></tr>
<tr><td><tt>& / |</tt></td><td>YCP</td></tr>
<tr><td><tt>+& / +| / +^</tt></td><td>Perl6</td></tr>
<tr><td><tt>.&. / .|. / xor<a href="#137">(137)</a></tt></td><td>Haskell</td></tr>
<tr><td><tt>&&& / ||| / ^^^</tt></td><td>F#</td></tr>
<tr><td><tt>and / or / xor</tt></td><td>Ada, Forth, PostScript, Rebol</td></tr>
<tr><td><tt>land / lor / lxor</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>logand / logior / logxor<a href="#138">(138)</a></tt></td><td>Common Lisp</td></tr>
<tr><td><tt>bitand / bitor / bitxor</tt></td><td>Logo, Matlab</td></tr>
<tr><td><tt>BITAND / BITOR / BITXOR</tt></td><td>Classic REXX</td></tr>
<tr><td><tt>BitAnd / BitOr / BitXor</tt></td><td>Mathematica</td></tr>
<tr><td><tt>bitAnd / bitOr / bitXor</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>bitwiseAnd / bitwiseOr / bitwiseXor</tt></td><td>Io</td></tr>
<tr><td><tt>/\ / \/ / xor</tt></td><td>Prolog</td></tr>
</table><p>
bitwise inversion
<table border=1 cellpadding=3>
<tr><td><tt>~</tt></td><td>C, C#, C++, CoffeeScript, Java, JavaScript, Perl, PHP, Pike, Python, Ruby, SML, Tcl, YCP</td></tr>
<tr><td><tt>~~~</tt></td><td>F#</td></tr>
<tr><td><tt>not</tt></td><td>Ada, Eiffel, PostScript</td></tr>
<tr><td><tt>lnot</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>lognot<a href="#139">(139)</a></tt></td><td>Common Lisp</td></tr>
<tr><td><tt>bitnot</tt></td><td>Eiffel, Logo</td></tr>
<tr><td><tt>BitNot</tt></td><td>Mathematica</td></tr>
<tr><td><tt>complement</tt></td><td>Haskell, Rebol</td></tr>
<tr><td><tt>bitcmp</tt></td><td>Matlab</td></tr>
<tr><td><tt>bitInvert</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>bitwiseComplement</tt></td><td>Io</td></tr>
<tr><td><tt>invert</tt></td><td>Forth</td></tr>
<tr><td><tt>\</tt></td><td>Prolog</td></tr>
</table><p>
left shift / right shift / unsigned right shift
<table border=1 cellpadding=3>
<tr><td><tt>&lt;&lt; / &gt;&gt; / &gt;&gt;&gt;</tt></td><td>CoffeeScript, Java, JavaScript</td></tr>
<tr><td><tt>&lt;&lt; / &gt;&gt;</tt></td><td>C, C#, C++, Go, Perl, PHP, Pike, Prolog, Python, Ruby, Tcl, YCP</td></tr>
<tr><td><tt>&lt;&lt;&lt; / &gt;&gt;&gt;</tt></td><td>F#</td></tr>
<tr><td><tt>|&lt;&lt; / |&gt;&gt;</tt></td><td>Eiffel</td></tr>
<tr><td><tt>lsl / lsr or asr</tt></td><td>F#, OCaml</td></tr>
<tr><td><tt>bitshift</tt></td><td>Matlab, PostScript</td></tr>
<tr><td><tt>bitShift</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>ashift lshift</tt></td><td>Logo</td></tr>
<tr><td><tt>lshift / rshift</tt></td><td>Forth</td></tr>
<tr><td><tt>shiftL / / shiftR</tt></td><td>Haskell</td></tr>
<tr><td><tt>shiftLeft / shiftRight</tt></td><td>Io</td></tr>
<tr><td><tt>Shift_Left / Shift_Right / Shift_Right_Arithmetic / Rotate_Left / Rotate_Right</tt></td><td>Ada</td></tr>
<tr><td><tt>(ash x positive-integer) / (ash x negative-integer) /</tt></td><td>Common Lisp</td></tr>
</table><p>
</ul><hr>
<h2><a name="Thrds">Threads</a></h2>
<ul>
<li><a name="ThrdsThrdDfnt">thread definition</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>class class_name(threading.Thread) {[override run method] }</tt></td><td>Python</td></tr>
<tr><td><tt>task task_name is [entry entry_name[(parameter ...)]...] end task_name</tt></td><td>Ada</td></tr>
<tr><td><tt>task type task_type_name is [entry entry_name[(parameter ...)]...] end task_type_name</tt></td><td>Ada</td></tr>
<tr><td><tt>class class_name extends Thread {[override run method] }</tt></td><td>Java</td></tr>
<tr><td><tt>thread ...</tt></td><td>Pliant</td></tr>
<tr><td><tt><pre>parallel [threads nb_threads] [mini mini_threshold] [maxi maxi_threshold] [active]
   ...
   task
     parallel_instructions
   [post
     sequential_instructions]
   ...</pre></tt></td><td>Pliant</td></tr>
<tr><td><tt>[NSThread detachNewThreadSelector:mainFunction toTarget:target withObject:obj]</tt></td><td>Objective-C</td></tr>
</table><p>
<li><a name="ThrdsThrdCrtn">thread creation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>object t=Thread.Thread(f)</tt></td><td>Pike</td></tr>
<tr><td><tt>set t [thread create {code}]</tt></td><td>Tcl</td></tr>
<tr><td><tt>Thread createThread(...)</tt></td><td>Io</td></tr>
</table><p>
<li><a name="ThrdsThrbjcCrt">thread object creation</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>MyTask : task_type_name;</tt></td><td>Ada</td></tr>
<tr><td><tt>class_name MyThread = new class_name()</tt></td><td>Java</td></tr>
<tr><td><tt>p :=  [ ... ] newProcess.</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>p :=  [ ... ] fork.<a href="#140">(140)</a></tt></td><td>Smalltalk</td></tr>
</table><p>
<li><a name="ThrdsStrStpThr">starting / stopping threads</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>start() / stop()<a href="#141">(141)</a></tt></td><td>Java</td></tr>
<tr><td><tt>resume / suspend / terminate</tt></td><td>Smalltalk</td></tr>
<tr><td><tt>Tasks are started when created / call Stop entry or "abort task-object-name"</tt></td><td>Ada</td></tr>
<tr><td><tt>thread send $t {script}</tt></td><td>Tcl</td></tr>
</table><p>
<li><a name="ThrdsPssDatDrcBtwThr">passing data directly between threads</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>call an entry with parameters</tt></td><td>Ada</td></tr>
<tr><td><tt>call any public method</tt></td><td>Java</td></tr>
<tr><td><tt>common variables are copied at thread creation, in abscence of a "share" statement</tt></td><td>Pliant</td></tr>
<tr><td><tt>use messages, parameters or shared variables<a href="#142">(142)</a></tt></td><td>Smalltalk</td></tr>
</table><p>
<li><a name="ThrdsTTCDTTO">terminating thread communication due to a time-out</a><p>

<table border=1 cellpadding=3>
<tr><td><tt>select task_entry_call; or delay timeout_limit; end select;</tt></td><td>Ada</td></tr>
</table><p>
<li><a name="ThrdsThrdSnch">Thread Synchronization</a><p>
Defining a Synchronized Shared Resource
<table border=1 cellpadding=3>
<tr><td><tt>thread::mutex</tt></td><td>Tcl</td></tr>
<tr><td><tt><pre>protected Object_Name is [entry entry_name(Parameter : [in out] is type [...]);
procedure procedure_name(Parameter : [in out] is type [...]);
function function_name return type;
private
shared data declaration
end Object_Name;</pre></tt></td><td>Ada</td></tr>
<tr><td><tt>synchronize (this){ ... }</tt></td><td>Java</td></tr>
<tr><td><tt>SharedQueue, Semaphore critical: [...], Future, LazyValue</tt></td><td>Smalltalk</td></tr>
</table><p>
Synchronized Writing to a shared resource
<table border=1 cellpadding=3>
<tr><td><tt>Object_Name.Entry_Name(Parms)<br>Object_Name.Procedure_Name(Parms)</tt></td><td>Ada</td></tr>
<tr><td><tt>Object_Name.SetMethod(Parms)</tt></td><td>Java</td></tr>
</table><p>
Synchronized Reading of a Shared Resource
<table border=1 cellpadding=3>
<tr><td><tt>Object_Name.Function_Name</tt></td><td>Ada</td></tr>
<tr><td><tt>Object_Name.GetMethod()</tt></td><td>Java</td></tr>
</table><p>
Monitor Syntax
<table border=1 cellpadding=3>
<tr><td><tt>Objectg_Name.Entry_Name(Parms)</tt></td><td>Ada</td></tr>
</table><p>
<li><a name="ThrdsJnnnthThr">Joining Another Thread</a><p>
Suspending a thread until another thread completes
<table border=1 cellpadding=3>
<tr><td><tt>Call task entry serviced just before task termination</tt></td><td>Ada</td></tr>
<tr><td><tt>OtherThread.join()</tt></td><td>Java, Python</td></tr>
</table><p>
Suspending a Thread Until Another Thread Establishes An Internal State
<table border=1 cellpadding=3>
<tr><td><tt>Call a task entry on the other thread</tt></td><td>Ada</td></tr>
</table><p>
<li><a name="ThrdsThrdPrrt">Thread Prioritization</a><p>
Selecting a Prioritization Model
<table border=1 cellpadding=3>
<tr><td><tt>pragma Locking_Policy(Ceiling_Locking);</tt></td><td>Ada</td></tr>
</table><p>
Establishing a base thread priority
<table border=1 cellpadding=3>
<tr><td><tt>pragma Priority(expression);</tt></td><td>Ada</td></tr>
</table><p>
Changing Thead Priority
<table border=1 cellpadding=3>
<tr><td><tt>Set_Priority(Priority_Value);</tt></td><td>Ada</td></tr>
<tr><td><tt>setPriority(newPriority);</tt></td><td>Java</td></tr>
<tr><td><tt>p priority: n</tt></td><td>Smalltalk</td></tr>
</table><p>
<li><a name="ThrdsTSSODWS">Thread-safe sharing of data without synchronization</a><p>
Ensuring access is atomic
<table border=1 cellpadding=3>
<tr><td><tt>pragma Atomic(Object_Name);</tt></td><td>Ada</td></tr>
</table><p>
Ensuring access is always via a local copy of the shared data
<table border=1 cellpadding=3>
<tr><td><tt>pragma Volatile(Object_Name);</tt></td><td>Ada</td></tr>
</table><p>
</ul><hr>
<h2>Remarks</h2>
<ul>
<li><a name="1">(1)</a> introduced in Scheme in R6RS
<li><a name="2">(2)</a> when unused
<li><a name="3">(3)</a> for C, it is not a standard convention, but it is the more widespread
<li><a name="4">(4)</a> any string literal would work
<li><a name="5">(5)</a> see also =head1, =head2, =over, etc
<li><a name="6">(6)</a> need "file: %script-header.r" in file header
<li><a name="7">(7)</a> for user defined functions only
<li><a name="8">(8)</a> displayed &lt;- with a special character
<li><a name="9">(9)</a> variable on the right
<li><a name="10">(10)</a> F#: with indentation
<li><a name="11">(11)</a> the variable behaves like a pointer
<li><a name="12">(12)</a> cf <a href="http://merd.net/choices_syntax.html#horizontal_layout">horizontal layout</a>
<li><a name="13">(13)</a> introduce scope
<li><a name="14">(14)</a> Smalltalk: introduce scope
<li><a name="15">(15)</a> ascii representation, original uses a special charset
<li><a name="16">(16)</a> in Modula-2, &lt;&gt; and # are synonyms
<li><a name="17">(17)</a> === and !== differ from == and != when the objects' type differ
<li><a name="18">(18)</a> for objects
<li><a name="19">(19)</a> normal / structural / unification / arithmetic
<li><a name="20">(20)</a> structural / mathematical
<li><a name="21">(21)</a> deep comparison
<li><a name="22">(22)</a> in List::Util
<li><a name="23">(23)</a> just 'eval' evaluates JavaScript
<li><a name="24">(24)</a> Univ operator
<li><a name="25">(25)</a> starting with PHP 5.3
<li><a name="26">(26)</a> procedure call
<li><a name="27">(27)</a> in Pliant, special sugar for only one parameter
<li><a name="28">(28)</a> only for one parameter
<li><a name="29">(29)</a> only for two parameters
<li><a name="30">(30)</a> f is a block
<li><a name="31">(31)</a> Python &gt;= 2.5
<li><a name="32">(32)</a> it does not scale to 3rd argument
<li><a name="33">(33)</a> lambda (x . y) ...
<li><a name="34">(34)</a> only final parameter may be variadic and accepts zero or more arguments
<li><a name="35">(35)</a> when callee has special "&" prototype
<li><a name="36">(36)</a> this is a block, not precisely a function, but it's alike
<li><a name="37">(37)</a> manual declaration of local variables wanted in the closure
<li><a name="38">(38)</a> see also: #1 + #2 &
<li><a name="39">(39)</a> also works for procedures: proc {$ A B} ... end
<li><a name="40">(40)</a> x, y, z are the parameters
<li><a name="41">(41)</a> method is optional
<li><a name="42">(42)</a> in Lua, "return xxx" can only appear before a block end. in Matlab, only in inline('...')
<li><a name="43">(43)</a> "return" is used when there is no value to return
<li><a name="44">(44)</a> in Matlab, only for anonymous function
<li><a name="45">(45)</a> firefox
<li><a name="46">(46)</a> C#4, only for "dynamic" objects
<li><a name="47">(47)</a> the result goes to "e"
<li><a name="48">(48)</a> "break"s are mandatory, even for "default"!
<li><a name="49">(49)</a> Perl &gt;= 5.8.0
<li><a name="50">(50)</a> 1 is optional in this example, since min is 1 by default
<li><a name="51">(51)</a> in Ruby, see also catch/throw
<li><a name="52">(52)</a> often provided in the abbreviated form call/cc
<li><a name="53">(53)</a> matches an expression of type t
<li><a name="54">(54)</a> type is infered
<li><a name="55">(55)</a> expression "e" is cast to the type of "v"
<li><a name="56">(56)</a> for parameters
<li><a name="57">(57)</a> quite bad: only the reference is non-mutable whereas the object is still mutable
<li><a name="58">(58)</a> eventual send
<li><a name="59">(59)</a> properties are something alike attributes, but really are methods
<li><a name="60">(60)</a> one level depth
<li><a name="61">(61)</a> general deep copy function
<li><a name="62">(62)</a> object cloning is the default, uses the copy constructor in C++
<li><a name="63">(63)</a> or simply o_ := o for non-polymorphic objects
<li><a name="64">(64)</a> c'Class is the class rooted in c
<li><a name="65">(65)</a> see also isMemberOf
<li><a name="66">(66)</a> assignment attempt
<li><a name="67">(67)</a> see also callable(obj.meth) for <a href="http://www.python.org/doc/current/ref/types.html">unbound methods</a>
<li><a name="68">(68)</a> in Python, usually called self
<li><a name="69">(69)</a> ":" is for external symbols only, recommended
<li><a name="70">(70)</a> directory name is package name
<li><a name="71">(71)</a> if names are exported using @EXPORT
<li><a name="72">(72)</a> if names are not exported or are exported using @EXPORT_OK
<li><a name="73">(73)</a> deprecated in ANSI Common Lisp, but used in ASDF
<li><a name="74">(74)</a> using a correspondance from the package name to the file name
<li><a name="75">(75)</a> inside a function
<li><a name="76">(76)</a> since PHP 5.3
<li><a name="77">(77)</a> no spaces
<li><a name="78">(78)</a> when using format
<li><a name="79">(79)</a> need expandMacros
<li><a name="80">(80)</a> where T is the type of the value
<li><a name="81">(81)</a> see also cPickle
<li><a name="82">(82)</a> but not using the C-like %-syntax
<li><a name="83">(83)</a> adding an end-of-line
<li><a name="84">(84)</a> in BourneShell, adding an end-of-line
<li><a name="85">(85)</a> adding an end-of-line unless already newline-terminated
<li><a name="86">(86)</a> Always case insensitive
<li><a name="87">(87)</a> Always case sensitive
<li><a name="88">(88)</a> faster than isEqual
<li><a name="89">(89)</a> the string is represented on the stack as (addr len)
<li><a name="90">(90)</a> in Lua &gt;= 5.0
<li><a name="91">(91)</a> in C++, is range-checked whereas a[i] is not
<li><a name="92">(92)</a> ESI dialect
<li><a name="93">(93)</a> beware of 0.0 which is true in Pike!
<li><a name="94">(94)</a> Smalltalk: postfix operator
<li><a name="95">(95)</a> in Modula-2, "&" and "and" are synonyms
<li><a name="96">(96)</a> in Oz, simple functions, not operators
<li><a name="97">(97)</a> new in PHP 5.4
<li><a name="98">(98)</a> restricted to initialisation of a local variable in C and C++
<li><a name="99">(99)</a> a b c must be constants
<li><a name="100">(100)</a> beware, if you give only one integer argument, it is the size!
<li><a name="101">(101)</a> for write access: a i o put
<li><a name="102">(102)</a> in C++, it is range-checked whereas a[i] is not. in Smalltalk, for write access: a :at i :put o
<li><a name="103">(103)</a> see also Head
<li><a name="104">(104)</a> list comprehension
<li><a name="105">(105)</a> not in standard
<li><a name="106">(106)</a> in C++, it is done in place
<li><a name="107">(107)</a> in Scheme, not standard, but nearly standard
<li><a name="108">(108)</a> the result is not guaranteed to be the same as the order in the input
<li><a name="109">(109)</a> in Perl, in List::Util
<li><a name="110">(110)</a> Borland extension in Pascal
<li><a name="111">(111)</a> prefix
<li><a name="112">(112)</a> postfix
<li><a name="113">(113)</a> infix
<li><a name="114">(114)</a> optional value is only for pointers
<li><a name="115">(115)</a> only for "access" types in Ada
<li><a name="116">(116)</a> introduced in Perl 5.10
<li><a name="117">(117)</a> attribute selector
<li><a name="118">(118)</a> Java: introduced in 1.5
<li><a name="119">(119)</a> n1, n2, ...
<li><a name="120">(120)</a> returns an iterator
<li><a name="121">(121)</a> right-bias
<li><a name="122">(122)</a> left-bias
<li><a name="123">(123)</a> jot on BSD
<li><a name="124">(124)</a> long is a big integer
<li><a name="125">(125)</a> fixed point
<li><a name="126">(126)</a> 0b1 new in PHP 5.4
<li><a name="127">(127)</a> integers are decimals
<li><a name="128">(128)</a> with mathematical priorities
<li><a name="129">(129)</a> APL uses a real multiplication sign for multiplication from a special character set
<li><a name="130">(130)</a> for each various types
<li><a name="131">(131)</a> from instances of Ada.Numerics.Float_Random or Ada.Numerics.Discrete_Random
<li><a name="132">(132)</a> "math/rand" is pseudo random whereas "crypto/rand" is cryptographically random
<li><a name="133">(133)</a> only applies to "math/rand"
<li><a name="134">(134)</a> Ruby &gt;= 1.7
<li><a name="135">(135)</a> method on big.Int
<li><a name="136">(136)</a> replace Float with whatever type you are using
<li><a name="137">(137)</a> in module Data.Bits
<li><a name="138">(138)</a> see also bit-and / bit-or / bit-xor
<li><a name="139">(139)</a> see also bit-not
<li><a name="140">(140)</a> equivalent to newProcess + resume
<li><a name="141">(141)</a> "stop" is now deprecated
<li><a name="142">(142)</a> a thread is created from a block, which is a closure on the variables as seen by the block
</ul>
<p>
<h2>Similar Pages</h2>
<ul>
<li><a href="http://webhostingrating.com/libs/syntax-across-languages-be">Belorussian translation of this page</a>
<li><a href="http://en.wikipedia.org/wiki/Comparison_of_programming_languages_(syntax)">Comparison of programming languages syntax</a>
<li><a href="http://www.gavilan.edu/csis/languages/history.html">Comments and Literals in programming languages</a>
<li><a href="http://web.cs.mun.ca/~ulf/pld/surface.html">The Surface of Programming Languages</a>
<li><a href="http://www.cpcug.org/user/clemenzi/technical/Languages/">Delphi, VisualBasic, C++, Java</a>
<li><a href="http://www.ps.uni-sb.de/~rossberg/SMLvsOcaml.html">SML, OCaml</a>
<li><a href="http://www.cc.gatech.edu/classes/AY2000/cs2803ab_fall/SqueakBasics.html">Java, C++, Smalltalk</a>
<li><a href="http://www.soften.ktu.lt/~mockus/gmcsharp/csharp/c-sharp-vs-java.html">Java, C#</a>
<li><a href="http://www.javaworld.com/javaworld/jw-11-2000/jw-1122-csharp1_p.html">Java, C#</a>
<li><a href="http://renaud.waldura.com/doc/ruby/idioms.shtml">Ruby, Java, Perl</a>
<li><a href="http://mail.python.org/pipermail/python-list/1999-August/009692.html">Python, Perl</a>
<li><a href="http://www.norvig.com/python-lisp.html">Python, Lisp</a>
<li><a href="http://www.uni-muenster.de/ZIV.EberhardSturm/PL1andC.html">PL/I, C</a>
<li><a href="http://www.cs.wcupa.edu/~rkline/perl2php/">Perl, PHP</a>
<li><a href="http://obsidianrook.com/devnotes/elisp-for-perl-programmers.html">EmacsLisp, Perl</a>
<li><a href="http://www.exept.de:8080/doc/online/english/programming/stForLispers.html">Smalltalk, Lisp</a>
<li><a href="http://rosettacode.org/">Tasks in many languages</a>
</ul>
<h2>References</h2>
<ul>
<li><a href="http://cm.bell-labs.com/cm/cs/who/dmr/bcpl.html">BCPL</a>
<li><a href="http://www.gobosoft.com/eiffel/syntax/">Eiffel</a>
<li><a href="http://sqlzoo.net/">SQL</a>
</ul>
