title=ChaiScript
tags=language, scripting
summary=An easy to use embedded scripting language for C++.
~~~~~~

[Website](http://chaiscript.com/index.html) [Source](https://github.com/ChaiScript/ChaiScript)

Header-only, thread-safe, portable.

## Embedding
```
#include <chaiscript/chaiscript.hpp>

std::string helloWorld(const std::string &t_name) {
  return "Hello " + t_name + "!";
}

int main() {
  chaiscript::ChaiScript chai;
  chai.add(chaiscript::fun(&helloWorld), "helloWorld");

  chai.eval(R"(
    puts(helloWorld("Bob"));
  )");
}
```

## Language Reference
```
var i; // uninitialized variable, can take any value on first assignment;
auto j; // equiv to var

var k = 5; // initialized to 5 (integer)
var l := k; // reference to k
auto &m = k; // reference to k

global g = 5; // creates a global variable. If global already exists, it is not re-added
global g = 2; // global 'g' now equals 2

global g2;
if (g2.is_var_undef()) { g2 = 4; } // only initialize g2 once, if global decl hit more than once

GLOBAL g3; // all upper case version also accepted

// c-style for loops
for (var i = 0; i < 100; ++i) { print(i); }

// while
while (some_condition()) { /* do something */ }

// ranged for
for (i : [1, 2, 3]) { print(i); }

if (expression) { }

// C++17-style init-if blocks
// Value of 'statement' is scoped for entire `if` block
if (statement; expression) { }

var myvalue = 2
switch (myvalue) {
    case (1) {
        print("My Value is 1");
        break;
    }
    case (2) {
        print("My Value is 2");
        break;
    }
    default {
        print("My Value is something else.";
    }
}

var v = [1,2,3u,4ll,"16", `+`]; // creates vector of heterogenous values
var m = ["a":1, "b":2]; // map of string:value pairs

// Add a value to the vector by value.
v.push_back(123);

// Add an object to the vector by reference.
v.push_back_ref(m);

def myfun(x, y) { x + y; } // last statement in body is the return value
def myfun(x, y) { return x + y; } // equiv 
def myfun(x, int y) : y > 5 { x - y; } // only called if y > 5

def string::add(int y) { this + to_string(y); }
def add(string s, int y) { s + to_string(y); } //equiv functionality

// calling new function/method
"a".add(1); // returns a1
add("a", 1); // returns a1, either calling syntax works with either def above

var l = fun(x) { x * 15; }
l(2) // returns 30

var a = 13
var m = fun[a](x) { x * a; } 
m(3); // a was captured (by reference), returns 39

var n = bind(fun(x,y) { x * y; }, _, 10);
n(2); // returns 20 

class MyType {
  var value;
  def MyType() { this.value = "a"; }
  def get_value() { "Value Is: " + this.value; }
};

var m = MyType(); // calls constructor
print(m.get_value()); // prints "Value Is: a"
print(get_value(m)); // prints "Value Is: a"

var o = Dynamic_Object();
o.f = fun(x) { print(x); }
o.f(3); // prints "3"

def method_missing(int i, string name, Vector v) {
  print("method_missing(${i}, ${name}), ${v.size()} params");
}
5.bob(1,2,3); // prints "method_missing(5, bob, 3 params)"
```