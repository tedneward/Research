title=Grace
tags=language, object
summary=The purpose of Grace is to allow novices to discover programming in the simplest possible way. Other famous languages such as Java or Python are widely used by professionals, but may be hard to assimilate for a beginner in programming. That is what the object-oriented Grace language is made for.
~~~~~~

[Website](http://gracelang.org/applications/home/) | [Language Specification](http://gracelang.org/applications/documentation/spec/)

Implementations:

* [Kernan](http://gracelang.org/applications/grace-versions/kernan/)
* [Minigrace](http://gracelang.org/applications/grace-versions/minigrace/)
* [Hopper](http://gracelang.org/applications/grace-versions/hopper/)
* [Grace editor customizations](http://gracelang.org/applications/grace-versions/grace-editor-customisations/)

**Grace in one page of code**:
```
//Grace in one page; run here: http://www.cs.pdx.edu/~grace/

import "io" as transput     // import module — the imported object is named transput
print "Hello World!"

// Comments &amp; Layout
// comment to end of line 

// Definitions and Variables
def one = 1 // constant
def two:Number = 2  // constant with type annotation

var i:Number := 13  // variable with type - note := 
var x := 4 // variable, dynamically typed
var z is readable, writable := "Z" // annotated to give public access

//Literals
1
16xF00F00
2x10110100
0xdeadbeef // Radix zero treated as 16 
true
false      // Booleans
"Hello World!"
"fruit\tcost"       // string with escape for tab 
"1 + 2 = {1 + 2}"   // string with interpolation
{two.something}     // block (lambda expression) without parameters
{ j -> print(j)}    // blocks with parameters

// Requests
self.z   // explicit self request, without arguments
z // implicit self-request, without arguments
print "Hello world" // implicit self-request, single string argument
"Hello".size // request of method size with string "Hello" as receiver
"abcdefghi".substringFrom 3 to 6 
    // request of method substringFrom(_)to(_); parens optional on literal arguments
1 + 2 * 3 // operators are also requests
! false // unary prefix operators!   Can't do that in Smalltalk.

"ab" ++ "cd" // operator ++ for string concatenation
1..10        // operator .. constructs a range of numbers
(true || false) &amp;&amp; true // only + - * and / have precedence
x := 22 // assignment request


// Control Structures — block bodies are indented when the
// block spans multiple lines
if (x == 22) then {
    print "YES"
} elseif {
    x == 23
} then {
    print "Maybe"
} else {
    print "...nope..."
}

for (2 .. 4) do {
    j -> print(j)
} // prints 2, 3, and 4

x := 10
while {x < 20} do {
    print(x)
    x := x + 3
} 


match (x) // match(_)case(_)... can match on both values and types
  case { 0 -> print "zero" }   // literal — matches when x == 0 
  case { n : Number -> print "Number {n}" }  // type matches 
  case { s : String -> print "String {s}" }
  else { print "who knows?" }     // all other cases 


// Methods
// Grace methods can be at the "top level"
method pi {3.141592634} //simple method 
method + (other) { other + self } // binary operator 
method prefix- {print "bing!"} //prefix unary operator
method from(n : Number) steps(s: Number) -> Number { 
    // method with multi-part name, each part with an argument list
    print "from {n} steps {s}"
    return s
} 
method fromsteps(n: Number, s: Number) -> Number { 
    // method with multiple arguments 
    print "from {n} steps {s}"
    return s  } 

// Objects
def fergus = object {  // make a new object 
    def colour is readable = "Tabby" 
    def name is readable = "Fergus"
    var miceEaten := 0
    method eatMouse {miceEaten := miceEaten + 1}
    method miaow {print "{name}({colour}) has eaten {miceEaten} mice"}
}

fergus.eatMouse
fergus.eatMouse
fergus.miaow

// Classes
class cat(name') colour(colour') {   // class is a factory method
    def colour is readable = colour' // note primes on names
    def name is readable = name'
    var miceEaten := 0
    method eatMouse {miceEaten := miceEaten + 1}
    method miaow {
        print "{name}({colour}) has eaten {miceEaten} mice"
    }
}
cat "Amelia" colour "Tortoiseshell".miaow

// Inheritance
class pedigreeCat(aName) colour(aColour) {  
    inherit cat(aName) colour("Pedigree " ++ aColour)
        // call superclass's factory
        alias catMiaow = miaow
    var prizes := 0    // initialize an instance variable
    method winner {prizes := prizes + 1}
    method miaow is override {
        catMiaow
        print "and won {prizes} prizes"
    }
}

def woopert = pedigreeCat "Woopert" colour "Siamese"
woopert.winner
woopert.winner
woopert.winner
woopert.miaow


// Exceptions
def NegativeError = ProgrammingError.refine "NegativeError"  
    // make a new kind of exception
try {
    ... // some complicated code
    NegativeError.raise "-1 &lt; 0"  // raise (throw) an exception
} catch { ne: NegativeError -> 
    print "it was negative! {ne}"
} catch { e: Exception -> 
    print "an unexpected exception {e}" 
} finally { 
    print "finally!"    // always executed
}    

// using a module
transput.output.write "Goodbye\n" // request method on imported module
```

