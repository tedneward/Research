title=iOS Foundation
tags=platform, ios
summary=Using the Foundation frameworks on iOS.
~~~~~~

[Apple Docs: Foundation](https://developer.apple.com/documentation/foundation) | [Apple Docs: Core Foundation](https://developer.apple.com/documentation/corefoundation)

The Foundation framework provides a base layer of functionality for apps and frameworks, including data storage and persistence, text processing, date and time calculations, sorting and filtering, and networking.

[Archives and serialization](https://developer.apple.com/documentation/foundation/archives_and_serialization): 

* [JSON](https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types)
* [XML](https://developer.apple.com/documentation/foundation/archives_and_serialization/xml_processing_and_modeling)
* [NSKeyedArchiver](https://developer.apple.com/documentation/foundation/nskeyedarchiver)/[NSKeyedUnarchiver](https://developer.apple.com/documentation/foundation/nskeyedunarchiver)

[Files and Filesystem](https://developer.apple.com/documentation/foundation/file_system)

[Preferences](https://developer.apple.com/documentation/foundation/preferences)

[Task Management](https://developer.apple.com/documentation/foundation/task_management):

* Before entering into a discussion about concurrency, it is necessary to define some relevant terminology to prevent confusion. Developers who are more familiar with UNIX systems or older OS X technologies may find the terms “task”, “process”, and “thread” used somewhat differently in this document. This document uses these terms in the following way:

    * The term *thread* is used to refer to a separate path of execution for code. The underlying implementation for threads in OS X is based on the POSIX threads API.
    * The term *process* is used to refer to a running executable, which can encompass multiple threads.
    * The term *task* is used to refer to the abstract concept of work that needs to be performed.

* [NSUserActivity](https://developer.apple.com/documentation/foundation/nsuseractivity): A representation of the state of your app at a moment in time. An NSUserActivity object provides a lightweight way to capture the state of your app and put it to use later. Create this object to capture information about what the user was doing, such as viewing app content, editing a document, viewing a web page, or watching a video. When the system launches your app and an activity object is available, your app can use the information in that object to restore itself to an appropriate state. Spotlight also uses these objects to improve search results for the user.

* Operations ([Operation](https://developer.apple.com/documentation/foundation/operation), [OperationQueue](https://developer.apple.com/documentation/foundation/operationqueue), [BlockOperation](https://developer.apple.com/documentation/foundation/blockoperation)): Managing tasks (code + data) for (possible) asynchronous execution. (See [Concurrency Programming Guide (Archived)](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html) for additional details)

[Processes and Threads](https://developer.apple.com/documentation/foundation/processes_and_threads):

* [NSRunLoop](https://developer.apple.com/documentation/foundation/nsrunloop): The programmatic interface to objects that manage input sources. A NSRunLoop object processes input for sources, such as mouse and keyboard events from the window system and NSPort objects. A NSRunLoop object also processes NSTimer events. Your application neither creates nor explicitly manages NSRunLoop objects. The system creates a NSRunLoop object as needed for each NSThread object, including the application’s main thread. If you need to access the current thread’s run loop, use the class method currentRunLoop. (`currentRunLoop` returns the run loop for the current thread; `mainRunLoop` returns the run loop of the main thread; `performBlock` schedules a block that the run loop invokes; `performSelector:target:argument:order:modes:` schedules a block that the run loop invokes when it's running in any of the specified modes.)
* [RunLoop](https://developer.apple.com/documentation/foundation/runloop): Appears similar/identical to NSRunLoop above, except for naming conventions on the class.
* [Threading Programming Guide (Archived)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/Introduction/Introduction.html)

[Object Runtime](https://developer.apple.com/documentation/foundation/object_runtime): Low-level support for basic Objective-C features, Cocoa design patterns, and Swift integration.

[Streams, Sockets, and Ports](https://developer.apple.com/documentation/foundation/streams_sockets_and_ports): Low-level Unix features to manage input and output among files, processes, and the network.

---

[Mantle](https://github.com/Mantle/Mantle): Model framework for Cocoa and Cocoa Touch. Mantle makes it easy to write a simple model layer for your Cocoa or Cocoa Touch application.

---

["Extending iOS apps with plugins"](https://betterprogramming.pub/extending-ios-apps-with-plug-ins-e4119d064f2d): Discusses three options: use Javascript (using baked-in JavaScriptConsole engine), use Lua ('https://github.com/weyhan/lua4swift'), or dynamically load libraries via C interop via the Darwin framework:

The Framework code:

```swift
import Foundation

let circle1 = 1
let circle2 = 2
let circle3 = 3

var time = 0.0
var step = 0

var updateProperty: (_ tag: Int, _ property: String, _ value: Any) -> Void
var addWidget: (_ widget: String, _ properties: [String: Any]) -> Void

@_cdecl("set_update_property_func")
public func setUpdatePropertyFunc(f: @escaping (_ tag: Int, _ property: String, _ value: Any) -> Void) {
    updateProperty = f
}

@_cdecl("set_add_widget_func")
public func setAddWidgetFunc(f: @escaping (_ widget: String, _ properties: [String: Any]) -> Void) {
    addWidget = f
}

@_cdecl("lights_tick")
public func tick(delta: TimeInterval) {
    time += delta
    if time >= 1.0 {
        time -= 1.0
        loopStep()
    }
}

@_cdecl("loop_step")
func loopStep() {
    switch step {
    case 0:
        updateProperty(circle1, "color", "#50ff0000")
        updateProperty(circle2, "color", "#ffffff00")
        updateProperty(circle3, "color", "#5000ff00")
        
    case 1:
        updateProperty(circle1, "color", "#50ff0000")
        updateProperty(circle2, "color", "#50ffff00")
        updateProperty(circle3, "color", "#ff00ff00")
        
    case 2:
        updateProperty(circle1, "color", "#ffff0000")
        updateProperty(circle2, "color", "#50ffff00")
        updateProperty(circle3, "color", "#5000ff00")
        
    default:
        break
    }
    step = (step + 1) % 3
}

@_cdecl("lights_start")
public func start(width: Double, height: Double) {
    let circleRadius = height / 10.0
    addWidget("Circle", [
        "tag": circle1,
        "x": width / 2,
        "y": circleRadius * 2,
        "radius": circleRadius,
        "color": "#ffff0000"
    ])
    addWidget("Circle", [
        "tag": circle2,
        "x": width / 2,
        "y": circleRadius * 5,
        "radius": circleRadius,
        "color": "#50ffff00"
    ])
    addWidget("Circle", [
        "tag": circle3,
        "x": width / 2,
        "y": circleRadius * 8,
        "radius": circleRadius,
        "color": "#5000ff00"
    ])
}
```

The ViewController that loads and uses the plugin:

```swift
import UIKit
import Darwin

class FrameworkViewController: UIViewController {
    @IBOutlet weak var vPluginContainer: UIView!
    
    var timer: Timer?
    
    typealias startFuncPrototype = @convention(c) (Double, Double) -> Void
    typealias tickFuncPrototype = @convention(c) (TimeInterval) -> Void
    typealias setUpdatePropertyPrototype = @convention(c) (@escaping (_ tag: Int, _ property: String, _ value: Any) -> Void) -> Void
    typealias setAddWidgetPrototype = @convention(c) (@escaping (_ widget: String, _ properties: [String: Any]) -> Void) -> Void

    var handle: UnsafeMutableRawPointer?
    var tickFunc: tickFuncPrototype?
    
    deinit {
        if let handle = handle {
            dlclose(handle)
        }
    }
    
    @IBAction func runPlugin() {
        if let handle = handle {
            dlclose(handle)
        }
        
        handle = dlopen("/Volumes/Extra/Work/DynamicLights", RTLD_LAZY)
        if handle == nil { return }
        
        let updateProperty: (_ tag: Int, _ property: String, _ value: Any) -> Void = { [weak self] (tag, property, value) in
            guard let w = self?.vPluginContainer.viewWithTag(tag) else { return }

            switch property {
            case "color":
                if let strValue = value as? String,
                    let color = UIColor(hex: strValue) {
                    w.backgroundColor = color
                }

            default:
                break
            }
        }
        
        let addWidget: (_ widget: String, _ properties: [String: Any]) -> Void = { [weak self] (widgetName, widgetProperties) in
            switch widgetName {
            case "Circle":
                guard let x = widgetProperties["x"] as? Double,
                      let y = widgetProperties["y"] as? Double,
                      let r = widgetProperties["radius"] as? Double else {
                    break
                }
                let color = widgetProperties["color"] as? String ?? "#ffffff"
                let tag = widgetProperties["tag"] as? Int ?? 0
                let v = UIView(frame: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2))
                v.layer.cornerRadius = CGFloat(r)
                v.tag = tag
                let uiColor = UIColor(hex: color) ?? .black
                v.backgroundColor = uiColor
                self?.vPluginContainer.addSubview(v)

            default:
                print("Unknown widget - \(widgetName)")
            }
        }
        
        if let setUpdatePropertySym = dlsym(handle!, "set_update_property_func") {
            let setUpdatePropertyFunc = unsafeBitCast(setUpdatePropertySym, to: setUpdatePropertyPrototype.self)
            setUpdatePropertyFunc(updateProperty)
        }
        
        if let setAddWidgetSym = dlsym(handle!, "set_add_widget_func") {
            let setAddWidgetFunc = unsafeBitCast(setAddWidgetSym, to: setAddWidgetPrototype.self)
            setAddWidgetFunc(addWidget)
        }
        
        if let startSym = dlsym(handle!, "lights_start") {
            let startFunc = unsafeBitCast(startSym, to: startFuncPrototype.self)
            startFunc(Double(vPluginContainer.bounds.width), Double(vPluginContainer.bounds.height))
        }
        
        if let tickSym = dlsym(handle!, "lights_tick") {
            tickFunc = unsafeBitCast(tickSym, to: tickFuncPrototype.self)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }

    @objc func tick() {
        if let tickFunc = tickFunc {
            tickFunc(0.01)
        }
    }
}
```
