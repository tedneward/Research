title=Code Generation
tags=language development,language,reading
summary=Information on how to generate code (binary or source)
~~~~~~

Notes from a Walter Bright talk at Northwest C++ Group (16 Jan 2025):

Link to slides?

* No real reading material out in the world for CodeGen (as opposed to parsing/lexing, semantics, etc)
* Talking about DMD's CodeGen; not based on any prior art (LLVM, Gnu, etc); Boost-licensed
* Understanding code generator is understanding their data structures
* Expression Tree Structure: operation, type, flags, count, comsub, plus union (for constants, values, etc)
* (Compile DMD sample functions w/ --b to dump trees, --b --f with full disclosure)
* Block Tree Structure: goto/iftrue/ret/retexp, expression tree, (list) next block to execute, next block in fn, genned code
* Code Structure: next, flags, lop (operator), lea (effective address), IFL1 (), IEV1 (), IFL2 (), IEV2 ()
* Local optimizations: doing expression reshuffling to save a register

    - two pairs of addition expressions, results added to each other (a + b) + (c + d), rewrite it to (((a + b) + c) + d) we can just keep accumulating in the one register
    - Is this term rewriting?
    - common subexpressions: (2 * b) / (3 + (2 * b)) can point the two (2 * b) nodes to point to one w/reference counting

* Register Masks (integer, FP, XMM, regs preserved by fn, regs we'd like to save); makes for a very fast codegenerator
* Effective Address:

    - offset
    - base register + offset
    - base + index * scale + offset

* Entry Point - dout.writefunc() (operates on per-fn basis); sets up symtabl, (optionally) runs intermediate code optimizer (dataflow analysis), calls codegen() (the code generator), shuts down and emits debug info, saves results for possible inlining
* Code Generator:

    - If optimized, loop:
    
        - Generate code in depth-first order (not dataflow analysis(DFA))
        - allocate unused registers to variables (until no more regs can be allocated)
    
    - else:

        - loop through block list generating code in that order

* Code Generator pt 2:

    - Compute locations of local vars
    - Generate fn prolog and epilog
    - assign addresses in genned code
    - pinhole optimizations: optimize specific instructions to a simpler instructions where possible
    - optimize jumps
    - generate switch tables
    - emit genned code




Research terms:

- "peephole" optimizations: replace an instruction or set of instructions w/simpler instruction
- Term rewriting?
- Dataflow Analysis (DFA)
- Register allocation by coloring (bitmasking)
