title=Dylan
tags=language, object, functional, dynamic
summary=A multi-paradigm functional and object-oriented programming language. 
~~~~~~

[Website](https://opendylan.org/index.html) | [Source](https://github.com/dylan-lang/opendylan)

[Introduction to Dylan](http://opendylan.org/documentation/intro-dylan/) | [Dylan Programming Guide](http://opendylan.org/books/dpg/) | [Dylan Reference Manual](http://opendylan.org/books/drm/) | [Open Dylan Documentation](http://opendylan.org/documentation/)

Example:
```
define class <vehicle> (<object>)
  slot owner :: <string>,
    init-keyword: owner:,
    init-value: "Northern Motors";
end;

define class <car> (<vehicle>)
end;

define class <truck> (<vehicle>)
  slot capacity,
    required-init-keyword: tons:;
end;
```

Dylan is a multi-paradigm functional and object-oriented programming language. It is dynamic while providing a programming model designed to support efficient machine code generation, including fine-grained control over dynamic and static behaviors.
