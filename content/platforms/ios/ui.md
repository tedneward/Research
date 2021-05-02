title=iOS (OS) UI
tags=platform, ios
summary=UI development for the Apple mobile device operating system (on top of the open-source Darwin kernel).
~~~~~~

## General

UIView forms root of view hierarchy; object instance lifetime isn't quite 1:1 with widget (screen) lifetime.

UIViewController: A view controller isn't an interface object (view), but it manages one--this view is its "main view".

### Interface Builder: Document Outline
Hierarchical view of the objects in the nib. 

Two fundamental IB file types, storyboards and nibs:

* Storyboard file contains "scenes": a single view controller, along with some ancillary material. Every scene has a single view controller at its top level. In the document outline, all scenes are listed. Each scene is the top level of a hierarchical list, and down from each scene are the objects that also appear in the view controller's scene dock: the view controller itself, and two proxy objects: the First Responder token and the Exit token. These are the scene's "top-level objects". The proxy objects are placeholders for objects that already exist, and are displayed in order to facilitate communication between nib objects and other objects that will be present at runtime.

* XIB file holds no scenes. Top-level interface object is usually a view. (A Nib can contain a view controller, but it usually doesn't.) The document outline for a Nib contains three top-level objects: the File's Owner, the First Responder, and a nib object (view).

To manually instantiate a view controller from a nib/storyboard, take a UIStoryboard instance and call `instantiateInitialViewController` (to instantiate the one marked as the initial view controller) or `instantiateViewController(withIdentifier:)` (to instantiate one by ID)

### Nib files
Resource-based widget construction. "Nib" comes from extension `.nib`: Nextstep Interface Builder. Also applies to `.xib` (XML-based Nib) and `.storyboard` files. A nib containing a view controller will almost certainly come from a storyboard.

When a view controller has a main view, but instantiates it lazily/on-demand. The view conroller can obtain it through one of several ways, including from a nib. If the view controller is instantiated in code, use the `init(nibName:bundle:)` to designate the .xib file to use to instantiate the view. (Or override it and provide it to the base class?)

`Bundle::loadNibNamed(_:owner:options)` or `UINib::instantiate(withOwner:options:)` (after instantiating a new UINib object). This returns an array of object instances created from the nib's top-level objects. (The owner will be the object to use for the destination of connections.)

To create a raw nib (.xib file): File | New | File -> iOS -> User Interface -> View.

## Connections

Directional linking in the nib editor from one object (source) to another (destination). Two kinds:

* **Outlet connections.** Has a name, which is matched against the destination's instance property of the same name. "In code, there must be an instance property in the class whose instance will act as owner when the nib loads; it must be marked as `@IBOutlet`. In the nib editor, the class of the nib owner object must be set to the class whose instance will act as owner when the nib loads. We must then create the outlet, with the same name as the property, from the nib owner to some nib object."

* **Action connections.** A message-sending reference. An action is a message emitted by a Cocoa UIControl object to another object (the destination); aka an event. Control object must know three things: control event, action (what message to send), target (destination). 
  Actions can be "nil-targeted", where the target is nil; there is no designated target object, so instead: starting with the hit-test view (the view with which the user is interacting, presumably the top of the Z-order), Cocoa walks up the responder chain looking for an object that can respond to the action message:
    * If a responder is found that handles this message, that method is called on that responder, and that's the end.
    * If we get all the way to the top of the responder chain without finding a responder to handle this message, nothing happens; the message goes unhandled with no error/exception.
  How do we do this in a nib? Form a connection to the First Responder proxy object in the dock--that's what it's for. Before you can connect an action to it, you have to define the action message within the First Responder proxy object: Select the First Responder proxy in the nib, and switch to the Attributes inspector. Click the Plus button in the table (probably empty) of user-defined nil-targeted First Responder actions, and give the new action a name; it must take a single parameter (so that its name will end with a colon). Now we can Control-drag from a control to the First Responder proxy to specify a nil-targeted action with the name specified in the table.

## UIView
Custom UIView subclass: `draw(_:)` method is invoked so that the view can draw itself.

Example: custom UIView class (`MyHorizLine`) that draws a horizontal line. File -> New -> File -> iOS -> Cocoa Touch Class (UIView).

    ```
    class MyHorizLine : UIView {
        required init?(coder: NSCoder) {
          super.init(coder: coder)
          self.backgroundColor = .clear
        }

        override func draw(_ rect: CGRect) {
          let c = UIGraphicsGetCurrentContext()!
          c.move(to: CGPoint(x: 0, y: 0))
          c.addLine(to: CGPoint(x: self.bounds.size.width), y: 0))
          c.strokePath()
        }
    }
    ```

## Responder chain
From bottom to top, looks roughly like this:

1. The UIView that we start with (the hit-test view)
1. If this UIView is a UIViewController's view, that UIViewController
1. The UIView's superview
1. Go back to step 2 and repeat, until we reach...
1. The UIWindow (and the UIWindowScene)
1. The UIApplication
1. The UIApplication's delegate

## Communication between objects
Organizational considerations to help arrange for coherent communication between objects.

* Visibility through an instance property
* Visibility through instantiation. (First instantiates the second, passing it the message/data in.)
* Visibility through connection/reference. Segues do this: At the moment a segue is triggered, the source view controller already exists, and the segue knows what view controller it is, and the segue itself instantiates the destination view controller, so the segue immediately turns to the source view controller and hands it a reference to the destination view controller (for example, by calling the source view controller's `prepare(for:sender:)` method). This is the source view controller's chance to obtain a reference to the newly-instantiated destination view controller and provide necessary data, references, delegation, whatever.
* Visibility through reference. (Singletons; navigating the view or view controller hierarchy.)

## Misc

#### Log all the `responds(to:)` requests on an object
For example, implement this on the AppDelegate class in a project to instrument with logging:

    ```
    override func response(to aSelector: Selector) -> Bool {
      print(aSelector)
      return super.responds(to: aSelector)
    }
    ```

#### [Variable Width Strings](https://useyourloaf.com/blog/variable-width-strings/)

> Wouldn’t it be useful if you could automatically change the text based on the available space? There’s a little-known feature of the localization system that does precisely that.

#### [UIView styling with functions](https://felginep.github.io/2019-02-19/uiview-styling-with-functions)

> Today I want to talk about UIView styling. The common approach when we want to customize the display of native UI controls (for instance UIButton or UILabel) is to create a subclass that overrides a bunch of properties. That works well most of the time, but some problems may arise.

#### [Two Takes on Adaptive Cell Layout](https://blog.alltheflow.com/two-takes-on-adaptive-cell-layout/)

On autolayout, adaptive table cells, and using UIStackView (or not!)

#### [Popovers, UINavigationController, and preferredContentSize](https://noahgilmore.com/blog/popover-uinavigationcontroller-preferredcontentsize/)

> In this post we'll look at a very specific but tricky interaction in UIKit, one which took me multiple days to work out how to implement.

#### [Modality changes in iOS 13](https://sarunw.com/posts/modality-changes-in-ios13)

> One behavior that changed and might break your old app once you starting adopting new iOS 13 is the modal presentation.

#### [The Auto Layout Comprehendium™](http://mischa-hildebrand.de/en/2017/11/the-auto-layout-comprehendium/)

> Intended as a compendium for you to look up certain topics and to fully understand the internal mechanics behind the technology. While following an intuitive approach, it will help you master Auto Layout at a deeper level and empower you to build adaptable layouts without conflicts or ambiguities.

#### [The iOS 13 Design Guidelines: An Illustrated Guide](https://learnui.design/blog/ios-design-guidelines-templates.html)

> In this article, we’re going to cover basically everything you need to know to design an iPhone app following standard iOS 13 conventions and style.

#### [SF Symbols Changes in iOS 14.2](https://hacknicity.medium.com/sf-symbols-changes-in-ios-14-2-8a8bdf708426)

> There are now three different sets of symbols to consider...

#### [Tweaking The iOS System Fonts](https://useyourloaf.com/blog/tweaking-the-ios-system-fonts/)

> Before you switch to a custom font don’t overlook how much you can tweak the appearance of the system fonts. A quick review of some font APIs that work for both UIKit and SwiftUI.


## Devices & Resolutions

### Resolutions

* [The Ultimate Guide To iPhone Resolutions](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

### iOS 14 resolutions

> [@stroughtonsmith](https://mobile.twitter.com/stroughtonsmith/status/1316121520880656384)
>
> iPhone 4”: 320 x 568 pt  
> iPhone 4.7”: 375 x 667 pt  
> iPhone 5.5”: 414 x 736 pt  
> 
> iPhone 5.4” & 5.8”: 375 x 812 pt  
> iPhone 6.1" (2020): 390 x 844 pt  
> 
> iPhone 6.1” (2018–2019) & 6.5”: 414pt x 896 pt  
> iPhone 6.7”: 428 x 926 pt  

> [@stroughtonsmith](https://mobile.twitter.com/stroughtonsmith/status/1316127636201132032)
>
> If you want to be thorough, the 5.4" and 5.8" iPhone models also support a Display Zoom resolution of 320 x 693 pt, 
> which I'm sure almost nobody actually tests their apps at

### iPhone 12

* [iPhone 12 Screen Sizes](https://useyourloaf.com/blog/iphone-12-screen-sizes/)
* [How iOS Apps Adapt to the various iPhone 12 Screen Sizes](https://hacknicity.medium.com/how-ios-apps-adapt-to-the-various-iphone-12-screen-sizes-e45c021e1b8b)
