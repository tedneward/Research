title=CoffeeScript
tags=language, nodejs, object, functional, dynamic
summary=Unfancy JavaScript.
~~~~~~

[Website](http://coffeescript.org/) | [Source](https://github.com/jashkenas/coffeescript)

### Reading

* [CoffeeScript Cookbook](https://coffeescript-cookbook.github.io)
* [CoffeeScript Ristretto](https://leanpub.com/coffeescript-ristretto/read) - Reginald Braithwaite  *(Leanpub account or valid email requested)*
* [Hard Rock CoffeeScript](https://alchaplinsky.github.io/hard-rock-coffeescript/) - Alex Chaplinsky (gitbook)
* [Smooth CoffeeScript](http://autotelicum.github.io/Smooth-CoffeeScript/SmoothCoffeeScript.html)
* [The Little Book on CoffeeScript](http://arcturo.github.io/library/coffeescript/) - Alex MacCaw, David Griffiths, Satoshi Murakami, Jeremy Ashkenas

## [Learn X in Y minutes Quick Intro](https://learnxinyminutes.com/docs/coffeescript/)
---
CoffeeScript is a little language that compiles one-to-one into the equivalent JavaScript, and there is no interpretation at runtime. As one of the successors to JavaScript, CoffeeScript tries its best to output readable, pretty-printed and smooth-running JavaScript code, which works well in every JavaScript runtime. It also attempts to try and make JavaScript more in line with the trends of many modern languages.

```coffeescript
# Comments are similar to Ruby and Python, using the hash symbol `#`

###
Block comments are like these, and they translate directly to '/ *'s and '* /'s
for the resulting JavaScript code.

You should understand most of JavaScript semantics
before continuing.
###

# Assignment:
number   = 42 #=> var number = 42;
opposite = true #=> var opposite = true;

# Conditions:
number = -42 if opposite #=> if(opposite) { number = -42; }

# Functions:
square = (x) -> x * x #=> var square = function(x) { return x * x; }

fill = (container, liquid = "coffee") ->
  "Filling the #{container} with #{liquid}..."
#=>var fill;
#
#fill = function(container, liquid) {
#  if (liquid == null) {
#    liquid = "coffee";
#  }
#  return "Filling the " + container + " with " + liquid + "...";
#};

# Ranges:
list = [1..5] #=> var list = [1, 2, 3, 4, 5];

# Objects:
math =
  root:   Math.sqrt
  square: square
  cube:   (x) -> x * square x
#=> var math = {
#    "root": Math.sqrt,
#    "square": square,
#    "cube": function(x) { return x * square(x); }
#   };

# Splats:
race = (winner, runners...) ->
  print winner, runners
#=>race = function() {
#    var runners, winner;
#    winner = arguments[0], runners = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
#    return print(winner, runners);
#  };

# Existence:
alert "I knew it!" if elvis?
#=> if(typeof elvis !== "undefined" && elvis !== null) { alert("I knew it!"); }

# Array comprehensions:
cubes = (math.cube num for num in list)
#=>cubes = (function() {
#	  var _i, _len, _results;
#	  _results = [];
# 	for (_i = 0, _len = list.length; _i < _len; _i++) {
#		  num = list[_i];
#		  _results.push(math.cube(num));
#	  }
#	  return _results;
# })();

foods = ['broccoli', 'spinach', 'chocolate']
eat food for food in foods when food isnt 'chocolate'
#=>foods = ['broccoli', 'spinach', 'chocolate'];
#
#for (_k = 0, _len2 = foods.length; _k < _len2; _k++) {
#  food = foods[_k];
#  if (food !== 'chocolate') {
#    eat(food);
#  }
#}
```

## Additional resources

- [Smooth CoffeeScript](http://autotelicum.github.io/Smooth-CoffeeScript/)
- [CoffeeScript Ristretto](https://leanpub.com/coffeescript-ristretto/read)

