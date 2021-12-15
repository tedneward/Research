title=Android Jetpack
tags=platform, mobile, android, library
summary=Collection of Kotlin-based libraries for making Android development easier/faster/etc.
~~~~~~

[Website](https://developer.android.com/jetpack) | [Fundamentals course](https://developer.android.com/courses/kotlin-android-fundamentals/overview)

Popular library list:

* activity: Access composable APIs built on top of Activity.
* appcompat: Allows access to new APIs on older API versions of the platform (many using Material Design).
* appsearch: Build custom in-app search capabilities for your users.
* camera: Build mobile camera apps.
* compose: Define your UI programmatically with composable functions that describe its shape and data dependencies.
* databinding: Bind UI components in your layouts to data sources in your app using a declarative format.
* fragment: Segment your app into multiple, independent screens that are hosted within an Activity.
* hilt: Extend the functionality of Dagger Hilt to enable dependency injection of certain classes from the androidx libraries.
* lifecycle: Build lifecycle-aware components that can adjust behavior based on the current lifecycle state of an activity or fragment.
* Material Design Components: Modular and customizable Material Design UI components for Android.
* navigation: Build and structure your in-app UI, handle deep links, and navigate between screens.
* paging: Load data in pages, and present it in a RecyclerView.
* room: Create, store, and manage persistent data backed by a SQLite database.
* test: Testing in Android.
* work: Schedule and execute deferrable, constraint-based background tasks.

Other libraries:

* ads: Get an advertising ID with or without Play Services.
* annotation: Expose metadata that helps tools and other developers understand your app's code.
* arch.core: Helper for other arch dependencies, including JUnit test rules that can be used with LiveData.
* asynclayoutinflater: Inflate layouts asynchronously to avoid jank in the UI.
* autofill: Improve autofill accuracy via extending hints.
* benchmark: Accurately measure your code's performance within Android Studio.
* biometric: Authenticate with biometrics or device credentials, and perform cryptographic operations.
* browser: Display webpages in the user's default browser.
* car-app: Build navigation, parking, and charging apps for Android Auto.
* cardview: Implement the Material Design card pattern with round corners and drop shadows.
* collection: Reduce the memory impact of existing and new collections that are small.
* compose.animation: Build animations in their Jetpack Compose applications to enrich the user experience.
* compose.compiler: Transform @Composable functions and enable optimizations with a Kotlin compiler plugin.
* compose.foundation: Write Jetpack Compose applications with ready to use building blocks and extend foundation to build your own design system pieces.
* compose.material: Build Jetpack Compose UIs with ready to use Material Design Components. This is the higher level entry point of Compose, designed to provide components that match those described at www.material.io.
* compose.material3: Build Jetpack Compose UIs with Material Design 3 Components, the next evolution of Material Design. Material 3 includes updated theming and components and Material You personalization features like dynamic color, and is designed to be cohesive with the new Android 12 visual style and system UI.
* compose.runtime: Fundamental building blocks of Compose's programming model and state management, and core runtime for the Compose Compiler Plugin to target.
* compose.ui: Fundamental components of compose UI needed to interact with the device, including layout, drawing, and input.
* concurrent: Move tasks off the main thread with coroutines and take advantage of ListenableFuture.
* constraintlayout: Position and size widgets in a flexible way with relative positioning.
* contentpager: Load and page across ContentProvider data in a background thread.
* coordinatorlayout: Position top-level application widgets, such as AppBarLayout and FloatingActionButton.
* core: Target the latest platform features and APIs while also supporting older devices.
* cursoradapter: Expose Cursor data to a ListView widget.
* customview: Implement custom views.
* datastore: Store data asynchronously, consistently, and transactionally, overcoming some of the drawbacks of SharedPreferences
* documentfile: View a file document.
* drawerlayout: Implement a Material Design drawer widget.
* dynamicanimation: Create smooth animations with a physics-based animation API.
* emoji: Display emoji in current and older devices.
* emoji2: Display emoji in current and older devices.
* enterprise: Create enterprise-ready applications.
* exifinterface: Read and write image file EXIF tags.
* games: Use the Android Game SDK natively in your app to perform complex games tasks, like Frame Pacing.
* gridlayout: Implement a grid layout.
* health: Create performant health applications in a platform agnostic way.
* heifwriter: Encode an image or image collection in HEIF format using the available codecs on the Android device.
* interpolator: Use animation interpolators on older platforms.
* jetifier: A standalone tool that migrates a library's dependencies on the deprecated support library to equivalent AndroidX dependencies.
* leanback: Write apps for Android TV devices using dpad-friendly widgets and template fragments.
* legacy: This artifact and its classes are deprecated. Starting with Android 8, background check restrictions make this class no longer useful.
* loader: Load data for your UI that survives configuration changes.
* localbroadcastmanager: This artifact and its classes are deprecated. Use LiveData or reactive streams instead.
* media: Share media contents and controls with other apps. Superseded by media2.
* media2: Share media contents and controls with other apps.
* media3: Support libraries for media use cases.
* mediarouter: Enable media display and playback on remote receiver devices using a common user interface.
* multidex: Deploy applications with multiple dex files on pre-Android 5 devices.
* palette: Extract representative color palettes from images.
* percentlayout: This artifact and its classes are deprecated. Use ConstraintLayout and associated layouts instead.
* preference: Build interactive settings screens without needing to interact with device storage or manage the UI.
* print: Print photos, docs, and other graphics and images from your app.
* profileinstaller: Enables libraries to prepopulate ahead of time compilation traces to be read by ART.
* recommendation: Promote content to the Android TV Launcher home screen.
* recyclerview: Display large sets of data in your UI while minimizing memory usage.
* remotecallback: Create a wrapper that makes it easier for developers to provide a PendingIntent.
* resourceinspection: Surface the attributes of custom views in Android Studio’s Live Layout Inspector.
* savedstate: Write pluggable components that save the UI state when a process dies, and restore it when the process restarts.
* security: Safely manage keys and encrypt files and sharedpreferences.
* sharetarget: Provide backwards compatibility for using shortcuts as direct share targets.
* slice: Display templated UI elements outside your app.
* slidingpanelayout: Implement a sliding pane UI pattern.
* [startup](https://developer.android.com/topic/libraries/app-startup): Implement a straightforward, performant way to initialize components at app startup.
* sqlite: Work with local SQLite databases. If possible, use Room instead.
* swiperefreshlayout: Implement the swipe-to-refresh UI pattern.
* textclassifier: Identifies conversations, links, selections, and other similar constructs in text.
* tracing: Write trace events to the system trace buffer.
* transition: Animate motion in the UI with starting and ending layouts.
* tvprovider: Provide Android TV channels.
* vectordrawable: Render vector graphics.
* versionedparcelable: Provides a stable and compact binary serialization format that can be passed across processes or persisted safely.
* viewpager: Display Views or Fragments in a swipeable format. If possible, use viewpager2 instead.
* viewpager2: Display Views or Fragments in a swipeable format.
* wear: Create applications for Wear OS by Google smartwatches.
* wear.compose: Write Jetpack Compose applications for Wearable devices by providing functionality to support wearable specific devices, sizes, shapes and navigation gestures.
* wear.tiles: Create applications for Wear OS by Google smartwatches.
* wear.watchface: Create applications for Wear OS by Google smartwatches.
* webkit: Work with modern WebView APIs on Android 5 and above.
* window: Helps support different device form factors such as foldable devices.

Fundamentals course covers:

1. Android Studio and HelloWorld
2. Layouts (LinearLayout, ConstraintLayout), event-handling, changing View properties, data binding to avoid findViewById()
3. Fragments, navigation graph, navigation drawer and options menu, modifying the destination of the Back button (back stack manipulation), firing an Intent to launch a new Activity
4. Activity and fragment lifecycles, lifecycle library
5. Architecture components: ViewModel, LiveData objects, wiring ViewModel to LiveData directly so as to avoid putting code in the activity event handlers
6. Room (O/R-M)
7. RecyclerView
8. Network access, Glide library
9. Repository concept, WorkManager (background tasks)
10. Design: themes and styles, material design, accessibility

