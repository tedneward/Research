title=Android platform testing
tags=platform, mobile, android
summary=Links and notes on how to unit- (and other) test on Android.
~~~~~~

[Testing on Android](https://developer.android.com/training/testing) | [Testing app activities](https://developer.android.com/guide/components/activities/testing)

[Automate UI testing](https://developer.android.com/training/testing/ui-testing) - [single app](https://developer.android.com/training/testing/ui-testing/espresso-testing), [multiple apps](https://developer.android.com/training/testing/ui-testing/uiautomator-testing)

Building [local unit tests](https://developer.android.com/training/testing/unit-testing/local-unit-tests) (which run on the local JVM) and [instrumented unit tests](https://developer.android.com/training/testing/unit-testing/instrumented-unit-tests) (which run on the device)

[Espresso](https://developer.android.com/training/testing/espresso) UI unit test framework ([cheat sheet](https://android.github.io/android-test/downloads/espresso-cheat-sheet-2.1.0.pdf)):

* [Basics](https://developer.android.com/training/testing/espresso/basics); [setting up the project](https://developer.android.com/training/testing/set-up-project)
* [Working with lists](https://developer.android.com/training/testing/espresso/lists) (scrolling to an item or acting on one)
* [Working with intents](https://developer.android.com/training/testing/espresso/intents): enables validation and stubbing of intents sent out by the app under test
* [WebView UI testing](https://developer.android.com/training/testing/espresso/web)
* [Testing async UI-related operations](https://developer.android.com/training/testing/espresso/idling-resource)
* [Accessibility checking](https://developer.android.com/training/testing/espresso/accessibility-checking)
* [Recipes](https://developer.android.com/training/testing/espresso/recipes):
    * [Match a view next to another view](https://developer.android.com/training/testing/espresso/recipes#matching-view-next-to-view)
    * [Match a view inside an action bar](https://developer.android.com/training/testing/espresso/recipes#matching-view-inside-action-bar)
    * [Assert that a view is not displayed](https://developer.android.com/training/testing/espresso/recipes#asserting-view-not-displayed)
    * [Assert that a view is not present](https://developer.android.com/training/testing/espresso/recipes#asserting-view-not-present)
    * [Assert that a data item is not in an adapter](https://developer.android.com/training/testing/espresso/recipes#asserting-data-item-not-in-adapter)
    * [Use a custom failure handler](https://developer.android.com/training/testing/espresso/recipes#using-custom-failure-handler)
    * [Target non-default windows](https://developer.android.com/training/testing/espresso/recipes#targeting-non-default-windows)
    * [Match a header or footer in list views](https://developer.android.com/training/testing/espresso/recipes#matching-header-or-footer)

[UI Automator](https://developer.android.com/training/testing/ui-automator) is for black-box functional UI testing

[App Crawler](https://developer.android.com/training/testing/crawler): "Spider"-style execution of your app: "automatically issuing actions (tap, swipe, etc) ... terminates automatically when there are no more unique actions to perform, the app crashes, or a timeout you designate is reached"

[Testing app component integrations](https://developer.android.com/training/testing/integration-testing) | [Services](https://developer.android.com/training/testing/integration-testing/service-testing) | [Content providers](https://developer.android.com/training/testing/integration-testing/content-provider-testing)
