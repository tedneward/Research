title=Sparkjava
tags=backend, jvm
summary=A micro framework for creating web applications in Kotlin and Java 8 with minimal effort.
~~~~~~

[Website](https://sparkjava.com/) | [Source](https://github.com/perwendel/spark)

## Hello world
```kotlin
import spark.kotlin.*

fun main(args: Array<String>) {
    val http: Http = ignite()

    http.get("/hello") {
        "Hello Spark Kotlin!"
    }
}
```

