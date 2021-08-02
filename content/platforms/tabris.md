title=Tabris
tags=platform, ios, android, ecmascript
summary=Native mobile apps in JavaScript. TypeScript is a first class citizen for app development with Tabris.js.
~~~~~~

[Website](https://tabris.com/) | [Source](https://github.com/eclipsesource/tabris-js/)

(Looks like it builds on top of Apache Cordova somewhere/how?)

Hello, world in Tabris:
```
import {Button, contentView, TextView} from 'tabris';

// in JS

new Button({top: 16, centerX: true, text: 'Use native UI'})
  .onSelect(() => $(TextView).only().text = 'Powered by Tabris.js')
  .appendTo(contentView);
new TextView({top: 'prev() 16', centerX: true})
  .appendTo(contentView);

// or in JSX

contentView.append(
  <$>
    <Button top={16} centerX text='Use native UI'
            onSelect={() => $(TextView).only().text = 'Powered by Tabris.js'}/>
    <TextView top='prev() 16' centerX/>
  </$>
);
```
yields
![](https://github.com/eclipsesource/tabris-js/raw/master/doc/img/hello-example.png)
and
~[](https://github.com/eclipsesource/tabris-js/raw/master/doc/img/hello-example.png)

The code of the application is loaded dynamically - nothing is precompiled. JavaScript is executed Just-in-Time and passed via a native bridge to the device. Tabris.js accesses native controls and does not depend on webviews to render the app's UI.

A Compiled Tabris.js app is written in JavaScript or TypeScript and offers support for the latest EcmaScript features and JSX. It is recommended for more complex Tabris.js projects. The only downside of this setup is that the code needs to be transformed before execution, which is done automatically when using the Tabris CLI or build service.

A Vanilla Tabris.js app is written in plain JavaScript that is executed as-is in the JavaScript engine. As a result there may be minor differences between the platforms.

