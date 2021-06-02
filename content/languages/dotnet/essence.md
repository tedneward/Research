title=Essence#
tags=clr, language
summary=A Smalltalk-superset language for the CLR.
~~~~~~
[Blog](https://essencesharp.wordpress.com/)

[Source](https://github.com/EssenceSharp):

* [Binaries](https://github.com/EssenceSharp/Bin)
* [Documentation](https://github.com/EssenceSharp/cSharp)
* [Library](https://github.com/EssenceSharp/Standard.lib)
* [Extensions](https://github.com/EssenceSharp/Extensions.lib)
* [Tools](https://github.com/EssenceSharp/Tools)
* [Scripts](https://github.com/EssenceSharp/Scripts)

From (archived) CodePlex:

Essence# is a fully dynamic and highly polymorphic programming language which features pervasive message passing, pervasive dynamic and strong typing, pervasive and deep reflection and pervasive object orientation. Essence# implements and reveals the "essence" of object-oriented programming:

**Message passing**: Almost all computation in Essence# happens via the sending of messages. The only way to invoke a method is to send a message—which necessarily involves dynamic binding (by name) of message to method at runtime (and never at compile time.) The internals of an object are not externally accessible, ever—the only way to access or modify an object's internal state is to send it a message. So function and data encapsulation and abstraction are both complete and universal.

**Dynamic and strong typing**: Although any object can be assigned to any variable, the only way to access or modify the internal state of an object is to send it a message—and the sending of any invalid message is detected and prevented at run time. So, even though Essence#'s pervasive use of dynamic typing enables the programmer to define highly polymorphic abstractions with an extremely high degree of applicability and reusability, it is impossible to apply a function to a value for which there is no valid, defined behavior.

**Reflection**: In most programming languages, the specifications of types, classes, functions and subroutines exist only in the source code, and so are not accessible at runtime. But in Essence#, all specifications of all program constructs (classes, methods, etc.) are live objects that exist both at compile time and at runtime—and those objects are fully accessible to a running program, and can be queried or modified by sending them messages. So an Essence# program can not only fully introspect on itself, it has full power to change itself.

**Object-orientation**: In Essence#, all values are objects—even booleans, integers and other numbers, characters, strings, classes, blocks of code...and even"null." That's right, in Essence# you can not only send messages to "null," you can even add methods to the class of "null," and then send "null" the corresponding messages! That's because all Essence# values are instances of a class, and so can all be sent messages. And Essence# classes can be created and modified while the program is running. In Essence#, almost all computation is done by sending messages.

**Inter-language interoperability**: Thanks to the DLR's Meta Object Protocol, Essence# provides deep and comprehensive integration and interoperability with other programming languages that are hosted on the CLR, whether those are statically-typed languages such as C# or are dynamically-typed languages that use the DLR's Meta Object Protocol.

In fact, Essence# serves as an excellent language for scripting the creation and manipulation of C# objects (for example.) The original motivation for the creation of Essence# was to use it as a domain specific language for creating and configuring C# objects that specify trading plans generated in response to trading signals. It has been and is being used for that purpose by the original implementer.

Necessity is the essence of invention. :-)

[InfoQ article](https://www.infoq.com/articles/Introducing-Essence-Sharp/):

In Essence#, most of the classes will derive from one of the following object state architectures.

* **Abstract**: A class whose instance architecture is #Abstract cannot have any instances.

* **Stateless**: The instances of a class whose instance architecture is #Stateless cannot have any state at all. For example, the class Object.

* **NamedSlots**: The instances of a class whose instance architecture is #NamedSlots can have named instance variables ("fields" in CLR-speak.) The instance variables ("fields") are dynamically typed; they work as though they had the C# type "Dynamic." (Note that there are more specific object state architectures that can also have named instance variables. So #NamedSlots is just the most abstract or general case.)

* **IndexedObjectSlots**: The instances of a class whose instance architecture is #IndexedObjectSlots can have any number of indexable slots--including none at all. They can also optionally have named instance variables. In both cases, the slots work as though they had the C# type "Dynamic." Such objects are the Essence# equivalent of C# object arrays.

* **Indexed[Type]Slots**: These represent arrays of various types. The current list is Byte, Char, HalfWord, Word, LongWord, SinglePrecision, DoublePrecision, and QuadPrecision (128-bit floating point).

There is a variety of system architectures as well. These architectures are used for the language’s infrastructure rather than for custom types. Some of the more interesting architectures include:

* **Message**: A Message instance specifies a message that was or could be sent, along with the message arguments, if any. Instances are created by the run time system when and as needed, although application code may also create and use instances. Message instances cannot have programmer-accessible named instance variables.

* **Namespace**: Namespace instances serve as dynamic namespaces at runtime (See the documentation on namespaces for a far more detailed description]). Instances may optionally have programmer-accessible named instance variables.

* **Pathname**: A Pathname instance serves as a hierarchical key whose elements are Strings. It's used for identifying namespaces, file pathnames, URLs, etc. Instances may optionally have programmer-accessible named instance variables.

* **Block**: A block is an anonymous function with full closure semantics. The implementation uses CLR delegates. Blocks cannot have programmer-accessible named instance variables.

* **Method**: A method is executable code that runs in the context of a specific class, with full access to the internal state of the distinguished object that receives the message that invokes the method. Methods cannot have programmer-accessible named instance variables.

* **Behavior**: A Behavior is a proto-class. There can actually be instances--it's not abstract. Instances may optionally have programmer-accessible named instance variables. (See the documentation on classes for a more detailed description]).

* **Class**: A Class is a full Essence# class which is a subclass of Behavior, is an instance of a Metaclass, and whose instances (if it's allowed to have any) can be an object (value) of any type. The term 'class' is usually intended to refer to an (indirect) instance of the class Class, but technically can refer to any Object that can create instances of itself, such as a Behavior or a Metclass (i.e., any instance of Behavior or anything that inherits from Behavior.) Instances may optionally have programmer-accessible named instance variables. (See the documentation on classes for a more detailed description]).

* **Metaclass**: A Metaclass is an Essence# class which is a direct subclass of the (Essence#) class Behavior. A Metaclass is an instance of the class Metaclass, and its instances must be Classes. A Metaclass can have only one instance which is called either the canonical instance or the sole instance. Note that the superclass of the Metaclass of any root Behavior (e.g., the metaclass of class Object) is (and must be) the class Class. Instances may optionally have programmer-accessible named instance variables. (See the documentation on classes for a more detailed description]).

* **BehavioralTrait**: A Trait is a composable unit of behavior. Traits can be "used" by a class or by another Trait with the effect of adding the methods defined (or used) by the Trait to the method dictionary of the using class or of the using Trait. A BehavioralTrait is a Trait usable by any BehavioralTrait or by any Behavior (i.e., by any instance of the class BehavioralTrait, or by any instance of the class Behavior, or by any instance of any subclass of either the class BehavioralTrait or of the class Behavior.)

* **HostSystemObject**: A "host system object" is simply an instance of any CLR type which is not a formal part of the Essence# runtime system. One of the requirements for an Essence# class to represent a CLR type (which may or may not be a "class" as the CLR defines that term) is that its instance type must be #HostSystemObject.

Traits
Traits are Essence#’s answer to multiple inheritance. Traits are sets of functionality that can be imported by a class, but they are more than just cut-and-paste methods handled by the compiler. So first, let us talk about how they differ from normal methods.

With one exception, methods imported from a trait should be indistinguishable from those implemented locally by the importing class or trait. The exception is that methods defined in a trait bind to non-local variables (e.g, class variables) based on the namespace environment of the trait that defines the methods, and not based on the namespace environment of the class or trait that uses (“imports”) those methods.

Currently Essence# does not allow instance variables to be defined or referenced by traits. That may change in the future.

Traits don’t have to be used entirely as-is; they can be combined to create new traits. Combining traits isn’t like combining interfaces where you have to include every method from each source. Instead, you have to work with three operators.

The '+' operator allows you to combine the unique methods of two traits. As a way of dealing with name collisions, if a method is defined in both traits being combined with the '+' operator, the method is excluded.

Since that is probably not what you want to happen, you can use the '-' operator to remove the unwanted method from one trait so that the method will be expressed by the other trait. Or you can use the '@' operator to rename the method on one of the base traits.


