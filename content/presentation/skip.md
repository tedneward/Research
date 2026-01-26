title=Skip
tags=presentation, android, ios
summary=A technology for creating dual-platform apps in Swift that run on iOS and Android.
~~~~~~

[Website](https://skip.dev/) | [Source](https://github.com/skiptools/skip)

## Getting Started
Skip is installed and updated using the popular Homebrew package management tool, which can be installed from brew.sh ↗. Once Homebrew has been setup, install Skip by running the Terminal command:

    brew install skiptools/skip/skip

This will download and install the skip tool itself, along with the Android SDK and gradle build tool that is necessary for building and running the Android side of your apps.

You can ensure that the basic development prerequisites are satisfied by running:

    skip checkup

Create a new Skip app project with:

    skip create

You will be guided through a series of questions about the app you want to create. The first two are especially important:

* App or Library? The App option creates a single Swift and SwiftUI app that uses Skip’s Xcode plugin to automatically build for Android. The Library option creates a Swift library that you can use in a unified Skip app, or use as shared business logic in separate iOS and Android apps. Neither option prevents you from using a combination of Swift and Kotlin, SwiftUI and Compose in your final application.
* Skip Fuse or Skip Lite? Information about the different modes can be found in the Native and Transpiled Modes documentation. In this example, we create a Skip Fuse app, which uses the official Swift SDK for Android ↗.

If you’re new to Skip, we recommend starting your exploration with an App project. An example session for creating a hello-skip/HelloSkip project (which generates a project identical to the minimal Skip Fuse sample app ↗ or Skip Lite sample app ↗) might look like:

    $ skip create

    Welcome to Skip!

    Select type of project to create:
    1: App: mobile application for Android and iOS
    2: Library: library project with one or more modules
    Enter selection (default: App) [1..2] 1

    Select the mode of the project:
    1: Skip Fuse: natively compiled project
    2: Skip Lite: transpiled project
    Enter selection [1..2] 1

    Enter the project-name for the App: hello-skip

    Enter the CamelCase name of the App module: HelloSkip

    Optionally enter additional module names:

    Enter the app bundle identifier: com.example.HelloSkip

    Create a free open-source project? (y/n) [n]: n
    Initialize git repository for the project? (y/n) [n]: n
    Initialize a Fastlane configuration for the project? (y/n) [y]: y
    Pre-build the project? (y/n) [y]: y
    Install the Swift Android SDK? (y/n) [y]: y
    Open the Xcode project after initialization? (y/n) [y]: y

    [✓] Install Swift Android SDK (48.4s)
    [✓] Resolve dependencies (12.12s)
    [✓] Build hello-skip (53.35s)
    [✓] Check project schemes (6.12s)
    [✓] Archive iOS ipa (17.18s)
    [✓] Assemble HelloSkip-debug.ipa 1 MB
    [✓] Verifying HelloSkip-debug.ipa: 1 MB
    [✓] Assembling Android apk (78.91s)
    [✓] Verify HelloSkip-debug.apk: 80 MB
    [✓] Opening Xcode project (0.10s)
    [✓] Skip create succeeded in 168.63s

You can alternatively create a Skip project using the non-interactive skip init command, as described in the command line reference.

Once your app pre-builds and opens in Xcode, you are almost ready to go. One more step is needed, which is to create and launch an Android emulator (which is the Android equivalent of the iPhone Simulator and is used for local app development). The skip tool has a command to quickly install and configure an Android emulator for your project:

    skip android emulator create

    [✓] Configure Android SDK Manager (1.55s)
    [✓] Install platform-tools (0.77s)
    [✓] Install emulator (0.75s)
    [✓] Install platforms;android-34 (0.76s)
    [✓] Install system-images;android-34;google_apis;arm64-v8a (0.75s)
    [✓] Create emulator: emulator-34-medium_phone (0.76s)
    [✓] Create Android emulator succeeded in 5.35s

Once this command completes successfully, you will have an Android emulator installed, which you can launch and observe the logging output with:

    skip android emulator launch

Now you should be ready to launch your new app! In Xcode, ensure the “HelloSkip App” scheme is selected along with a simulator destination (e.g., “iPhone 17”), and then Run the scheme.

You may be prompted to “Trust and Enable” the Skip plugin, and then the project will build and launch simultaneously on both the iPhone Simulator and Android Emulator.
