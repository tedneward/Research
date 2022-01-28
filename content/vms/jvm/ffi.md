title=JVM FFI
tags=vm, jvm, native, llvm
summary=A collection of links and notes around JVM foreign function interface and native bindings.
~~~~~~

- [java-native-benchmark](https://github.com/zakgof/java-native-benchmark): Benchmarking Java's native call APIs: JNI, JNA, JNR, BridJ and Project Panama

# JNI (Java Native Interface)

[Specification (Java 17)](https://docs.oracle.com/en/java/javase/17/docs/specs/jni/index.html)

Basically broken into three parts:

* Java calling native code (static methods marked `native` and dynamically linked at runtime)
* Native code calling back into the JVM (native code accessing fields and methods of Java objects)
* Invocation/hosting (bringing the JVM up inside a native process--which is what the `java` host does)

### Helpers

- [jni.hpp](https://github.com/mapbox/jni.hpp): a modern, type-safe, header-only, C++14 wrapper for JNI
- [JavaCPP](https://github.com/bytedeco/javacpp): The missing bridge between Java and native C++

# JNA

[Source](https://github.com/java-native-access/jna)

# JNR (jnr-ffi): Java Abstracted Foreign Function Layer

Java library for loading native libraries without writing JNI code by hand or using tools such as SWIG. JNR is a comparingly young project that target the same problem. Similarly as JNA or Bridj it does not require native programming. There's not much documentation or reviews at the moment, but JNR is often called promising.

[Source](https://github.com/jnr/jnr-ffi)

# BridJ

# Project Panama
- Panama: A Foreign Policy for Java
	- Devoxx 2018; Maurizio Cimadamore
	- https://www.youtube.com/watch?v=cfxBrYud9KM
- Native Interfaces: The Phantom Menace
	- NYJavaSIG, February 7, 2018
	- Tony Printezis - JVM Engineer - Twitter
	- JNI, Project Panama
	- https://www.eventbrite.com/e/nyjavasig-native-interfaces-the-phantom-menace-and-java-9-compatibility-tickets-42519931259#
	- https://www.youtube.com/watch?v=YxHb6kAGZ10


## GraalVM
Supports native execution of LLVM bitcode using [Sulong](https://github.com/graalvm/sulong). This enables interop to C/C++, Fortran, and other languages that can be compiled to LLVM bitcode.

# Other FFI

