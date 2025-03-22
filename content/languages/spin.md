title=Spin
tags=language
summary=High-level language designed specifically for the Propeller chip.
~~~~~~

[Website](https://www.parallax.com/propeller/qna/Default.htm#QnaTopics/QnaSpin.htm)

Tightly tied to the [Propeller CPU from Parallax](/hardware/parallax).

**What is Spin - Why did Parallax make a unique language?** Spin is the high-level object-based language Parallax designed specifically for the Propeller chip. Spin provides control of the Propeller's multicore hardware and encourages the principles of the Propeller's real-time application design in ways that were not represented by existing languages. Spin was inspired by portions of C, Delphi, and Python, and a host of problem/solution scenarios explored by its designers.

**Spin is "Object-based." So how is that different from "Object-oriented" languages?** Spin embraces the modular programming paradigm of objects as "devices" that can be collected together in an application, each doing their part to achieve a larger goal. This is similar in concept to that of object-oriented languages, however, aspects of inheritance and polymorphism, commonly considered to be integral parts of object-oriented languages, are not supported by Spin. For this reason, Spin is often called "object-based" rather than "object-oriented."

**How are Spin objects structured?** Spin objects are built from six special-purpose blocks: `CON`, `VAR`, `OBJ`, `PUB`, `PRI`, and `DAT`. `CON` and `VAR` are for declaring constants and variables, respectively. `OBJ` is used to declare what other objects will be used during this object's execution. `PUB` and `PRI` declare public and private methods, which contain the executable Spin instructions. DAT blocks contain data and/or Propeller Assembly programs.

**Where does Spin code live and how does it get processed?** Spin code exists only in the Propeller Application image that is stored in the Main RAM during runtime. To execute Spin code, a cog must first be loaded with the Spin Interpreter (a Propeller Assembly program that is built into the Main ROM). Execution of the Spin Interpreter (in Cog RAM) results in the statement-by-statement execution of Spin code (from Main RAM).

For the initial startup, the Propeller chip runs its Boot Up Procedure and the Spin Interpreter (stored in Main ROM) is copied to Cog 0’s RAM. This Spin Interpreter fetches chunks of the application code, called tokens, from the Main RAM and executes it.

Spin execution begins with the first method in the application's Top Object. Cog 0 fetches one or more tokens, executes the related code, then gets more tokens and continues. Whenever the application launches a new cog with COGNEW(SpinMethod…) or COGINIT(SpinMethod…), that new cog also gets a copy of the Spin Interpreter in its own Cog RAM. The new cog then starts fetching and executing tokens from the application in Main RAM too, starting at the point indicated by the SpinMethod argument. So, at any given time, there can be up to eight cogs using their own copies of the Spin Interpreter to fetch and execute tokens from the application.

**Which Spin method is the initial entry point of my application?** An application's initial entry point (the code in which execution begins) is always the very first public method in the top object. It doesn't matter what that method is called, but developers often call it "main."

**What's the difference between calling code and launching code?** Calling a piece of code (a spin method or assembly label) executes that code within the current cog. Launching code (a spin method or assembly program) executes that code in a different cog; to execute code in parallel.

**Can Spin call Propeller Assembly code?** No, it can launch Propeller Assembly, but can not call it directly since it wouldn't be practical to do so. By design, Spin and Propeller Assembly code execute in separate cogs, so just like coordinating between two or more cogs, Spin and Propeller Assembly code can communicate with each other via shared memory, if necessary.

**Can Propeller Assembly call Spin code?** No, and it wouldn't be practical to do so. By design, Propeller Assembly and Spin code execute in separate cogs, so just like coordinating between two or more cogs, Propeller Assembly and Spin code can communicate with each other via shared memory, if necessary.

**Can Spin start a new cog?** Yes, using the `COGNEW` or `COGINIT` command. This is the most practical and recommended way to start a cog.

**How do I determine the execution time of a portion of code?** This is quite easy for Propeller Assembly, but more elusive for Spin code. There are three techniques for timing code with definitive results, each with its "ideal" application.

* Counting and adding up determinant instruction times (Propeller Assembly only).
* Using the System Counter (Spin and Propeller Assembly).
* Toggling a pin and measuring the pulse-width (Spin or Propeller Assembly).

**Does Spin use a call stack?** Yes, Spin uses a different call stack for each Spin-based process.

The Spin Interpreter implements a call stack to facilitate Spin method calling, parameter passing, and expression evaluation. The Propeller Application's stack is located in Main RAM immediately following the application's global variable memory. It expands and collapses as needed; growing towards higher addresses and shrinking towards lower addresses. Spin methods that are manually launched into other cogs store their stack starting at the StackPointer address given by the COGNEW or COGINIT command that launched them. Their stacks expand and contract in the same manner as with the Propeller Application stack. In both cases, the capacity of the stack (method nesting-depth, parameter list length, and expression complexity) is limited only by the amount of free memory available (for the application) or memory provided (by the developer).
