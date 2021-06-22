title=Ceylon
tags=jvm, javascript, language, object, functional, metaobject, static
summary=An object-oriented, strongly statically typed programming language with an emphasis on immutability.
~~~~~~

[Website](https://ceylon-lang.org/) | [Github](http://ceylon.github.io/) | [Specification](https://ceylon-lang.org/documentation/1.3/spec)

From the Website:
> Ceylon's flow-sensitive static type system catches bugs while letting you express intent: union and intersection types, tuples, function types, mixin inheritance, enumerated types, and reified generics. Ceylon prioritizes readability, via a highly regular syntax, support for treelike structures, and syntax sugar. Language eschews magical implicit features with ambiguous corner cases. Compiler follows simple rules and produces meaningful errors. Runs on both Java and JavaScript virtual machines. Compiler produces module archives which are then distributed via a repository architecture with Ceylon Herd as its social focus point.

### Examples
HTTP API endpoint:
```
shared void run() => newServer {
        Endpoint {
            path = startsWith("/");
            acceptMethod = { get };
            (request, response) =>
                response.writeString("Say more, more clearly");
        }
    }.start();
```

Defining and calling a function:
```
function distance(Point from, Point to) {
    return ((from.x-to.x)^2 + (from.y-to.y)^2)^0.5;
}

value dist = distance(Point(0.0, 0.0), Point(2.0, 3.0));
```

Create and iterate over a sequence:
```
String[] names = ["Tom", "Dick", "Harry"];
for (name in names) {
    print("Hello, ``name``!");
}
```

Class:
```
class Counter(count=0) {
    variable Integer count;
    shared Integer currentValue {
        return count;
    }
    shared void increment() {
        count++;
    }
}
```

or

```
class Counter(count=0) {
    variable Integer count;
    shared Integer currentValue => count;
    shared void increment() => count++;
}
```

Hierarchical structures:
```
Table table = Table {
    title = "Squares";
    rows = 5;
    Border {
        padding = 2;
        weight = 1;
    };
    Column {
        heading = "x";
        width = 10;
        String content(Integer row) {
            return row.string;
        }
    },
    Column {
        heading = "x^2";
        width=10;
        String content(Integer row) {
            return (row^2).string;
        }
    }
};
```

or

```
Suite tests = Suite {
    Test { 
        "sqrt() function";
        void run() {
            assert(sqrt(1)==1);
            assert(sqrt(4)==2);
            assert(sqrt(9)==3);
        }
    },
    Test {
        "sqr() function";
        void run() {
            assert(sqr(1)==1);
            assert(sqr(2)==4);
            assert(sqr(3)==9);
        }
    }
};
```

Principal typing, union types, intersection types:
```
Person | Organization personOrOrganization = ... ;

Printable & Sized & Persistent printableSizedPersistent = ... ;

value stuff = { "hello", "world", 1.0, -1 };
value joinedStuff = concatenate({"hello", "world"}, {1.0, 2.0}, {});
  // Compiler infers Iterable<String|Float|Integer> for stuff, and
  // Sequential<String|Float> for joinedStuff.
```

Mixin inheritance:
```
interface Sized {
    shared formal Integer size;
    shared Boolean empty => size==0;
    string => empty then "EMPTY" else "SIZE: ``size``";
}

interface Printable {
    shared void printIt() => print(this);
}

object empty satisfies Sized & Printable {
    size => 0;
}
```

Polymorphic attributes

Typesafe null and flow-sensitive typing

Enumerated subtypes

Type aliases and type inference

Higher-order functions

Tuples

Comprehensions

Generics with fully-reified types

Declaratin-site and use-site variance

Operator polymorphism

Typesafe metaprogramming and annotations

Modularity

Java and Javascript Interop

