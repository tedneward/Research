title=Ante
tags=language, metaobject, llvm
summary=A compiled systems language focusing on providing extreme extensibility through the use of a compile-time API. Using such an API, compiler extensions can be created within the program itself, allowing for the addition of a garbage collector, ownership system, automatic linters, etc, all in a normal library without requiring any changes to the compiler itself.
~~~~~~

[Website](http://antelang.org/) | [Source](https://github.com/jfecher/ante) | [HN](https://news.ycombinator.com/item?id=31775216)

Ante is a low-level functional language for exploring refinement types, lifetime inference, and other fun features. In general, ante is low-level (no GC, values aren't boxed by default) while also trying to be as readable as possible by encouraging high-level approaches that can be optimized with low-level details later on.

Example:
```
//The 'ante' keyword declares compile-time values
ante
    labels = global mut empty Map

    goto lbl =
        label = lookup labels lbl ?
            None -> Ante.error "Cannot goto undefined label ${lbl}"

        Llvm.setInsertPoint (getCallSiteBlock ())
        Llvm.createBr label

    label name:Str =
        callingFn = getParentFn (getCallSiteBlock ())
        lbl = Llvm.BasicBlock(Ante.llvm_ctxt, callingFn)
        labels#name := lbl


//test it out
label "begin"
print "hello!"
goto "begin"
```
