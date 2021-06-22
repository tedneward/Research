title=ECSY
tags=gamedev, ecmascript, browser
summary=A highly experimental Entity Component System framework implemented in javascript, aiming to be lightweight, easy to use and with good performance.
~~~~~~

[Website](https://ecsy.io/) | [Source](https://github.com/MozillaReality/ecsy) | [Docs](https://ecsy.io/docs)

### Features

* Framework agnostic
* Focused on providing a simple but yet efficient API
* Designed to avoid garbage collection as possible
* Systems, entities and components are scoped in a world instance
* Multiple queries per system
* Reactive support:
    * Support for reactive behaviour on systems (React to changes on entities and components)
    * System can query mutable or immutable components
* Predictable:
    * Systems will run on the order they were registered or based on the priority defined when registering them
    * Reactive events will not generate a random callback when emited but queued and be processed in order
* Modern Javascript: ES6, classes, modules,...
* Pool for components and entities

#### Goals
Our goal is for ECSY to be a lightweight, simple, and performant ECS library that can be easily extended and encoruages open source collaboration.

ECSY will not ship with features that bind it to a rendering engine or framework. Instead, we encourage the community to build framework specific projects like ecsy-three, ecsy-babylon, and ecsy-two.

ECSY does not adhere strictly to "pure ECS design". We focus on APIs that push users towards good ECS design like putting their logic in systems and data in components. However, we will sometimes break the rules for API ergonomics, performance in a JS context, or integration with non-ECS frameworks.

ECSY is designed for a community driven ecosystem. We encourage users to come up with modular components and systems that can be composed into larger games, apps, and engines.