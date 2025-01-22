title=Continuation-passing style
tags=reading, language, language development
summary=Readings and links on CPS.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Continuation-passing_style): 
... a style of programming in which control is passed explicitly in the form of a continuation. ... A function written in continuation-passing style takes an extra argument: an explicit "continuation"; i.e., a function of one argument. When the CPS function has computed its result value, it "returns" it by calling the continuation function with this value as the argument. That means that when invoking a CPS function, the calling function is required to supply a procedure to be invoked with the subroutine's "return" value. Expressing code in this form makes a number of things explicit which are implicit in direct style. These include: procedure returns, which become apparent as calls to a continuation; intermediate values, which are all given names; order of argument evaluation, which is made explicit; and tail calls, which simply call a procedure with the same continuation, unmodified, that was passed to the caller.

In CPS, each procedure takes an extra argument representing what should be done with the result the function is calculating. This, along with a restrictive style prohibiting a variety of constructs usually available, is used to expose the semantics of programs, making them easier to analyze. This style also makes it easy to express unusual control structures, like catch/throw or other non-local transfers of control.

The key to CPS is to remember that (a) every function takes an extra argument known as its continuation, and (b) every argument in a function call must be either a variable or a lambda expression (not a more complex expression). This has the effect of turning expressions "inside-out" because the innermost parts of the expression must be evaluated first, thus CPS makes explicit the order of evaluation as well as the control flow. Some examples of code in direct style and the corresponding CPS appear below. These examples are written in the Scheme programming language; by convention the continuation function is represented as a parameter named "k":

Direct style:
```
(define (pyth x y)
  (sqrt (+ (* x x) (* y y))))
```
CPS:
```
(define (pyth& x y k)
 (*& x x (lambda (x2)
          (*& y y (lambda (y2)
                   (+& x2 y2 (lambda (x2py2)
                              (sqrt& x2py2 k))))))))
```

Direct style:
```
(define (factorial n)
 (if (= n 0)
     1     ; NOT tail-recursive
     (* n (factorial (- n 1)))))
```
CPS:
```
(define (factorial& n k)
 (=& n 0 (lambda (b)
          (if b                    ; growing continuation
              (k 1)                ; in the recursive call
              (-& n 1 (lambda (nm1)
                       (factorial& nm1 (lambda (f)
                                        (*& n f k)))))))))
```
Direct style:
```
(define (factorial n)
 (f-aux n 1))
(define (f-aux n a)
 (if (= n 0)
     a        ; tail-recursive
     (f-aux (- n 1) (* n a))))
```

CPS:
```
(define (factorial& n k) (f-aux& n 1 k))
(define (f-aux& n a k)
 (=& n 0 (lambda (b)
          (if b                    ; unmodified continuation
              (k a)                ; in the recursive call
              (-& n 1 (lambda (nm1) 
                       (*& n a (lambda (nta)
                                (f-aux& nm1 nta k)))))))))
```

Functions using more than one continuation can be defined to capture various control flow paradigms, for example (in Scheme):

```
(define (/& x y ok err)
 (=& y 0.0 (lambda (b)
            (if b
                (err (list "div by zero!" x y))
                (ok (/ x y))))))
```

### Haskell examples

Direct:
```
pow2 :: Float -> Float
pow2 a = a ** 2

add :: Float -> Float -> Float
add a b = a + b

pyth :: Float -> Float -> Float
pyth a b = sqrt (add (pow2 a) (pow2 b))
```

CPS:
```
pow2' :: Float -> (Float -> a) -> a
pow2' a cont = cont (a ** 2)

add' :: Float -> Float -> (Float -> a) -> a
add' a b cont = cont (a + b)

-- Types a -> (b -> c) and a -> b -> c are equivalent, so CPS function
-- may be viewed as a higher order function
sqrt' :: Float -> ((Float -> a) -> a)
sqrt' a = \cont -> cont (sqrt a)

pyth' :: Float -> Float -> (Float -> a) -> a
pyth' a b cont = pow2' a (\a2 -> pow2' b (\b2 -> add' a2 b2 (\anb -> sqrt' anb cont)))
```

### Continuations as objects

Programming with continuations can also be useful when a caller does not want to wait until the callee completes. For example, in user-interface (UI) programming, a routine can set up dialog box fields and pass these, along with a continuation function, to the UI framework. This call returns right away, allowing the application code to continue while the user interacts with the dialog box. Once the user presses the "OK" button, the framework calls the continuation function with the updated fields.

```
function confirmName() {
    fields.name = name;
    framework.Show_dialog_box(fields, confirmNameContinuation);
}

function confirmNameContinuation(fields) {
    name = fields.name;
}
```

A similar idea can be used when the function must run in a different thread or on a different processor. The framework can execute the called function in a worker thread, then call the continuation function in the original thread with the worker's results. This is in Java 8 using the Swing UI framework:

```
void buttonHandler() {
    // This is executing in the Swing UI thread.
    // We can access UI widgets here to get query parameters.
    int parameter = getField();

    new Thread(() => {
        // This code runs in a separate thread.
        // We can do things like access a database or a 
        // blocking resource like the network to get data.
        int result = lookup(parameter);

        javax.swing.SwingUtilities.invokeLater(() => {
            // This code runs in the UI thread and can use
            // the fetched data to fill in UI widgets.
            setField(result);
        });
    }).start();
}
```

