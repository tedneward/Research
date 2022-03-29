title=iOS Foundation
tags=platform, ios
summary=Using the Foundation frameworks on iOS.
~~~~~~

[Apple Docs: Foundation](https://developer.apple.com/documentation/foundation) | [Apple Docs: Core Foundation](https://developer.apple.com/documentation/corefoundation)

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
