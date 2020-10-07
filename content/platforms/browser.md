title=Browsers (Web)
type=page
tags=platform, browser
status=published
summary=Standardized web browser programming.
~~~~~~

The Web browsers (Chrome, IE, Firefox, etc) form a platform in of themselves, given how much is targeted specifically to them. That said, there is a great deal of overlap between the browser ecosystem and the [NodeJS](nodejs.html) platform, owing to the ECMAScript-based nature of each.

## Web APIs
[MDN list](https://developer.mozilla.org/en-US/docs/Web/API):
* [Background tasks](https://developer.mozilla.org/en-US/docs/Web/API/Background_Tasks_API)
* [Bluetooth](https://developer.mozilla.org/en-US/docs/Web/API/Web_Bluetooth_API)
* [Broadcast Channel](https://developer.mozilla.org/en-US/docs/Web/API/Broadcast_Channel_API): broadcast messages across windows/frames/etc
* [Canvas](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API): a means for drawing 2D graphics via JavaScript and the HTML <canvas> element.
* [Console](https://developer.mozilla.org/en-US/docs/Web/API/Console_API): functionality to allow developers to perform debugging tasks, such as logging messages or the values of variables at set points in your code, or timing how long an operation takes to complete.
* [DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model)
* [Fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API): generalized replacement for XMLHttpRequest
* [Fullscreen](https://developer.mozilla.org/en-US/docs/Web/API/Fullscreen_API): adds methods to present a specific Element (and its descendants) in full-screen mode, and to exit full-screen mode once it is no longer needed.
* [Geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API)
* [HTML Drag and Drop](https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
* [IndexedDB](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API) and [here](/storage/indexeddb.html)
* [Intersection Observer](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API): provides a way to asynchronously observe changes in the intersection of a target element with an ancestor element or with a top-level document's viewport.
* [Navigation Timing](https://developer.mozilla.org/en-US/docs/Web/API/Navigation_timing_API): measure the performance of a web site.
* [Page Visibility](https://developer.mozilla.org/en-US/docs/Web/API/Page_Visibility_API): determine whether a page is actually visible to the user
* [Server Sent Events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events)
* [Service Workers](https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API)
* [Storage](https://developer.mozilla.org/en-US/docs/Web/API/Storage_API)
* [Storage Access](https://developer.mozilla.org/en-US/docs/Web/API/Storage_Access_API)
* [Touch Events](https://developer.mozilla.org/en-US/docs/Web/API/Touch_events)
* [URL](https://developer.mozilla.org/en-US/docs/Web/API/URL_API)
* [Web Notifications](https://developer.mozilla.org/en-US/docs/Web/API/Notifications_API)
* [Web Storage](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API)
* [Web Workers](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API)
* [WebGL](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API) (This should be its own page)
* [WebRTC](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) (This should be its own page)
* [Websockets API](https://developer.mozilla.org/en-US/docs/Web/API/Websockets_API) and [here](/distribution/websockets.html)

## Web workers
A background task that can be created via script, which can send messages back to its creator. Creating a worker is done by calling the Worker("path/to/worker/script") constructor.

[MDN](https://developer.mozilla.org/en-US/docs/Web/API/Worker)
