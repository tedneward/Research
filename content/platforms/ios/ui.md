title=iOS UI
tags=platform, ios
summary=UI development for the Apple mobile device operating system (on top of the open-source Darwin kernel).
~~~~~~

## SceneDelegate
Introduced in iOS 13.

[Understanding the iOS 13 SceneDelegate](https://www.donnywals.com/understanding-the-ios-13-scene-delegate/):

* Info.plist has a new key: `Application Scene Manifest` (contains Enable Multiple Windows and Scene Configuration, which in turn contains Application Session Role, which is an array of Configuration Name/Delegate Class Name items); specifies a name and delegate class for your scene. Note that these properties belong to an array (Application Session Role), suggesting that you can have multiple configurations in your Info.plist. A much more important key that you may have already spotted in the screenshot above is Enable Multiple Windows. This property is set to NO by default. Setting this property to YES will allow users to open multiple windows of your application on iPadOS (or even on macOS). Being able to run multiple windows of an iOS application side by side is a huge difference from the single window environment we’ve worked with until now, and the ability to have multiple windows is the entire reason our app’s lifecycle is now maintained in two places rather than one.

    ***If I delete this key from the plist file, does that "turn off" scene delegates?***

* AppDelegate's responsibilities: The AppDelegate is still the main point of entry for an application in iOS 13. Apple calls AppDelegate methods for several application level lifecycle events. In Apple’s default template you’ll find three methods that Apple considers to be important for you to use:

    * `func application(_:didFinishLaunchingWithOptions:) -> Bool`: called at launch, used to perform app setup. In iOS 12 and earlier, you might have used this method to create/configure a UIWindow and assign a UIViewController instance to the window to make it appear. If your app is using scenes, the AppDelegate is no longer responsible for doing this. (Since your app can now have multiple windows, or UISceneSessions, active, it doesn't make much sense to manage a single-window object here.)
    * `func application(_:configurationForConnecting:options:) -> UISceneConfiguration`: called whenever your application is expected to supply a new scene, or window for iOS to display. Note that this method is not called when your app launches initially, it’s only called to obtain and create new scenes.
    * `func application(_:didDiscardSceneSessions:)`: This method is called whenever a user discards a scene, for example by swiping it away in the multitasking window or if you do so programmatically. If your app isn’t running when the user does this, this method will be called for every discarded scene shortly after `func application(_:didFinishLaunchingWithOptions:) -> Bool` is called.

    In addition to these default methods, your AppDelegate can still be used to open URLs, catch memory warnings, detect when your app will terminate, whether the device’s clock changed significantly, detect when a user has registered for remote notifications and more.

* SceneDelegate's responsibilities: the SceneDelegate is responsible for what’s shown on the screen; the scenes or windows. When you’re dealing with scenes, what looks like a window to your user is actually called a UIScene which is managed by a UISceneSession. So when we refer to windows, we are really referring to UISceneSession objects.

    * `scene(_:willConnectTo:options:)`: creates your initial content view (ContentView if you’re using SwiftUI), creates a new UIWindow, sets the window’s `rootViewController` and makes this window the key window. You might think of this window as the window that your user sees. This, unfortunately, is not the case. Windows have been around since before iOS 13 and they represent the viewport that your app operates in. So, the UISceneSession controls the visible window that the user sees, the UIWindow you create is the container view for your application. In addition to setting up initial views, you can use `scene(_:willConnectTo:options:)` to restore your scene UI in case your scene has disconnected in the past. For example, because it was sent to the background. You can also read the `connectionOptions` object to see if your scene was created due to a HandOff request or maybe to open a URL.
    * `sceneWillEnterForeground(_:)`: Once your scene has connected, the next method in your scene’s lifecycle is `sceneWillEnterForeground(_:)`. This method is called when your scene will take the stage. This could be when your app transitions from the background to the foreground, or if it’s just becoming active for the first time. 
    * `sceneDidBecomeActive(_:)`: Next, `sceneDidBecomeActive(_:)` is called. This is the point where your scene is set up, visible and ready to be used.
    * `sceneWillResignActive(_:)`: When your app goes to the background, sceneWillResignActive(_:) and sceneDidEnterBackground(_:) are called.
    * `sceneDidEnterBackground(_:)`: When your app goes to the background, sceneWillResignActive(_:) and sceneDidEnterBackground(_:) are called.
    * `sceneDidDisconnect(_:)`: Whenever your scene is sent to the background, iOS might decide to disconnect and clear out your scene to free up resources. This does not mean your app was killed or isn’t running anymore, it simply means that the scene passed to this method is not active anymore and will disconnect from its session. Note that the session itself is not necessarily discarded too, iOS might decide to reconnect a scene to a scene session at any time, for instance when a user brings a particular scene to the foreground again. The most important thing to do in `sceneDidDisconnect(_:)` is to discard any resources that you don’t need to keep around. This could be data that is easily loaded from disk or the network or other data that you can recreate easily. It’s also important to make sure you retain any data that can’t be easily recreated, like for instance any input the user provided in a scene that they would expect to still be there when they return to a scene.

    State restoration (a la `NSUserActivity`): State restoration starts when your scene gets disconnected and sceneDidDisconnect(_:) is called. At this point, it's important that your application already has a state set up that can be restored later. The best way to do this is to use NSUserActivity in your application. If you’re using NSUserActivity to support Handoff, Siri Shortcuts, Spotlight indexing and more, you don’t have a lot of extra work to do. If you don’t use NSUserActivity yet, don’t worry. A simple user activity might look a bit as follows:

            let activity = NSUserActivity(activityType: "com.donnywals.DocumentEdit")
            activity.userInfo = ["documentId": document.id]

    Note that this user activity is not structured how Apple recommends it, it’s a very bare example intended to illustrate state restoration. For a complete guide on NSUserActivity, I recommend that you take a look at Apple’s documentation on this topic.

    When the time comes for you to provide a user activity that can be restored at a later time, the system calls stateRestorationActivity(for:) method on your SceneDelegate. Note that this method is not part of the default template

            func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
                return scene.userActivity
            }

    Doing this associates the currently active user activity for a scene with the scene session. Remember that whenever a scene is disconnected, the UISceneSession that owns the UIScene is not discarded to allow the session to reconnect to a scene. When this happens, scene(_:willConnectTo:options:) is called again. In this method, you have access to the UISceneSession that owns the UIScene so you can read the session’s stateRestorationActivity and restore the application state as needed:

            if let activity = session.stateRestorationActivity,
                activity.activityType == "com.donnywals.DocumentEdit",
                let documentId = activity.userInfo["documentId"] as? String {

                // find document by ID
                // create document viewcontroller and present it
            }

    Of course, the fine details of this code will vary based on your application, but the general idea should be clear.

    If your UISceneSession is expected to handle a URL, you can inspect the connectionOptions object’s urlContexts to find URLs that your scene should open and information about how your application should do this:

            for urlContext in connectionOptions.urlContexts {
                let url = urlContext.url
                let options = urlContext.options

                // handle url and options as needed
            }

    The options object will contain information about whether your scene should open the URL in place, what application requested this URL to be opened and other metadata about the request.

    The basics of state restoration in iOS 13 with the SceneDelegate are surprisingly straightforward, especially since it's built upon NSUserActivity which means that a lot of applications won’t have to do too much work to begin supporting state restoration for their scenes.

    Keep in mind that if you want to have support for multiple scenes for your app on iPadOS, scene restoration is especially important since iOS might disconnect and reconnect your scenes when they switch from the foreground to the background and back again. Especially if your application allows a user to create or manipulate objects in a scene, a user would not expect their work to be gone if they move a scene to the background for a moment.

## UIView
A view forms root of view hierarchy; object instance lifetime isn't quite 1:1 with widget (screen) lifetime.

Views form a hierarchy; every view has a parent view, rooted to a UIWindow (which is the root view to the OS).

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

## UIViewController
A view controller isn't an interface object (view), but it manages one; this view is its "main view".

Use view controllers to manage your UIKit app’s interface. A view controller manages a single root view, which may itself contain any number of subviews. User interactions with that view hierarchy are handled by your view controller, which coordinates with other objects of your app as needed. Every app has at least one view controller whose content fills the main window. If your app has more content than can fit onscreen at once, use multiple view controllers to manage different parts of that content.

A *container view controller* embeds the content of other view controllers into its own root view. A container view controller may mix custom views with the contents of its child view controllers to facilitate navigation or to create unique interfaces. For example, a UINavigationController object manages a navigation bar and a stack of child view controllers (only one of which is visible at a time), and provides an API to add and remove child view controllers from the stack.

You change your app's interface by presenting and dismissing view controllers. Every window has a root view controller, which provides the initial content for your window. Presenting a new view controller changes that content by installing a new set of views in the window. When you no longer need the view controller, dismissing it removes its views from the window. You present view controllers in one of several ways:

* **Configure presentations visually in your storyboard.** Using segues in your storyboard is the recommended way to present and dismiss view controllers. A segue is a visual representation of a transition from one view controller to another. A segue starts with an action such as a button tap or table-row selection in the initial view controller. When that action occurs, UIKit creates the view controller at the other end of the segue and presents it automatically. Because you create and configure segues in your storyboard, you can change them very quickly.

    Start a segue from any object that implements an action method, such as a control or gesture recognizer. You may also start segues from table rows and collection view cells.

    * Right-click the control or object in your current view controller.

    * Drag the cursor to the view controller you want to present.

    * Select the kind of segue you want from the list that Xcode provides.

    The storyboard shows segues as an arrow between two view controllers. Selecting the segue displays information about it, including the kind of presentation you want UIK to perform. You can modify the presentation type or configure additional details, such as a segue identifier. You use this information at runtime to customize the segue further, as described in [Customizing the Behavior of Segue-Based Presentations](https://developer.apple.com/documentation/uikit/resource_management/customizing_the_behavior_of_segue-based_presentations).

    For information about how to dismiss a view controller in your storyboards, see [Dismissing a View Controller with an Unwind Segue](https://developer.apple.com/documentation/uikit/resource_management/dismissing_a_view_controller_with_an_unwind_segue).

* **Let the current context define the presentation technique.** Reusing the same view controller in multiple places creates a potential problem: presenting it in different ways based on the current context. For example, you might want to embed it in a navigation controller in one instance, but present it modally in another. UIKit solves this problem with the `show(_:sender:)` and `showDetailViewController(_:sender:)` methods of UIViewController, which present the view controller in the most appropriate way for the current context.

    When you call the `show(_:sender:)` or `showDetailViewController(_:sender:)` method, UIKit determines the most appropriate context for the presentation. Specifically, it calls the `targetViewController(forAction:sender:)` method to search for a parent view controller that implements the corresponding show method. If a parent implements the method and wants to handle the presentation, UIKit calls the parent's implementation. A UINavigationController object's implementation of the `show(_:sender:)` method pushes the new view controller onto its navigation stack. If no view controller handles the presentation, UIKit presents the view controller modally.

    The following code example creates a view controller and shows it using the `show(_:sender:)` method. The code is equivalent to creating a segue with the kind set to Show.

          @IBAction func showSecondViewController() {
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController")

              show(secondVC, sender: self)
          }

    After showing a view controller, use the current context to determine how to dismiss it. Calling the `dismiss(animated:completion:)` method might not always be the most appropriate option. For example, don't call that method if a navigation controller added the view controller to its navigation stack. Instead, use the presentingViewController, splitViewController, navigationController, and tabBarController properties to determine the current context, and to take appropriate actions in response. That response might also include modifying your view controller's UI to hide a Done button or other controls for dismissing the UI.

    When implementing a custom container view controller, implement the `show(_:sender:)` and `showDetailViewController(_:sender:)` methods to handle presentations. For more information, see Creating a Custom Container View Controller.

* **Embed them in a container view controller.** A container view controller embeds content from one or more child view controllers, and presents the combined interface onscreen. Embedding a child view controller presents it using a container-specific approach. For example, a navigation controller initially positions the child view controller offscreen and then animates it into position onscreen.

    The standard UIKit container view controllers work with segues and the `show(_:sender:)` and `showDetailViewController(_:sender:)` methods to embed view controllers as children. They also define additional API for adding and removing child view controllers programmatically. Use segues and the show methods to handle most transitions. Use the methods in the following table to perform one-time configuration of your view controller, for example when restoring your app's UI to a previous state.

    Container | Presentation options
    --------- | --------------------
    UISplitViewController | Replace the two initial view controllers using the viewControllers property. The first (primary) view controller appears in the leading pane and the second (detail) view controller appears in the trailing pane.
    UINavigationController | Replace the contents of the navigation stack using the viewControllers property. Add or remove a subset of view controllers simultaneously using the setViewControllers(_:animated:) method.
    UITabBarController | Replace the initial tabs using the viewControllers property. Change the current tabs dynamically using the setViewControllers(_:animated:) method.
    UIPageViewController | Provide all child view controllers using a UIPageViewControllerDataSource object.

    Always use the container view controller's API to remove or replace a presented view controller. 

* **Present a View Controller modally.** Use modal presentations to create temporary interruptions in your app's workflow, such as prompting the user for important information. A modal presentation covers the current view controller wholly or partially, depending on the presentation style you use. Full-screen presentations always replace the previous content, but sheet-style presentations may leave some of the underlying content visible. The actual appearance of each presentation style depends on the current trait environment.

    To configure a modal presentation, create the new view controller and call the present(_:animated:completion:) method. That method animates the new view controller into position using the UIModalPresentationStyle.automatic style and the UIModalTransitionStyle.coverVertical transition animation. To change the styles, modify the modalPresentationStyle and modalTransitionStyle properties of the view controller you present. The following code example changes both of these styles to create a full-screen presentation using a cross-dissolve animation.

        @IBAction func presentSecondViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController")
            
            secondVC.modalPresentationStyle = .fullScreen
            secondVC.modalTransitionStyle = .crossDissolve
            
            present(secondVC, animated: true, completion: nil)
        }
    
    To dismiss a modally presented view controller, call the view controller's dismiss(animated:completion:) method.

* Call methods of UIViewController directly.

Each technique gives you different amounts of control over the presentation and dismissal process.

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

### Connections

Directional linking in the nib editor from one object (source) to another (destination). Two kinds:

* **Outlet connections.** Has a name, which is matched against the destination's instance property of the same name. "In code, there must be an instance property in the class whose instance will act as owner when the nib loads; it must be marked as `@IBOutlet`. In the nib editor, the class of the nib owner object must be set to the class whose instance will act as owner when the nib loads. We must then create the outlet, with the same name as the property, from the nib owner to some nib object."

* **Action connections.** A message-sending reference. An action is a message emitted by a Cocoa UIControl object to another object (the destination); aka an event. Control object must know three things: control event, action (what message to send), target (destination). 
  Actions can be "nil-targeted", where the target is nil; there is no designated target object, so instead: starting with the hit-test view (the view with which the user is interacting, presumably the top of the Z-order), Cocoa walks up the responder chain looking for an object that can respond to the action message:
    * If a responder is found that handles this message, that method is called on that responder, and that's the end.
    * If we get all the way to the top of the responder chain without finding a responder to handle this message, nothing happens; the message goes unhandled with no error/exception.
  How do we do this in a nib? Form a connection to the First Responder proxy object in the dock--that's what it's for. Before you can connect an action to it, you have to define the action message within the First Responder proxy object: Select the First Responder proxy in the nib, and switch to the Attributes inspector. Click the Plus button in the table (probably empty) of user-defined nil-targeted First Responder actions, and give the new action a name; it must take a single parameter (so that its name will end with a colon). Now we can Control-drag from a control to the First Responder proxy to specify a nil-targeted action with the name specified in the table.

## Communication between objects
Organizational considerations to help arrange for coherent communication between objects. Almost all of them require First to have an active reference to second in some form.

* Visibility through instantiation. (First instantiates the second, passing it the message/data in via property or method.)
* Visibility through connection/reference. Segues do this: At the moment a segue is triggered, the source view controller already exists, and the segue knows what view controller it is, and the segue itself instantiates the destination view controller, so the segue immediately turns to the source view controller and hands it a reference to the destination view controller (for example, by calling the source view controller's `prepare(for:sender:)` method). This is the source view controller's chance to obtain a reference to the newly-instantiated destination view controller and provide necessary data, references, delegation, whatever.
* Visibility through segue subclassing. (Investigate)
* Visibility through a priori known reference. (Singletons)
* Visibility through discovered reference. (navigating the view or view controller hierarchy)

---

## Misc

#### [Adding support for multiple windows to iPadOS app](https://www.donnywals.com/adding-support-for-multiple-windows-to-your-ipados-app/)

(TODO: This is pretty complicated)

#### Dismissing the keyboard
From [Dismissing the keyboard in SwiftUI](https://www.dabblingbadger.com/blog/2020/11/5/dismissing-the-keyboard-in-swiftui)

In UIKit, views that utilize the keyboard such as UITextField and UITextView can be dismissed by calling resignFirstResponder on the view itself, or endEditing on one of its parent views.  Code in a simple view controller might look like this:

```
class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        dismissKeyboardFrom(view: textField)
    }

    @objc func dismissKeyboardFrom(view: UIView) {
        view.resignFirstResponder()
        // or view.endEditing()
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
```

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

---

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

---

## Nib/Storyboard/SwiftUI Alternatives

[Layout](https://github.com/nicklockwood/layout): A declarative UI framework for iOS

