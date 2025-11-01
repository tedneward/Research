title=Spoon
tags=tool, static analysis, jvm
summary=An open-source library to analyze, rewrite, transform, transpile Java source code.
~~~~~~

[Website](https://spoon.gforge.inria.fr/) | [Source](https://github.com/INRIA/spoon)

It parses source files to build a well-designed AST with powerful analysis and transformation API. It supports modern Java versions up to Java 20. Spoon is an official Inria open-source project, and member of the [OW2](https://www.ow2.org/) open-source consortium.

## Documentation

The latest official documentation is available at [http://spoon.gforge.inria.fr/](http://spoon.gforge.inria.fr/).

## Getting started in 2 seconds

> **Java version:** Spoon version 10 and up requires Java 11 or later. Spoon 9.1.0 is the final Spoon release compatible with Java 8, and we do not plan to backport any bug fixes or features to Spoon 9. Note that Spoon can of course still consume source code for older versions of Java, but it needs JDK 11+ to run.

Get latest stable version with Maven, see [https://search.maven.org/artifact/fr.inria.gforge.spoon/spoon-core](https://search.maven.org/artifact/fr.inria.gforge.spoon/spoon-core)

And start using it:

    CtClass l = Launcher.parseClass("class A { void m() { System.out.println(\"yeah\");} }");
    

Documentation:

-   Reference documentation: [http://spoon.gforge.inria.fr/](http://spoon.gforge.inria.fr/) (contains the content of the [doc folder](https://github.com/INRIA/spoon/tree/master/doc))
-   Code examples: [https://github.com/SpoonLabs/spoon-examples](https://github.com/SpoonLabs/spoon-examples)
-   Videos: [Spoon: Getting Started - Simon Urli @ OW2Con’18 (Paris)](https://www.youtube.com/watch?v=ZZzdVTIu-OY), [Generate Test Assertion with Spoon - Benjamin Danglot @ OW2Con’17 (Paris)](https://www.youtube.com/watch?v=JcCIbjnkfD4)

## Contributing in 2 seconds

Create your first pull request to improve the documentation, see [doc](https://github.com/INRIA/spoon/tree/master/doc)! Proceed with your first bug fix! The community is open-minded, respectful and patient. All external contributions are welcome.

## Design Philosophy

R1) The Spoon metamodel is as close as possible to the language concepts.

R2) The Spoon model of a program is complete and sound.

R3) The text version of a Spoon model is well-formed and semantically equivalent to the original program.

R4) The analysis and transformation API is intuitive and regular.

R5) Transformation operators are designed to warn as fast as possible about invalid programs. This is done either with static type checking or with dynamic checks when the operators are used.

R6) When feasible, the text version of a Spoon model is close to the original one.

### Compiling

To compile Spoon, you need a Java Development Kit (JDK) and Maven:

    git clone https://github.com/INRIA/spoon
    cd spoon
    mvn compile
    

To run the tests:

    mvn test
    

### Download

Latest version: [https://search.maven.org/remote\_content?g=fr.inria.gforge.spoon&a=spoon-core&v=LATEST&c=jar-with-dependencies](https://search.maven.org/remote_content?g=fr.inria.gforge.spoon&a=spoon-core&v=LATEST&c=jar-with-dependencies) - [Javadoc](http://spoon.gforge.inria.fr/mvnsites/spoon-core/apidocs/index.html)

Maven:

    <dependency>
        <groupId>fr.inria.gforge.spoon</groupId>
        <artifactId>spoon-core</artifactId>
        <!-- See rendered release value at http://spoon.gforge.inria.fr/ -->
        <version></version>
    </dependency>