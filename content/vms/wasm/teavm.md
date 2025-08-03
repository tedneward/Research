title=TeaVM
tags=vm, tool, jvm, wasm, native
summary=Compiles Java bytecode to JavaScript, WebAssembly and C
~~~~~~

[Website](https://teavm.org/) | [Source](https://github.com/konsoletyper/teavm)

WebAssembly support is in experimental status. It may lack major features available in JavaScript backend. There's no documentation yet, and you should do many things by hands (like embedding generated wasm file into your page, importing JavaScript objects, etc).

## Purpose
TeaVM is primarily a web development tool. It's not for taking your large existing codebase in Java or Kotlin and producing JavaScript. Unfortunately, Java was not designed to run efficiently in the browser. There are Java APIs that are impossible to implement without generating inefficient JavaScript. Some of these APIs are: reflection, resources, class loaders, and JNI. TeaVM restricts usage of these APIs. Generally, you'll have to manually rewrite your code to fit into TeaVM constraints.

TeaVM is for you, if:

* You are a Java developer and you are going to write a web front-end from scratch.
* You already have a Java-based backend and want to integrate front-end code tightly into your existing development infrastructure.
* You have some Java back-end code you want to reuse in the front end.
* You are ready to rewrite your code to work with TeaVM.

If you have tightly-coupled applications that use Swing, you want to run these applications in web, and you don't care about download size, start-up time and performance, you should probably look elsewhere; there are more appropriate tools for you, like CheerpJ.

## Strong parts

* TeaVM tries to reconstruct original structure of a method, so in most cases it produces JavaScript that you would write manually. No bloated while/switch statements, as naive compilers often do.
* TeaVM has a very sophisticated optimizer, which knows a lot about your code. Some examples are:

    * Dead code elimination produces very small JavaScript.
    * Devirtualization turns virtual calls into static function calls, which makes code faster.
    * TeaVM can reuse one local variables to store several local variables.
    * TeaVM renames methods to as short forms as possible; UglifyJS usually can't perform such optimization.

* TeaVM supports threads. JavaScript does not provide APIs to create threads (WebWorkers are not threads, since they don't allow to share state between workers). TeaVM is capable of transforming methods to continuation-passing style. This makes possible to emulate multiple logical threads in one physical thread. TeaVM threads are, in fact, green threads.
* TeaVM is very fast, you don't need to wait for minutes until your application gets recompiled.
* TeaVM produces source maps; TeaVM IDEA plugin allows you to debug code right from the IDE.
* TeaVM has a nice JavaScript interop API.

### Integrating with Gradle
Here's a minimal `build.gradle`:

```
plugins {
    id "java"
    id "war"
    id "org.teavm" version "0.12.3"
}
repositories {
    mavenCentral()
}

// This is optional, but for real-world applications you need to interact with browser.
// This dependency provides useful wrappers.
dependencies {
    implementation teavm.libs.jsoApis
}

teavm {
    all {
        mainClass = "example.MainClass"
    }
    js {
        addedToWebApp = true

        // this is also optional, default value is <project name>.js
        targetFileName = "example.js"
    }
    wasmGC {
        addedToWebApp = true

        // this is also optional, default value is <project name>.wasm
        targetFileName = "example.wasm"
    }
}
```

If you don't need either JS or WebAssembly GC, you can remove corresponding `addedToWebApp` setting, or ever entire configuration section related to particular backend.

where `MainClass` could do something simple like writing "Hello, world" string in the console. A bit more complex example of MainClass could be following:

```
package example;

import org.teavm.jso.dom.html.HTMLDocument;

public class MainClass {
    public static void main(String[] args) {
        var document = HTMLDocument.current();
        var div = document.createElement("div");
        div.appendChild(document.createTextNode("TeaVM generated element"));
document.getBody().appendChild(div);
    }
}
```

Finally, you need to add to your webapp resources index.html page, which includes examples.js and runs main method, like this:

```
<!DOCTYPE html>
<html>
  <head>
    <title>TeaVM example</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <script type="text/javascript" charset="utf-8" src="js/example.js"></script>
  </head>
  <body onload="main()"></body>
</html>
```

or if you need WebAssembly, HTML file like this:

```
<!DOCTYPE html>
<html>
  <head>
    <title>TeaVM WebAssembly example</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <script type="text/javascript" charset="utf-8" src="wasm-gc/example.wasm-runtime.js"></script>
    <script>
      async function main() {
          let teavm = await TeaVM.wasmGC.load("wasm-gc/example.wasm");
          teavm.exports.main([]);
      }
    </script>
  </head>
  <body onload="main()"></body>
</html>
```

now you can run `gradle build` or, if you are using Gradle wrapper, `./gradlew build` / `gradlew.bat build`. Finally, take `.war` file from `build/libs` directory and deploy it to any compatible container or simply unzip and open `index.html`.

Note that during development you can use Gretty plugin to serve you .war file via HTTP.

