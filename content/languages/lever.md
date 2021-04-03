title=Lever
tags=language, dynamic, logic
summary=A language that has capabilities to absorb features from other languages. Otherwise it is very generic purpose programming system with a hint of inclination towards interactive graphics and audio programming.
~~~~~~

[Website](http://leverlanguage.com/) | [Source](https://github.com/cheery/lever/)

Examples:
```
main = (args):
    print("hello, world")
```

```
for i in range(1, 101)
    if (i % 3) == 0 and (i % 5) == 0
        print("Fizz Buzz")
    elif (i % 3) == 0
        print("Fizz")
    elif (i % 5) == 0
        print("Buzz")
    else
        print(i)
```

```
trigraph_getch = (getch):
    ch0 = getch()
    ch1 = getch()
    return ():
        ch2 = getch()
        if ch0 == '?' and ch1 == '?' # This is equivalent to how big compilers
            try                      # are doing it.
                ch = trigraphs[ch2]  # Three-character window and checking if
                ch0 := getch()       # There's a trigraph on it.
                ch1 := getch()
                return ch
            except KeyError as _
                null
        ch = ch0
        ch0 := ch1
        ch1 := ch2
        return ch

trigraphs = {
    "=": "#",
    "/": "\\",
    "(": "[",
    ")": "]",
    "!": "|",
    "<": "{",
    ">": "}",
    "-": "~",
}
```

```
sphere_ray_intersect = (sphere, ray):
    radius2 = sphere.radius*sphere.radius
    d = sphere.center - ray.orig
    tca = dot(d, ray.dir)
    d2 = dot(d, d) - tca * tca
    if d2 > radius2
        return null
    thc = sqrt(radius2 - d2)
    return object();
        t0 = tca - thc
        t1 = tca + thc
```

