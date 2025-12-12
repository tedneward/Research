title=Avaje
tags=library, jvm
summary=Compile-time libraries for JVM applications.
~~~~~~

[Website](https://avaje.io/) | [Source](https://github.com/avaje)

Features:

* [Dependency Injection](https://avaje.io/inject): Cloud Native/Kubernetes friendly [dependency injection](https://avaje.io/inject) via source code generation instead of expensive reflection and classpath scanning. It includes bean lifecycle support and component testing.
* [Jsonb](https://avaje.io/jsonb): Flexible and reflection-free JSON library that uses Java annotation processing to generate JSON adapters. One of the [top 3 fastest](https://github.com/fabienrenaud/java-json-benchmark#users-model) Java JSON libraries.
* [Validator](https://avaje.io/validator): Reflection-free POJO validation library that uses annotation processing to generate validation adapters to run constraints.
* [HTTP Client](https://avaje.io/http-client): A wrapper on JDK 11's HttpClient. Includes support for defining client API's similar to JAX-RS, Retrofit and Feign. Uses Java annotation processing to generate client API implementations.
* [Jex](https://avaje.io/jex): Lightweight wrapper over the JDK's own [built-in HTTP server](https://docs.oracle.com/en/java/javase/21/docs/api/jdk.httpserver/com/sun/net/httpserver/package-summary.html), adding various capabilities. (virtual threads, JSON, compression, etc.).
* [HTTP Generator](https://avaje.io/http): Lightweight JAX-RS style HTTP servers using [Helidon SE](https://helidon.io/), [Javalin](https://javalin.io/), or [Jex](https://avaje.io/jex). Use annotations like `@Controller`, `@Get` etc to define a REST API.Uses Java annotation processing to generate source code for adapting and registering JAX-RS style classes to servers. These annotation processors are included in Jex and Nima.
* [Configuration](https://avaje.io/config): Provides external configuration. Loads _YAML_, _TOML_ & _properties_ files, supports dynamic configuration and plugins.
* [Nima](https://avaje.io/nima): Combines avaje libraries with [Helidon SE](https://helidon.io/) webserver to provide a lightweight, fast, and GraalVM native image compatible framework.
* [Simple logger](https://avaje.io/simple-logger): A SLF4J compatible simple logger that logs to _System out_ with structured JSON. Lightweight and GraalVM native image compatible.
* [Prisms](https://avaje.io/prisms): Zero-dependency utility library for building annotation processors.
* [SPI Service](https://avaje.io/spi): Zero-dependency library that adds SPI _META-INF/services_ entries for classes and validates modular _provides_ clauses.
* [GraalVM Analysis](https://avaje.io/graalvm): GraalVM native image compatible libraries for reflection-free runtime. Review [Why GraalVM](https://avaje.io/graalvm) for details.
