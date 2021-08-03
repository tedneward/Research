title=Raven-Lang
tags=language, jvm
summary=An experimental programming language built (using ANTLR) for the JVM platform; the main goal of this project is to create a fast jvm language that lacks the verbosity of java while maintaining interoperability.
~~~~~~

[Source](https://github.com/BradleyWood/Raven-Lang)

Antlr is used to perform parsing and the ASM bytecode manipulation framework is used for bytecode generation. The runtime environment performs all type checking and coercions as well as dynamic linking.

## Examples

#### Interoperability

```kotlin
import javax.swing.JOptionPane

fun main() {
    JOptionPane.showMessageDialog(null, "Hello World.")
}
```

#### Defer

Function calls can be deferred in a last in first out order. Parameters
are evaluated immediately and are stored until the deferred statement is executed.

```kotlin
fun main() {
    for (i range 0 to 10) {
    	defer println(i)
    }
    defer println("World!")
    defer print("Hello, ")
}
```

#### When

```kotlin
fun func(name, param) = when(name) {
    "println" -> println(param)
    "sin"     -> Math.sin(param)
    "cos"     -> Math.cos(param)
    "PI"      -> Math.PI / param
    else      -> {}
}

fun main() {
    println("Sin(PI) = " + func("cos", Math.PI))
}
```

#### Go routines


```go
go aFunction();
```

[View more examples](https://github.com/BradleyWood/TlDemo)


## Tests

Many Raven tests are written in Raven and are compiled using the
[raven-maven-plugin](raven-maven-plugin/src/main/java/org/raven/maven).
To achieve Junit compatibility we add an annotation processor for the
@Test annotation to ensure that test methods are compiled as non-static
void methods.

#### Example

```kotlin
import org.junit.Assert
import org.junit.Test

@Test
fun testAddition() {
    var a = 100
    var b = 200
    Assert.assertEquals(300, a + b)
}
```