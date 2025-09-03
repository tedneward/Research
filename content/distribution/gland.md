title=Gland
tags=distribution, ecmascript
summary=A lightweight, modular framework for event-driven applications.
~~~~~~

[Website](https://glandjs.github.io/) | [Source](https://github.com/glandjs/gland)

Gland is a lightweight, extensible web framework built for modern JavaScript and TypeScript applications. With its unique event-driven architecture (EDS), it offers unparalleled flexibility in creating modular, scalable server-side applications.

Inspired by frameworks like Angular and NestJS, Gland integrates an object-oriented design pattern, minimalistic dependency injection (DI), and powerful event-driven communication, allowing developers to efficiently build and maintain complex applications.

**Philosophy**
Rather than relying on predefined conventions or imposing rigid structures, Gland offers an approach where the developer can focus on the core problem domain without being hindered by unnecessary constraints. By using an event-driven approach, Gland ensures that communication between components remains straightforward and flexible, while also maintaining the ability to easily extend the system as requirements evolve.

The simplicity of Gland lies not in the absence of features, but in how it allows developers to shape their applications with minimal friction and clear intentions. It strives to be a framework that adapts to the developer's needs, not the other way around. Through this approach, Gland provides the foundation for building applications that are both effective and maintainable, without forcing an unnatural design pattern upon the developer.

**Why Gland?**
Gland is designed with flexibility and scalability in mind. Whether you're building small APIs or large-scale applications, Gland provides the tools to help you structure your codebase efficiently and maintainably. Its event-driven approach helps in decoupling components and improving testability, while its object-oriented philosophy ensures clear and consistent code organization.

Unlike traditional frameworks that rely on rigid structures or prescriptive patterns, Gland provides a flexible foundation where components communicate through events, allowing developers to focus on solving domain problems rather than conforming to framework conventions.

```
// A simple Gland application
@Controller('/')
class HomeController {
  @Get()
  index(ctx: ExpressContext) {
    ctx.emit('@response:send', ctx)
  }
}

@Channel('response')
export class Response {
  @On('send')
  index(ctx: ExpressContext) {
    ctx.res.send('Hello World')
  }
}
```

**Gland Philosophy**
Gland is built around three core philosophical principles:

1. Event-Driven Everything: In Gland, every interaction is modeled as an event. This creates a system where components can communicate without tight coupling, making your application more modular and easier to test. By emitting and listening to events, components can interact without needing to know the implementation details of one another.

2. Minimal Opinions, Maximum Flexibility: Gland doesn’t force you into a specific way of structuring your application. Instead, it provides the tools and patterns that allow you to organize your code in a way that makes sense for your specific use case. This flexibility allows Gland to adapt to your needs, not the other way around.

3. Familiar Yet Progressive: While introducing a novel event-driven approach, Gland incorporates familiar concepts from popular frameworks like dependency injection and decorators. This balance of innovation and familiarity creates a framework that feels both fresh and accessible.

