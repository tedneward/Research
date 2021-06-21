title=Ecstasy (XTC)
tags=language, vm, compiled, service, cloud, distribution
summary=An object-ish language designed to be cloud native from the ground up.
~~~~~~

[Website](http://xtclang.org/) | [Blog](https://xtclang.blogspot.com/) | [Source](https://github.com/xtclang/)

> Ecstasy is a new, general-purpose, programming language, designed for modern cloud architectures, and explicitly for the serverless cloud. Actually, to be completely honest, it's the most amazing programming language ever. No, really, it's that awesome.

> The Ecstasy project includes a development kit (XDK) that is produced out of this repository, a programming language specification, a core set of runtime modules (libraries), a portable, type-safe, and verifiable Intermediate Representation (IR), a proof-of-concept runtime (with an adaptive LLVM-based optimizing compiler in development), and a tool-chain with both Java and Ecstasy implementations being actively developed.

> The Ecstasy language supports first class modules, including versioning and conditionality; first class functions, including currying and partial application; type-safe object orientation, including support for auto-narrowing types, type-safe covariance, mixins, and duck-typed interfaces; complete type inference; first class immutable types; first class asynchronous services, including both automatic async/await-style and promises-based (@Future) programming models; and first class software containers, including resource injection and transitively-closed, immutable type systems. And much, much more.

## Articles
[InfoQ](https://www.infoq.com/articles/xtc-lang/)
[TheServerSide](https://www.theserverside.com/news/252471233/Ecstasy-programming-language-targets-cloud-native-computing)
[yC](https://news.ycombinator.com/item?id=21481958)


## Examples
**[HelloWorld](https://github.com/xtclang/xvm/blob/master/doc/examples/HelloWorld.x)**
```
module HelloWorld
    {
    void run()
        {
        @Inject Console console;
        console.println("Hello World!");
        }
    }
```

**[FizzBuzz](https://github.com/xtclang/xvm/blob/master/doc/examples/FizzBuzz.x)**
```
module FizzBuzz
    {
    void run()
        {
        @Inject Console console;
        for (Int x : 1..100)
            {
            console.println(switch (x % 3, x % 5)
                {
                case (0, 0): "FizzBuzz";
                case (0, _): "Fizz";
                case (_, 0): "Buzz";
                case (_, _): x.toString();
                });
            }
        }
    }
```

**[Example1.x](https://github.com/xtclang/xvm/blob/master/doc/examples/Example1.x)**
```
module Example1
    {
    @Inject Console console;

    void run()
        {
        console.println("Hello world!");

        @Inject ecstasy.Timer timer;
        timer.reset();

        @Inject FileStore storage;
        console.println($"root={storage.root} capacity={storage.capacity}");

        @Inject Clock clock;
        console.println(clock.now);

        console.println($"Elapsed {timer.elapsed.milliseconds} ms");
        }
    }
```

**[Example3.x](https://github.com/xtclang/xvm/blob/master/doc/examples/Example3.x)**
```
module Example3
    {
    const Person(String name, Int age);

    interface AgeAware
        {
        Int age;
        }

    mixin AverageAgeCalculator
            into Array<AgeAware>
        {
        Int average()
            {
            Int sum = 0;
            for (AgeAware el : this)
                {
                sum += el.age;
                }
            return size == 0 ? 0 : sum/size;
            }
        }

    interface Extract<Element>
        {
        List insertAll(Int index, Iterable<Element> values);
        }

    void run()
        {
        @Inject Console console;

        // for exactly the same reason (Iterator is a producer now) the two below don't compile
        // Extract<AgeAware> array = new Array<Person>();
        // val calc = new @AverageAgeCalculator Array<Person>();

        val calc = new @AverageAgeCalculator Array<AgeAware>();

        calc += new Person("Bob", 31);
        calc += new Person("Sue", 25);

        console.println(calc.average());
        }
    }
```

## XVM
XTC Virtual Machine?

### [Opcodes](https://github.com/xtclang/xvm/blob/master/doc/ops.txt)
```
// fundamentals
+NOP                                                ; traditional no-op (i.e. it does nothing)
+LINE_1                                             ; advance source code line counter by 1 line
+LINE_2                                             ; advance source code line counter by 2 line
+LINE_3                                             ; advance source code line counter by 3 line
+LINE_N     #lines                                  ; advance source code line counter by n lines
+ENTER                                              ; variable scope begin
+EXIT                                               ; variable scope end
+GUARD      #handlers:(TYPE, STRING, addr)          ; try { (+ catch type, var name, handler address) (implicit ENTER)
+GUARD_E    addr                                    ; } ... // ("E"=) end guarded block with a jump (implicit EXIT)
+CATCH                                              ; begin an exception handler (implicit ENTER and VAR_IN for exception)
+CATCH_E    addr                                    ; ("E"=) end an exception handler with a jump (implicit EXIT)
+GUARDALL   addr                                    ; try { (+ "finally" address (implicit ENTER, also intercepts boundary-crossing-jumps and returns)
+FINALLY                                            ; begin a "finally" handler (implicit EXIT/ENTER and VAR_I of type "Exception?")
+FINALLY_E                                          ; ("E"=) end  a "finally" handler (implicit EXIT)
+THROW      rvalue                                  ; raise exception

// function calls
// rvalue-fn, rvalue-param and lvalue-return support "local property" mode
// return values can specify the "next register" to allocate
// - first digit is # params: 0, 1, n, or "t"=tuple
// - second digit is # returns: 0, 1, n, or "t"=tuple
+CALL_00    rvalue-fn
+CALL_01    rvalue-fn, lvalue-return
+CALL_0N    rvalue-fn, #:(lvalue)
+CALL_0T    rvalue-fn, lvalue-treturn
+CALL_10    rvalue-fn, rvalue-param
+CALL_11    rvalue-fn, rvalue-param, lvalue-return
+CALL_1N    rvalue-fn, rvalue-param, #:(lvalue)
+CALL_1T    rvalue-fn, rvalue-param, lvalue-treturn
+CALL_N0    rvalue-fn, #:(rvalue)
+CALL_N1    rvalue-fn, #:(rvalue), lvalue-return
+CALL_NN    rvalue-fn, #:(rvalue), #:(lvalue)
+CALL_NT    rvalue-fn, #:(rvalue), lvalue-treturn
+CALL_T0    rvalue-fn, rvalue-tparams
+CALL_T1    rvalue-fn, rvalue-tparams, lvalue-return
+CALL_TN    rvalue-fn, rvalue-tparams, #:(lvalue)
+CALL_TT    rvalue-fn, rvalue-tparams, lvalue-treturn

// method calls ("NVOK"=invoke)
// REVIEW rvalue-target should not support lprops
// lvalue-param and lvalue-return support "local property" mode
// return values can specify the "next register" to allocate
// - first digit is # params: 0, 1, n, or tuple
// - second digit is # returns: 0, 1, n, or tuple
+NVOK_00    rvalue-target, METHOD
+NVOK_01    rvalue-target, METHOD, lvalue-return
+NVOK_0N    rvalue-target, METHOD, #:(lvalue)
+NVOK_0T    rvalue-target, METHOD, lvalue-treturn
+NVOK_10    rvalue-target, METHOD, rvalue-param
+NVOK_11    rvalue-target, METHOD, rvalue-param, lvalue-return
+NVOK_1N    rvalue-target, METHOD, rvalue-param, #returns:(lvalue)
+NVOK_1T    rvalue-target, METHOD, rvalue-param, lvalue-treturn
+NVOK_N0    rvalue-target, METHOD, #:(rvalue)
+NVOK_N1    rvalue-target, METHOD, #:(rvalue), lvalue-return
+NVOK_NN    rvalue-target, METHOD, #:(rvalue), #:(lvalue)
+NVOK_NT    rvalue-target, METHOD, #:(rvalue), lvalue-treturn
+NVOK_T0    rvalue-target, METHOD, rvalue-tparams
+NVOK_T1    rvalue-target, METHOD, rvalue-tparams, lvalue-return
+NVOK_TN    rvalue-target, METHOD, rvalue-tparams, #:(lvalue)
+NVOK_TT    rvalue-target, METHOD, rvalue-tparams, lvalue-treturn

// method and function binding
// - does NOT support "local property" mode nor "next register"  REVIEW why not? agreed that rvalue-target and rvalue-param must not support lprops
+BIND_M      rvalue-target, METHOD, lvalue-fn-result
+BIND_F      rvalue-fn, #params:(param-index, rvalue-param), lvalue-fn-result

// construct calls
 SYN_INIT                                                           ; default initializer
+CONSTR_0   CONSTRUCT                                               ; "super" construct call
+CONSTR_1   CONSTRUCT, rvalue-param
+CONSTR_N   CONSTRUCT, #params:(rvalue)
 CONSTR_T   CONSTRUCT, rvalue-tparams

// construction
// ("G"=) generic types; ("C"=) child classes;
// - rvalue parameters can be registers, constant values, or local-property indicators (PROPERTY)
// - lvalue will hold the newly constructed object
// - the lvalue can be a register or a local-property indicator (PROPERTY)
// - a new register of the constructed type is allocated if the lvalue is the next unallocated register
+NEW_0      CONSTRUCT, lvalue                                       ; simple "new"
+NEW_1      CONSTRUCT, rvalue-param, lvalue
+NEW_N      CONSTRUCT, #:(rvalue), lvalue
+NEW_T      CONSTRUCT, rvalue-tparams, lvalue
+NEWG_0     CONSTRUCT, TYPE, lvalue                                 ; generic-type "new"
+NEWG_1     CONSTRUCT, TYPE, rvalue-param, lvalue
+NEWG_N     CONSTRUCT, TYPE, #:(rvalue), lvalue
+NEWG_T     CONSTRUCT, TYPE, rvalue-tparams, lvalue
+NEWC_0     CONSTRUCT, rvalue-parent, lvalue                        ; virtual "new" for child classes
+NEWC_1     CONSTRUCT, rvalue-parent, rvalue-param, lvalue
+NEWC_N     CONSTRUCT, rvalue-parent, #:(rvalue), lvalue
 NEWC_T     CONSTRUCT, rvalue-parent, rvalue-tparams, lvalue
+NEWCG_0    CONSTRUCT, rvalue-parent, TYPE, lvalue                  ; virtual generic-type "new" for child classes
+NEWCG_1    CONSTRUCT, rvalue-parent, TYPE, rvalue-param, lvalue
+NEWCG_N    CONSTRUCT, rvalue-parent, TYPE, #:(rvalue), lvalue
 NEWCG_T    CONSTRUCT, rvalue-parent, TYPE, rvalue-tparams, lvalue
+NEWV_0     CONSTRUCT, rvalue-type, lvalue                          ; virtual "new"
+NEWV_1     CONSTRUCT, rvalue-type, rvalue-param, lvalue            ;  - CONSTRUCT may be on an interface (implies compile-time type)
+NEWV_N     CONSTRUCT, rvalue-type, #:(rvalue), lvalue              ;  - rvalue-type is the virtual type
 NEWV_T     CONSTRUCT, rvalue-type, rvalue-tparams, lvalue

// returns
// - rvalues support a local-property mode
+RETURN_0                                           ; return (no return value)
+RETURN_1   rvalue                                  ; return (single return value)
+RETURN_N   #vals:(rvalue)                          ; return (multiple return value)
+RETURN_T   rvalue-tuple                            ; return (multiple return from a tuple)

// next register allocation (variables, including refs)
// - does NOT support "local property" mode
+VAR        TYPE                                    ; uninitialized anonymous variable
+VAR_I      TYPE, rvalue-src                        ; ("I"=) initialized anonymous variable
+VAR_N      TYPE, STRING                            ; uninitialized ("N"=) named variable
+VAR_IN     TYPE, STRING, rvalue-src                ; ("I"=) initialized ("N"=) named variable
+VAR_D      TYPE                                    ; anonymous ("D"=) dynamic reference
+VAR_DN     TYPE, STRING                            ; ("N"=) named ("D"=) dynamic reference
-VAR_C      rvalue-ref                              ; ("C"=) capture variable: rvalue must be of type Ref or Var; local property mode is supported
-VAR_CN     rvalue-ref, STRING                      ; ("N"=) named ("C"=) capture variable: rvalue must be of type Ref or Var; local property mode is supported
+VAR_S      TYPE, #values:(rvalue)                  ; initialized anonymous ("S"=) Sequence variable
+VAR_SN     TYPE, STRING, #values:(rvalue)          ; initialized ("N"=) named ("S"=) Sequence variable
+VAR_T      TYPE. #values:(rvalue)                  ; initialized anonymous ("T"=) Tuple variable
+VAR_TN     TYPE, STRING, #values:(rvalue)          ; initialized ("N"=) named ("T"=) Tuple variable
+VAR_M      TYPE, #entries:(rvalue, rvalue)         ; initialized anonymous ("M"=) Map variable
+VAR_MN     TYPE, STRING, #entries:(rvalue, rvalue) ; initialized ("N"=) named ("M"=) Map variable

// "move" operations
// - rvalues do NOT support "local property" mode;
// - the lvalue can be a register or a local-property indicator (PROPERTY)
// - lvalue-dest can be a next unallocated register
// - for MOV the source could be unassigned
+MOV        rvalue-src, lvalue-dest                 ; copy source to destination ("protection" proxy may be generated)
+MOV_VAR    rvalue-src, lvalue-dest                 ; move ("R"=) Var-to-source to destination
+MOV_REF    rvalue-src, lvalue-dest                 ; move ("R"=) Ref-to-source to destination (read-only)
+MOV_THIS   #, lvalue-dest                          ; # (an inline unsigned byte) specifies the count of this-to-outer-this steps (0=this, 1=ImmediatelyOuter.this, etc.)
+MOV_THISA  #, lvalue-dest, A_*                     ; same as above with an additional access modifier (A_TARGET, A_PUBLIC, A_PROTECTED, A_PRIVATE)
+MOV_TYPE   rvalue-src, lvalue-dest                 ; place the type of the r-value into the l-value
+CAST       rvalue-src, lvalue-dest, TYPE           ; copy source to destination with cast

// Value comparisons (mostly Boolean checks)
// - rvalues support a local-property mode
// - lvalue return values can specify the "next register" to allocate
+CMP        rvalue1, rvalue2, lvalue-return         ; T <=> T -> Ordered
+IS_ZERO    rvalue-int, lvalue-return               ; T == 0 -> Boolean
+IS_NZERO   rvalue-int, lvalue-return               ; T != 0 -> Boolean
+IS_NULL    rvalue, lvalue-return                   ; T == null -> Boolean
+IS_NNULL   rvalue, lvalue-return                   ; T != null -> Boolean
+IS_EQ      rvalue, rvalue, lvalue-return           ; T == T -> Boolean
+IS_NEQ     rvalue, rvalue, lvalue-return           ; T != T -> Boolean
+IS_LT      rvalue, rvalue, lvalue-return           ; T < T -> Boolean
+IS_LTE     rvalue, rvalue, lvalue-return           ; T <= T -> Boolean
+IS_GT      rvalue, rvalue, lvalue-return           ; T > T -> Boolean
+IS_GTE     rvalue, rvalue, lvalue-return           ; T >= T -> Boolean
+IS_NOT     rvalue, lvalue-return                   ; !T -> Boolean
+IS_TYPE    rvalue, rvalue-type, lvalue-return      ; T instanceof Type -> Boolean
+IS_NTYPE   rvalue, rvalue-type, lvalue-return      ; !(T instanceof Type) -> Boolean
+IS_SVC     rvalue, lvalue-return                   ; (T is a service) -> Boolean
+IS_CONST   rvalue, lvalue-return                   ; (T is a const) -> Boolean
+IS_IMMUT   rvalue, lvalue-return                   ; (T is an immutable) -> Boolean

// jumps (all addresses are relative to the PC of the jump op)
// - rvalues support a local-property mode
+JMP        addr                                    ; unconditional relative jump
+JMP_TRUE   rvalue, addr                            ; jump if Boolean value is Boolean.True
+JMP_FALSE  rvalue, addr                            ; jump if Boolean value is Boolean.False
+JMP_ZERO   rvalue, addr                            ; jump if value is zero
+JMP_NZERO  rvalue, addr                            ; jump if value is NOT zero
+JMP_NULL   rvalue, addr                            ; jump if value is null
+JMP_NNULL  rvalue, addr                            ; jump if value is NOT null
+JMP_EQ     rvalue1, rvalue2, addr                  ; jump if value-1 is equal to value-2
+JMP_NEQ    rvalue1, rvalue2, addr                  ; jump if value-1 is NOT equal to value-2
+JMP_LT     rvalue1, rvalue2, addr                  ; jump if value-1 is less than value-2
+JMP_LTE    rvalue1, rvalue2, addr                  ; jump if value-1 is less than or equal to value-2
+JMP_GT     rvalue1, rvalue2, addr                  ; jump if value-1 is greater than value-2
+JMP_GTE    rvalue1, rvalue2, addr                  ; jump if value-1 is greater than or equal to value-2
+JMP_TYPE   rvalue, TYPE, addr                      ; jump if type of the value is “instanceof" specified type
+JMP_NTYPE  rvalue, TYPE, addr                      ; jump if type of the value is NOT “instanceof" specified type
+JMP_COND   COND, addr                              ; jump if the link-time condition evaluates to True
+JMP_NCOND  COND, addr                              ; jump if the link-time condition evaluates to False
+JMP_NFIRST addr                                    ; jump if this is NOT the first time the op has been executed
+JMP_NSAMPL rvalue, addr                            ; jump if this is NOT a selected sample based on the rvalue sample rate (a compile-time or run-time constant)
+JMP_INT    rvalue, offset, #:(addr), addr-default      ; if (value - offset) equals (0,1,2,...), jump to corresponding address, otherwise default
+JMP_VAL    rvalue, #:(CONST, addr), addr-default       ; if value equals a constant, jump to address, otherwise default
-JMP_VAL_N  #:(rvalue), #:(CONST, addr), addr-default   ; if values equals fields of a tuple constant, jump to address, otherwise default

// asserts
// (specifying CONSTRUCT as A_IGNORE implies a breakpoint only, and not a raised exception)
+ASSERT     rvalue, CONSTRUCT                       ; assert boolean (zero parameter exception constructor)
+ASSERT_M   rvalue, CONSTRUCT, STRING               ; assert with a ("M"=) message (one String parameter exception constructor)
+ASSERT_V   rvalue, CONSTRUCT, STRING, #vals(rvalue); assert with a message and ("V"=) values to print (one String parameter exception constructor)

// ("GP"=) general purpose register/local-property operations:
// - rvalues could be a register or a constant value or a local-property indicator (PROPERTY)
// - the lvalue(s) can be a register or a local-property indicator (PROPERTY)
// - a new register of type T is allocated if the lvalue is the next unallocated register
+GP_ADD      rvalue1, rvalue2, lvalue                ; T + T -> T
+GP_SUB      rvalue1, rvalue2, lvalue                ; T - T -> T
+GP_MUL      rvalue1, rvalue2, lvalue                ; T * T -> T
+GP_DIV      rvalue1, rvalue2, lvalue                ; T / T -> T
+GP_MOD      rvalue1, rvalue2, lvalue                ; T % T -> T
+GP_SHL      rvalue1, rvalue2, lvalue                ; T << Int -> T
+GP_SHR      rvalue1, rvalue2, lvalue                ; T >> Int -> T
+GP_USHR     rvalue1, rvalue2, lvalue                ; T >>> Int -> T
+GP_AND      rvalue1, rvalue2, lvalue                ; T & T -> T
+GP_OR       rvalue1, rvalue2, lvalue                ; T | T -> T
+GP_XOR      rvalue1, rvalue2, lvalue                ; T ^ T -> T
+GP_DIVREM   rvalue1, rvalue2, lvalue-quotient, lvalue-remainder; T /% T -> T, T
+GP_DOTDOT   rvalue1, rvalue2, lvalue                ; T .. T -> Range<T>   (inclusive end)
+GP_DOTDOTEX rvalue1, rvalue2, lvalue                ; T .. T -> Range<T>   (exclusive end)
+GP_NEG      rvalue, lvalue                          ; -T -> T
+GP_COMPL    rvalue, lvalue                          ; ~T -> T

// ("L"=) local property and ("P"=) property load/store operations
// - lvalue return values can specify the "next register" to allocate
// - for P_GET and P_REF, an rvalue-target of "black hole" indicates a constant property
+L_GET       PROPERTY, lvalue                        ; get local property (move local property value to a register or local property)
+L_SET       PROPERTY, rvalue                        ; set local property (move register value to local property)
+P_GET       PROPERTY, rvalue-target, lvalue         ; get property (move target property value to a register or local property)
+P_SET       PROPERTY, rvalue-target, rvalue         ; set property (move register value to target property)
+P_VAR       PROPERTY, rvalue-target, lvalue-dest    ; move Var-to-property to destination
+P_REF       PROPERTY, rvalue-target, lvalue-dest    ; move Ref-to-property to destination

// register/local-property inc/dec ("A"=after, aka "post" / "B"=before, aka "pre"):
// - the lvalue-target indicates the register or the local-property indicator (PROPERTY)
// - the lvalue can be a register or a local-property indicator (PROPERTY)
// - a new register of type T is allocated if the lvalue is the next unallocated register
+IP_INC      lvalue-target                           ; in-place increment; no result
+IP_DEC      lvalue-target                           ; in-place decrement; no result
+IP_INCA     lvalue-target, lvalue                   ; T++ -> T
+IP_DECA     lvalue-target, lvalue                   ; T-— -> T
+IP_INCB     lvalue-target, lvalue                   ; ++T -> T
+IP_DECB     lvalue-target, lvalue                   ; --T -> T

// ("IP"=) in-place ("___ and assign") ops:
// - the lvalue can be a register or a local-property indicator (PROPERTY)
// - the rvalue can be a register or a constant value or a local-property indicator (PROPERTY)
+IP_ADD      lvalue, rvalue2                         ; T += T
+IP_SUB      lvalue, rvalue2                         ; T -= T
+IP_MUL      lvalue, rvalue2                         ; T *= T
+IP_DIV      lvalue, rvalue2                         ; T /= T
+IP_MOD      lvalue, rvalue2                         ; T %= T
+IP_SHL      lvalue, rvalue2                         ; T <<= Int
+IP_SHR      lvalue, rvalue2                         ; T >>= Int
+IP_USHR     lvalue, rvalue2                         ; T >>>= Int
+IP_AND      lvalue, rvalue2                         ; T &= T
+IP_OR       lvalue, rvalue2                         ; T |= T
+IP_XOR      lvalue, rvalue2                         ; T ^= T

// ("P"=) property ("IP"=) in-place inc/dec:
// - the rvalue-target indicates the object on which to get/set the property value
// - the rvalue-target supports the "local property" mode
// - the lvalue return value can be a register or a local-property indicator (PROPERTY)
// - lvalue return values can specify the "next register" to allocate
+PIP_INC     PROPERTY, rvalue-target                 ; in-place increment; no result
+PIP_DEC     PROPERTY, rvalue-target                 ; in-place decrement; no result
+PIP_INCA    PROPERTY, rvalue-target, lvalue         ; T++ -> T
+PIP_DECA    PROPERTY, rvalue-target, lvalue         ; T-- -> T
+PIP_INCB    PROPERTY, rvalue-target, lvalue         ; ++T -> T
+PIP_DECB    PROPERTY, rvalue-target, lvalue         ; --T -> T

// ("IP"=) in-place ("___ and assign") ("P"=) property ops:
// - the rvalue-target indicates the object on which to get/set the property value
// - the rvalue-target supports the "local property" mode
// - the rvalue2 can be a register or a constant value or a local-property indicator (PROPERTY)
+PIP_ADD     PROPERTY, rvalue-target, rvalue2        ; T += T
+PIP_SUB     PROPERTY, rvalue-target, rvalue2        ; T -= T
+PIP_MUL     PROPERTY, rvalue-target, rvalue2        ; T *= T
+PIP_DIV     PROPERTY, rvalue-target, rvalue2        ; T /= T
+PIP_MOD     PROPERTY, rvalue-target, rvalue2        ; T %= T
+PIP_SHL     PROPERTY, rvalue-target, rvalue2        ; T <<= Int
+PIP_SHR     PROPERTY, rvalue-target, rvalue2        ; T >>= Int
+PIP_USHR    PROPERTY, rvalue-target, rvalue2        ; T >>>= Int
+PIP_AND     PROPERTY, rvalue-target, rvalue2        ; T &= T
+PIP_OR      PROPERTY, rvalue-target, rvalue2        ; T |= T
+PIP_XOR     PROPERTY, rvalue-target, rvalue2        ; T ^= T

// ("I"=) index-based (tuple and single-dimensioned array) ops
// - all rvalues support the "local property" mode
// - lvalue return values can specify the "next register" to allocate
+I_GET       rvalue-target, rvalue-ix, lvalue        ; T = T[ix]
+I_SET       rvalue-target, rvalue-ix, rvalue        ; T[ix] = T

// ("I"=) index-based ("IP"=) in-place ops:
+IIP_INC     rvalue-target, rvalue-ix                ; ++T[ix] (no result)
+IIP_DEC     rvalue-target, rvalue-ix                ; --T[ix] (no result)
+IIP_INCA    rvalue-target, rvalue-ix, lvalue        ; T[ix]++ -> T
+IIP_DECA    rvalue-target, rvalue-ix, lvalue        ; T[ix]-— -> T
+IIP_INCB    rvalue-target, rvalue-ix, lvalue        ; ++T[ix] -> T
+IIP_DECB    rvalue-target, rvalue-ix, lvalue        ; --T[ix] -> T
+IIP_ADD     rvalue-target, rvalue-ix, rvalue2       ; T[ix] += T
+IIP_SUB     rvalue-target, rvalue-ix, rvalue2
+IIP_MUL     rvalue-target, rvalue-ix, rvalue2
+IIP_DIV     rvalue-target, rvalue-ix, rvalue2
+IIP_MOD     rvalue-target, rvalue-ix, rvalue2
+IIP_SHL     rvalue-target, rvalue-ix, rvalue2
+IIP_SHR     rvalue-target, rvalue-ix, rvalue2
+IIP_USHR    rvalue-target, rvalue-ix, rvalue2
+IIP_AND     rvalue-target, rvalue-ix, rvalue2
+IIP_OR      rvalue-target, rvalue-ix, rvalue2
+IIP_XOR     rvalue-target, rvalue-ix, rvalue2

// ("M"=) multi-dimensioned array ops
 M_GET       rvalue-target, #:(rvalue-ix), lvalue    ; T = T[ix*]
 M_SET       rvalue-target, #:(rvalue-ix), rvalue    ; T[ix*] = T
 M_VAR       rvalue-target, #:(rvalue-ix), lvalue    ; Var<T> = &T[ix*]
 M_REF       rvalue-target, #:(rvalue-ix), lvalue    ; Ref<T> = &T[ix*]

// ("M"=) multi-dimensioned array ("IP"=) in-place ops:
 MIP_INC     rvalue-target, #:(rvalue-ix)            ; ++T[ix] (no result)
 MIP_DEC     rvalue-target, #:(rvalue-ix)            ; --T[ix] (no result)
 MIP_INCA    rvalue-target, #:(rvalue-ix), lvalue    ; T[ix]++ -> T
 MIP_DECA    rvalue-target, #:(rvalue-ix), lvalue    ; T[ix]-— -> T
 MIP_INCB    rvalue-target, #:(rvalue-ix), lvalue    ; ++T[ix] -> T
 MIP_DECB    rvalue-target, #:(rvalue-ix), lvalue    ; --T[ix] -> T
 MIP_ADD     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_SUB     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_MUL     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_DIV     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_MOD     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_SHL     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_SHR     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_USHR    rvalue-target, #:(rvalue-ix), rvalue2
 MIP_AND     rvalue-target, #:(rvalue-ix), rvalue2
 MIP_OR      rvalue-target, #:(rvalue-ix), rvalue2
 MIP_XOR     rvalue-target, #:(rvalue-ix), rvalue2



pre-defined variables/constants:
index  r/w  name            type        description
-----  ---  --------------  ----------  ------------------------------------------------
-0x01  r/w  (n/a)           auto        frame-local stack; auto type: each pop/read *MUST* correspond 1:1 with a previous push/write
-0x02   w   (n/a)           any         black hole (basically the /dev/null of registers)
-0x03   r   this:target                 the "this" that was used to invoke the method                             (only in virtual context)
-0x04   r   this:public                 type is meta.PublicType                                                   (only in virtual context)
-0x05   r   this:protected              type is meta.ProtectedType                                                (only in virtual context)
-0x06   r   this:private                type is meta.PrivateType                                                  (only in virtual context)
-0x07   r   this:struct     Struct      type is meta.StructType                                                   (only in virtual or construct context)
-0x08   r   this:service	Service     the run-time service within which the currently executing code is running (any context permitted)
-0x09   r   super           Function    type is the appropriate compile-time generic form                         (only in virtual context)
-0x0A       (n/a)                       *reserved
-0x0B       (n/a)                       *reserved
-0x0C       (n/a)                       *reserved
-0x0D       (n/a)                       *reserved
-0x0E       (n/a)                       *reserved
-0x0F       (n/a)                       *reserved
-0x10       (n/a)                       *reserved
```