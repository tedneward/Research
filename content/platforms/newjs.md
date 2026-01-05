title=NWJS (previously known as node-webkit)
tags=platform, presentation, browser, native, windows, macos, linux
summary=Call all Node.js modules directly from DOM and enables a new way of writing applications with all Web technologies.
~~~~~~

[Website](https://nwjs.io/) | [Source](https://github.com/nwjs/nw.js)

## Getting Started

NW.js is based on [Chromium](http://www.chromium.org) and [Node.js](http://nodejs.org/). It lets you call Node.js code and modules directly from browser and also use Web technologies in your app. Further, you can easily package a web application to a native application.

### Get NW.js

You can get the latest binaries from official website http://nwjs.io.

### Write NW.js App

#### Example 1 - Hello World

This the basic example shows how to write an NW.js app.

**Step 1.** Create `package.json`:

```json
{
  "name": "helloworld",
  "main": "index.html"
}
```

`package.json` is the manifest file in your app. It is written in [JSON format](http://www.json.org/). The `main` field figures out the first page opened by the NW.js, i.e. `"index.html"` in this example. And the `name` field is the unique name used among NW.js apps. See [Manifest Format](../References/Manifest Format.md) for more details.

**Step 2.** Create `index.html`:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Hello World!</title>
  </head>
  <body>
    <h1>Hello World!</h1>
  </body>
</html>
```

This is the normal HTML file. You can use any web technologies supported by latest browsers.

!!! note "Chromium Specific Features"
    NW.js is based on Chromium, which also enables you to use Chrome specific features. Such as [File System API](https://developer.mozilla.org/en-US/docs/Web/API/File_System_API), experimental CSS styles with `-webkit-` prefix. **Be careful with these non-standard features since they may be deprecated shortly.**

**Step 3.** Run your app

```bash
cd /path/to/your/app
/path/to/nw .
```

`/path/to/nw` is the binary file of NW.js. On Windows, it's `nw.exe`; On Linux, it's `nw`; On Mac, it's `nwjs.app/Contents/MacOS/nwjs`.

!!! tip "Drag &amp; Drop on Windows"
    On Windows, you can drag the `folder containing package.json` to `nw.exe` to run your app.

#### Example 2 - Using NW.js APIs

All NW.js APIs are loaded in `nw` object globally and can be used directly in JavaScript files.

This example shows how to create a native context menu in your NW.js app. You can create `index.html` with following content:
```html
<!DOCTYPE html>
<html>
<head>
  <title>Context Menu</title>
</head>
<body style="width: 100%; height: 100%;">

<p>'Right click' to show context menu.</p>

<script>
// Create an empty context menu
var menu = new nw.Menu();

// Add some items with label
menu.append(new nw.MenuItem({
  label: 'Item A',
  click: function(){
    alert('You have clicked at "Item A"');
  }
}));
menu.append(new nw.MenuItem({ label: 'Item B' }));
menu.append(new nw.MenuItem({ type: 'separator' }));
menu.append(new nw.MenuItem({ label: 'Item C' }));

// Hooks the "contextmenu" event
document.body.addEventListener('contextmenu', function(ev) {
  // Prevent showing default context menu
  ev.preventDefault();
  // Popup the native context menu at place you click
  menu.popup(ev.x, ev.y);

  return false;
}, false);

</script>  
</body>
</html>
```

... then run your app:
```bash
cd /path/to/your/app
/path/to/nw .
```

!!! tip "require('nw.gui')"
    The legacy way of loading NW.js APIs using `require('nw.gui')` is also supported. It returns the same `nw` object.

#### Example 3 - Using Node.js API

You can call node.js and modules directly from the DOM. So it enables endless possibilities for writing apps with nw.js.

This example shows how to query the OS platform with `os` module of Node.js. Simply create the `index.html` file with following content and run it with NW.js.

```html
<!DOCTYPE html>
<html>
<head>
  <title>My OS Platform</title>
</head>
<body>
<script>
// get the system platform using node.js
var os = require('os');
document.write('You are running on ', os.platform());
</script>
</body>
</html>
```

You could also use the modules installed by [`npm`](https://www.npmjs.com/) with NW.js.

!!! note "Native Node Modules"
    Native Node modules, built when running `npm install`, are not compatible with NW.js ABI. To use them, you have to rebuild it from source code with [`nw-gyp`](https://github.com/nwjs/nw-gyp). See [Use Native Node Modules](Advanced/Use Native Node Modules.md) for details.

