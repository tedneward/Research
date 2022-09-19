title=iOS (Platform)
tags=platform, ios
summary=The Apple mobile device operating system (on top of the open-source Darwin kernel).
~~~~~~

See also [macOS](../macos)

- [Accessibility](../accessibility)
- [APIs + Design](../apis_design)
- [Debugging](../debugging)
- [Foundation](../foundation)
- [Launch](../launch)
- [Performance](../performance)
- [Threads, Queues, GCD](../threads_and_queues)
- [UI](../ui)

## General resources

- [iOS Dev Weekly](http://iosdevweekly.com)
- [objc.io](https://www.objc.io)
- [Mike Ash, Friday Q & A](https://www.mikeash.com/pyblog/)
- [Swift Unboxed](https://swiftunboxed.com)
- [iOS Dev Directory](https://iosdevdirectory.com)
- [Erica Sadun Github](https://github.com/erica): Author of many, many iOS books

## Guides

- [Apple Design Resources](https://developer.apple.com/design/resources/)
- [Apple Marketing Guidelines, Product Images, etc.](https://developer.apple.com/app-store/marketing/guidelines/)
- [App Screenshot Specs](https://help.apple.com/app-store-connect/#/devd274dd925)
- [App Preview Specs](https://help.apple.com/app-store-connect/#/dev4e413fcb8)
- [The Ultimate Guide To iPhone Resolutions](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)
- [The Wisdom of Quinn: Informative DevForum posts from everyone's favorite DTS member](https://gist.github.com/macshome/0753d3fdf711cfe699533fe5059e50e2)

## Books

* "iOS *N* Programming Fundamentals with Swift" (Matt Newburg, OReilly)
* [Cocoa Dev Central](http://cocoadevcentral.com)
* [iOS Developer Notes for Professionals](https://goalkicker.com/iOSBook/) - Compiled from StackOverflow Documentation (PDF)
* [iOS Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/ios) (PDF, Kindle) (email address *requested*, not required)
* [NSHipster](http://nshipster.com/#archive) (Resource)
* [Start Developing iOS Apps (Swift)](https://developer.apple.com/library/prerelease/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html) (HTML)
* [Start Developing iOS Apps Today (Objective-C) - Last updated 22.10.2013](http://everythingcomputerscience.com/books/RoadMapiOS.pdf) (PDF)



## Miscellaneous

#### Universal Links

[Preflight possible universal links before opening SFSafariController](https://recoursive.com/2019/02/22/preflight_universal_links/)

> Before you open a URL in SFSafariController or any other browser, you should check if it’s a universal link, 
> and if so, open it in the respective native app instead. 
> It’s a good way to improve the user experience since SFSafariController will not trigger universal links on open.

```swift
let url = URL(string: "https://youtu.be/k0kSc8hHzAM?t=1461")!
UIApplication.shared.open(url, options: [.universalLinksOnly: true]) { (success) in
    if !success {
        // not a universal link or app not installed
        let vc = SFSafariViewController(url: url)
        self.present(vc, animated: true)
    }
}
```

#### iOS App Subscriptions

* [Linking to Subscription Management Settings](https://joecieplinski.com/blog/2018/11/26/linking-to-subscription-management-settings/)

* [The Ultimate Guide to iOS Subscription Testing](https://www.revenuecat.com/blog/the-ultimate-guide-to-subscription-testing-on-ios)

#### iOS Simulator

- [Getting to Know the Simulator Better](https://www.andyibanez.com/posts/getting-to-know-the-simulator-better/): In this article, we will explore the Simulator features provided to us by Xcode and the `xcrun simctl` tool.

#### Push Notifications

- [How to test push notifications in simulator and production iOS apps](https://onmyway133.com/blog/how-to-test-push-notifications-in-simulator-and-production-ios-apps/)

#### [How expensive is `DateFormatter`?](https://sarunw.com/posts/how-expensive-is-dateformatter/)

> The key take away from all these stats are:
>
> 1. `DateFormatter` is expensive to create.
> 1. `DateFormatter` is expensive to change.
> 1. Subsequent use of `string(from: Date)` is cheap.
> 1. Subsequent use of `date(from: String)` **is not** cheap.

#### [Wrangling Time: A Brief Explainer/Rant About Date Math](https://harshil.net/blog/foundation-date)

> This is slightly misleading, though. Despite what the preview shows, `Date` has no concept of days, months, years, any of that stuff. It deals solely with time, and more specifically, the number of seconds that have passed since midnight of 1 January 2001, in UTC.
>
> [...]
>
> Here’s a screenshot from the Health app, showing my step counts for the day of June 8, 2017. It was a fairly active day, as I got in a bit over 20,000 steps. The distribution of those steps, though, feels a bit off. It reads like I was up walking all night, and then asleep throughout the day, and scrolling around a bit, that’s the story for the rest of the week too. I don’t remember spending the week that way.
>
> As it happens I was in San Jose attending WWDC at the time, which has a -12:30 time difference with India , and as a result all of my health data from that trip appears time-shifted.
>
> [...]
>
> Going back to how `Date` works, it doesn’t model the actual clock time but rather a fixed point in time that can be interpreted in any time zone. And so what’s happening here is that the data is being interpreted as if it happened in my current time zone, which is the default time zone that `Calendar` and `DateFormatter` use.
>
> And as such, a `Date` alone isn’t sufficient for modelling historical data, or at least personal historical data: You need time zone information too.

