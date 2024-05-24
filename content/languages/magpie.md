title=Magpie
tags=language
summary=A toy language interpreter, written in Go. It has C-style syntax, and is largely inspired by Ruby, Python, Perl and c#.
~~~~~~

[Source](https://github.com/haifenghuang/magpie)

> Features: Class with support for property, indexer & operator overloading; await/async for asynchronous programming; Builtin support for linq; Builtin support for datetime literal; First class function; function with Variadic parameters and default values; function with multiple return values; int, uint, float, bool, array, tuple, hash(all support json marshal & unmarshal, all can be extended); try-catch-finally exception handling; Optional Type support(Java 8 like); using statment(C# like); Elixir like pipe operator; Using method of Go Package(RegisterFunctions and RegisterVars); Syntax-highlight REPL; Doc-generation tool mdoc; Integrated services processing; Simple debugger; Simple Macro processing

### Examples

#### LINQ
```
// async/await
async fn add(a, b) { a + b }

result = await add(1, 2)
println(result)

// linq example
class Linq {
    static fn TestSimpleLinq() {
        //Prepare Data Source
        let ingredients = [
            {Name: "Sugar",  Calories: 500},
            {Name: "Egg",    Calories: 100},
            {Name: "Milk",   Calories: 150},
            {Name: "Flour",  Calories: 50},
            {Name: "Butter", Calories: 200},
        ]

        //Query Data Source
        ingredient = from i in ingredients where i.Calories >= 150 orderby i.Name select i

        //Display
        for item in ingredient => println(item)
    }

    static fn TestFileLinq() {
        //Read Data Source from file.
        file = newFile("./examples/linqSample.csv", "r")

        //Query Data Source
        result = from field in file where int(field[1]) > 300000 select field[0]

        //Display
        for item in result => printf("item = %s\n", item)

        file.close()
    }

    /* Code from https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/let-clause */
    static fn TestComplexLinq() {
        //Data Source
        stringList = [
            "A penny saved is a penny earned.",
            "The early bird catches the worm.",
            "The pen is mightier than the sword."
        ]

        //Query Data Source
        earlyBirdQuery =
            from sentence in stringList
            let words = sentence.split(" ")
            from word in words
            let w = word.lower()
            where w[0] == "a" || w[0] == "e" ||
                  w[0] == "i" || w[0] == "o" ||
                  w[0] == "u"
            select word

        //Display
        for v in earlyBirdQuery => printf("'%s' starts with a vowel\n", v)
    }
}

Linq.TestSimpleLinq()
println("======================================")
Linq.TestFileLinq()
println("======================================")
Linq.TestComplexLinq()
```

#### Web service
```
//service Hello on "0.0.0.0:8090" {
service Hello on "0.0.0.0:8090:debug" { //':debug': for debugging request
  //In '@route', you could use 'url(must), methods, host, schemes, headers, queries'
  @route(url="/authentication/login", methods=["POST"])
  fn login(writer, request) {
    //writer.writeJson({ sessionId: "3d5bd2cA15ef047689" })
    //writer.writeJson({ sessionId: "3d5bd2cA15ef047689" }), 200 # same as above
    //return { sessionId: "3d5bd2cA15ef047689" }, 200 # same as above
    return { sessionId: "3d5bd2cA15ef047689" } // same as above
  }

  @route(url="/authentication/logout", methods=["POST"])
  fn logout(writer, request) {
    // writer.writeHeader(http.STATUS_CREATED) # return http status code 201
    return http.STATUS_CREATED // same as above
  }

  @route(url="/meters/setting-result/{acceptNo}", methods=["GET"])
  fn load_survey_result(writer, request) {
    //using 'vars' dictionary to access the url parameters
    //writer.writeJson({ acceptNo: vars["acceptNo"], resultCode: "1"})
    return { acceptNo: vars["acceptNo"], resultCode: "1"} // same as above
  }

  @route(url="/articles/{category}/{id:[0-9]+}", methods=["GET"])
  fn getArticle(writer, request) {
    //using 'vars' dictionary to access the url parameters
    //writer.writeJson({ category: vars["category"], id: vars["id"]})
    return { category: vars["category"], id: vars["id"]} // same as above
  }
}
```
https://github.com/munificent/magpie
Magpie is a small dynamically-typed programming language built around patterns, classes, and multimethods. It has a prototype interpreter that runs on the JVM and an in-progress bytecode VM written in C++.
