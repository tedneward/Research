title=Android
tags=platform, android, mobile
summary=The Android mobile platform.
~~~~~~

[Website](https://developer.android.com/) | [Docs](https://developer.android.com/docs) | [Jetpack](../jetpack) | [Testing](../testing) | [Security](../security) | [Performance](../performance)

## Guides

[App fundamentals](https://developer.android.com/guide/components/fundamentals): Four different types of app components (activities, services, broadcast receivers, content providers), three of which activated by intents. Application components declared in an application manifest. Apps also contain resources.

App resources: [Overview](https://developer.android.com/guide/topics/resources/providing-resources) discusses the different kinds of resources, the use of project file structure (`res/` directory and subdirectories) to group them, and the convention-based approach to providing alternative resources depending on the device hardware. Accessing resources via code or referencing them from the various XML files. If access to the original files is necessary, store them as "assets" (in `assets/`) instead of as "resources". Describes how Android finds the best resource match. [Handle configuration changes](https://developer.android.com/guide/topics/resources/runtime-changes) describes how Android handles device/hardware configuration changes (such as screen orientation) by either retaining an object (in which state is stored) or by handling the configuration change manually. [Localize your app](https://developer.android.com/guide/topics/resources/localization) is the first guide in the Localization section ([Test your app with pseudolocales](https://developer.android.com/guide/topics/resources/pseudolocales), [Unicode and internationalization support](https://developer.android.com/guide/topics/resources/internationalization), and [Language and local resolution](https://developer.android.com/guide/topics/resources/multilingual-support) are the rest); in essence, it's more about resource management again. [Complex XML resources](https://developer.android.com/guide/topics/resources/complex-xml-resources) describes a means by which multiple related XML resources can be collected into one file via AAPT. [Resource types](https://developer.android.com/guide/topics/resources/available-resources) lists out the different resource types available in Android: [Animation](https://developer.android.com/guide/topics/resources/animation-resource), [Color state list](https://developer.android.com/guide/topics/resources/color-list-resource) for changes based on View state, [Drawable](https://developer.android.com/guide/topics/resources/drawable-resource) resources like graphics, [Layout](https://developer.android.com/guide/topics/resources/layout-resource) resources for UI, [Menu](https://developer.android.com/guide/topics/resources/menu-resource)s, [String](https://developer.android.com/guide/topics/resources/string-resource)s, [Style](https://developer.android.com/guide/topics/resources/style-resource)s, [Font](https://developer.android.com/guide/topics/resources/font-resource)s, and [more](https://developer.android.com/guide/topics/resources/more-resources) (booleans, colors, dimensions, IDs, integers, int arrays, and typed arrays).

[App manifest](https://developer.android.com/guide/topics/manifest/manifest-intro), which includes links as a reference to each of the XML elements in the manifest file format.

[App architecture](https://developer.android.com/topic/architecture): Kicks off the Android app architecture section:

* A [guide](https://developer.android.com/jetpack/guide) to app architecture, which is broken out into the [UI layer](https://developer.android.com/jetpack/guide/ui-layer) and [events](https://developer.android.com/jetpack/guide/ui-layer/events), the [domain layer](https://developer.android.com/jetpack/guide/domain-layer), and the [data layer](https://developer.android.com/jetpack/guide/data-layer).
* A collection of architectural components:

    * UI layer libraries:
    
        * [View binding](https://developer.android.com/topic/libraries/view-binding) for binding controls to object references inside the Activity, based on doing some codegen during compilation.
        * [Data binding](https://developer.android.com/topic/libraries/data-binding) binds UI components directly to data sources. [Get started](https://developer.android.com/topic/libraries/data-binding/start), use [layouts and binding expressions](https://developer.android.com/topic/libraries/data-binding/expressions) to write expressions that connect variables to the views in the layout, [work with observable data objects](https://developer.android.com/topic/libraries/data-binding/observability), use and customize [generated binding classes](https://developer.android.com/topic/libraries/data-binding/generated-binding), work with [binding adapters](https://developer.android.com/topic/libraries/data-binding/binding-adapters), [bind layout views to architectural components](https://developer.android.com/topic/libraries/data-binding/architecture), and/or use [two-way data binding](https://developer.android.com/topic/libraries/data-binding/two-way).
        * Lifecycle-aware components: [Handle lifecycles](https://developer.android.com/topic/libraries/architecture/lifecycle) more easily through components, build [ViewModel](https://developer.android.com/topic/libraries/architecture/viewmodel) classes designed to store and manage UI-related data in a lifecycle conscious way such as to allow data to survive configuration changes such as screen rotations, use [LiveData](https://developer.android.com/topic/libraries/architecture/livedata) (an observable data holder class) which is lifecycle-aware (meaning it respects the lifecycle of other app components, ensuring LiveData only updates app component observers that are in an active lifecycle state), [save state](https://developer.android.com/topic/libraries/architecture/saving-states) discusses preserving and restoring state during the lifecycle (which also has some discussion around [ViewModel state preservation](https://developer.android.com/topic/libraries/architecture/viewmodel-savedstate)); [Kotlin coroutines](https://developer.android.com/topic/libraries/architecture/coroutines) play a part here too (though I'm not 100% sure why or how just yet).
        * [Paging (v3) library](https://developer.android.com/topic/libraries/architecture/paging/v3-overview) describes how to load and display pages of data from a larger dataset from local storage or over network. There's also an older (v2) library that seems deprecated.
        * [Slices](https://developer.android.com/guide/slices): UI templates that can display rich, dynamic, and interactive content from your app from within the Google Search app and also in other places like the Google Assistant. Slices can help users perform tasks faster by enabling engagement outside of the fullscreen app experience. [Getting Started](https://developer.android.com/guide/slices/getting-started) and [Slice templates](https://developer.android.com/guide/slices/templates).

    * Data layer libraries:

        * (Jetpack) [DataStore](https://developer.android.com/topic/libraries/architecture/datastore): a data storage solution that allows you to store key-value pairs or typed objects with protocol buffers. DataStore uses Kotlin coroutines and Flow to store data asynchronously, consistently, and transactionally. If you're currently using SharedPreferences to store data, consider migrating to DataStore instead.
        * (Jetpack) [WorkManager](https://developer.android.com/topic/libraries/architecture/workmanager): an API that makes it easy to schedule reliable, asynchronous tasks that are expected to run even if the app exits or the device restarts. The WorkManager API is a suitable and recommended replacement for all previous Android background scheduling APIs, including FirebaseJobDispatcher, GcmNetworkManager, and Job Scheduler.

[App actions](https://developers.google.com/actions/app/): Voice-enabled actions on an Android device.

[On-device search](https://developer.android.com/guide/topics/search/appsearch) enables the device to search documents stored in the search database, even when offline.

[Handle mixed connectivity](https://developer.android.com/docs/quality-guidelines/build-for-billions/connectivity): Store data, queue requests, handle images properly for offline/slow connections.

[Build for device range](https://developer.android.com/docs/quality-guidelines/build-for-billions/device-capacity): Lower app memory footprint, build for a range of device capabilities

[Provide data controls](https://developer.android.com/docs/quality-guidelines/build-for-billions/data-cost): Give users control over app's data, reduce app's size, be mindful of consumption

[Use battery efficiently](https://developer.android.com/docs/quality-guidelines/build-for-billions/battery-consumption)

[Privacy](https://developer.android.com/privacy/best-practices): Pay attention to permissions; minimize use of location; handle data safely; use resettable identifiers

[Accessibility](https://developer.android.com/guide/topics/ui/accessibility): [Make apps more accessible](https://developer.android.com/guide/topics/ui/accessibility/apps), [Principles for improve app accessibility](https://developer.android.com/guide/topics/ui/accessibility/principles), [Testing app accessibility](https://developer.android.com/guide/topics/ui/accessibility/testing), [Making custom views more accessible](https://developer.android.com/guide/topics/ui/accessibility/custom-views), [Creating custom accessibility service](https://developer.android.com/guide/topics/ui/accessibility/service)

### Links, Libraries, etc

[Simplify](https://github.com/CalebFenton/simplify): Generic Android Deobfuscator: "Simplify virtually executes an app to understand its behavior and then tries to optimize the code so that it behaves identically but is easier for a human to understand. Each optimization type is simple and generic, so it doesn't matter what the specific type of obfuscation is used."

### Reading

* [Android Notes for Professionals](https://goalkicker.com/AndroidBook) - Compiled from StackOverflow Documentation (PDF)
* [Android Programming Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/android) ([PDF](https://www.syncfusion.com/Account/Logon?ReturnUrl=%2fresources%2ftechportal%2febooks%2fandroid), [Kindle](https://www.syncfusion.com/Account/Logon?ReturnUrl=%2fresources%2ftechportal%2febooks%2fandroid)) (email address *requested*, not required)
* [Android Tutorial](http://www.tutorialspoint.com/android) - Tutorials Point
* [Codelabs for Advanced Android Development](https://developer.android.com/courses/advanced-training/toc)
* [CodePath Android Cliffnotes](https://github.com/codepath/android_guides/wiki)
* [Expert Android and Eclipse development knowledge](http://www.vogella.com/tutorials/android.html)
* [Google Android Developer Training](https://developer.android.com/guide)
* [Styling Android](https://blog.stylingandroid.com)
* [The Busy Coder's Guide to Android Development](https://commonsware.com/Android/4-2-free) (PDF - older versions)

### Articles

* [Deploy Android Apps on Play Store Using GitHub Actions](https://yogeshpaliyal.com/posts/deploy-android-app-on-play-store-using-github-action/)

