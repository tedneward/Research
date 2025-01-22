title=EarScript
tags=language, esolang
summary=Takes the elegant and minimalistic design of brainfuck and adds "quality of life features" like goto statements, randomized control flow, multiple arrays, and a second dimension.
~~~~~~

[Source](https://github.com/Agecaf/EarScript)

# README

EarScript is a domain specific programming language, designed to only work with integers, and multiple 2D arrays of integers. It is designed to be used specifically for procedural generation.

It takes the elegant and minimalistic design of [brainfuck](https://esolangs.org/wiki/Brainfuck) and adds "quality of life features" like goto statements, randomized control flow, multiple arrays, and a second dimension.

This programming language was first implemented to create infinite procedurally generated music and charts in the rhythm game [EternAlgoRhythm](https://www.agecaf.eu/eternalgorhythm.html). While this first implementation leaves much to be desired in terms of performance, it shows the practical potential of EarScript.

# Links
- [Try EarScript Online!](https://agecaf.github.io/EarScript/tryonline/)
- [Getting Started: Beginner's Guide](https://github.com/Agecaf/EarScript/wiki).
- User Reference under construction.
- [Specification](https://github.com/Agecaf/EarScript/specification/specification.md)
- [EternAlgoRhythm official page](https://www.agecaf.eu/eternalgorhythm.html)
- [EternAlgoRhythm on Steam](https://store.steampowered.com/app/2678290/EternAlgoRhythm/)
- [EarScript for EternAlgoRhythm video tutorials](https://www.youtube.com/playlist?list=PLGC7JEgOH2Ulp3hBY0oaLczdxvPgD0neI)

# What does EarScript look like?
```
# This is a comment
=42 .   # Assignment to 42, output.
```
```
# Fibonacci Example
\ncol2 =1 > =1 >    # Initialize a table to [1 1]
[10 . +l > ]        # Loop 10 times, output, add the cell to the left, move right
```
```
# Sequencers
[12 {=1|=2|=3} .]   # Output: 1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3,

# Randomizers
[12 {r=1|=2|=3} .]   # Output Example: 1, 2, 1, 1, 1, 3, 3, 1, 2, 1, 2, 2, 
```
```
'start    # Jumps to label start
@func     # Label func
+.        # Increases value, outputs
~         # Return
@start    # Label Start
=42         # Set value to 42
[3 "func ]  # Loop 3 times, call func and return
```
```
$main                # Name default table
$other               # Create table other
$                    # Return to main table
$other=4$            # Move to table other, set it to 4, return to main table
+other*other*other   # Use table value
.                    # Output: 64 = 4^3
```
# EarScript machines

EarScript is run by machines (often virtual). Each machine may take EarScript code directly, or it may take an intermediate representation like EarByte, a bytecode used in EternAlgoRhythm's machines.

Each machine implements its input and output differently. For example, in EternAlgoRhythm, the Part machine's output is linked to the Instrument machines' input, while the Instrument machines' output is used to generate the notes of the procedurally generated music.

Each machine in a way is a foreign function interface for EarScript.

# Visual representations

EarScript was initially designed to be used through EarVis, a node-based visual programming language. The idea of EarVis is to replace goto statements with node links, which help the code spaghetti look like actual spaghetti.

EarVis actually uses EarScript to save its files, with meta comments used to designate blocks and what their position and size is in the editor. 

By creating similar editors, the way the user writes EarScript can be adjusted just as much as the way the machine runs it.

[Here's some videos of EarScript's visual editor in action](https://www.youtube.com/playlist?list=PLGC7JEgOH2Ulp3hBY0oaLczdxvPgD0neI).

# The future of EarScript

There's many new features I'd like to add to a spiritual successor of EarScript, with functionality to use multiple threads, handle other data types like strings, and more. However this spiritual successor will have major breaking changes to the lexical syntax of the language, and would have much more complex compiler implementations. 

So even once this spiritual successor is available, there may still be use cases where EarScript's relative simplicity is preferred. 

EarScript is very flexible, writing a virtual machine for it is relatively straightforward, and customising virtual machines can make them quite applicable to different use cases.

I will be building an implementation of EarScript that runs on JS to be able to test EarScript online. 

I might next attempt to build implementations that compile too native code. 
