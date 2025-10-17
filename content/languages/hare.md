title=Hare
tags=language, static, native
summary=A systems programming language (a static type system, manual memory management, and a minimal runtime) designed to be simple, stable, and robust.
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
