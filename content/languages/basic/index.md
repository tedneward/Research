title=BASIC (Beginners' All-purpose Symbolic Instruction Code)
tags=language
summary=Various notes and implementations of the BASIC programming language.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/BASIC)

## Implementations

* [basic_rs](https://github.com/yiransheng/basic_rs) - a BASIC Interpreter/Compiler for the Original Dartmouth Version written in Rust. Also provides `basic2wasm` tool which compiles BASIC to WebAssembly using binaryen.
* [basicwasm](https://github.com/navionguy/basicwasm) - a GWBasic interpreter compiled to WASM with a Web UI.
* [EndBASIC](/languages/basic/endbasic)
* [FreeBASIC](/languages/basic/freebasic) ([Source](https://github.com/freebasic/fbc)): a completely free, open-source, multi-platform BASIC compiler, with syntax similar to MS-QuickBASIC, that adds new features such as pointers, object orientation, unsigned data types, inline assembly, and many others.
* [Gambas](/languages/basic/gambas)
* [gobasic](https://github.com/skx/gobasic) - a BASIC interpreter written in Golang.
* [GWBasic](/languages/basic/gwbasic)
* [My_Basic](https://github.com/paladin-t/my_basic)
* [NSBasic](https://www.nsbasic.com/): A complete, powerful development environment. Create apps for iOS, Android, Windows, MacOS and Linux. Commercial.
* [QB64](https://qb64.com/): a modern extended BASIC programming language that retains QBasic/QuickBASIC 4.5 compatibility and compiles native binaries for Windows, Linux, and macOS. (Source is in flux; abandoned project [here](https://github.com/QB64Team/qb64) but reboot happening [here](https://github.com/QB64Official/qb64).)
* [PCBasic](/languages/basic/pcbasic) ([Source](https://github.com/robhagemans/pcbasic)): A free, cross-platform emulator for the GW-BASIC family of interpreters
* [Phoenix/Envelop](http://www.biz-wise.nl/phoenix_download.html) : Rapid Development under Basic.
* [PureBASIC](/languages/basic/purebasic)
* [RadBASIC](/languages/basic/radbasic)
* [Rapid-Q](http://rapidq.phatcode.net/) : Rapid-Q is a free IDE and BASIC op-code compiler system for Win32, Linux, Unix/languages/basic.  It is very easy to use and to integrate with many other goodies like mySQL, cgi, DirectX, Direct3D, GTK ...
* [ScriptBasic](http://www.scriptbasic.com/) : Free embedded and extendable scripting Basic interpreter with full C source code. Tested on Windows NT and on Linux.
* [SmallBASIC](http://smallbasic.github.io/) ([Source](https://github.com/smallbasic/SmallBASIC))
* [TinyBASIC](/languages/basic/tinybasic)
* [TMBasic](https://tmbasic.com/) ([Source](https://github.com/electroly/tmbasic)): a programming language for writing console programs, from simple command line tools to sophisticated mouse-driven user interfaces. The BASIC language is beginner-friendly, and experienced programmers will find it familiar and easy to use.
* [XBasic](http://www.maxreason.com/software/xbasic/xbasic.html) : interactive program development environment, advanced 32-bit/64-bit BASIC, interactive graphical GuiDesigner, multi-platform portable source code, Windows95 - Windows98 - WindowsNT - Linux - UNIX
* [Yabasic](http://www.yabasic.de/) : Small basic interpreter (with source code for Visual C++ 6) for Windows and Linux



### Transpilers

* [BCX](http://bcx-basic.sourceforge.net/) : Basic to C compiler, generates C source files compatible with Lcc-Win32 and MingW (or Dev-C++) without any modification.  It also comes with a resource translator which can read MS resource code and produce code in C (Win32).
* [B++](https://sourceforge.net/projects/b-plus-plus/) : B++ is a BASIC compiler built on top of C++ - it converts BASIC code to C++, and then calls C++ compiler to produce EXE (or DLL). Source code is in Free Pascal.

### Reading

* [10 PRINT CHR$(205.5+RND(1)); : GOTO 10](http://10print.org) - Nick Montfort, Patsy Baudoin, John Bell, Ian Bogost, Jeremy Douglass, Mark C. Marino, Michael Mateas, Casey Reas, Mark Sample, Noah Vawter
* [A beginner's guide to Gambas](http://distro.ibiblio.org/vectorlinux/Uelsk8s/GAMBAS/gambas-beginner-guide.pdf) - John W. Rittinghouse (PDF)
* [Pick/Basic: A Programmer's Guide](http://www.jes.com/pb/) - Jonathan E. Sisk

### Visual Basic P-Code

* [Microsoft's P-Code Implementation](https://archive.ph/2013.09.03-174756/http://www.programmersheaven.com/articles/userarticles/john/vbvm.htm)
* [P32Dasm: VB5/VB6 PCode Decompiler](https://progress-tools.x10.mx/p32dasm.html)
* [VB Decompiler: Decompiling P-Code in Your Mind's Eye. The Subtleties of Researching Commands of the VB Virtual Machine.](https://www.vb-decompiler.org/pcode_decompiling.htm)
* [pcodedmp.py](https://github.com/bontchev/pcodedmp): A VBA p-code disassembler


---

## [Learn X in Y minutes Quick Intro: SmallBASIC](https://learnxinyminutes.com/docs/smallbasic/)
SmallBASIC is a fast and easy to learn BASIC language interpreter ideal for everyday calculations, scripts and prototypes. SmallBASIC includes trigonometric, matrices and algebra functions, a built in IDE, a powerful string library, system, sound, and graphic commands along with structured programming syntax.

## Development

SmallBASIC was originally developed by Nicholas Christopoulos in late 1999 for the Palm Pilot. Project development has been continued by Chris Warren-Smith since around 2005.

Versions of SmallBASIC have been made for a number of early hand held devices including Franklin eBookman and the Nokia 770. Also various desktop versions have been released based on a variety of GUI tool-kits, some of which have become defunct. The current supported platforms are Linux and Windows based on SDL2 and Android based on NDK. A desktop command line version is also available, although not typically released in binary form.

In around 2008 a large corporation released a BASIC like programming environment with a similar sounding name. SmallBASIC is not related to this other project.

```
REM This is a comment
' and this is also a comment

REM print text
print "hello"
? "? is short for PRINT"

REM Control structures
FOR index = 0 TO 10 STEP 2
  ? "This is line number "; index
NEXT
J=0
REPEAT
 J++
UNTIL J=10
WHILE J>0
 J--
WEND

REM Select case statement
Select Case "Cool"
 Case "null", 1,2,3,4,5,6,7,8,"Cool","blah"
 Case "Not cool"
   PRINT "Epic fail"
 Case Else
   PRINT "Fail"
End Select

REM catching errors with TRY/CATCH
Try
  fn = Freefile
  Open filename For Input As #fn
Catch err
  Print "failed to open"
End Try

REM User defined subs and functions
func add2(x,y)
  ' variables may be declared as local within the scope of a SUB or FUNC
  local K
  k = "k will cease to exist when this FUNC returns"
  add2=x+y
end
Print add2(5,5)
sub print_it(it)
  print it
end
print_it "IT/languages/basic"

REM Display lines and pixels
At 0,ymax/2+txth("Q")
Color 1: ? "sin(x)":
Color 8: ? "cos(x)":
Color 12: ? "tan(x)"
Line 0,ymax/2,xmax,ymax/2
For i=0 to xmax
  Pset i,ymax/2-sin(i*2*pi/ymax)*ymax/4 color 1
  Pset i,ymax/2-cos(i*2*pi/ymax)*ymax/4 color 8
  Pset i,ymax/2-tan(i*2*pi/ymax)*ymax/4 color 12
Next
showpage

REM SmallBASIC is great for experimenting with fractals and other interesting effects
Delay 3000
Randomize
ff = 440.03
For j = 0 to 20
  r = rnd * 1000 % 255
  b = rnd * 1000 % 255
  g = rnd * 1000 % 255
  c = rgb(r,b,g)
  ff += 9.444
  for i=0 to 25000
    f += ff
    x = min(xmax, -x + cos(f*i))
    y = min(ymax, -y + sin(f*i))
    pset x, y color c
    if (i%1000==0) then
      showpage
    fi
  next
Next j

REM For computer historians, SmallBASIC can run programs
REM found in early computer books and magazines, for example:
10 LET A=9
20 LET B=7
30 PRINT A*B
40 PRINT A/B

REM SmallBASIC also has support for a few modern concepts such as JSON
aa = array("{\"cat\":{\"name\":\"harry\"},\"pet\":\"true\"}")
If (ismap(aa) == false) Then
  throw "not an map"
End If
Print aa

PAUSE

```

#### Articles

* [Getting started](http://smallbasic.sourceforge.net/?q=node/1573)
* [Welcome to SmallBASIC](http://smallbasic.sourceforge.net/?q=node/838)

