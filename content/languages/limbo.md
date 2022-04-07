title=Limbo
tags=language, concurrency
summary=A concurrent programming language for the Inferno operating system that was also an ancestor to Go.
~~~~~~

[Website](http://doc.cat-v.org/inferno/4th_edition/limbo_language/)

Generates a portable object code which is then interpreted by the [Dis virtual machine](/vms/dis).

### Docs
- [A Descent into Limbo](http://doc.cat-v.org/inferno/4th_edition/limbo_language/descent) by Brian Kernighan.
- [The Limbo Programming Language](http://doc.cat-v.org/inferno/4th_edition/limbo_language/limbo) by Dennis M. Ritchie and Addendum by Vita Nuova.

### See Also
- [Inferno Programming with Limbo](http://doc.cat-v.org/inferno/books/inferno_programming_with_limbo/)
- The [Alef programming language](/languages/alef) for Plan 9, was an ancestor of Limbo by Phil Winterbottom.
- [Squeak: a Language for Communicating with Mice](http://doc.cat-v.org/bell_labs/squeak/) by Luca Cardelli and Rob Pike was an even more ancient ancestor.
- [Go](/languages/go) - A direct descendant of Limbo, developed at Google and designed by Rob Pike, Ken Thompson and Robert Griesemer.

### Examples

#### Hello, World
The first example is the traditional ‘‘hello, world’’, in the file hello.b:

```
implement Hello;

include "sys.m";

    sys: Sys;

include "draw.m";

Hello: module

{

    init:   fn(ctxt: ref Draw->Context, args: list of string);

};

init(ctxt: ref Draw->Context, args: list of string)

{

    sys = load Sys Sys->PATH;

    sys->print("hello, world\n");

}
```

An implementation file implements a single module, named in the implement declaration at the top of the file. The two include lines copy interface definitions from two other modules, Sys (which describes a variety of system functions like print), and Draw (which describes a variety of graphics types and functions, only one of which, Context, is used here).

The module declaration defines the external interface that this module presents to the rest of the world. In this case, it’s a single function named init. Since this module is to be called from a command interpreter (shell), by convention its init function takes two arguments, the graphical context and a list of strings, the command-line arguments, though neither is used here. This is like main in a C program. Essentially all of the other examples begin with this standard code. Commands are unusual, though, in that a command’s module declaration appears in the same file as its implementation.

Most modules have a more extensive set of declarations; for example, draw.m is 298 lines of constants, function prototypes, and type declarations for graphics types like Point and Rect, and sys.m is 160 lines of declarations for functions like open, read, and print. Most module declarations are therefore stored in separate files, conventionally suffixed with .m, so they can be included in other modules. The system library module declaration files are collected in the module directory at the root of the Inferno source tree. Modules that are components of a single program are typically stored in that program’s source directory.

The last few lines of hello.b are the implementation of the init function, which loads the Sys module, then calls its print function. By convention, each module declaration includes a pathname constant that points to the code for the module; this is the second parameter Sys->PATH of the load statement. Note that the Draw module is not loaded because none of its functions is used, but it is included to define the type Draw->Context.

#### Graphical Hello World
The following module creates and displays a window containing only a button with the label "hello, world" as shown in the screen shot in Figure 1.

```
implement Hello2;

include "sys.m";

    sys: Sys;

include "draw.m";

    draw: Draw;

include "tk.m";

    tk: Tk;

include "tkclient.m";

    tkclient: Tkclient;

Hello2: module

{

        init:   fn(ctxt: ref Draw->Context, args: list of string);

};

init(ctxt: ref Draw->Context, args: list of string)

{

    sys = load Sys Sys->PATH;

    tk = load Tk Tk->PATH;

    tkclient = load Tkclient Tkclient->PATH;

    tkclient->init();

    (t, nil) := tkclient->toplevel(ctxt, "", "Hello", Tkclient->Plain);

    tk->cmd(t, "button .b -text {hello, world}");

    tk->cmd(t, "pack .b");

    tk->cmd(t, "update");

    tkclient->onscreen(t, nil);

    sys->sleep(10000);  # wait 10 seconds

}
```

![Figure 1. 'Hello, world' button.](http://doc.cat-v.org/inferno/4th_edition/limbo_language/f1.gif)

This is not very exciting, but it illustrates the absolute minimum required to get a picture on the screen. The Tk module is modeled closely after John Ousterhout’s Tk interface toolkit, but Limbo is used as the programming language instead of Tcl. The Inferno version is similar in functionality to the original Tk but it does not support any Tcl constructs, such as variables, procedures, or expression evaluation, since all processing is done using Limbo. There are ten functions in the Tk interface, only one of which is used here: cmd, which executes a command string. (It is the most commonly used Tk function.)

Tk itself displays graphics and handles mouse and keyboard interaction within a window. There can however be many different windows on a display. A separate window manager, wm, multiplexes control of input and output among those windows. The module Tkclient provides the interface between the window manager and Tk. Its function toplevel, used above, makes a top-level window and returns a reference to it, for subsequent use by Tk. The contents of the window are prepared by calls to tk->cmd before the window is finally displayed by the call to onscreen. (The second parameter to onscreen, a string, controls the position and style of window; here we take the default by making that nil.)

Note that Tkclient must also be explicitly initialized by calling its init function after loading. This is a common convention, although some modules do not require it (typically those built in to the system, such as Sys or Tk).

The sleep delays exit for 10 seconds so the button can be seen. If you try to interact with the window, for instance by pressing the button, you will see no response. That is because the program has not done what is required to receive mouse or keyboard input in the window. In a real application, some action would also be bound to pressing the button. Such actions are handled by setting up a connection (a ‘channel’) from the Tk module to one’s own code, and processing the messages (‘events’) that appear on this channel. The Tk module and its interface to the window manager is explained in more detail later, as are a couple of other constructions, after we have introduced processes and channels.