title=Ktor
tags=library, distribution, jvm
summary=A framework for building asynchronous server-side and client-side Kotlin applications with ease.
~~~~~~

[Website](https://ktor.io/) | [Source](https://github.com/ktorio/ktor)

# Principles

#### Unopinionated
Ktor Framework doesn't impose a lot of constraints on what technology a project is going to use – logging, templating, messaging, persistence, serialization, dependency injection, etc. Sometimes it may be required to implement a simple interface, but usually it is a matter of writing a transforming or intercepting function. Features are installed into the application using a unified interception mechanism which allows building arbitrary pipelines.

Ktor Applications can be hosted in any servlet container with Servlet 3.0+ API support such as Tomcat, or standalone using Netty or Jetty. Support for other hosts can be added through the unified hosting API.

Ktor APIs are mostly functions calls with lambdas. Thanks to Kotlin DSL capabilities, the code looks declarative. Application composition is entirely up to the developer's choice – with functions or classes, using dependency injection framework or doing it all manually in the main function.

#### Asynchronous
The Ktor pipeline machinery and API are utilising Kotlin coroutines to provide easy-to-use asynchronous programming model without making it too cumbersome. All host implementations are using asynchronous I/O facilities to avoid thread blocking.

#### Testable
Ktor applications can be hosted in a special test environment, which emulates a web server to some extent without actually doing any networking. It provides easy way to test an application without mocking too much stuff, and still achieve good performance while validating application calls. Running integration tests with a real embedded web server are of course possible, too.

