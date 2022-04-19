title=iOS (OS) App launch process
tags=platform, ios
summary=The process that takes place when launching an iOS app.
~~~~~~

1. Entry point
    * iOS finds the compiled binary inside the app's bundle via the Info.plist file, "Executable file" key (`CFBundleExecutable`); by default this comes from the `EXECUTABLE_NAME` environment variable
    * Obj-C entry point is `main`, written by the developer
        ```
        int main(int argc, char* argv[]) {
            @autoreleasepool {
                return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
            }
        }
        ```
    * Swift entry point; entry point is auto-generated, calling UIApplicationMain using class annotated by `@main` as the class to pass in as the fourth argument.
        * If we want to control that, create a `main.swift` (name is important, it gets special dispensation from the compiler to have top-level statements/expressions), and do the same as above:
            ```
            import UIKit
            UIApplicationMain(
                CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(AppDelegate.self)
            )
            ```
        * In Swift 5.3/XCode 12, we can also `@main` a type and give it a static `main()` function:
            ```
            @main
            struct Program {
                static func main() -> Void {
                    UIApplicationMain(
                        CommandLine.argc, CommandLine.unsafeArgv, nil, 
                            NSStringFromClass(AppDelegate.self)
                    )
                }
            }
            ```
2. UIApplicationMain (assuming the app supports scenes (Info.plist contains an "Application Scene Manifest" dictionary and the code has classes and protocols whose names begin with `UIScene`) and the app has a main storyboard):
    1. ... creates the shared application instance and binds it to `UIApplication.shared`
    2. ... creates the application instance's delegate
    3. ... invokes the app delegate's `application(_:didFinishLaunchingWithOptions:).`
    4. ... creates a UISceneSession, a UIWindowScene, and the app's scene delegate (Info.plist)
    5. ... loads the storyboard to find the initial view controller (storyboard entry point) and instantiates it
    6. ... creates the app's window; assigns it to the scene delegate's `window` property; assigns the initial view controller to the window instance's `rootViewController` property. This view controller is now the app's root view controller.
    7. ... calls the scene delegate's `scene(_:willConnectTo:options:)`
    8. ... calls the UIWindow's `makeKeyAndVisible` to make the window visible. This causes the window to turn to the root view controller and tell it to obtain its main view (from a nib or nib inside a storyboard, typically) and then call its `viewDidLoad` method.

3. Enter the event loop

### App without a storyboard
Create new Xcode project ("TrulyEmpty").
1. Edit the target: In the General pane, select "Main" in the Main Interface field and delete it. (Press Tab to set the change)
2. Info.plist: select "Storyboard Name" in "Application Scene Configuration" dictionary and delete it.
3. (Delete Main.storyboard file from the project--it will be ignored regardless if present.)
4. `SceneDelegate.swift`: edit `scene(_:willConnectTo:options:)` to look like:
    ```
    func scene(_ scene: UIScene,
                willConnectTo session: UISceneSession
                options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.backgroundColor = .white
            window.rootViewController = ViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    ```

TODO: Create an app where there's a main storyboard but sometimes is ignored at launch time (step 4 above), such as displaying a login screen.

TODO: How does the splash screen storyboard play into this?
