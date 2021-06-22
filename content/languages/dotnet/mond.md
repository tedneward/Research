title=Mond
tags=language, clr
summary=A scripting language for .NET Core.
~~~~~~

[Website](https://rohbot.net/mond/) | [Source](https://github.com/Rohansi/Mond)

Features
* sequences that can also be used for async/await
* prototype-based inheritance
* metamethods
* simple embedding with a great binding API

Example:
```
const Seq = require("Seq.mnd");

const randomApi =
    "https://www.random.org/decimal-fractions/?num=1&dec=9&col=1&format=plain";

Async.start(seq() {
    // concurrently request for 10 random numbers
    var numberTasks = Seq.range(0, 10)
        |> Seq.select(() -> Http.getAsync(randomApi))
        |> Seq.toArray();

    // wait for all the requests to finish
    var numbers = yield Task.whenAll(numberTasks);

    // parse and sum the numbers
    var total = numbers
        |> Seq.select(s -> Json.deserialize(s))
        |> Seq.aggregate(0, (acc, n) -> acc + n);
        
    printLn("average = {0}".format(total / 10));
});

Async.runToCompletion();
```
