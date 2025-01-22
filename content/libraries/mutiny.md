title=Mutiny
tags=library, jvm, reactive
summary=Provides a simple but powerful asynchronous development model to build reactive applications.
~~~~~~

[Website](https://smallrye.io/smallrye-mutiny/latest/) | [Source](https://github.com/smallrye/smallrye-mutiny)

Example:

```java
Uni<String> request = makeSomeNetworkRequest(params);

request.ifNoItem().after(ofMillis(100))
    .failWith(() -> new TooSlowException("💥"))
    .onFailure(IOException.class).recoverWithItem(fail -> "📦")
    .subscribe().with(
        item -> log("👍 " + item),
         err -> log(err.getMessage())
    );
```
