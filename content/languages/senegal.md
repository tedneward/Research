title=Senegal
tags=language, concurrency, dynamic, object
summary=A powerful, small-but-fast, concurrent, class-based, and dynamically-typed programming language with a modern syntax.
~~~~~~

[Website](https://lang-senegal.web.app/) | [Source](https://github.com/SenegalLang/Senegal)

Example:
```
class Senegal {
    var name;

    Senegal(name) {
        this.name = name;
    }
    
    function talk(msg) {
        println(this.name + " says: " + msg);
    }
}

var mel = Senegal("Mel");
mel.talk("Hello world!"); // Mel says: Hello World
```

Supports coroutines as means of concurrency...:
```
function foo() {
    println('Before Yield');
    yield "Yield Value";
    println('After Yield');

    coroutine2.takeover();
    println('Transfer should not return to this');
}

function bar() {
    println("Transferred to coroutine2");
}

var coroutine = Coroutine(foo);
var coroutine2 = Coroutine(bar);

println("Before Call"); // output Before Call

var yielded = coroutine.call();
println(yielded);
// output Before Yield
// output Yield Value

println("After Call"); // output After Call

coroutine.call();
// output After Yield
// output Transferred to coroutine2
```

... and exception-handling (which I find interesting):

```
function foo() {
    throw "Error";
}


var coroutine_a = Coroutine(foo);

var caughtError = coroutine_a.try(); // output Error
println(caughtError);

var coroutine_b = Coroutine(foo);

// error Error
// error Senegal encountered an uncaught error.
// error <Line 2> Global Scope
var unCaughtError = coroutine_b.call();
```



https://github.com/SenegalLang/Senegal
Senegal is a powerful, small-but-fast, concurrent, class-based, and dynamically-typed programming language with a modern syntax.
