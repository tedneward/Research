title=Litho
tags=presentation, android, server-driven
summary=A declarative framework for building efficient UIs on Android.
~~~~~~

[Website](https://fblitho.com/) | [Source](https://github.com/facebook/litho) 

* Declarative: Litho uses a declarative API to define UI components. You simply describe the layout for your UI based on a set of immutable inputs and the framework takes care of the rest.
* Asynchronous layout: Litho can measure and layout your UI ahead of time without blocking the UI thread.
* View flattening: Litho uses Yoga for layout and automatically reduces the number of ViewGroups that your UI contains.
* Fine-grained recycling: Any component such as a text or image can be recycled and reused anywhere in the UI.

