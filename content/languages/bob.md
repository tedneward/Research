title=Bob
tags=language
summary=Bob is a simple object-oriented scripting language. Bob’s syntax is similar to C or C++ but it is dynamically typed and has automatic memory management.
~~~~~~

[Source](https://github.com/dbetz/bob)

---

*This article originally appeared in Dr Dobb's, and was cut over from . All rights respective of their owners; I copy it here merely for my own archival purposes.*

### SP 94: Bob: A Tiny Object-Oriented Language

#### C++? Smalltalk? What About Bob?

*David Betz*

<p><i><a name="025e_00d6"><a name="025e_0000">David is a contributing editor for DDJ, and the author of XLisp, XScheme, and other languages. He can be reached through the DDJ offices.</i></p><hr><P>
When I first started reading <I>Dr. Dobb's</I> back in the '70s, the articles I looked forward to the most were those describing tiny programming languages. First there were tiny implementations of Basic for various microprocessors, then small implementations of C and Forth, and even a tiny language for the control of robots. These articles intrigued me because they not only described a language, but also included complete source code for its implementation. I've always been interested in how programming languages are constructed, and this gave me an opportunity to look inside and see how things worked. Eventually, I decided to try my own hand at building languages.<P>
Since then, I've built many different types of languages, ranging from simple assemblers to complete Lisp systems. This article describes my latest creation, a C-like, object-oriented language I call &quot;Bob.&quot; Unlike the popular Small C compiler by Ron Cain, it isn't a strict subset of C or C++; hence it isn't possible to compile Bob programs with a standard C or C++ compiler. Instead, Bob is an interpreter for a language with C-like syntax and a class system similar to C++, but without variable typing and mostly without declarations. In a sense, Bob is a combination of C++ and Lisp.<P>
<h3><a name="025e_00d8">Writing a Bob Program<a name="025e_00d8"></h3><P>
Before I begin describing Bob in detail, let's discuss how you go about writing Bob programs. <a href="#025e_00dd">Example 1(a)</A> presents a simple example program--a function for computing factorials--written in Bob.<P>
This function definition looks a lot like its C counterpart. The only noticeable difference is the lack of a declaration for the type of the parameter <I>n</I> and for the return type of the function. Variable types do not need to be declared in Bob. Any variable can take on a value of any type. There is no need for type declarations.<P>
To take this further, <a href="#025e_00dd">Example 1(b)</A> shows a program that uses the factorial function in <a href="#025e_00dd">Example 1(a)</A> to display the factorials of the numbers from 1 to 10. Again, this program looks a lot like a similar program written in C. The main difference is in the first line. In a function definition's formal parameter list, the semicolon character introduces a list of variables local to the function. In this case, the variable <I>i</I> is local to the function <I>main</I>. Also, notice that I've used the <I>print </I>function to display the results instead of the C <I>printf</I> function. The <I>print</I> function in Bob prints each of its arguments in succession. It is capable of printing arguments of any type and automatically formats them appropriately. In addition to supporting C-like expressions and control constructs, Bob also supports C++-like classes. Again, Bob is a typeless language, so the syntax for class definitions is somewhat different from C++, but it is similar enough that it should be easy to move from one to the other. <P>
<a href="#025e_00de">Example 2(a)</A> shows a simple class definition that defines a class called <I>foo</I> with members <I>a</I> and <I>b</I>, a static member <I>last</I>, and a static member function <I>get_last</I>. Unlike in C++, it is not necessary to declare all member functions within the class definition; only the static member functions need be declared. It <I>is</I> necessary, however, to declare all data members in the class definition.<P>
As in C++, new objects of a class are initialized using a constructor function, which has the same name as the class itself. <a href="#025e_00de">Example 2(b)</A> is the constructor function for the <I>foo</I> class. This constructor takes two arguments, which are the initial values for the member variables <I>a</I> and <I>b</I>. It also remembers the last object created in the static member variable <I>last. </I>Lastly, it returns the new object. For those of you not familiar with C++, the variable <I>this </I>refers to the object for which the member function is being called. It is an implicit parameter passed to every nonstatic member function. In this case, it is the new object just created.<P>
In Bob, all data members are implicitly protected: The only way to access or modify the value of a member variable is through a member function. If you need to access to a member variable outside a member function, you must provide access to member functions to do this; see <a href="#025e_00df">Example 3(a)</A>. <a href="#025e_00df">Example 3(b)</A> shows how to set the value of a member variable. Finally, <a href="#025e_00df">Example 3(c)</A> shows a member function that displays the numbers between <I>a</I> and <I>b</I> for any object of the <I>foo</I> class, and a <I>main</I> function that creates some objects and manipulates them. The <I>new</I> operator creates a new object of the class whose name follows it. The expressions in parentheses after the class name are the arguments to be passed to the constructor function.<P>
Bob also allows one class to be derived from another. The derived class will inherit the behavior of the base class and possibly add some behavior of its own. Bob only supports single inheritance; therefore, each class can have at most one base class. The code in <a href="#025e_00e0">Example 4(a)</A> defines a class <I>bar</I> derived from the base class <I>foo</I>, defined earlier.<P>
The class <I>bar</I> will have member variables <I>a</I> and <I>b</I> inherited from <I>foo</I> as well as the additional member variable <I>c</I>. The constructor for <I>bar</I> needs to initialize this new member variable and do the initialization normally done for objects of class <I>foo</I>; see <a href="#025e_00e0">Example 4(b)</A>.<P>
This definition illustrates another difference between Bob and C++. In  C++, constructor functions cannot be called to initialize already existing objects. This is allowed in Bob, so the <I>foo</I> constructor can be used to do the common initialization of the <I>foo</I> and <I>bar</I> classes. In C++, it would be necessary to define an <I>init</I> function for <I>foo</I> and call it from both constructors.<P>
That's a brief walk through the features of Bob. <a href="#025e_00e1">Table 1</A> details Bob's complete syntax. <P>
<h3><a name="025e_00d9">How Does it All Work?<a name="025e_00d9"></h3><P>
I've implemented Bob as a hybrid of a compiler and an interpreter. When a function is defined, it is compiled into instructions for a stack-oriented, bytecode machine. When the function is invoked, those bytecode instructions are interpreted. The advantage of this approach over a straight interpreter is that syntax analysis is done only once, at compile time. This speeds up function execution considerably and opens up the possibility of building a run-time-only system that doesn't include the compiler at all.<P>
<h3><a name="025e_00da">Run-Time Organization<a name="025e_00da"></h3><P>
First, I'll describe the run-time environment of Bob programs. The virtual machine that executes the bytecodes generated by the Bob compiler has a set of registers, a stack, and a heap. The register set is shown in <a href="#025e_00e2">Table 2</A>. All instructions get their arguments from and return their results to the stack. Literals are stored in the code object itself and are referred to by offset. Branch instructions test the value on the top of the stack (without popping the stack) and branch accordingly. Function arguments are passed on the stack, and function values are returned on top of the stack.<P>
In Bob, all member functions are virtual. This means that when a member function is invoked, the interpreter must determine which implementation of the member function to invoke. This is done by the SEND opcode, which uses a selector from the stack (actually, just a string containing the name of the member function) with the method dictionary associated with the object's class to determine which member function to use. If the lookup fails, the dictionary from the base class is examined. This continues, following the base-class chain until either a member function is found or there is no base class. If a member function is found to correspond to the selector, it replaces the selector on the stack and control is transferred to the member function, just as it would have been for a regular function. If no member function is found, an error is reported and the interpreter aborts.<P>
Bob supports five basic data types: integers, strings, vectors, objects, and nil. Internally, the interpreter uses four more types: classes, compiled bytecode functions, built-in function headers, and variables. Wherever a value can be stored, a tag indicates the type of value presently stored there. The structure for Bob values is shown in <a href="#025e_00e3">Example 5</A>.<P>
Objects, vectors, and bytecode objects are all represented by an array of value structures. In the case of bytecode objects, the first element in the vector is a pointer to the string of bytecodes for the function, and the rest are the literals referred to by the bytecode instructions. Class objects are vectors, where the first element is a pointer to the class object and the remaining elements are the values of the nonstatic member variables for the object. Built-in functions are just pointers to the C functions that implement the built-in function. Variables are pointers to dictionary entries for the variable. There is a dictionary for global symbols and one for classes. Each class also has a dictionary for data members and member functions.<P>
In addition to the stack, Bob uses a heap to store objects, vectors, and strings. The current implementation of Bob uses the C heap and the C functions <I>malloc</I> and <I>free</I> to manage heap space and uses a compacting memory manager.<P>
<h3><a name="025e_00db">The Source Code<a name="025e_00db"></h3><P>
The Bob bytecode compiler is a fairly straightforward recursive-descent compiler. At the moment, it uses a set of heavily recursive functions to parse expressions. I intend to replace that with a table-driven expression parser. The bytecode interpreter (<a href="#025e_00e4">Listing One</A>) is really just a giant <I>switch </I>statement with one case for each bytecode.<P>
The source code for Bob is too large (more than 3000 lines) to be included in this issue. Consequently, it's available electronically; see &quot;Availability&quot; on page 3. I am including significant portions of the code here, though, and I hope this will give you a taste of the implementation of Bob.<P>
<h3><a name="025e_00dc">Conclusions<a name="025e_00dc"></h3><P>
Well, there it is--a complete, if simple, object-oriented language. I don't think I'd want to throw away my C or C++ compiler in favor of programming in Bob, but it could serve as a good basis for building a macro language for an application program or just as a tool for experimenting with language design and implementation. It should be fairly easy to extend Bob with more built-in functions and classes or to build application- specific versions with functions tailored to your own application. I'm designing a computerized system for controlling theater lighting and will probably use Bob as a macro facility in that system. Anyway, have fun playing with Bob and please let me know if you come up with an interesting application for it.<P>
<h4><a name="025e_00dd"><B>Example 1:</B> (a) A Bob program for computing factorials; (b) a program that uses the factorial function to display the factorials of the numbers from 1 to 10.<a name="025e_00dd"></h4><P>
<pre>(a)factorial(n)
   {
       return n == 1 ? 1 : n * factorial(n-1) ;
   }

(b)main(; i)
   {
       for (i = 1; i &lt;= 10; ++i)
           print(i,&quot; factorial is &quot;,factorial(i),&quot;\n&quot;);
   }
</pre><P>
<h4><a name="025e_00de"><B>Example 2:</B> (a) A simple class definition; (b) a constructor function for the class  foo.<a name="025e_00de"></h4><P>
<pre>(a)
class foo
{
    a,b;
    static last;
    static get_last() ;
}

(b)
foo::foo(aa,bb)
{
    a = aa; b = bb;
    last = this;
    return this;
}</pre><P>
<h4><a name="025e_00df"><B>Example 3:</B> (a) Providing access to a member variable outside a member function; (b) setting the value of a member variable; (c) a member function that displays the numbers between  a and  b for any object of the  foo class, and a main function that creates some objects and manipulates them.<a name="025e_00df"></h4><P>
<pre>(a)
foo::get_a()
    {
    return a;
}

(b)
foo::set_a(aa)
    {
    a = aa;
}

(c)
foo::count (; i)
{
    for (i = a; i &lt;= b; ++i)
        print (i, &quot;\n&quot;);
}
main(; foo1, foo2)
{
    foo1 = new foo (1, 2);      // create a object of class foo
    foo2 = new foo (11, 22);    // and another
    print (&quot;fool counting\n&quot;);   // ask the first to count
    foo1 -&gt;count ();
    print (&quot;foo2 counting\n&quot;);     // ask the second to count
    foo2 -&gt;count ();
  }</pre><P>
<h4><a name="025e_00e0"><B>Example 4:</B> (a) Defining a class bar derived from the base class foo; (b) the constructor for bar needs to initialize this new member variable as well as doing the initialization normally done for objects of class  foo.<a name="025e_00e0"></h4><P>
<pre>(a)
class bar : foo
// a class derived from foo
{
    c;
}

(b)
bar::bar (aa,bb,cc)
{
    this-&gt;foo (aa,bb);
    c = cc;
    return this;
}</pre><P>
<h4><a name="025e_00e1"><B>Table 1:</B> Bob syntax.<a name="025e_00e1"></h4><P>
<pre><B>    Class Definition</B>
      class &lt;class-name&gt; [ : &lt;base-class-name &gt; ]
       { &lt;member-definition&gt;... }

<B>    Member Definition</B>
      &lt;variable-name&gt;... ;
      static &lt;variable-name&gt;... ;
      &lt;function-name&gt; ( [ &lt;formal-argument-list&gt; ] ) ;
      static &lt;function-name&gt; ( [ &lt;formal-argument-list&gt; ] ) ;

<B>    Function Definition</B>
      [ &lt;class-name&gt; :: ] &lt;function-name&gt;
       ( [ &lt;formal-argument-list&gt; [ ; &lt;temporary-list&gt; ] )
       { &lt;statement&gt;... }

<B>    Statement</B>
      if ( &lt;test-expression&gt; ) &lt;then-statement&gt; [ else &lt;else-statement&gt; ] ;
      while ( &lt;test-expression&gt; ) &lt;body-statement&gt;
      do &lt;body-statement&gt; while &lt;test-expression&gt; ) ;
      for ( &lt;init-expression&gt; ; &lt;test-expression&gt; ; &lt;increment-expression&gt; )
        &lt;body-statement&gt;
      break ;
      continue ;
      return [ &lt;result-expression&gt; ] ;
      [ &lt;expression&gt; ] ;
      { &lt;statement&gt;... }

    <B>Expression</B>
<B>    </B>   &lt;expression&gt; , &lt;expression&gt;
       &lt;lvalue&gt; = &lt;expression&gt;
       &lt;lvalue&gt; += &lt;expression&gt;
       &lt;lvalue&gt; --   &lt;expression&gt;
       &lt;lvalue&gt; *= &lt;expression&gt;
       &lt;lvalue&gt; /= &lt;expression&gt;
       &lt;test-expression&gt; ? &lt;true-expression&gt; : &lt;false-expression&gt;
       &lt;expression&gt; || &lt;expression&gt;
       &lt;expression&gt; &amp;&amp; &lt;expression&gt;
       &lt;expression&gt; | &lt;expression&gt;
       &lt;expression&gt; ^&lt; expression&gt;
       &lt;expression&gt; &amp;&lt; expression&gt;
       &lt;expression&gt; == &lt;expression&gt;
       &lt;expression&gt; != &lt;expression&gt;
       &lt;expression&gt; &lt;&lt; expression&gt;
       &lt;expression&gt; &lt;= &lt;expression&gt;
       &lt;expression&gt; &gt; = &lt;expression&gt;
       &lt;expression&gt; &gt; &lt;expression&gt;
       &lt;expression&gt; &lt;&lt; &lt;expression&gt;
       &lt;expression&gt; &gt; &gt; &lt;expression&gt;
       &lt;expression&gt; + &lt;expression&gt;
       &lt;expression&gt; -- &lt;expression&gt;
       &lt;expression&gt; * &lt;expression&gt;
       &lt;expression&gt; / &lt;expression&gt;
       &lt;expression&gt; % &lt;expression&gt;
       -- &lt;expression&gt;
       ! &lt;expression&gt;
       ~ &lt;expression&gt;
       ++ &lt;lvalue&gt;
       -- &lt;lvalue&gt;
       &lt;lvalue&gt; ++
       &lt;lvalue&gt; --
       new  &lt;class-name&gt; ( [ &lt;constructor-arguments&gt; ] )
       &lt;expression&gt; ( [ &lt;arguments&gt; ] )
       &lt;expression&gt; -&gt; &lt;function-name&gt; ( [ &lt;arguments&gt; ] )
       ( &lt;expression&gt; )
       &lt;variable-name&gt;
       &lt;number&gt;
       &lt;string&gt;
       nil</pre><P>
<h4><a name="025e_00e2"><B>Table 2:</B> Registers used by the virtual machine.<a name="025e_00e2"></h4><P>
<PRE>
    Register   Description

    code       Currently executing code object.
    cbase      base of bytecode array for the current code object.
    pc         Address of the next bytecode to fetch.
    sp         Top of the stack.
    fp         Stack frame for the current call.
    stkbase    Bottom stack limit.
    stktop     Top stack limit.</pre><P>
<h4><a name="025e_00e3"><B>Example 5:</B> The structure for Bob values.<a name="025e_00e3"></h4><P>
<pre>typedef struct value {
  int v_type;      /* data type */
  union {      /* value */
    struct class *v_class;
    struct value *v_object;
    struct value *v_vector;
    struct string *v_string;
    struct value *v_bytecode;
    struct dict_entry *v_var;
     int (*v_code) ();
    long v_integer;
  } v;
} VALUE;</pre><P>
<P>
<h4><a name="025e_00e4">Listing One <a name="025e_00e4"></h4><pre>

/* bobint.c - bytecode interpreter */
/*
    Copyright (c) 1991, by David Michael Betz
    All rights reserved
*/

#include &lt;setjmp.h&gt;
#include &quot;bob.h&quot;

#define iszero(x)   ((x)-&gt;v_type == DT_INTEGER &amp;&amp; (x)-&gt;v.v_integer == 0)
#define istrue(x)   ((x)-&gt;v_type != DT_NIL &amp;&amp; !iszero(x))

/* global variables */
VALUE *stkbase;     /* the runtime stack */
VALUE *stktop;      /* the top of the stack */
VALUE *sp;      /* the stack pointer */
VALUE *fp;      /* the frame pointer */ int trace=0;        /* variable to control tracing */

/* external variables */
extern DICTIONARY *symbols;
extern jmp_buf error_trap;

/* local variables */
static unsigned char *cbase;    /* the base code address */
static unsigned char *pc;   /* the program counter */
static VALUE *code;     /* the current code vector */

/* forward declarations */
char *typename();

/* execute - execute a bytecode function */
int execute(name)
  char *name;
{
    DICT_ENTRY *sym;
    
    /* setup an error trap handler */
    if (setjmp(error_trap) != 0)
    return (FALSE);

    /* lookup the symbol */
    if ((sym = findentry(symbols,name)) == NULL)
    return (FALSE);

    /* dispatch on its data type */
    switch (sym-&gt;de_value.v_type) {
    case DT_CODE:
    (*sym-&gt;de_value.v.v_code)(0);
    break;
    case DT_BYTECODE:
    interpret(sym-&gt;de_value.v.v_bytecode);
    break;
    }
    return (TRUE);
}

/* interpret - interpret bytecode instructions */
int interpret(fcn)
  VALUE *fcn;
{
    register int pcoff,n;
    register VALUE *obj;
    VALUE *topframe,val;
    STRING *s1,*s2,*sn;
    
    /* initialize */
    sp = fp = stktop;
    cbase = pc = fcn[1].v.v_string-&gt;s_data;
    code = fcn;

    /* make a dummy call frame */     check(4);
    push_bytecode(code);
    push_integer(0);
    push_integer(0);
    push_integer(0);
    fp = topframe = sp;
    
    /* execute each instruction */
    for (;;) {
    if (trace)
        decode_instruction(code,pc-code[1].v.v_string-&gt;s_data);
    switch (*pc++) {
    case OP_CALL:
        n = *pc++;
        switch (sp[n].v_type) {
        case DT_CODE:
            (*sp[n].v.v_code)(n);
            break;
        case DT_BYTECODE:
            check(3);
            code = sp[n].v.v_bytecode;
            push_integer(n);
            push_integer(stktop - fp);
            push_integer(pc - cbase);
            cbase = pc = code[1].v.v_string-&gt;s_data;
            fp = sp;
            break;
        default:
            error(&quot;Call to non-procedure, Type %s&quot;,
              typename(sp[n].v_type));
            return;
        }
        break;
    case OP_RETURN:
        if (fp == topframe) return;
        val = *sp;
        sp = fp;
        pcoff = fp[0].v.v_integer;
        n = fp[2].v.v_integer;
        fp = stktop - fp[1].v.v_integer;
        code = fp[fp[2].v.v_integer+3].v.v_bytecode;
        cbase = code[1].v.v_string-&gt;s_data;
        pc = cbase + pcoff;
        sp += n + 3;
        *sp = val;
        break;
    case OP_REF:
        *sp = code[*pc++].v.v_var-&gt;de_value;
        break;
    case OP_SET:
        code[*pc++].v.v_var-&gt;de_value = *sp;
        break;
    case OP_VREF:
        chktype(0,DT_INTEGER);
        switch (sp[1].v_type) {         case DT_VECTOR: vectorref(); break;
        case DT_STRING: stringref(); break;
        default:    badtype(1,DT_VECTOR); break;
        }
        break;
    case OP_VSET:
        chktype(1,DT_INTEGER);
        switch (sp[2].v_type) {
        case DT_VECTOR: vectorset(); break;
        case DT_STRING: stringset(); break;
        default:    badtype(1,DT_VECTOR); break;
        }
        break;
    case OP_MREF:
        obj = fp[fp[2].v.v_integer+2].v.v_object;
        *sp = obj[*pc++];
        break;
    case OP_MSET:
        obj = fp[fp[2].v.v_integer+2].v.v_object;
        obj[*pc++] = *sp;
        break;
    case OP_AREF:
        n = *pc++;
        if (n &gt;= fp[2].v.v_integer)
            error(&quot;Too few arguments&quot;);
        *sp = fp[n+3];
        break;
    case OP_ASET:
        n = *pc++;
        if (n &gt;= fp[2].v.v_integer)
            error(&quot;Too few arguments&quot;);
        fp[n+3] = *sp;
        break;
    case OP_TREF:
        n = *pc++;
        *sp = fp[-n-1];
        break;
    case OP_TSET:
        n = *pc++;
        fp[-n-1] = *sp;
        break;
    case OP_TSPACE:
        n = *pc++;
        check(n);
        while (--n &gt;= 0) {
            --sp;
            set_nil(sp);
        }
        break;
    case OP_BRT:
        if (istrue(sp))
            pc = cbase + getwoperand();
        else
            pc += 2;
        break;     case OP_BRF:
        if (istrue(sp))
            pc += 2;
        else
            pc = cbase + getwoperand();
        break;
    case OP_BR:
        pc = cbase + getwoperand();
        break;
    case OP_NIL:
        set_nil(sp);
        break;
    case OP_PUSH:
        check(1);
        push_integer(FALSE);
        break;
    case OP_NOT:
        if (istrue(sp))
            set_integer(sp,FALSE);
        else
            set_integer(sp,TRUE);
        break;
    case OP_NEG:
        chktype(0,DT_INTEGER);
        sp-&gt;v.v_integer = -sp-&gt;v.v_integer;
        break;
    case OP_ADD:
        switch (sp[1].v_type) {
        case DT_INTEGER:
            switch (sp[0].v_type) {
            case DT_INTEGER:
            sp[1].v.v_integer += sp-&gt;v.v_integer;
            break;
            case DT_STRING:
            s2 = sp[0].v.v_string;
            sn = newstring(1 + s2-&gt;s_length);
            sn-&gt;s_data[0] = sp[1].v.v_integer;
            memcpy(&amp;sn-&gt;s_data[1],
                   s2-&gt;s_data,
                   s2-&gt;s_length);
            set_string(&amp;sp[1],sn);
            break;
            default:
            break;
            }
            break;
        case DT_STRING:
            s1 = sp[1].v.v_string;
            switch (sp[0].v_type) {
            case DT_INTEGER:
            sn = newstring(s1-&gt;s_length + 1);
            memcpy(sn-&gt;s_data,
                   s1-&gt;s_data,
                   s1-&gt;s_length);
            sn-&gt;s_data[s1-&gt;s_length] = sp[0].v.v_integer;             set_string(&amp;sp[1],sn);
            break;
            case DT_STRING:
            s2 = sp[0].v.v_string;
            sn = newstring(s1-&gt;s_length + s2-&gt;s_length);
            memcpy(sn-&gt;s_data,
                   s1-&gt;s_data,s1-&gt;s_length);
            memcpy(&amp;sn-&gt;s_data[s1-&gt;s_length],
                   s2-&gt;s_data,s2-&gt;s_length);
            set_string(&amp;sp[1],sn);
            break;
            default:
            break;
            }
            break;
        default:
            badtype(1,DT_VECTOR);
            break;
        }
        ++sp;
        break;
    case OP_SUB:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        sp[1].v.v_integer -= sp-&gt;v.v_integer;
        ++sp;
        break;
    case OP_MUL:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        sp[1].v.v_integer *= sp-&gt;v.v_integer;
        ++sp;
        break;
    case OP_DIV:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        if (sp-&gt;v.v_integer != 0) {
            int x=sp-&gt;v.v_integer;
            sp[1].v.v_integer /= x;
        }
        else
            sp[1].v.v_integer = 0;
        ++sp;
        break;
    case OP_REM:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        if (sp-&gt;v.v_integer != 0) {
            int x=sp-&gt;v.v_integer;
            sp[1].v.v_integer %= x;
        }
        else
            sp[1].v.v_integer = 0;
        ++sp;
        break;     case OP_INC:
        chktype(0,DT_INTEGER);
        ++sp-&gt;v.v_integer;
        break;
    case OP_DEC:
        chktype(0,DT_INTEGER);
        --sp-&gt;v.v_integer;
        break;
    case OP_BAND:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        sp[1].v.v_integer &amp;= sp-&gt;v.v_integer;
        ++sp;
        break;
    case OP_BOR:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        sp[1].v.v_integer |= sp-&gt;v.v_integer;
        ++sp;
        break;
    case OP_XOR:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        sp[1].v.v_integer ^= sp-&gt;v.v_integer;
        ++sp;
        break;
    case OP_BNOT:
        chktype(0,DT_INTEGER);
        sp-&gt;v.v_integer = sp-&gt;v.v_integer;
        break;
    case OP_SHL:
        switch (sp[1].v_type) {
        case DT_INTEGER:
            chktype(0,DT_INTEGER);
            sp[1].v.v_integer &lt;&lt;= sp-&gt;v.v_integer;
            break;
        case DT_FILE:
            print1(sp[1].v.v_fp,FALSE,&amp;sp[0]);
            break;
        default:
            break;
        }
        ++sp;
        break;
    case OP_SHR:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        sp[1].v.v_integer &gt;&gt;= sp-&gt;v.v_integer;
        ++sp;
        break;
    case OP_LT:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        n = sp[1].v.v_integer &lt; sp-&gt;v.v_integer;
        ++sp;         set_integer(sp,n ? TRUE : FALSE);
        break;
    case OP_LE:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        n = sp[1].v.v_integer &lt;= sp-&gt;v.v_integer;
        ++sp;
        set_integer(sp,n ? TRUE : FALSE);
        break;
    case OP_EQ:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        n = sp[1].v.v_integer == sp-&gt;v.v_integer;
        ++sp;
        set_integer(sp,n ? TRUE : FALSE);
        break;
    case OP_NE:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        n = sp[1].v.v_integer != sp-&gt;v.v_integer;
        ++sp;
        set_integer(sp,n ? TRUE : FALSE);
        break;
    case OP_GE:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        n = sp[1].v.v_integer &gt;= sp-&gt;v.v_integer;
        ++sp;
        set_integer(sp,n ? TRUE : FALSE);
        break;
    case OP_GT:
        chktype(0,DT_INTEGER);
        chktype(1,DT_INTEGER);
        n = sp[1].v.v_integer &gt; sp-&gt;v.v_integer;
        ++sp;
        set_integer(sp,n ? TRUE : FALSE);
        break;
    case OP_LIT:
        *sp = code[*pc++];
        break;
    case OP_SEND:
        n = *pc++;
        chktype(n,DT_OBJECT);
        send(n);
        break;
    case OP_DUP2:
        check(2);
        sp -= 2;
        *sp = sp[2];
        sp[1] = sp[3];
        break;
    case OP_NEW:
        chktype(0,DT_CLASS);
        set_object(sp,newobject(sp-&gt;v.v_class));
        break;     default:
        info(&quot;Bad opcode %02x&quot;,pc[-1]);
        break;
    }
    }
}

/* send - send a message to an object */
static send(n)
  int n;
{
    char selector[TKNSIZE+1];
    DICT_ENTRY *de;
    CLASS *class;
    class = sp[n].v.v_object[OB_CLASS].v.v_class;
    getcstring(selector,sizeof(selector),sp[n-1].v.v_string);
    sp[n-1] = sp[n];
    do {
    if ((de = findentry(class-&gt;cl_functions,selector)) != NULL) {
        switch (de-&gt;de_value.v_type) {
        case DT_CODE:
        (*de-&gt;de_value.v.v_code)(n);
        return;
        case DT_BYTECODE:
        check(3);
        code = de-&gt;de_value.v.v_bytecode;
        set_bytecode(&amp;sp[n],code);
        push_integer(n);
        push_integer(stktop - fp);
        push_integer(pc - cbase);
        cbase = pc = code[1].v.v_string-&gt;s_data;
        fp = sp;
        return;
        default:
        error(&quot;Bad method, Selector '%s', Type %d&quot;,
              selector,
              de-&gt;de_value.v_type);
        }
    }
    } while ((class = class-&gt;cl_base) != NULL);
    nomethod(selector);
}

/* vectorref - load a vector element */
static vectorref()
{
    VALUE *vect;
    int i;
    vect = sp[1].v.v_vector;
    i = sp[0].v.v_integer;
    if (i &lt; 0 || i &gt;= vect[0].v.v_integer)
    error(&quot;subscript out of bounds&quot;);
    sp[1] = vect[i+1];
    ++sp;
} 
/* vectorset - set a vector element */
static vectorset()
{
    VALUE *vect;
    int i;
    vect = sp[2].v.v_vector;
    i = sp[1].v.v_integer;
    if (i &lt; 0 || i &gt;= vect[0].v.v_integer)
    error(&quot;subscript out of bounds&quot;);
    vect[i+1] = sp[2] = *sp;
    sp += 2;
}

/* stringref - load a string element */
static stringref()
{
    STRING *str;
    int i;
    str = sp[1].v.v_string;
    i = sp[0].v.v_integer;
    if (i &lt; 0 || i &gt;= str-&gt;s_length)
    error(&quot;subscript out of bounds&quot;);
    set_integer(&amp;sp[1],str-&gt;s_data[i]);
    ++sp;
}

/* stringset - set a string element */
static stringset()
{
    STRING *str;
    int i;
    chktype(0,DT_INTEGER);
    str = sp[2].v.v_string;
    i = sp[1].v.v_integer;
    if (i &lt; 0 || i &gt;= str-&gt;s_length)
    error(&quot;subscript out of bounds&quot;);
    str-&gt;s_data[i] = sp[0].v.v_integer;
    set_integer(&amp;sp[2],str-&gt;s_data[i]);
    sp += 2;
}

/* getwoperand - get data word */
static int getwoperand()
{
    int b;
    b = *pc++;
    return ((*pc++ &lt;&lt; 8) | b);
}

/* type names */
static char *tnames[] = {
&quot;NIL&quot;,&quot;CLASS&quot;,&quot;OBJECT&quot;,&quot;VECTOR&quot;,&quot;INTEGER&quot;,&quot;STRING&quot;,&quot;BYTECODE&quot;,
&quot;CODE&quot;,&quot;VAR&quot;,&quot;FILE&quot;
}; 
/* typename - get the name of a type */
static char *typename(type)
  int type;
{
    static char buf[20];
    if (type &gt;= _DTMIN &amp;&amp; type &lt;= _DTMAX)
    return (tnames[type]);
    sprintf(buf,&quot;(%d)&quot;,type);
    return (buf);
}

/* badtype - report a bad operand type */
badtype(off,type)
  int off,type;
{
    char tn1[20];
    strcpy(tn1,typename(sp[off].v_type));
    info(&quot;PC: %04x, Offset %d, Type %s, Expected %s&quot;,
     pc-cbase,off,tn1,typename(type));
    error(&quot;Bad argument type&quot;);
}

/* nomethod - report a failure to find a method for a selector */
static nomethod(selector)
  char *selector;
{
    error(&quot;No method for selector '%s'&quot;,selector);
}

/* stackover - report a stack overflow error */
stackover()
{
    error(&quot;Stack overflow&quot;);
}

</pre>
<HR><P>Copyright &copy; 1994, <I>Dr. Dobb's Journal</I></P></BODY></HTML>
