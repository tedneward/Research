title=Java Virtual Machine (JVM)
tags=vm, jvm
summary=The execution engine and supporting structure for Java programs.
~~~~~~

Bytecode interpreted. JIT compiled (depending on implementation). Dynamic code loaded.

[Wikipedia](https://en.wikipedia.org/wiki/Java_virtual_machine)

[JVM Specifications](../specifications)

[JVM conversion](https://github.com/jtransc/jtransc): Bytecode to source converting Java & Kotlin code into JavaScript, C++, D, C#, PHP, AS3, Dart and Haxe and run it everywhere. Also use JVM code in your favourite language as a library. [Website](https://jtransc.soywiz.com/)

## Articles

- [Java Reference Objects](https://www.kdgregory.com/index.php?page=java.refobj): One of the best articles on the Java "Reference" types (SoftReference, WeakReference, PhantomReference, ReferenceQueue) that I've ever read
- [General memory mgmt/GC reading and links](/reading/memory-management)
- [Inside Java](https://inside.java/): News and views from members of the Java team at Oracle

    - [Sip of Java](https://inside.java/sip/): Short takes on interesting Java ideas
    - [Emulating C# LINQ using Code Reflection](https://openjdk.org/projects/babylon/articles/linq)

## Implementations:

* [OpenJDK](../openjdk)
* [OpenJ9](https://www.eclipse.org/openj9/) ([Source](https://github.com/eclipse/openj9))
* [AdoptOpenJDK](https://adoptopenjdk.net/) builds JDK downloads of OpenJDK and OpenJ9 builds.
* [GraalVM](../graalvm)
* Zulu
* Amazon Coretto
* [JRockit](https://www.oracle.com/java/jrockit.html)
* [Kaffe](http://www.kaffe.org/) ([Source](https://github.com/kaffe/kaffe))
* [jvmulator](https://github.com/alblue/jvmulator): "a simple emulator for Java bytecode as well as an in-memory Java compiler to allow bytecode to be generated. The generated code can be executed as well as emulated to allow stepping through bytecode line by line, and seeing what the content of the local variables or stack happens to be."

Research/Experiments:

* [Maxine](../maxine-vm): Research JVM; "meta-circular" (meaning, JVM written in Java)
* [Squawk](https://github.com/tomatsu/squawk): A JVM for micro-devices [Wikipedia](https://en.wikipedia.org/wiki/Squawk_virtual_machine)
* [Jikes RVM](https://www.jikesrvm.org/): Research JVM; "meta-circular" (meaning, JVM written in Java) [Wikipedia](https://en.wikipedia.org/wiki/Jikes_RVM) [Source](https://github.com/JikesRVM)
* [JamVM](https://github.com/xranby/jamvm): "JamVM is a new Java Virtual Machine conforming to the JVM specification edition 2 (blue book). (Clone of git://git.code.sf.net/p/jamvm/code)"
* [Inside Java](https://inside.java/): News and views from members of the Java team at Oracle
