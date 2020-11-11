title=Implementation Patterns
tags=reading, books, pattern, language
summary=A collection of patterns around language atoms.
~~~~~~
(by Kent Beck )


### Class
-- Class (22): Use a class to say, "This data goes together and this logic goes with it"
-- Simple Superclass Name (23): Name the roots of class hierarchies with simple names drawn from the same metaphor
-- Qualified Subclass Name (24): Name subclasses to communicate the similarities and differences with a superclass
-- Abstract Interface (24): Separate the interface from the implementation
-- Interface (26): Specify an abstract interface which doesn't change often
-- Versioned Interface (27): Extend interfaces safely by introducing a new subinterface
-- Abstract Class (26): Specify an abstract interface which will likely change with an abstract class
-- Value Object (28): Write an object that acts like a mathematical value
-- Specialization (31): Clearly express the similarities and differences of related computations
-- Subclass (32): Express one-dimensional variation with a subclass
-- Implementor (34): Override a method to express a variant of computation
-- Inner Class (34): Bundle locally useful code into a private class
-- Instance-specific Behavior (36): Vary logic by instance
-- Conditional (36): Vary logic by explicit conditionals
-- Delegation (38): Vary logic by delegating to one of several types of objects
-- Pluggable Selector (40): Vary logic by reflectively executing a method
-- Anonymous Inner Class (41): Vary logic by overriding one or two methods right in the method that is creating a new object
-- Library Class (41): Represent a bundle of functionality that doesn't fit into any object as a set of static methods


### State
-- State (44): Compute with values that change over time
-- Access (45): Maintain flexibility by limiting access to state
-- Direct Access (46): Directly access state inside an object
-- Indirect Access (47): Access state through a method to provide greater flexibility
-- Common State (47): Store the state common to all objects of a class as fields
-- Variable State (48): Store state whose presence differs from instance to instance as a map
-- Extrinsic State (50): Store special-purpose state associated with an object in a map held by the user of that state
-- Variable (50): Variables provide a namespace for accessing state
-- Local Variable (51): Local variables hold state for a single scope
-- Field (52): Fields store state for the life of an object
-- Parameter (53): Parameters communicate state during the activation of a single method
-- Collecting Parameter (55): Pass a parameter to collect complicated results from multiple methods
-- Optional Parameter (56):
-- Var Args (56):
-- Parameter Object (57): Consolidate frequently used long parameter lists into an object
-- Constant (58): Store state that doesn't vary as a constant
-- Role-Suggesting Name (58): Name variables after the role they play in a computation
-- Declared Type (60): Declare a general type for variables
-- Initialization (60): Initialize variables declaratively as much as possible
-- Eager Initialization (60): Initialize fields at instance creation time
-- Lazy Initialization (62): Initialize fields whose values are expensive to calculate just before they are used


### Behavior
-- Control Flow (64): Express computations as a sequence of steps
-- Main Flow (64): Clearly express the main flow of control
-- Message (65): Express control flow by sending a message
-- Choosing Message (65): Vary the implementors of a message to express choices
-- Double Dispatch (66): Vary the implementors of messages along two axes to express cascading choices
-- Decomposing (Sequencing) Message (67): 
-- Reversing Message (67): Make control flows symmetric by sending a sequence of messages to the same receiver
-- Inviting Message (68): Invite future variation by sending a message that can be implemented in several ways
-- Explaining Message (69): Send a message to explain the purpose of a clump of logic
-- Exceptional Flow (70): Express the unusual flows of control as clearly as possible without interfering with the expression of the main flow
-- Guard Clause (70): Express local exceptional flows by an early return
-- Exception (72): Express non-local exceptional flows with exceptions
-- Checked Exception (72): Ensure that exceptions are caught by declaring them explicitly
-- Exception Propagation (73): Propagate exceptions, transforming them as necessary so the information they contain is appropriate to the catcher


### Method
-- Composed Method (77): Compose methods out of calls to other methods
-- Intention-Revealing Name (79): Name methods after what they are intended to do
-- Method Visibility (80): Make methods as private as possible
-- Method Object (82): Turn complex methods into their own objects
-- Overridden Method (83): Override methods to express specialization
-- Overloaded Method (83): Provide alternative interfaces to the same computation
-- Method Return Type (84): Declare the most general possible return type
-- Method Comment (85): Comment methods to communicate information not easily read from the code
-- Helper Method (85): Create small, private methods to express the main computation more succinctly
-- Debug Print Method (86): Use toString() to print useful debugging information
-- Conversion (87): Express the conversion of one type of object to another cleanly
-- Conversion Method (87): For simple, limited conversions, provide a method on the source object that returns the converted object
-- Conversion Constructor (88): For most conversions, provide a method on the converted object's class that takes the source object as a parameter
-- Creation (88): Express object creation clearly
-- Complete Constructor (89): Write constructors that return fully formed objects
-- Factory Method (90): Express more complex creation as a static method on a class rather than a constructor
-- Internal Factory (91): Encapsulate in a helper method object creation that may need explanation or later refinement
-- Collection Accessor Method (91): Provide methods that allow limited access to collections
-- Boolean Setting Method (93): If it helps communication, provide two methods to set boolean values, one for each state
-- Query Method (93): Return boolean values with methods named asXXX
-- Equality Method (94): Define equals() and hashCode() together
-- Getting Method (95): Occasionally provide access to fields with a method returning that field
-- Setting Method (96): Even less frequently provide the ability to set fields with a method
-- Safe Copy (97): Avoid aliasing errors by copying objects passed in or out of accessor methods

---

I really want to expand on this list; I think there's a lot more implementation atoms out there to consider. Much of what Kent put here seems deeply biased/influenced by object-oriented programming paradigms, and I'm certain that's a blinder.

