title=Sugar
tags=language, browser, nodejs
summary=A language to make JavaScript programming sweeter.
~~~~~~

Sugar design goals include:

 - Can be learned in a couple of days by average developers
 - Abstract from common JavaScript pitfalls
 - Minimize the differences in the code produced by different coders
 - Capture more information than other languages (be explicit)

Sugar owes the following languages in different areas:

 - Python, for the simplicity and cleanliness of the syntax
 - Eiffel, for the design by contract support
 - Smalltalk, for blocks
 - Io, for the message sending syntax
 - ML, for the pattern-matching syntax
 - Lisp, for the map/reduce/filter support

[Source](https://github.com/sebastien/sugar)

Example:
```
@module helloworld
   
  @class HelloWorld
  | This is a docstring for my hello world
   
      @property message

      @constructor
          message = "Hello, World !"
      @end

      @method say
          alert ( message )
      @end
   
@end
```
