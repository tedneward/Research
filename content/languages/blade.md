title=Blade
tags=language
summary=A simple, fast, clean, and dynamic language that allows you to develop applications quickly.
~~~~~~

[Website](https://bladelang.com/) | [Source](https://github.com/blade-lang/blade)

Blade emphasises algorithm over syntax and for this reason, it has a very small but powerful syntax set with a very natural feel. Blade builds upon the best features of JavaScript, Python and Ruby to give developers a familiar and powerful system that feels native for developers coming from any of these languages and an easy way to leverage the strength of any.

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

