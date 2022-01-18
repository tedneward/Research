title=Falcon
tags=language
summary=An open source, simple, fast and powerful programming language, easy to learn and to feel comfortable with, and a scripting engine ready to empower mission-critical multithreaded applications; provides six integrated programming paradigms: procedural, object oriented, prototype oriented, functional, tabular and message oriented.
~~~~~~

[Website](http://falconpl.org/) | [Source](https://github.com/falconpl)

Examples:
```
// return a square of the argument
function sqr( a )
   return a*a
end

// create an object that extracts the (base)nth radix of an argument
// i.e.
// tenth_radix = radix_of( 10 )
// > tenth_radix.extract( exp(50) )   --> extracts the tenth radix of 50^e

class radix_of( base )
   _base = base

   function extract( value )
      return value ** (1/self._base)
   end
end

//create a functional "absolute" through the math sqr(x) operation
func_abs = .[ cascade .[      // this is the functional sequence operator
   sqr                        // our square argument
   radix_of( 2 ).extract      // get the extract method of an instance of square root.
   ]
]

// then call it
> func_abs( -4 )              // shall be 4
```

But also the reverse is possible, as functional constructs can be used as object members. For example:

```
// We'll use a singleton instance this time
object absoluter
   // a data to be filled by the functional operators
   _data = nil

   // and our functional operators...
   enact = .[cascade .[ self.set       // this will update self._data.
      self.square                      // and theese will use self._data
      self.sqrt] ]

   function set( value )
      self._data = value
   end

   function square()
      self._data *= self._data
   end

   function sqrt( value )
      return self._data ** 0.5
   end
end

// let's see it in action
> absoluter.enact( -2 )    // shall be 2
```