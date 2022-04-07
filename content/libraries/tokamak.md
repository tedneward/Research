title=Tokamak
tags=library, swift, wasm, browser
summary=SwiftUI-compatible framework for building browser apps with WebAssembly and native apps for other platforms.
~~~~~~

[Source](https://github.com/TokamakUI/Tokamak)

### Example code
Tokamak API attempts to resemble SwiftUI API as much as possible. The main difference is that you use import TokamakShim instead of import SwiftUI in your files. The former makes your views compatible with Apple platforms, as well as platforms supported by Tokamak (currently only WebAssembly/WASI with more coming in the future):

```
import TokamakShim

struct Counter: View {
  @State var count: Int
  let limit: Int

  var body: some View {
    if count < limit {
      VStack {
        Button("Increment") { count += 1 }
        Text("\(count)")
      }
      .onAppear { print("Counter.VStack onAppear") }
      .onDisappear { print("Counter.VStack onDisappear") }
    } else {
      VStack { Text("Limit exceeded") }
    }
  }
}

@main
struct CounterApp: App {
  var body: some Scene {
    WindowGroup("Counter Demo") {
      Counter(count: 5, limit: 15)
    }
  }
}
```

#### Arbitrary HTML
With the HTML view you can also render any HTML you want, including inline SVG:

```
struct SVGCircle: View {
  var body: some View {
    HTML("svg", ["width": "100", "height": "100"]) {
      HTML("circle", [
        "cx": "50", "cy": "50", "r": "40",
        "stroke": "green", "stroke-width": "4", "fill": "yellow",
      ])
    }
  }
}
```

HTML doesn't support event listeners, and is declared in the TokamakStaticHTML module, which TokamakDOM re-exports. The benefit of HTML is that you can use it for static rendering in libraries like TokamakVapor and TokamakPublish.

Another option is the DynamicHTML view provided by the TokamakDOM module, which has a listeners property with a corresponding initializer parameter. You can pass closures that can handle onclick, onmouseover and other DOM events for you in the listeners dictionary. Check out MDN docs for the full list.

An example of mouse events handling with DynamicHTML would look like this:

```
struct MouseEventsView: View {
  @State var position: CGPoint = .zero
  @State var isMouseButtonDown: Bool = false

  var body: some View {
    DynamicHTML(
      "div",
      ["style": "width: 200px; height: 200px; background-color: red;"],
      listeners: [
        "mousemove": { event in
          guard
            let x = event.offsetX.jsValue().number,
            let y = event.offsetY.jsValue().number
          else { return }

          position = CGPoint(x: x, y: y)
        },
        "mousedown": { _ in isMouseButtonDown = true },
        "mouseup": { _ in isMouseButtonDown = false },
      ]
    ) {
      Text("position is \(position), is mouse button down? \(isMouseButtonDown)")
    }
  }
}
```

#### Arbitrary styles and scripts
While JavaScriptKit is a great option for occasional interactions with JavaScript, sometimes you need to inject arbitrary scripts or styles, which can be done through direct DOM access:

```
import JavaScriptKit

let document = JSObject.global.document
let script = document.createElement("script")
script.setAttribute("src", "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js")
document.head.appendChild(script)

_ = document.head.insertAdjacentHTML("beforeend", #"""
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
"""#)
```

This way both Semantic UI styles and moment.js localized date formatting (or any arbitrary style/script/font added that way) are available in your app.

