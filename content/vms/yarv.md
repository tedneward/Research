title=YARV (Yet Another Ruby VM)
tags=vm, ruby
summary=The successor to the original Ruby VM (MRI).
~~~~~~

[Instruction docs](https://kddnewton.com/yarv/) | [Design Document](http://www.atdot.net/yarv/yarvarch.ja.html)

## Articles

* Compiling Ruby
	* [Part 0](https://lowlevelbits.org/compiling-ruby-part-0/)
	* [Part 1](https://lowlevelbits.org/compiling-ruby-part-1/)
* [A Tender Introduction to Ruby Internals with TenderJIT](https://www.hexdevs.com/posts/ruby-just-in-time-compiler-tenderjit/)
* [Inside RubyVM](https://sitaramshelke.medium.com/inside-rubyvm-967b25e234db)
* [Ruby source code complete explanation](https://i.loveruby.net/ja/rhg/book/) (Jul 2004) - Japanese text
* [YARV maniacs](https://magazine.rubyist.net/articles/0006/0006-YarvManiacs.html) - (May 2005) Japanese text 
* [The Ruby VM Serial Interview](http://graysoftinc.com/the-ruby-vm-interview/the-ruby-vm-serial-interview) - (Feb 2007) 
* [YARV instruction set](https://lifegoo.pluskid.org/upload/doc/yarv/yarv_iset.html) - (Apr 2008) 
* [How Ruby Executes Your Code (excerpt from Ruby Under a Microscope)](https://patshaughnessy.net/2012/6/29/how-ruby-executes-your-code) - (Jun 2012)
* [ko1's 2012 Ruby VM advent calendar](http://www.atdot.net/~ko1/diary/201212.html#d1) - (Dec 2012) Japanese text
* [Ruby made with Rust](https://qiita.com/sisshiki1969/items/3d25aa81a376eee2e7c2) - (Dec 2019) 
* [Evaluating Ruby in Ruby](https://iliabylich.github.io/2020/01/25/evaluating-ruby-in-ruby.html) - (Jan 2020) 

## [Bytecode set](https://lifegoo.pluskid.org/upload/doc/yarv/yarv_iset.html)

* `adjuststack`: accepts a single integer argument and removes that many elements from the top of the stack.
* `anytostring`: ensures that the value on top of the stack is a string.
* `branchif`: If the value popped off the stack is `true`, branchif jumps to the jump index and continues executing there.
* `branchnil`: If the value popped off the stack is `nil`, branchnil jumps to the jump index and continues executing there.
* `branchunless`: If the value popped off the stack is `false` or `nil`, branchunless jumps to the jump index and continues executing there.
* `concatarray`: concatenates the two Arrays on top of the stack.
* `concatstrings`: just pops a number of strings from the stack joins them together into a single string and pushes that string back on the stack.
* `defined`: checks if the top value of the stack is defined. If it is, it pushes its value onto the stack. Otherwise it pushes `nil`.
* `definemethod`: defines a method on the class of the current value of `self`.
* `dup`: copies the top value of the stack and pushes it onto the stack.
* `dup_hash`: pushes a hash onto the stack.
* `duparray`: copies a literal Array and pushes it onto the stack.
* `dupn`: duplicates the top n stack elements.
* `expandarray`: looks at the top of the stack, and if the value is an array it replaces it on the stack with num elements of the array, or nil if the elements are missing.
* `getconstant`: performs a constant lookup and pushes the value of the constant onto the stack.
* `getglobal`: pushes the value of a global variables onto the stack.
* `getlocal`: fetches the value of a local variable from a frame determined by the level and index arguments.
* `getlocal_wc_0`: is a specialized version of the getlocal instruction. It fetches the value of a local variable from the current frame determined by the index given as its only argument.
* `getlocal_wc_1`: is a specialized version of the getlocal instruction. It fetches the value of a local variable from the parent frame determined by the index given as its only argument.
* `intern`: converts top element from stack to a symbol.
* `invokeblock`: invokes the block passed to a method during a yield.
* `jump`: set PC to (PC + dst).
* `leave`: exits the current frame.
* `newarray`: puts a new array initialized with size values from the stack.
* `newhash`: puts a new hash onto the stack, using num elements from the stack. num needs to be even.
* `newrange`: creates a Range.
* `nop`: is a no-operation instruction.
* `objtostring`: pops a value from the stack, calls to_s on that value and then pushes the result back to the stack.
* `opt_and`: a specialization of the opt_send_without_block instruction that occurs when the & operator is used.
* `opt_aref`: a specialization of the opt_send_without_block instruction that occurs when the [] operator is used.
* `opt_aref_with`: a specialization of the opt_aref instruction that occurs when the [] operator is used with a string argument known at compile time.
* `opt_aset`: an instruction for setting the hash value by the key in recv[obj] = set format.
* `opt_aset_with`: an instruction for setting the hash value by the known string key in the recv[obj] = set format.
* `opt_case_dispatch`: a branch instruction that moves the control flow for case statements.
* `opt_div`: a specialization of the opt_send_without_block instruction that occurs when the / operator is used.
* `opt_empty_p`: an optimization applied when the method empty? is called on a String, Array or a Hash.
* `opt_eq`: a specialization of the opt_send_without_block instruction that occurs when the == operator is used.
* `opt_ge`: a specialization of the opt_send_without_block instruction that occurs when the >= operator is used.
* `opt_getinlinecache`: a wrapper around a series of getconstant instructions that allows skipping past them if the inline cache is currently set.
* `opt_gt`: a specialization of the opt_send_without_block instruction that occurs when the > operator is used.
* `opt_le`: a specialization of the opt_send_without_block instruction that occurs when the <= operator is used.
* `opt_length`: a specialization of opt_send_without_block, when the length method is called on a Ruby type with a known size.
* `opt_lt`: a specialization of the opt_send_without_block instruction that occurs when the < operator is used. 
* `opt_ltlt`: a specialization of the opt_send_without_block instruction that occurs when the << operator is used.
* `opt_minus`: a specialization of the opt_send_without_block instruction that occurs when the - operator is used.
* `opt_mod`: a specialization of the opt_send_without_block instruction that occurs when the % operator is used.
* `opt_mult`: a specialization of the opt_send_without_block instruction that occurs when the * operator is used.
* `opt_neq`: an optimisation that tests whether two values at the top of the stack are not equal by testing their equality and performing a logical NOT on the result.
* `opt_newarray_max`: an instruction that represents calling max on an array literal. It is used to optimize quick comparisons of array elements.
* `opt_newarray_min`: an instruction that represents calling min on an array literal.
* `opt_nil_p`: an optimization applied when the method nil? is called.
* `opt_not`: negates the value on top of the stack.
* `opt_or`: a specialization of the opt_send_without_block instruction that occurs when the | operator is used.
* `opt_plus`: a specialization of the opt_send_without_block instruction that occurs when the + operator is used.
* `opt_regexpmatch2`: a specialization of the opt_send_without_block instruction that occurs when the =~ operator is used.
* `opt_send_without_block`: a specialization of the send instruction that occurs when a method is being called without a block.
* `opt_setinlinecache`: the final instruction after a series of getconstant instructions that populates the inline cache associated with an opt_getinlinecache instruction.
* `opt_size`: a specialization of opt_send_without_block, when the size method is called on a Ruby type with a known size.
* `opt_str_freeze`: pushes a frozen known string value with no interpolation onto the stack.
* `opt_str_uminus`: pushes a frozen known string value with no interpolation onto the stack.
* `opt_succ`: a specialization of the opt_send_without_block instruction when the method being called is succ.
* `pop`: pops the top value off the stack.
* `putnil`: pushes a global nil object onto the stack.
* `putobject`: pushes a known value onto the stack.
* `putobject_int2fix_0`: pushes 0 on the stack. It is a specialized instruction resulting from the operand unification optimization. It is the equivalent to putobject 0.
* `putobject_int2fix_1`: pushes 1 on the stack. It is a specialized instruction resulting from the operand unification optimization. It is the equivalent to putobject 1.
* `putself`: pushes the current value of self onto the stack.
* `putstring`: pushes a string literal onto the stack.
* `send`: invokes a method with a block.
* `setglobal`: sets the value of a global variable.
* `setlocal`: sets the value of a local variable on a frame determined by the level and index arguments. The level is the number of frames back to look and the index is the index in the local table. It pops the value it is setting off the stack.
* `setlocal_wc_0`: a specialized version of the setlocal instruction. It sets the value of a local variable on the current frame to the value at the top of the stack as determined by the index given as its only argument.
* `setlocal_wc_1`: a specialized version of the setlocal instruction. It sets the value of a local variable on the parent frame to the value at the top of the stack as determined by the index given as its only argument.
* `setn`: an instruction for set Nth stack entry to stack top.
* `splatarray`: calls to_a on an array to splat.
* `swap`: swaps the top two elements in the stack.
* `topn`: has one argument: n. It gets the nth element from the top of the stack and pushes it on the stack.
* `toregexp`: is generated when string interpolation is used inside a regex literal //. It pops a defined number of values from the stack, combines them into a single string and coerces that string into a Regexp object, which it pushes back onto the stack.

## Tools

* [YARV emulator written in Ruby](https://github.com/kddnewton/yarv)
