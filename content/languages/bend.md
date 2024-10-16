title=Bend
tags=language, concurrency, parallel
summary=A massively parallel, high-level programming language.
~~~~~~

[Website](https://higherorderco.com/) | [Source](https://github.com/HigherOrderCO/Bend)

## Articles

["How Bend Works: A Parallel Programming Language That “Feels Like Python but Scales Like CUDA”."](https://towardsdatascience.com/how-bend-works-a-parallel-programming-language-that-feels-like-python-but-scales-like-cuda-48be5bf0fc2c)

## Examples

```
# Write definitions like this
(Def1) = ((λa a) (λb b))

# You can call a definition by just referencing its name
# It will be substituted in place of the reference
(Def2) = ((λa a) Def1)

# Definitions and variables can have names in upper and lower case and contain numbers
# Names defined in a more inner position shadow names in an outer position
(def3) = ((λDef1 Def1) (λx λx x))

# The language is affine, but if you use a variable more than once the compiler inserts duplications for you
# Of course you can always do them manually
(def4) = λz let {z1 z2} = z; (z1 ((λx (x x x x x)) z2))

# You can use machine numbers and some native numeric operations
# Numeric operations can only reduce numbers, doing (+ (λx x) 1) will not do anything
(nums) = λx1 λx2 (* (+ x1 1) (/ (- x2 2) 1))

# You can use numbers on the native match expression
# The `+` arm binds the `scrutinee`-1 variable to the value of the number -1
(Num.pred) = λn 
  switch n { 
    0: 0
    _: n-1
  }

# Write new data types like this
data Option = (Some val) | None
data Bool = True | False

# You can have pattern matching on definitions
# Use `*` to ignore a pattern
(Option.unwrap_or (Option/Some val) *) = val
(Option.unwrap_or Option/None      or) = or

(Bool.or Bool/True  *) = Bool/True
(Bool.or * Bool/True)  = Bool/True
(Bool.or * *)     = Bool/False

# Or using a match expression
(Bool.not) = λbool
  match bool {
    Bool/True:  Bool/False
    Bool/False: Bool/True
  }

# Data types can store values
data Boxed = (Box val)

# Types with only one constructor can be destructured using `let` or a single matching definition
(Box.map (Boxed/Box val) f) = (Boxed/Box (f val))

(Box.unbox) = λbox match box {
  Boxed/Box: box.val
}

# Use tuples to store two values together without needing to create a new data type
(Tuple.new fst snd) =
  let pair = (fst, snd)
  pair

# Then you can destructure it inside the definition or using `let`
(Tuple.fst (fst, snd)) = fst

(Tuple.snd) = λpair
  let (fst, snd) = pair
  snd

# All files must have a main definition to be run.
# You can execute a program in HVM with "cargo run -- run <path to file>"
# Other options are "check" (the default mode) to just see if the file is well formed
# and "compile" to output hvm-core code.
(main) = 
  let tup = (Tuple.new Option/None (Num.pred 5))

  let fst = (Tuple.fst tup)
  let snd = (Tuple.snd tup)

  let box =     (Boxed/Box fst)
  let map =     (Box.map box Option.unwrap_or)
  let unboxed = ((Box.unbox map) snd)

  (nums 3 unboxed)
```