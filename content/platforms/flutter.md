title=Flutter
tags=platform, native, mobile, ios, android, presentation, reactive, functional
summary=A functional/reactive cross-platform mobile framework.
~~~~~~

[Website](https://flutter.io) | [Github](https://github.com/flutter/flutter) ([Engine](https://github.com/flutter/engine)) | [Flutter Gallery](https://github.com/flutter/gallery)

[Flutter packages](https://pub.dev/) | [Flutter team "first-team" packages](https://github.com/flutter/packages)

### Examples
[Collection of applications and widgets](https://itsallwidgets.com/) | [Flutter catalog](https://github.com/X-Wei/flutter_catalog) | [Flutter by Example](https://flutterbyexample.com) | [Flutter Cookbook](https://flutter.dev/docs/cookbook) | [Flutter samples - Github](https://github.com/flutter/samples)

[inKino](https://github.com/roughike/inKino) An unofficial Finnkino client that shows movies and showtimes of Finnkino cinemas in Finland. It uses Redux, has a comprehensive set of tests, and shares 40% of its code between the Flutter app and the AngularDart web app.

[FlutterFlip](https://github.com/redbrogdon/flutterflip) A simple reversi clone built with Flutter. It showcases some implicit animations, a stream-based, reactive architecture, and a technique to move work off the UI thread and into an isolate.


### Articles -- Dialogs
["Manage your Flutter Dialogs with a Dialog Manager"](https://medium.com/flutter-community/manager-your-flutter-dialogs-with-a-dialog-manager-1e862529523a) | ["Quick and easy dialogs in Flutter with RfFlutter"](https://www.filledstacks.com/snippet/quick-and-easy-dialogs-in-flutter-with-rf-flutter/) | ["Making an Alert Dialog in Flutter"](https://medium.com/@suragch/making-an-alertdialog-in-flutter-544bc703f758) | 

## Curated list of of samples (from https://github.com/flutter/samples/blob/master/INDEX.md)
### How-to Collections

#### [Flutter Examples](https://github.com/nisrulz/flutter-examples) [![GitHub stars](https://img.shields.io/github/stars/nisrulz/flutter-examples.svg?style=social&label=Star)](https://github.com/nisrulz/flutter-examples) [![GitHub forks](https://img.shields.io/github/forks/nisrulz/flutter-examples.svg?style=social&label=Fork)](https://github.com/nisrulz/flutter-examples/fork)

A collection of single-topic examples from Nishant Srivastava. These include
everything from gradients to JSON to routing and more.

#### [Flutter Example Apps](https://github.com/iampawan/FlutterExampleApps) [![GitHub stars](https://img.shields.io/github/stars/iampawan/FlutterExampleApps.svg?style=social&label=Star)](https://github.com/iampawan/FlutterExampleApps) [![GitHub forks](https://img.shields.io/github/forks/iampawan/FlutterExampleApps.svg?style=social&label=Fork)](https://github.com/iampawan/FlutterExampleApps/fork)

Several dozen examples from Flutter GDE Pawan Kumar. These cover state
management, Firebase, UI design, and many other topics. Each one comes with a
YouTube video showing implementation.

#### [Flutter by Example](https://github.com/mjohnsullivan/flutter-by-example) [![GitHub stars](https://img.shields.io/github/stars/mjohnsullivan/flutter-by-example.svg?style=social&label=Star)](https://github.com/mjohnsullivan/flutter-by-example) [![GitHub forks](https://img.shields.io/github/forks/mjohnsullivan/flutter-by-example.svg?style=social&label=Fork)](https://github.com/mjohnsullivan/flutter-by-example/fork)

Twenty-odd samples detailing common tasks with Flutter: how to use text fields,
streams and StreamBuilders, and more.

#### [Flutter for web samples](web) _(Flutter team)_

A collection of Flutter samples structured as Flutter for web projects. You
can see them in action at https://flutter.github.io/samples.

### Architecture / networking / backend

#### [Flutter Architectural Samples](https://github.com/brianegan/flutter_architecture_samples) [![GitHub stars](https://img.shields.io/github/stars/brianegan/flutter_architecture_samples.svg?style=social&label=Star)](https://github.com/brianegan/flutter_architecture_samples) [![GitHub forks](https://img.shields.io/github/forks/brianegan/flutter_architecture_samples.svg?style=social&label=Fork)](https://github.com/brianegan/flutter_architecture_samples/fork)

Brian Egan's implementations of TodoMVC using a variety of state management and
architectural approaches. If you'd like to see how an app built with
`flutter-redux` is different from one using BLoC, this is a great place to
start.

#### [jsonexample](jsonexample) _(Flutter team)_

A simple app showing three different approaches to deserializing JSON:
hand-written constructors, `json_serializable`, and `built_value`.

#### [provider_counter](provider_counter) _(Flutter team)_

The simplest possible app (the counter) using `provider`
for state management. This was previously known as `scoped_model_counter`,
and used `scoped_model` for state management.

#### [provider_shopper](provider_shopper) _(Flutter team)_

A slightly more complex example of state management with `provider`.
This example demonstrates multiple `providers`, navigation between screens,
and some other advanced topics.

### UI

#### [Veggie Seasons](veggieseasons) _(Flutter team)_

[Available on the App Store!](https://itunes.apple.com/is/app/veggie-seasons/id1450855435)

Veggie Seasons is a published iOS app that displays seasonality, vitamin
content, and trivia for a bunch of different fruits and veggies. If you're
interested in learning how to use Flutter's
[Cupertino](https://flutter.dev/docs/development/ui/widgets/cupertino) package
to build interfaces for iOS, it's a great place to start.

#### [Flutter UI Kit](https://github.com/iampawan/Flutter-UI-Kit) [![GitHub stars](https://img.shields.io/github/stars/iampawan/Flutter-UI-Kit.svg?style=social&label=Star)](https://github.com/iampawan/Flutter-UI-Kit) [![GitHub forks](https://img.shields.io/github/forks/iampawan/Flutter-UI-Kit.svg?style=social&label=Fork)](https://github.com/iampawan/Flutter-UI-Kit/fork)
Another sample from Flutter GDE Pawan Kumar, this repo includes a variety of
polished UI examples.

#### [FlutterPlayground](https://github.com/ibhavikmakwana/FlutterPlayground) [![GitHub stars](https://img.shields.io/github/stars/ibhavikmakwana/FlutterPlayground.svg?style=social&label=Star)](https://github.com/ibhavikmakwana/FlutterPlayground) [![GitHub forks](https://img.shields.io/github/forks/ibhavikmakwana/FlutterPlayground.svg?style=social&label=Fork)](https://github.com/ibhavikmakwana/FlutterPlayground/fork)

A repo full of short, specific examples (with animated screenshots!) showing
commonly used widgets and how to put them to work.

#### [Platform Design](platform_design) _(Flutter team)_

An app designed to look great on both iOS and Android, this sample
shows how to add platform-specific design touches to an app
while reusing as much code as possible.

#### [Animation examples](animations) _(Flutter team)_

_currently in development_

A collection of animation examples. The app starts with basic concepts like
`AnimationController` and `Tween`, then progresses to transitions and
advanced demos.

### Maps

#### [Place tracker](place_tracker) _(Flutter team)_

A simple integration of the Google Maps plugin for Flutter, this app
shows how to add a map to the Flutter widget hierarchy, create markers,
and more.

#### [Flutter, maps, and Cloud Firestore](flutter_maps_firestore) _(Flutter team)_

This app shows the use of a Google map with data loaded from Cloud Firestore.
It was [built live on stage](https://www.youtube.com/watch?v=RpQLFAFqMlw) at
Cloud Next '19.
