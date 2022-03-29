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

Using C libraries in your Lever code is so clean that it is optional to write wrappers for them.

```
sdl = api.library("libSDL2")
sdl.Init(sdl.INIT_EVERYTHING)
sdl.Quit()
```

Lever has semi-automatic utilities to parse C files, clean them and translate them into .json -formatted headers that provide you with everything to use the libraries you need.

It also has headers for OpenGL4, although they have been generated directly from Khronos specifications.

```
blen = ffi.automem(ffi.uint)
gl.getObjectParameterivARB(obj, gl.OBJECT_INFO_LOG_LENGTH_ARB, blen)
gl.getShaderiv(obj, gl.INFO_LOG_LENGTH, blen)
log = ffi.automem(ffi.ubyte, blen.to)
gl.getInfoLogARB(obj, blen.to, null, log)
print(log.str)
```

Combine this with rest of the features, and you get so incredibly simple programs that do incredibly complex things. For example, check this implementation of Logo out.


