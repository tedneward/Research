title=iOS (OS) SwiftUI
tags=platform, ios
summary=SwiftUI user-interface style for the Apple mobile device operating system (on top of the open-source Darwin kernel) UI.
~~~~~~
Code-based widget construction. You can find the [official documentation here](https://developer.apple.com/documentation/swiftui).

- [MemeMaker on GitHub](https://github.com/dempseyatgithub/MemeMaker): An app that composes text over an image in SwiftUI

- [How SwiftUI can now be used to build entire iOS apps](https://wwdcbysundell.com/2020/building-entire-apps-with-swiftui/): This year, however, entire apps can now be defined directly using SwiftUI, thanks to a few new additions to its API.

- [What’s new in SwiftUI for iOS 14](https://www.hackingwithswift.com/articles/221/whats-new-in-swiftui-for-ios-14): SwiftUI was inevitably going to see big changes this year, and I’m really excited to experiment with them all – text views, color pickers, progress views, and even limited support for grids have all landed. 

- [How to define SwiftUI properties](https://twitter.com/chriseidhof/status/1280433133813456896): Here's a first draft of a decision tree for how to define your SwiftUI properties...

- [A guide to SwiftUI’s state management system](https://www.swiftbysundell.com/articles/swiftui-state-management-guide/): What separates SwiftUI from Apple’s previous UI frameworks isn’t just how views and other UI components are defined, but also how view-level state is managed throughout an app that uses it.

- [Mastering toolbars in SwiftUI](https://swiftwithmajid.com/2020/07/15/mastering-toolbars-in-swiftui/): This week we will learn all about the new Toolbar API.

- [Setting up a multi-platform SwiftUI project](https://blog.scottlogic.com/2021/03/04/Multiplatform-SwiftUI.html): This blog will take a look at a basic setup for a multi-platform SwiftUI app.

## Examples

### Hello World
```
struct ContentView : View {
  var body: some View {
    Text("Hello World")
  }
}
```

### ... with a button
```
struct ContentView : View {
  var body: some View {
    HStack {
      Text("Hello World")
      Spacer()
      Button("Tap Me") {      // trailing closure syntax
        // Do nothing
      }
    }.frame(width: 200)
    .padding(20)
    .backgroundColor(Color.yellow)
  }
}
```

### ... with state properties
```
struct ContentView : View {
  @State var isHello = true  // whenever isHello changes, trigger body getter again
  var greeting : String {    // convenience expression to switch between strings
    self.isHello ? "Hello" : "Goodbye"
  }
  var body: some View {
    HStack {
      Text(self.greeting + " World") // why not a Swift inline expression?
      Spacer()
      Button("Tap Me") {
        self.isHello.toggle() // is this a natural method of Boolean?
      }
    }.frame(width: 200)
    .padding(20)
    .backgroundColor(Color.yellow)
  }
}
```

### ... and bindings (two-way)
```
struct ContentView : View {
  @State var isHello = true  // provides an $isHello Binding object
  var greeting : String { 
    self.isHello ? "Hello" : "Goodbye"
  }
  var body: some View {
    HStack {
      Text(self.greeting + " World")
      Spacer()
      Toggle("Friendly", isOn: $isHello) // uses the Binding to enable two-way
    }.frame(width: 200)
    .padding(20)
    .backgroundColor(Color.yellow)
  }
}
```

### Passing data "downhill"
Passing data from the View doing the creating to the View that is created.
```
struct ContentView : View {
  @State var isHello = true  // whenever isHello changes, trigger body getter again
  var greeting : String {    // convenience expression to switch between strings
    self.isHello ? "Hello" : "Goodbye"
  }
  @State var showSheet = false
  var body: some View {
    VStack {
      Button("Show Message") {
        self.showSheet.toggle()
      }.sheet(isPresented: $showSheet) {
        Greeting(greeting: self.greeting)
      }
      Spacer()
      Toggle("Friendly", isOn: $isHello)
    }.frame(width: 150, height: 100)
    .padding(20)
    .background(Color.yellow)
  }
}

struct Greeting : View {
  let greeting : String
  var body: some View {
    Text(greeting + " World")
  }
}
```

### Passing data "uphill"
Passing data from the secondary view back to the view that presented it.
```
struct ContentView : View {
  @State var isHello = true  // whenever isHello changes, trigger body getter again
  var greeting : String {    // convenience expression to switch between strings
    self.isHello ? "Hello" : "Goodbye"
  }
  @State var showSheet = false
  @State var name = ""
  var body: some View {
    VStack {
      Button("Show Message") {
        self.showSheet.toggle()
      }.sheet(isPresented: $showSheet) {
        Greeting(greeting: self.greeting, username: self.$name)
      }
      Spacer()
      Toggle("Friendly", isOn: $isHello)
    }.frame(width: 150, height: 100)
    .padding(20)
    .background(Color.yellow)
  }
}

struct Greeting : View {
  @Binding var username : String
  let greeting : String
  var body: some View {
    TextField("Your Name", text: $username)
      .frame(width: 200)
      .textFieldStyle(ROundedBorderTextFieldStyle())
    Text(greeting + " World")
  }
}
```

