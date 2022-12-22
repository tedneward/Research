title=RIFE2
tags=distribution, jvm, presentation, browser, web
summary=A full-stack, no-declaration, framework to quickly and effortlessly create web applications with modern Java.
~~~~~~

[Website](https://rife2.com/) | [Source](https://github.com/gbevin/rife2)

## Examples
Fully Functional Web Application

```
import rife.engine.*;

public class HelloWorld extends Site {
    public void setup() {
        get("/hello", c -> c.print("Hello World"));
    }

    public static void main(String[] args) {
        new Server().start(new HelloWorld());
    }
}
```

Let's change the example some more and create a single route that can respond to both get and post requests.

* the get request will display a form with a single button to click.
* the post request will receive the form's submission and display Hello World.

```
public class HelloForm extends Site {
    Route hello = route("/hello", c -> {
        var t = c.template("HelloForm");
        switch (c.method()) {
            case GET -> t.setBlock("content", "form");
            case POST -> t.setBlock("content", "text");
        }
        c.print(t);
    });

    public static void main(String[] args) {
        new Server().start(new HelloForm());
    }
}
```

With HelloForm.html being:

```
<!DOCTYPE html>
<html lang="en">
<body>
<!--v content/-->
<!--b form-->
<form action="{{v route:hello/}}" method="post" name="hello">
  <input type="submit" name="Submit">
</form>
<!--/b-->
<!--b text--><p id="greeting">Hello World</p><!--/b-->
</body>
</html>
```

