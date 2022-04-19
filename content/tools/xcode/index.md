title=XCode (Development tool/platform)
tags=platform, ios
summary=Apple's IDE and tools for development on iOS and macOS.
~~~~~~

See also [xcodebuild](./xcodebuild), [Swift](../../languages/swift), [Objective-C](../../languages/objc)

## Tips and Tricks

Find a list of [useful tips here](https://xcode-tips.github.io).

## Xcode build process

- [Xcode Build Settings](https://xcodebuildsettings.com)

- [Xcode Build Process](https://www.objc.io/issues/6-build-tools/build-process/)

- [Build performance analysis for speeding up Xcode builds](https://www.avanderlee.com/optimization/analysing-build-performance-xcode/)

- [Xcode Build Time Optimization](https://www.onswiftwings.com/posts/build-time-optimization-part1/)

- [Xconfig: Simple Mac app to display build settings for the currently open Xcode projects](https://github.com/pfandrade/Xconfig)

- [Digging deeper into xcbuild: Rules and Tasks](https://asifmohd.github.io/ios/2021/03/11/xcbuild-debug-info.html)

- [New Build System Tricks](https://gist.github.com/ddunbar/2dda0e836c855ea96759d1d05f086d69), by Daniel Dunbar

## Automatically setting Xcode project build numbers

- [Automated Xcode version and build numbering via Git](https://mokacoding.com/blog/automatic-xcode-versioning-with-git/)

- [Setting Xcode build version to Git commit name](https://useyourloaf.com/blog/setting-xcode-build-version-to-git-commit-name/)

- [Setting iPhone Application Build Versions](https://useyourloaf.com/blog/setting-iphone-application-build-versions/)

## Static vs Dynamic libraries and frameworks

- [Static and Dynamic Libraries, by pewpewthespells](https://pewpewthespells.com/blog/static_and_dynamic_libraries.html)

- [It Looks Like You Are Trying to Use a Framework](https://www.bignerdranch.com/blog/it-looks-like-you-are-trying-to-use-a-framework/)

- [Basic Overview Of Static And Dynamic Frameworks On iOS](https://www.runtastic.com/blog/en/frameworks-ios/)

- [CocoaPods 1.9 Beta](http://blog.cocoapods.org/CocoaPods-1.9.0-beta/), `use_frameworks! :linkage => :static`

## Cross-platform frameworks in Xcode

* [Multiplatform, Single-scheme Xcode Projects](https://promisekit.org/news/2016/08/Multiplatform-Single-Scheme-Xcode-Projects/)
* [Xcode & cross-platform frameworks](http://ilya.puchka.me/xcode-cross-platform-frameworks/)

## Documentation Packages ("DocC")

XCode Developer Documentation: `Developer Tools/DocC`

Introduced (?) in XCode 13. DocC doc compiler converst Markdown-based text into "rich documentation" for Swift projects, accessible within XCode.

* Add a doc catalog to an existing project:
    * select project/package in Project Navigator
    * File > New > File > Documentation Catalog template. Place the doc catalog in the same folder as the source files for DocC to associate the catalog with the library.
    * "Root" markdown file is for the package-level documentation
* Source files use `///` comments (with Markdown tags embedded within them) to provide context documentation
* Product > Build Documentation generates the docs
* Docs appear in Window > Developer Documentation > Workspace Documentation (at the top)

`Developer Tools/DocC/Documentation Types/API Documentation` has more on the format of the Markdown