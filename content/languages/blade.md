title=Blade
tags=language
summary=A simple, fast, clean, and dynamic language that allows you to develop applications quickly.
~~~~~~

[Website](https://bladelang.com/) | [Source](https://github.com/blade-lang/blade)

Blade is a simple, clean, and embeddable dynamic programming language created to be simple enough for beginners, yet powerful and expressive for professionals. It has a very small syntax set with a very low learning curve. Blade improves upon the best features of JavaScript, Python, and Ruby to give developers a familiar and powerful system that feels native for developers coming from any of these languages and an easy way to leverage the strength of any.

*How does it differ from Python and Ruby?*

* First-class package management (Package management is built into the language module system).
* Iterable classes.
* Backend development without any external dependencies.
* Function promotion.
* Default exports and imports.
* Anonymous functions.
* Access modifiers for variables, properties, function, class, modules, etc.
* Decorator functions.
* Function overrides in classes — A class can chose the result to return for a function if the function allows it.
* Easy to extend with C modules with a familiar API to Wren.

## Examples
HTTP API

```
import http
import json

var server = http.server(3000)
server.on_receive(|request, response| {
  response.headers['Content-Type'] = 'application/json'
  response.write(json.encode(request))
})

echo 'Listening on Port 3000...'
server.listen()
```

