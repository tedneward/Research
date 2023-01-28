title=Cerbos
tags=library, authorization, cloud 
summary=Authorization as a service (or library), decoupled from actual code.
~~~~~~

[Website](https://cerbos.dev/) | [Source](https://github.com/cerbos)

"**What is Cerbos?** It's an access control decision engine for your software that is: Driven by simple API which makes every decision feel like a database call; Policy-driven and attribute based for maximum flexibility and scale; Decoupled, stateless and runs inside your stack."

"**Where and how does Cerbos run?** Self-hosted: Cerbos lives in your environment where-ever it is, cloud or on-premise: VM, Kubernetes, or serverless; Infinite scalability via serverless functions or a sidecar deployment model; GitOps enabled policy development and deployment via a full testing suite for CI/CD pipelines."

"**Runs anywhere.** Meets your infrastructure requirements and business compliance policies wherever they are: Public or private cloud, or on premise. Deploy and host based on your architecture.

* Container orchestration:

    * Service: Share Cerbos among many services
    * Sidecar: Run Cerbos right next to your application or anywhere a container can be run

* Serverless: let your cloud provider manage it

    * AWS lambda
    * Google Cloud Run

* Anywhere a binary can be run:

    * Bare metal
    * Virtual machine"

Implemented in Go. SDKs in ECMAScript, Python, PHP, JVM, CLR, Rust, Ruby, GraphQL(?), Prisma(?), SQLAlchemy(?), ExpressJS, NextJS, NestJS, Remix (React?), SvelteKit, FastAPI(?)

Remote calls (REST or gRPC) to service for centralized authorization control.

