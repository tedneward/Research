title=PowerFX
tags=language
summary=Low-code language
~~~~~~

[Website](https://docs.microsoft.com/en-us/power-platform/power-fx/overview) [Source](https://github.com/microsoft/power-fx)

## Design principles

### Simple
Power Fx is designed to target the maker audience, whose members haven't been trained as developers. Wherever possible, we use the knowledge that this audience would already know or can pick up quickly. The number of concepts required to be successful is kept to a minimum.

Being simple is also good for developers. For the developer audience, we aim to be a low-code language that cuts down the time required to build a solution.

### Excel consistency
Microsoft Power Fx language borrows heavily from the Excel formula language. We seek to take advantage of Excel knowledge and experience from the many makers who also use Excel. Types, operators, and function semantics are as close to Excel as possible.

If Excel doesn't have an answer, we next look to SQL. After Excel, SQL is the next most commonly used declarative language and can provide guidance on data operations and strong typing that Excel doesn't.

### Declarative
The maker describes what they want their logic to do, not exactly how or when to do it. This allows the compiler to optimize by performing operations in parallel, deferring work until needed, and pre-fetching and reusing cached data.

For example, in an Excel worksheet, the author defines the relationships among cells but Excel decides when and in what order formulas are evaluated. Similarly, formulas in an app can be thought of as "recalc-ing" as needed based on user actions, database changes, or timer events.

### Functional
We favor pure functions that don't have side effects. This results in logic that's easier to understand and gives the compiler the most freedom to optimize.

Unlike Excel, apps by their nature do mutate state—for example, apps have buttons that save changes to the record in a database. Some functions, therefore, do have side effects, although we limit this as much as is practical.

### Composition
Where possible, the functionality that's added composes well with existing functionality. Powerful functions can be decomposed into smaller parts that can be more easily used independently.

For example, a Gallery control doesn't have separate Sort and Filter properties. Instead, the Sort and Filter functions are composed together into a single Items property. The UI for expressing Sort and Filter behavior is layered on top of the Items property by using a two-way editor for this property.

### Strongly typed
The types of all the values are known at compile time. This allows for the early detection of errors and rich suggestions while authoring.

Polymorphic types are supported, but before they can be used, their type must be pinned to a static type and that type must be known at compile time. The IsType and AsType functions are provided for testing and casting types.

### Type inference
Types are derived from their use without being declared. For example, setting a variable to a number results in the variable's type being established as a number.

Conflicting type usage results in a compile-time error.

### Locale-sensitive decimal separators
Some regions of the world use a dot (.) as the decimal separator, while others use a comma (,). This is what Excel does, too. This is commonly not done in other programming languages, which generally use a canonical dot (.) as the decimal separator for all users worldwide. To be as approachable as possible for makers at all levels, it's important that 3,14 is a decimal number for a person in France who has used that syntax all their lives.

### Not object-oriented
Excel isn't object-oriented, and neither is Power Fx. For example, in some languages, the length of a string is expressed as a property of the string, such as "Hello World".length in JavaScript. Excel and Power Fx instead express this in terms of a function, as Len( "Hello World" ).

Components with properties and methods are object-oriented and Power Fx easily works with them. But where possible, we prefer a functional approach.

### Extensible
Makers can create their components and functions by using Power Fx itself. Developers can create their components and functions by writing JavaScript.

### Developer friendly
Although makers are our primary target, we try to be developer-friendly wherever possible. If it doesn't conflict with the design principles described previously, we do things in a way that a developer will appreciate. For example, Excel has no capability for adding comments, so we use C-like line and inline comments.

### Language evolution
Evolving programming languages is both necessary and tricky. Everyone—rightfully—is concerned that a change, no matter how well-intentioned, might break existing code and require users to learn a new pattern. Power Fx takes backward compatibility seriously, but we also strongly believe that we won't always get it right the first time and we'll collectively learn what's best as a community. We must evolve, and Power Fx designed support for language evolution from the very beginning.

A language version stamp is included with every Power Fx document that's saved. If we want to make an incompatible change, we'll write what we call a "back compat converter" that rewrites the formula automatically the next time it's edited. If the change is something major that we need to educate the user about, we'll also display a message with a link to the docs. Using this facility, we can still load apps that were built with the preview versions of Power Apps from many years ago, despite all the changes that have occurred since then.

### No undefined value
Some languages, such as JavaScript, use the concept of an undefined value for uninitialized variables or missing properties. For simplicity's sake, we've avoided this concept. Instances that would be undefined in other languages are treated as either an error or a blank value. For example, all uninitialized variables start with a blank value. All data types can take on the value of blank.

