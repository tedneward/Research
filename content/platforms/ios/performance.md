title=iOS Performance
tags=platform, ios
summary=Performance and tuning the Apple mobile device operating system (on top of the open-source Darwin kernel).
~~~~~~

## UI performance

- [Measuring iOS scroll performance](http://thisiskyle.me/posts/measuring-ios-scroll-performance-is-tough-use-this-to-make-it-simple-and-automated.html)

- [iOS Performance tips you probably didn't know (from an ex-Apple engineer)](https://www.fadel.io/blog/posts/ios-performance-tips-you-probably-didnt-know/)

> 1. `UILabel` costs more than what you think
> 1. Always start with serial queues, and only use concurrent queues as a last resort
> 1. Avoid using `dispatch_semaphore_t` to wait for asynchronous work
> 1. Don’t use UIView tags

## Launch Time

- [Apple Docs: Reducing Your App's Launch Time](https://developer.apple.com/documentation/xcode/improving_your_app_s_performance/reducing_your_app_s_launch_time)
- [WWDC 2019: Optimizing App Launch](https://developer.apple.com/videos/play/wwdc2019/423/)
- [Testing App Launch Time](https://useyourloaf.com/blog/testing-app-launch-time/)
- [iOS App Launch time analysis and optimizations](https://medium.com/globant-mobile-studio-india/ios-app-launch-time-analysis-and-optimization-a219ee81447c)
- [Improving Your iOS App’s Launch Time](https://techblog.izotope.com/2018/03/08/improving-your-ios-apps-launch-time/)

## Startup Time

- [WWDC 2016: Optimizing App Startup Time](https://developer.apple.com/videos/play/wwdc2016/406/)
- [WWDC 2017: App Startup Time: Past, Present, and Future](https://developer.apple.com/videos/play/wwdc2017/413)
- [Slow App Startup Times](https://useyourloaf.com/blog/slow-app-startup-times/)
- [How to accurately measure iOS App startup time](https://programmer.group/how-to-accurately-measure-ios-app-startup-time.html)
