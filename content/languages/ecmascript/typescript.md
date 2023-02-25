title=TypeScript
tags=language, nodejs, object, functional, metaobject
summary=A superset of JavaScript with strong compile-time typechecking that transpiles to clean JavaScript output.
~~~~~~

[Website](https://www.typescriptlang.org/) | [Source](https://github.com/microsoft/TypeScript) | [Spec] (https://github.com/Microsoft/TypeScript/blob/master/doc/spec.md) | [Playground](https://www.typescriptlang.org/play)

### Reading

* [Anders Hejlsberg - Introducing TypeScript on Channel 9] (http://channel9.msdn.com/posts/Anders-Hejlsberg-Introducing-TypeScript)
* [Definitely Typed - repository for type definitions] (http://definitelytyped.org/)
* [Tackling TypeScript: Upgrading from JavaScript](https://exploringjs.com/tackling-ts/toc.html) - Dr. Axel Rauschmayer
* [TypeScript Accelerated](https://accelerated.amimetic.co.uk) - James Porter
* [TypeScript Deep Dive](https://basarat.gitbooks.io/typescript/)
* [TypeScript for C# Programmers](http://www.infoq.com/minibooks/typescript-c-sharp-programmers)
* [TypeScript Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/typescript) (PDF, Kindle) (email address *requested*, not required)
* ["Advanced TypeScript Types with Examples"](https://levelup.gitconnected.com/advanced-typescript-types-with-examples-1d144e4eda9e)
* ["Advanced TypeScript patterns"](https://medium.com/@dhruvrajvanshi/advanced-typescript-patterns-6cf8826c7944)
* ["Practical Advanced TypeScript"](https://egghead.io/courses/practical-advanced-typescript)
* ["Advanced TypeScript type FTW!"](https://www.pulumi.com/blog/advanced-typescript-type-ftw/)
* ["How to master advanced TypeScript patterns"](https://www.freecodecamp.org/news/typescript-curry-ramda-types-f747e99744ab/)
* ["The Ultimate TypeScript Thread"](https://twitter.com/mpocock1/status/1509964736275927042):

    * Learn how to derive a union type from an object - an incredibly useful switcheroo that's at the heart of most TS magic out there
    * Transform a union to another union, using the `in` operator as a kind of for-loop.
    * TypeScript's string interpolation powers are incredible, esp since 4.1. Add some utilities from ts-toolbelt, and you've got a stew going.
    * Function overloads can be used in conjunction with generics to make incredibly complex and dynamic type signatures.
    * The `extends` keyword is very powerful; here I use it to narrow the value of a generic to enable some beautiful autocomplete/inference.
    * Type helpers change the game when it comes to types in yoru codebase. They help TS infer more from your code and make your types a lot more readable.
    * The looseness of Object.keys can be a real pain point when using TS. Luckily, it's pretty simple to create a tighter version using generics and the keyof operator.
    * You can use generics in React to make dynamic, flexible components.
    * Generics can be "locked in" by function calls, meaning that generics can be 'curried' through functions.
    * You can throw detailed error messages for type checks.
    * Deep partials are useful and not natively supported by TS.
    * Create a TS helper called LooseAutocomplete which gives us autocomplete while also allowing arbitrary values.
    * Want to turn a module into a type? Use typeof import('./') to grab the type of any module, even third-party ones.
    * Globals in TS? declare global is a useful tool for when you want to allow types to cross module boundaries.
    * You can use generics to dynamically specify the number, and type, of arguments to functions.

* [Code for "Advanced Static Types in TypeScript" course on egghead.io](https://github.com/mariusschulz/egghead-advanced-static-types-in-typescript)
* Video: ["Advanced TypeScript tooling at scale"](https://archive.fosdem.org/2019/schedule/event/typescript_advanced_tooling/)
* ["Using the Compiler API"](https://github.com/Microsoft/TypeScript/wiki/Using-the-Compiler-API)
* ["Assembly interpreter inside of TypeScript's type system"](https://judehunter.dev/blog/assembly-interpreter-in-typescripts-type-system)

### [Learn TypeScript in Y Minutes](https://learnxinyminutes.com/docs/typescript/)

TypeScript is a language that aims at easing development of large scale applications written in JavaScript.  TypeScript adds common concepts such as classes, modules, interfaces, generics and (optional) static typing to JavaScript.  It is a superset of JavaScript: all JavaScript code is valid TypeScript code so it can be added seamlessly to any project. The TypeScript compiler emits JavaScript.

```ts
// There are 3 basic types in TypeScript
let isDone: boolean = false;
let lines: number = 42;
let name: string = "Anders";

// But you can omit the type annotation if the variables are derived
// from explicit literals
let isDone = false;
let lines = 42;
let name = "Anders";

// When it's impossible to know, there is the "Any" type
let notSure: any = 4;
notSure = "maybe a string instead";
notSure = false; // okay, definitely a boolean

// Use const keyword for constants
const numLivesForCat = 9;
numLivesForCat = 1; // Error

// For collections, there are typed arrays and generic arrays
let list: number[] = [1, 2, 3];
// Alternatively, using the generic array type
let list: Array<number> = [1, 2, 3];

// For enumerations:
enum Color { Red, Green, Blue };
let c: Color = Color.Green;
console.log(Color[c]); // "Green"

// Lastly, "void" is used in the special case of a function returning nothing
function bigHorribleAlert(): void {
  alert("I'm a little annoying box!");
}

// Functions are first class citizens, support the lambda "fat arrow" syntax and
// use type inference

// The following are equivalent, the same signature will be inferred by the
// compiler, and same JavaScript will be emitted
let f1 = function (i: number): number { return i * i; }
// Return type inferred
let f2 = function (i: number) { return i * i; }
// "Fat arrow" syntax
let f3 = (i: number): number => { return i * i; }
// "Fat arrow" syntax with return type inferred
let f4 = (i: number) => { return i * i; }
// "Fat arrow" syntax with return type inferred, braceless means no return
// keyword needed
let f5 = (i: number) => i * i;

// Interfaces are structural, anything that has the properties is compliant with
// the interface
interface Person {
  name: string;
  // Optional properties, marked with a "?"
  age?: number;
  // And of course functions
  move(): void;
}

// Object that implements the "Person" interface
// Can be treated as a Person since it has the name and move properties
let p: Person = { name: "Bobby", move: () => { } };
// Objects that have the optional property:
let validPerson: Person = { name: "Bobby", age: 42, move: () => { } };
// Is not a person because age is not a number
let invalidPerson: Person = { name: "Bobby", age: true };

// Interfaces can also describe a function type
interface SearchFunc {
  (source: string, subString: string): boolean;
}
// Only the parameters' types are important, names are not important.
let mySearch: SearchFunc;
mySearch = function (src: string, sub: string) {
  return src.search(sub) != -1;
}

// Classes - members are public by default
class Point {
  // Properties
  x: number;

  // Constructor - the public/private keywords in this context will generate
  // the boiler plate code for the property and the initialization in the
  // constructor.
  // In this example, "y" will be defined just like "x" is, but with less code
  // Default values are also supported

  constructor(x: number, public y: number = 0) {
    this.x = x;
  }

  // Functions
  dist(): number { return Math.sqrt(this.x * this.x + this.y * this.y); }

  // Static members
  static origin = new Point(0, 0);
}

// Classes can be explicitly marked as implementing an interface.
// Any missing properties will then cause an error at compile-time.
class PointPerson implements Person {
    name: string
    move() {}
}

let p1 = new Point(10, 20);
let p2 = new Point(25); //y will be 0

// Inheritance
class Point3D extends Point {
  constructor(x: number, y: number, public z: number = 0) {
    super(x, y); // Explicit call to the super class constructor is mandatory
  }

  // Overwrite
  dist(): number {
    let d = super.dist();
    return Math.sqrt(d * d + this.z * this.z);
  }
}

// Modules, "." can be used as separator for sub modules
module Geometry {
  export class Square {
    constructor(public sideLength: number = 0) {
    }
    area() {
      return Math.pow(this.sideLength, 2);
    }
  }
}

let s1 = new Geometry.Square(5);

// Local alias for referencing a module
import G = Geometry;

let s2 = new G.Square(10);

// Generics
// Classes
class Tuple<T1, T2> {
  constructor(public item1: T1, public item2: T2) {
  }
}

// Interfaces
interface Pair<T> {
  item1: T;
  item2: T;
}

// And functions
let pairToTuple = function <T>(p: Pair<T>) {
  return new Tuple(p.item1, p.item2);
};

let tuple = pairToTuple({ item1: "hello", item2: "world" });

// Including references to a definition file:
/// <reference path="jquery.d.ts" />

// Template Strings (strings that use backticks)
// String Interpolation with Template Strings
let name = 'Tyrone';
let greeting = `Hi ${name}, how are you?`
// Multiline Strings with Template Strings
let multiline = `This is an example
of a multiline string`;

// READONLY: New Feature in TypeScript 3.1
interface Person {
  readonly name: string;
  readonly age: number;
}

var p1: Person = { name: "Tyrone", age: 42 };
p1.age = 25; // Error, p1.age is read-only

var p2 = { name: "John", age: 60 };
var p3: Person = p2; // Ok, read-only alias for p2
p3.age = 35; // Error, p3.age is read-only
p2.age = 45; // Ok, but also changes p3.age because of aliasing

class Car {
  readonly make: string;
  readonly model: string;
  readonly year = 2018;

  constructor() {
    this.make = "Unknown Make"; // Assignment permitted in constructor
    this.model = "Unknown Model"; // Assignment permitted in constructor
  }
}

let numbers: Array<number> = [0, 1, 2, 3, 4];
let moreNumbers: ReadonlyArray<number> = numbers;
moreNumbers[5] = 5; // Error, elements are read-only
moreNumbers.push(5); // Error, no push method (because it mutates array)
moreNumbers.length = 3; // Error, length is read-only
numbers = moreNumbers; // Error, mutating methods are missing

// Tagged Union Types for modelling state that can be in one of many shapes
type State = 
  | { type: "loading" }
  | { type: "success", value: number }
  | { type: "error", message: string };

declare const state: State;
if (state.type === "success") {
  console.log(state.value);
} else if (state.type === "error") {
  console.error(state.message);
}

// Template Literal Types
// Use to create complex string types
type OrderSize = "regular" | "large";
type OrderItem = "Espresso" | "Cappuccino";
type Order = `A ${OrderSize} ${OrderItem}`;

let order1: Order = "A regular Cappuccino";
let order2: Order = "A large Espresso";
let order3: Order = "A small Espresso"; // Error

// Iterators and Generators

// for..of statement
// iterate over the list of values on the object being iterated
let arrayOfAnyType = [1, "string", false];
for (const val of arrayOfAnyType) {
    console.log(val); // 1, "string", false
}

let list = [4, 5, 6];
for (const i of list) {
   console.log(i); // 4, 5, 6
}

// for..in statement
// iterate over the list of keys on the object being iterated
for (const i in list) {
   console.log(i); // 0, 1, 2
}

// Type Assertion

let foo = {} // Creating foo as an empty object
foo.bar = 123 // Error: property 'bar' does not exist on `{}`
foo.baz = 'hello world' // Error: property 'baz' does not exist on `{}`

// Because the inferred type of foo is `{}` (an object with 0 properties), you 
// are not allowed to add bar and baz to it. However with type assertion,
// the following will pass:

interface Foo { 
  bar: number;
  baz: string;
}

let foo = {} as Foo; // Type assertion here
foo.bar = 123;
foo.baz = 'hello world'

```

## Language-related libraries

* [neverthrow](https://github.com/supermacro/neverthrow): Type-Safe Errors for JS & TypeScript
