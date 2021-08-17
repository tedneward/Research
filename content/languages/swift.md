title=Swift
tags=language, native, macos, ios, object, metaobject, functional
summary=A second-generation object-oriented language with functional overtones.
~~~~~~

"Swift defines away large classes of common programming errors by adopting modern programming patterns:

* Variables are always initialized before use.
* Array indices are checked for out-of-bounds errors.
* Integers are checked for overflow.
* Optionals ensure that nil values are handled explicitly.
* Memory is managed automatically.
* Error handling allows controlled recovery from unexpected failures.

Swift combines powerful type inference and pattern matching with a modern, lightweight syntax, allowing complex ideas to be expressed in a clear and concise manner."

[Website](https://swift.org/) | [Apple website](https://developer.apple.com/swift/) | [Source](https://github.com/apple/swift)

- [The power of key paths in Swift](https://www.swiftbysundell.com/posts/the-power-of-key-paths-in-swift)

- [Making properties overridable only in debug builds](https://www.swiftbysundell.com/tips/making-properties-overridable-only-in-debug-builds/)

- [Maintaining a Homebrew Tap for Swift Projects](https://medium.com/@mxcl/maintaining-a-homebrew-tap-for-swift-projects-7287ed379324)

- [Unsafe Swift: Using Pointers and Interacting With C](https://www.raywenderlich.com/7181017-unsafe-swift-using-pointers-and-interacting-with-c)

- [Method Dispatch in Swift](https://www.rightpoint.com/rplabs/switch-method-dispatch-table)

- Tip: mark a workaround for a bug as deprecated in next compiler version, [@olebegemann](https://twitter.com/olebegemann/status/1294583027583123458): If you write a workaround for a bug, mark it as deprecated in the next compiler version to get a timely reminder to check if the bug has been fixed. If it has, delete the workaround. If it hasn’t, update the deprecation to the next version.

- [Compiler optimizations](https://gist.github.com/lsavino/38367f10c2d20aeec4f031610d2929b8)

---

- [InterposeKit](https://github.com/steipete/InterposeKit): A modern library to swizzle elegantly in Swift. [Website](https://interposekit.com/) Essentially, method interception (and rewriting/monkey-patching?) for Swift code that runs on top of the ObjC runtime. (Relies on the underlying mechanics there to do its work, it seems.) Looks pretty interesting.

- [Aspects](https://github.com/steipete/Aspects): AOP in ObjC and Swift.

