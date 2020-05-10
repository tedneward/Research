title=Wyvern
tags=language, object, static, object capability
summary=A new programming language designed from the ground up to support highly productive development of secure software systems.
~~~~~~

Wyvern is a new programming language designed from the ground up to support highly productive development of secure software systems. While the language is general purpose, we are especially interested in emerging application areas such as the web, mobile devices, and the internet of things.

Achieving high productivity and high security simultaneously may seem daunting, as there are clear tradeoffs between existing approaches that have been taken to achieve these goals. For example, we could seek to increase security by fully specifying a program's intended behavior and security properties and then verifying the code against that specification, but this could be achieved only at very high cost in programmer time.

The key insight of Wyvern is that we can leapfrog current languages both in productivity and security by providing better support for expressing and enforcing large-scale design. Better support for design is important because design drives the core engineering properties of programs: issues like performance, maintainability, and security, among others. Our observation, grounded in software engineering research and experience, is that as programs grow in scale and complexity, ensuring fidelity to design becomes more critical yet also more difficult. Large programs are by necessity implemented by teams, but making sure that everyone on the team shares a design concept is difficult. Even if everyone knows what the design should be, in the course of implementation engineers may discover that this design needs to change, or may make mistakes in implementing it correctly. Therefore the design of the software as-implemented commonly diverges from the design as-intended, and as a result it fails to realize the critical engineering properties that the design was intended to achieve.

Unfortunately, while modern languages provide good support for expressing the low-level design of algorithms and object structures, they do not provide good support for expressing and enforcing design at larger scales.

[Website](http://wyvernlang.github.io/) | [Github](https://github.com/wyvernlang/wyvern) | [Wyvern Manifesto](https://github.com/wyvernlang/wyvern/wiki/Wyvern%3A-A-Language-for-Usable-Design-Driven-Assurance)


