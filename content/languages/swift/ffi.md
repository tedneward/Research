title=Swift FFI
tags=language, swift, ios, macos, native
summary=Swift Foreign Function Interface notes.
~~~~~~

[Apple docs: C Interoperability](https://developer.apple.com/documentation/swift/swift_standard_library/c_interoperability)

[Using Swift with Cocoa and Objective-C](https://developer.apple.com/library/content//documentation/Swift/Conceptual/BuildingCocoaApps/index.html) (HTML) [(iBook)](https://itunes.apple.com/us/book/using-swift-cocoa-objective/id888894773?mt=11)

## Projects
[swift-jni](https://github.com/SwiftAndroid/swift-jni): A project to wrap Swift around [JNI](/vms/jvm/ffi)

[SwiftJava](https://github.com/SwiftJava): A collection of Swift-Java bridges built around a pair of core packages (SwiftJava and CJavaVM), it looks like?

## Articles/Blogs

[Unsafe Swift: Using Pointers and Interacting With C](https://www.raywenderlich.com/7181017-unsafe-swift-using-pointers-and-interacting-with-c)

---

[Making a C library available in Swift using Swift Package Manager](https://rderik.com/blog/making-a-c-library-available-in-swift-using-the-swift-package/):

*Example is making Sqlite3 C library available in Swift*

By convention, we prepend a letter "C" to the name of the library that we want to wrap. This makes explicit that its a wrapper for a C library.

Create directory for SQLite 3 (`mkdir Csqlite3`) and initialise with Swift Package Manager: `swift package init --type library`.

Ultimately directory structure for this package will look like:

        Csqlite3
        ├── Headers
        │   └── Csqlite3-Bridging-Header.h
        ├── Package.swift
        └── Sources
            └── Csqlite3
                └── module.modulemap

Create directory to hold header files: `mkdir Headers` and create a bridging header file, `Csqlite3-Bridging-Header.h` with

        #import <sqlite3.h>

inside of it.

In `Sources\Csqlite3\module.modulemap` put

        module CSQLite [system] {
            header "../../Headers/Csqlite3-Bridging-Header.h"
            link "sqlite3"
            export *
        }

Adding `[system]` is the same as when you use gcc and add the macro `#pragma system_header`. What this does is indicate to the compiler that the header is a system header. A system header is different than a regular header because it might include code that is not entirely standard. The code in a system header could include code that generates warnings for regular headers.

Because a system header is written for the OS, the system header might take some liberties. If you want to learn more check gcc's systems header description, or this Stack overflow question. In summary, if you are using a system library and know it's ok to suppress the warnings, use the `[system]` attribute.

Then `Package.swift` should look like

        // swift-tools-version:5.1
        // The swift-tools-version declares the minimum version of Swift required to build this package.

        import PackageDescription

        let package = Package(
            name: "Csqlite3",
            products: [
                .library(name: "Csqlite3", targets: ["Csqlite3"]),
            ],
            targets: [
                .systemLibrary(name: "Csqlite3"),
            ]
        )

---

[Using BSD Sockets in Swift](https://rderik.com/blog/using-bsd-sockets-in-swift/)

