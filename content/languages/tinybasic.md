title=TinyBasic
tags=language
summary=A family of dialects of the BASIC programming language that can fit into 4 or fewer KBs of memory.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Tiny_BASIC)

### EBNF

```
line ::= number statement CR | statement CR

statement ::=   PRINT expr-list
                IF expression relop expression THEN statement
                GOTO expression
                INPUT var-list
                LET var = expression
                GOSUB expression
                RETURN
                CLEAR
                LIST
                RUN
                END

expr-list ::= (string|expression) (, (string|expression) )*

var-list ::= var (, var)*

expression ::= (+|-|ε) term ((+|-) term)*

term ::= factor ((*|/) factor)*

factor ::= var | number | (expression)

var ::= A | B | C ... | Y | Z

number ::= digit digit*

digit ::= 0 | 1 | 2 | 3 | ... | 8 | 9

relop ::= < (>|=|ε) | > (<|=|ε) | =

string ::= " ( |!|#|$ ... -|.|/|digit|: ... @|A|B|C ... |X|Y|Z)* "
```

### Virtual Machine implementation notes
The following table gives a partial list of the 32 commands of the virtual machine in which the first Tiny BASIC interpreter was written.

**TST *lbl*, *string***: If string matches the BASIC line, advance cursor over string and execute the next IL instruction; if the test fails, execute the IL instruction at the label lbl
**CALL *lbl***: Execute the IL subroutine starting at lbl; save the IL address following the CALL on the control stack
**DONE**: Report a syntax error if after deleting leading blanks the cursor is not positioned to reach a carriage return
**XFER**: Test value at the top of the AE stack to be within range. If not, report an error. If so, attempt to position cursor at that line. If it exists, begin interpretation there; if not, report an error.
**JUMP *lbl***: Continue execution of the IL at the label specified
**RTN**: Return to the IL location specified at the top of the control stack
**PRS**: Print characters from the BASIC text up to but not including the closing quotation mark
**PRN**: Print number obtained by popping the top of the expression stack
**SPC**: Insert spaces to move the print head to next zone
**NLINE**: Output a CRLF to the printer

