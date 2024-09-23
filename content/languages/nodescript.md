title=NodeScript
tags=language, gamedev
summary=A language intended for use in puzzle games.
~~~~~~

[Website](https://www.nuget.org/packages/NodeScript/) | [Source](https://github.com/aviboddu/NodeScript)

NodeScript is a rudimentary programming language designed to function on 'nodes', intended for use in puzzle games.

## Nodes
- Input nodes will continuously attempt to send the next line. It has only one output.
- Regular nodes can take in one string at a time, process it and send it to a set number of outputs. Each node can store a single string in `mem`. `mem` is the only variable which will persist between executions.
- Combiner nodes can merge multiple inputs into one output. It offers no options to choose which string goes through first, picking whatever comes first.
- Output nodes will consume the lines sent to it, storing it in a string.

## Features
- Basic arithmetic and boolean logic
- Variables - All variables are global in scope
- Indexing
    - Element_of: `v[i]`
    - Slice: `v[i:j]`
- Basic control flow (if-else)
- Native functions for things like:
    - String manipulation
    - Data conversion and parsing
- Dynamic typing between:
    - string
    - string[]
    - int
    - bool

Notably, there are **NO** loops within the scripting itself. No while. No for.
Execution will occur line by line and will only start when a node receives an input string to be processed.

## Syntax
Every line contains a single statement. All statements will start with a relevant keyword for the operation.
- SET: Sets a variable to a certain value. Variables do not need to be declared. Syntax: `SET <variable_name>, <expression>`
- PRINT: Sends a string to a specific output node, denoted by an index. Syntax: `PRINT <output_idx>, <expression>`
- RETURN: Ends the program (until the next input comes). Syntax: `RETURN`
- IF: Executes the following code if the given expression is true. Syntax `IF <expression>`
- ELSE: Executes the following code if the previous if statement was false. Syntax `ELSE`
- ENDIF: Marks the end of the IF clause. Either ends the IF code section or the ELSE code section. Only one is needed per IF/ELSE statement. Syntax `ENDIF`
- NOP: Does nothing. Helpful for synchronizing the timing of multiple nodes. Syntax `NOP`
