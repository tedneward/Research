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
* Outlet connections. Has a name, which is matched against the destination's instance property of the same name. "In code, there must be an instance property in the class whose instance will act as owner when the nib loads; it must be marked as `@IBOutlet`. In the nib editor, the class of the nib owner object must be set to the class whose instance will act as owner when the nib loads. We must then create the outlet, with the same name as the property, from the nib owner to some nib object."
* Action connections. A message-sending reference. An action is a message emitted by a Cocoa UIControl object to another object (the destination); aka an event. Control object must know three things: control event, action (what message to send), target (destination).

## Misc

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

## SwiftUI
Code-based widget construction. You can find the [official documentation here](https://developer.apple.com/documentation/swiftui).

- [MemeMaker on GitHub](https://github.com/dempseyatgithub/MemeMaker): An app that composes text over an image in SwiftUI

- [How SwiftUI can now be used to build entire iOS apps](https://wwdcbysundell.com/2020/building-entire-apps-with-swiftui/): This year, however, entire apps can now be defined directly using SwiftUI, thanks to a few new additions to its API.

- [What’s new in SwiftUI for iOS 14](https://www.hackingwithswift.com/articles/221/whats-new-in-swiftui-for-ios-14): SwiftUI was inevitably going to see big changes this year, and I’m really excited to experiment with them all – text views, color pickers, progress views, and even limited support for grids have all landed. 

- [How to define SwiftUI properties](https://twitter.com/chriseidhof/status/1280433133813456896): Here's a first draft of a decision tree for how to define your SwiftUI properties...

- [A guide to SwiftUI’s state management system](https://www.swiftbysundell.com/articles/swiftui-state-management-guide/): What separates SwiftUI from Apple’s previous UI frameworks isn’t just how views and other UI components are defined, but also how view-level state is managed throughout an app that uses it.

- [Mastering toolbars in SwiftUI](https://swiftwithmajid.com/2020/07/15/mastering-toolbars-in-swiftui/): This week we will learn all about the new Toolbar API.

- [Setting up a multi-platform SwiftUI project](https://blog.scottlogic.com/2021/03/04/Multiplatform-SwiftUI.html): This blog will take a look at a basic setup for a multi-platform SwiftUI app.


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
