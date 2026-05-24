title=Zero
tags=language, ai, agents
summary=A programming language for agents: a systems language for small native tools, explicit effects, predictable memory, and structured compiler output.
~~~~~~

[Website](https://zerolang.ai/) | [Source](https://github.com/vercel-labs/zero)

## Examples

hello.0:
```
pub fun main(world: World) -> Void raises {
    check world.out.write("hello from zero\n")
}
```

add.0:
```
fun answer() -> i32 {
    return 40 + 2
}

pub fun main(world: World) -> Void raises {
    let value = answer()
    if value == 42 {
        check world.out.write("math works\n")
    } else {
        check world.out.write("math broke\n")
    }
}
```

