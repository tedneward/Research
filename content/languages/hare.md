title=Hare
tags=language, static, native
summary=A systems programming language designed to be simple, stable, and robust. Hare uses a static type system, manual memory management, and a minimal runtime.
~~~~~~

[Website](https://harelang.org/) | [Source](https://sr.ht/~sircmpwn/hare/) | [Docs](https://harelang.org/documentation/index.html)

```
use fmt;

export fn main() void = {
	const greetings = [
		"Hello, world!",
		"¡Hola Mundo!",
		"Γειά σου Κόσμε!",
		"Привіт, світе!",
		"こんにちは世界！",
	];
	for (let greeting .. greetings) {
		fmt::println(greeting)!;
	};
};
```

## Getting Started
Have to build from source
