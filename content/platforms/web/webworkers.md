title=Web Worker API
tags=platform, browser
summary=A background browser task that can be created via script, which can send messages back to its creator.
~~~~~~

[MDN Specification](https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API)

# Notes
- Creating a worker is done by calling the `Worker("path/to/worker/script")` constructor.
- Workers have no access to the page-specific objects/APIs (like `document`, etc)
- We can send data back and forth between the main application and our worker script. Calling the `postMessage()` function can send JSON, Strings, numbers, and/or arrays.

        //main.js
        worker.postMessage("hello world"); // Send this to the worker script.

        //worker.js
        postMessage("hi from worker"); // Send this back to the main script.

- We need to add event listeners to both sides to receive the messages above. We can either use onmessage or addEventListener.

        //worker.js
        self.addEventListener('message', function(e) {
        // Send the message back.
        self.postMessage('You said: ' + e.data);
        }, false);

  Note that we use self for the worker to give a global reference to web workers because it is not a window object.

  Event listener in the main script:

        //main.js
        let worker = new Worker('worker.js');
        worker.addEventListener('message', function(e) {
        // Log the workers message.
        console.log(e.data);
        }, false);

# MDN Reference: Functions and classes available to Web Workers

The following functions are available to workers:

- WorkerGlobalScope.atob()
- WorkerGlobalScope.btoa()
- WorkerGlobalScope.clearInterval()
- WorkerGlobalScope.clearTimeout()
- WorkerGlobalScope.createImageBitmap()
- WorkerGlobalScope.dump() Non-standard
- WorkerGlobalScope.fetch()
- WorkerGlobalScope.queueMicrotask()
- WorkerGlobalScope.reportError()
- WorkerGlobalScope.setInterval()
- WorkerGlobalScope.setTimeout()
- WorkerGlobalScope.structuredClone()
- DedicatedWorkerGlobalScope.postMessage() (dedicated workers only)
- DedicatedWorkerGlobalScope.requestAnimationFrame() (dedicated workers only)
- DedicatedWorkerGlobalScope.cancelAnimationFrame() (dedicated workers only)

The following functions are only available to workers:

- WorkerGlobalScope.importScripts()

The following Web APIs are available to workers:

- Background Fetch API
- Background Synchronization API
- Barcode Detection API
- Broadcast Channel API
- Canvas API
- Channel Messaging API
- Compression Streams API
- Compute Pressure API
- Console API
- Content Index API
- Cookie Store API (service workers only)
- CSS Font Loading API
- Encoding API
- Fetch API
- File API
- File System API
- Idle Detection API
- IndexedDB API
- Media Capabilities API
- Media Source Extensions API (dedicated workers only)
- Network Information API
- Notifications API
- Payment Handler API
- Performance API
- Permissions API
- Prioritized Task Scheduling API
- Push API
- Reporting API
- Server-Sent Events
- Service Worker API
- Streams API
- Trusted Types API
- URL API
- URL Pattern API
- User-Agent Client Hints API
- Web Crypto API
- Web Locks API
- Web Serial API
- Web Periodic Background Synchronization API
- WebCodecs API
- WebGL API
- WebGPU API
- WebHID API (dedicated and service workers only)
- WebUSB API
- WebSockets API
- XMLHttpRequest API

