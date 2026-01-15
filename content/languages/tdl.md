title=TDL
tags=language, events
summary=A prototype-based event-driven language with influences from ooc, Ruby, and Ioke.
~~~~~~

Source used to be at https://github.com/duckinator/TDL but 404s now. Found again: [Source](https://github.com/nealcao/TDL) but is lacking the README (which I have below):

### From the README
TDL is a prototype-based event-driven language.

Syntax for event actions:

    ObjName: ObjInheritedFrom {
      EvtName: Event {
        ACTION1
        ACTION2
        ...
      }
    }

Events can have multiple actions. You can declare events multiple times, they'll run in the order added.


Syntax for event triggering:

    OBJECT EVENT()

`OBJECT` can be a literal (string, number, etc).

`OBJECT EVENT()` triggers the event `EVENT` on `OBJECT` (Similar to `OBJECT.EVENT()` in many OOP languages)

#### Inheritance and predefined objects

Non-existant objects are references to the `null` object (inherits from `Predefined null`).

`Object` inherits from `null` and adds methods to it.

Objects - excluding `null`, `true`, and `false` - all inherit from the object `Object`.

Events all inherit from the object `Event` (inherits from `Predefined event`).

Constructs all inherit from the object `Construct` (inherits from `Predefined construct`).

All `Event` and `Construct` arguments inherit from the object `Argument` (inherits from `Predefined argument`)

Numbers all inherit from the object `Number`.

Strings all inherit from the object `String`.

Booleans inherit from either `true` or `false`.

Arrays all inherit from the object `Array`.

Hashes all inherit from the object `Hash`.

All events without a receiver are ran on the `Ground` object.

#### Predefined events

The following predefined events are defined on the `Predefined` object:

    clone(this)
    print(this)
    string_size(this)
    string_concat(this, other)
    string_replace(this, current, other, all) // `all` is `true` if you want to replace all instances,
                                              // and `false` otherwise
    substring(this, position)
    substring_replace(this, position, value)
    add(this, number)
    subtract(this, number)
    multiply(this, number)
    divide(this, number)
    modulo(this, number)
    pow(this, number)
    left_shift(this, other)
    right_shift(this, other)
    bitwise_and(this, other)
    bitwise_or(this, other)
    bitwise_xor(this, other)
    lt_gt_equal(this, other)
    number_floor(this)
    number_to_string(this)
    hash_get(this, key)
    hash_set(this, key, value)
    hash_size(this)

#### Predefined constructs

The following predefined constructs are defined on the `Predefined` object:

    while(condition, block)
    if(condition, block)
    hash_each(block)

#### Ground object

The `Ground` object starts as a clone of `Object`. It is the object which all unbound events (events not raised on a particular object) are forwarded to and all unbound objects (objects not specified in the context of another object) are defined.

#### Defining objects

To set `A` as a copy of `B`:

    A: B

To add new events to `A` that are not in `B` while defining the object:

    A: B {
      foo: Event {
        "hai"
      }
    }

To add create a new object, and add new events later:

    A: B {
      foo: Event {
        "hai"
      }
    }
     
    A {
      bar: Event {
        "thar"
      }
    }

#### Events and Constructs

Arguments to events and constructs inherit from the `Argument` object (which should not used directly), and are not evaluated until you invoke the `call()` method

Events - despite being objects - work as what most languages would call methods, very straight-forward:

    A: Object {
      foo: Event {
        # Everything here is ran when you do `A foo()`
      }
    }

Constructs are like events but the last argument is always a _block_ and none of the arguments are evaluated until you raise the `call()` event on them.

There is a `call!()` event (defined in core.tdl) which is the same as `argName = argName call()`

    Number {
      upto: Construct(limit, block) {
        i: this
        limit call!()
        while(i < limit) {
          block call(i)
          i += 1
        }
      }
    }
    
    init {
      1 upto(10) { |i|
        i toString() print()
      }
    }

#### Properties

A property, also known by about a million other names, is a variable which references an object.  There are no other variables in TDL.

Properties are per-object, since code is never actually executed outside of events (the obvious limitations of this are mentioned in "Object Initialization").

    A: Object {
      b: Event {
        asdf = "fdsa"
      }
    }

#### Object Initialization

The `init` event is called when the object is created. The object is created as it is found in the code, when the program starts.

`Ground init()` is called when the program starts.

For instance, in the following example, `A` is created before `B`.

    A: Object {
      init: Event {
        foo = "bar"
      }
    }

    B: Object {
      init: Event {
        bar = "asdf"
      }
    }

#### this, This, parent, and Parent

`this` returns a reference to the current object.

    A: Object {
      foo: Event {
        "meep"
      }
      b: Event {
        this foo() // calls `A foo`
      }
    }

`This` returns a clone of the current object.

    B: Object {
      clone: Event {
        This // returns a clone of `B`
      }
    }

`parent` returns a reference to the object the current object is a clone of.

    C: Object {
      p: Event {
        parent // I couldn't think of a real use for this, but it fits with this/This
      }
    }

`Parent` returns a clone of the object the current object is a clone of.

    D: Object {
      reset: Event {
        this = Parent /* replace the current object with a new clone of
                         the object was a clone of, `Object` in this case */
      }
    }

#### Object

All objects inherit from Object. 

    Object {
      foo: Event {
        // "foo" can be run on all objects
      }
    }


#### Special syntax

Any object following a colon is considered an object or attribute reference.

The original reasoning for adding this was to allow for objects that would otherwise be interpreted as numbers.

    A: Object {
      init: Event {
        FOO = "meep"
        001 = "meep" // unambiguous enough to not require a leading colon
        FOO print() // this is the same as just `FOO`
      }
      2: Event { // unambiguous enough to not require a leading colon
        :001 print() // ambiguous enough to require a colon, the `001` could be a number
      }
      3: Event { // unambiguous enough to not require a leading colon
        print(:001) // ambiguous enough to require a colon, the `001` could be a number, this is the same as calling `Ground print(:001)`
      }
    }

#### Comments

Any line starting with `//` is a comment, and data contained within `/*` and `*/` are comments

    // This is one comment
    /* And this,
       is yet another */


#### Example
```
IRC: Socket {
  /*
    You can define events that only work from inside a particular class
    *insert mass suicide before people see how amazing this looks later*
  */
  String {
    send: Event {
      parent send(self)
    }
  }

  run: Event {
    connect ("irc.ninthbit.net", 6667)
    "USER a b c d" send()
    "NICK foobar" send()
  }

  001: Event {
    "JOIN #programming" send()
  }

  receiveLine: Event (line) {
    words = line split(" ")
    if (words[0] == "PING") {
      ("PONG " + words[1..-1]) send()
    } else if (words[1] == "001") {
      :001()
    }
  }

  quit: Event {
    "QUIT :Boom" send()
  }
}

init: Event {
  bot: IRC
  bot run()
}
```

