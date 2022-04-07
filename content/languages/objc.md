title=Objective-C
tags=language, native, object, dynamic, compiled, macos, ios, message-passing
summary=The other object-oriented take on C, based much more directly on the message-passing principles of Smalltalk.
~~~~~~

"It’s a superset of the C programming language and provides object-oriented capabilities and a dynamic runtime. Objective-C inherits the syntax, primitive types, and flow control statements of C and adds syntax for defining classes and methods. It also adds language-level support for object graph management and object literals while providing dynamic typing and binding, deferring many responsibilities until runtime."

[Apple website](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/Introduction/Introduction.html)

[Objective-C Programming Language](http://andrewd.ces.clemson.edu/courses/cpsc102/notes/ObjC.pdf) (2002) | [Objective-C 2.0 Programming Language](http://cagt.bu.edu/w/images/b/b6/Objective-C_Programming_Language.pdf) (2009) | [GNUStep Obj-C book](http://www.gnustep.org/resources/documentation/ObjectivCBook.pdf)

---

## Fundamentals

#### Obj-C builds off of C syntax
Pretty much everything we know about ObjC, at the procedural level, we know from C. Basic syntax, primitive types, curly-brace blocks and semicolons, flow control, it all basically comes from C to start. This was a deliberate decision by the language designers--they wanted to layer objects on top of C via [message-passing](/reading/message-passing.html), so they built a message-passing runtime at the C level, and then the ObjC compiler uses that message-passing runtime as its object implementation.

#### An App Is Built from a Network of Objects
> When building apps for OS X or iOS, you’ll spend most of your time working with objects. Those objects are instances of Objective-C classes, some of which are provided for you by Cocoa or Cocoa Touch and some of which you’ll write yourself. If you’re writing your own class, start by providing a description of the class that details the intended public interface to instances of the class. This interface includes the public properties to encapsulate relevant data, along with a list of methods. Method declarations indicate the messages that an object can receive, and include information about the parameters required whenever the method is called. You’ll also provide a class implementation, which includes the executable code for each method declared in the interface.

Class definitions are split into interface files (.h) and implementation files (.m). Expectation is one class per each.

```
@interface Person : NSObject

@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *age; /* or could be @property int yearOfBirth; if we want to use a primitive instead of an object */

@end
```

Declares Person to inherit from NSObject. Person has several public properties, and they are pointers to Objective-C objects (NSString or NSNumber). These properties are completely publicly-accessible, which means they're essentially just fields of an object. Properties can have access restrictions via *property attributes*, which are expressed as part of the property declaration, like so:

```
@interface Person : NSObject

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSNumber *age; /* or could be @property int yearOfBirth; if we want to use a primitive instead of an object */

@end
```

[Complete list of property accessors](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/EncapsulatingData/EncapsulatingData.html#//apple_ref/doc/uid/TP40011210-CH5-SW4)

Declaring methods is about declaring what *messages* objects of this class type can receive. (C-functions are standard direct-dispatch, whereas ObjC *methods* are done via message-passing through the ObjC runtime.) Doing so means declaring the method in the @interface, using a + or - to indicate instance vs "class" (static) methods:

```
@interface Person : NSObject

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSNumber *age; /* or could be @property int yearOfBirth; if we want to use a primitive instead of an object */

- (void)sayHello;

@end
```

If the method is to take parameters, they are declared in ":"-separated style like so:

```
@interface Person : NSObject

@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;
@property (readonly) NSNumber *age; /* or could be @property int yearOfBirth; if we want to use a primitive instead of an object */

- (void)sayHello;
- (void)introduceMyself:(NSNumber*)times;
- (void)introduceMyself:(NSNumber*)times to:(NSString*)other;

@end
```

This creates a method that takes a single NSNumber parameter, called "times", when invoked. The parameter names are exposed as part of the method signature; this makes sense, given that under the hood invocation of a method is creating a message with the parameters all bundled up, identified by name, and sent to the object for examination and possible execution (or deference to superclasses).

For each parameter type, the `(type)name` syntax repeats, separated by `:` characters and terminated with a `;`. Methods can overload based on the type, number, *and names* of parameters to the method. (This is a distinguishing point against C++-influenced languages like Java and C#.) The second and subsequent parameter names are considered part of the method signature. (The second method above is known as "introduceMyself:to".) The name following the parameter type is the local reference to the passed-in value.

Objective-C lacks any lexical namespacing feature, so frameworks/libraries generally create two- or three-letter prefixes for their classes to avoid name clashes.

Implementation is done in .m files, which `#import` the header and define the implementation inside of `@implementation` blocks, like so:

```
#import "Person.h"

@implementation Person

- (void)sayHello {
  NSLog(@"Hello, I'm a Person");
}

- (void)introduceMyself:(NSNumber*)times {
  // Loop "times" times and say the message
}

- (void)introduceMyself:(NSNumber*)times to:(NSString*)other {
  // Loop "times" times and say hello to "other"
}

@end
```



---

#### Categories Extend Existing Classes
> Rather than creating an entirely new class to provide minor additional capabilities over an existing class, it’s possible to define a category to add custom behavior to an existing class. You can use a category to add methods to any class, including classes for which you don’t have the original implementation source code, such as framework classes like NSString. If you do have the original source code for a class, you can use a class extension to add new properties, or modify the attributes of existing properties. Class extensions are commonly used to hide private behavior for use either within a single source code file, or within the private implementation of a custom framework.

---

#### Protocols Define Messaging Contracts
> The majority of work in an Objective-C app occurs as a result of objects sending messages to each other. Often, these messages are defined by the methods declared explicitly in a class interface. Sometimes, however, it is useful to be able to define a set of related methods that aren’t tied directly to a specific class. Objective-C uses protocols to define a group of related methods, such as the methods an object might call on its delegate, which are either optional or required. Any class can indicate that it adopts a protocol, which means that it must also provide implementations for all of the required methods in the protocol.

---

#### Values and Collections Are Often Represented as Objective-C Objects
> It’s common in Objective-C to use Cocoa or Cocoa Touch classes to represent values. The NSString class is used for strings of characters, the NSNumber class for different types of numbers such as integer or floating point, and the NSValue class for other values such as C structures. You can also use any of the primitive types defined by the C language, such as int, float or char. Collections are usually represented as instances of one of the collection classes, such as NSArray, NSSet, or NSDictionary, which are each used to collect other Objective-C objects.

---

#### Blocks Simplify Common Tasks
> Blocks are a language feature introduced to C, Objective-C and C++ to represent a unit of work; they encapsulate a block of code along with captured state, which makes them similar to closures in other programming languages. Blocks are often used to simplify common tasks such as collection enumeration, sorting and testing. They also make it easy to schedule tasks for concurrent or asynchronous execution using technologies like Grand Central Dispatch (GCD).

---

#### Error Objects Are Used for Runtime Problems
> Although Objective-C includes syntax for exception handling, Cocoa and Cocoa Touch use exceptions only for programming errors (such as out of bounds array access), which should be fixed before an app is shipped. All other errors—including runtime problems such as running out of disk space or not being able to access a web service—are represented by instances of the NSError class. Your app should plan for errors and decide how best to handle them in order to present the best possible user experience when something goes wrong."

---

#### Objective-C Code Follows Established Conventions
> When writing Objective-C code, you should keep in mind a number of established coding conventions. Method names, for example, start with a lowercase letter and use camel case for multiple words; for example, doSomething or doSomethingElse. It’s not just the capitalization that’s important, though; you should also make sure that your code is as readable as possible, which means that method names should be expressive, but not too verbose.

> In addition, there are a few conventions that are required if you wish to take advantage of language or framework features. Property accessor methods, for example, must follow strict naming conventions in order to work with technologies like Key-Value Coding (KVC) or Key-Value Observing (KVO)."

Being a dynamic language, ObjC depends very heavily on the use of names as the commonality/specialization axis for first-class support. Thus, a class needs to provide precisely-matching names to what's expected in order to be a participant in a particular design family. This enables objects to participate in multiple families without requiring a recompilation of the world, and allows objects to be evaluated for participation in a design family at runtime, which provides greater flexibility, but at the cost of being erroneous due to programmer mistakes.

---

## FFI

- OC - Easily Declare/Invoke Objective-C APIs from C11 or C++11
	- Macro magic for declaring/calling Objective-C APIs from C11 or C++. Preloads selectors, chooses the correct objc_msgSend to call per method/platform.
	- https://github.com/garettbass/oc



## GNUstep
The remnants of the NeXTStep environment from Jobs' NeXT days.

[Tutorials](http://www.gnustep.it/nicola/Tutorials/index.html) | [Documentation](http://www.gnustep.org/experience/documentation.html) | [Build Guide](http://gnustep.made-it.com/BuildGuide/)

