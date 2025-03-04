title=Erg
tags=language, static, python
summary=A statically typed language that can deeply improve the Python ecosystem.
~~~~~~

[Website](https://erg-lang.org/) | [Docs](https://erg-lang.org/the-erg-book/print.html) | [Source](https://github.com/erg-lang)

## Examples

Hello, world
```
print! "Hello, world!"
print! "こんにちは、世界！"
print! "Γειά σου Κόσμε!"
print! "!مرحبا بالعالم"

greetings = ["Good morning", "Hello", "Good evening"]
for! greetings, greeting =>
    print! "\{greeting}, world!"
```

Class
```
Empty = Class()
empty = Empty.new()
print! empty

MyInt = Class {value = Int}
MyInt.
    # You cannot access private instance attribute `value` outside of the class
    get_value self = self::value
i = MyInt.new {value = 1}
print! i.get_value()

MyStr = Class {.value = Str}
s = MyStr.new {.value = "aaa"}
print! s.value

# Inheritance is prohibited by default. Remove this decorator and check for errors.
# [<: Self] means that the attribute is public within the class and its subclasses
@Inheritable
Point2D = Class {::[<: Self]x = Int; ::[<: Self]y = Int}
# Private variables & methods
Point2D::
    one = 1
# Restricted variables & methods
Point2D::[<: Self]
    two = 2
# Public variables & methods
Point2D.
    zero = Point2D::one - 1
    '''erg
    p = Point2D.new {x = 1; y = 2}
    assert p.norm() == 5
    '''
    norm self = self::x**2 + self::y**2

Point3D = Inherit Point2D, Additional := {z = Int}
Point3D.
    # Overloading is prohibited by default. Remove this decorator and check for errors.
    @Override
    new x, y, z =
        Point3D {x; y; z}
    @Override
    norm self = self::x**2 + self::y**2 + self::z**2

# the constructor of `Point2D` is private, use `Point2D.new` instead
p = Point2D.new {x = 1; y = 2}
print! p, p.norm()
print! Point2D.zero
# print! Point2D::one # cannot access private variables
q = Point3D.new 1, 2, 3
print! q, q.norm()

# Newtype notation
# Shorthand of `IorS = Class {base = Int or Str}`
IorS = Class(Int or Str)
IorS.
    is_int self =
        # self: IorS
        # self::base: Int or Str
        match self::base:
            (_: Int) -> True
            _ -> False
    is_str self =
        match self::base:
            (_: Str) -> True
            _ -> False

# `.new` is of type `Int or Str -> IorS`, not `{base = Int or Str} -> IorS`
x = IorS.new 1
print! x
assert x.is_int()
assert not x.is_str()
```
