title=Web Assembly Component Model
tags=platform, web assembly
summary=Notes and links on the concept.
~~~~~~

[Website](https://component-model.bytecodealliance.org/introduction.html)

## Component Model Concepts

* A WebAssembly Component is the next evolution of core WebAssembly binaries.

    * WebAssembly components are nestable -- they may contain one or more core modules and/or sub-components composed together.
    * Logically, components are containers for modules - or other components - which express their interfaces and dependencies via WIT.
    * Conceptually, components are self-describing units of code that interact only through interfaces instead of shared memory.
    * Physically, a component is a specially-formatted WebAssembly file. Internally, the component could include multiple traditional ("core") WebAssembly modules, and sub-components, composed via their imports and exports.

    The external interface of a component - its imports and exports - corresponds to a world. The component, however, internally defines how that world is implemented.

* The Component Model extends core WebAssembly by introducing higher level types and interface-driven development

    * WebAssembly Interface Types (WIT) is the IDL (Interface Definition Language) used to formally define functionality for WebAssembly modules.
    * With WIT, WebAssembly components gain the ability to conform an language-agnostic and encode that support, so any WebAssembly component binary can be interrogated and executed.
    * An Interface describes the types and functions used for a specific, focused bit of functionality. They are defined using WIT.

        * An interface describes a single-focus, composable contract, through which components can interact with each other and with hosts. Interfaces describe the types and functions used to carry out that interaction. For example:
        * A "receive HTTP requests" interface might have only a single "handle request" function, but contain types representing incoming requests, outgoing responses, HTTP methods and headers, and so on.
        * A "wall clock" interface might have two functions, one to get the current time and one to get the granularity of the timer. It would also include a type to represent an instant in time.

    * A World assembles interfaces to express what features a component offers, and what features it depends on. A WIT world is a higher-level contract that describes a component's capabilities and needs.

        On one hand, a world describes the shape of a component - it says which interfaces the component exposes for other code to call (its exports), and which interfaces the component depends on (its imports). A world only defines the surface of a component, not the internal behaviour. If you're an application or library developer creating a component, you'll specify the world your component targets. This world describes the functionality your component exposes and declares the functionality your component depends on in order to be able to run. Your component may target a custom world definition you have created with a unique set of imports and exports tailored just for your use case, or it may target an existing world definition that someone else has already specified.

        On the other hand though, a world defines a hosting environment for components (i.e., an environment in which a component can be instantiated and its functionality can be invoked). An environment supports a world by providing implementations for all of the imports and by optionally invoking one or more of the exports.

        For example, WASI (the WebAssembly System Interface) defines a "command line" world which imports interfaces that command line programs typically expect to have available to them such as file I/O, random number generation, clocks and so on. This world has a single export for running the command line tool. Components targeting this world must provide an implementation for this single export, and they may optionally call any of the imports. On the other hand, environments supporting this world must provide implementations for all of the imports and may invoke the single export.

        A world is composed of interfaces, but each interface is directional - it indicates whether the interface is available for outside code to call (an "export"), or whether outside code must fulfill the interface for the component to call (an "import"). These interfaces strictly bound the component. A component cannot interact with anything outside itself except by having its exports called, or by it calling its imports. This provides very strong sandboxing; for example, if a component does not have an import for a secret store, then it cannot access that secret store, even if the store is running in the same process.

        For a component to run, its imports must be fulfilled, by a host or by other components. Connecting up some or all of a component's imports to other components' matching exports is called composition.

        Example Worlds

        * A (trivial) "HTTP proxy" world would export a "handle HTTP requests" interface, and import a "send HTTP requests" interface. A host, or another component, would call the exported "handle" interface, passing an HTTP request; the component would forward it on via the imported "send" interface. To be a useful proxy, the component may also need to import interfaces such as I/O and clock time - without those imports the component could not perform, for example, on-disk caching.
        * A "regex parser" world would export a "parse regex" function, and would import nothing. This declares not only that the component implementing this world can parse regular expressions, but also that it calls no other APIs. A user of such a parser could know, without looking at the implementation, that is does not access the file system, or send the user's regexes to a network service.

    * A Package is a set of WIT files containing a related set of interfaces and worlds.

        A WIT package is a set of one or more WIT (Wasm Interface Type) files containing a related set of interfaces and worlds. WIT is an IDL (interface definition language) for the Component Model. Packages provide a way for worlds and interfaces to refer to each other, and thus for an ecosystem of components to share common definitions.

        A WIT package is not a world. It's a way of grouping related interfaces and worlds together for ease of discovery and reference, more like a namespace.

        The WebAssembly System Interface (WASI) defines a number of packages, including one named `wasi:clocks`. Our HTTP proxy world could import the wall-clock interface from the `wasi:clocks` package, rather than having to define a custom clock interface.

* The Component Model introduces the idea of a "platform" to core WebAssembly -- enabling the structured, standardized use of "host" functionality for WebAssembly "guest"s.

    * The WebAssembly System Interface (WASI) defines in WIT a family of interfaces for common system-level functions.
    * WASI defines common execution environments such as the command line (wasi:cli) or a HTTP server (wasi:http).

* The Component Model makes core WebAssembly composable -- components that provide functionality and those that use them can be composed together into one resulting component
