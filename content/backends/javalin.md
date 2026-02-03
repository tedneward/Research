title=Javalin
tags=backend, distribution, jvm, library
summary=A simple Web framework for Java and Kotlin.
~~~~~~

[Website](https://javalin.io/) | [Source](https://github.com/javalin/javalin)

## Examples
Hello, world

```kotlin
import io.javalin.Javalin

fun main() {
    val app = Javalin.create(/*config*/)
        .get("/") { ctx -> ctx.result("Hello World") }
        .start(7070)
}
```

More complex example

```kotlin
import io.javalin.Javalin
import io.javalin.apibuilder.ApiBuilder.*

fun main() {
    val app = Javalin.create { config ->
        config.useVirtualThreads = true
        config.http.asyncTimeout = 10_000L
        config.staticFiles.add("/public")
        config.staticFiles.enableWebjars()
        config.router.apiBuilder {
            path("/users") {
                get(UserController::getAll)
                post(UserController::create)
                path("/{userId}") {
                    get(UserController::getOne)
                    patch(UserController::update)
                    delete(UserController::delete)
                }
                ws("/events", userController::webSocketEvents)
            }
        }
    }.start(7070)
}
```
