title=Cub
tags=language
summary=an interpreted, dynamically typed, scripting language inspired by Swift.
~~~~~~

[Source](https://github.com/louisdh/cub)

The following Cub code calculates factorials recursively:

```
func factorial(x) returns {
	
    if x > 1 {
        return x * factorial(x - 1)
    }
	
    return 1
}

a = factorial(5) // a = 120
```

The following Cub code uses a do times loop:

```
a = 1
n = 10
do n times {
    a += a
}
// a = 1024
```

