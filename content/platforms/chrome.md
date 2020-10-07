title=Chrome (browser)
tags=platform, browser
summary=(Chrome) Extensions are software programs that customize the browsing experience. They enable users to tailor Chrome functionality and behavior to individual needs or preferences. They are built on web technologies such as HTML, JavaScript, and CSS.
~~~~~~

[Website](https://developer.chrome.com/extensions)
* [Overview](https://developer.chrome.com/extensions/overview)
* [Developer's Guide](https://developer.chrome.com/extensions/devguide)
* Customize extension user interface
  * [Browser Actions](https://developer.chrome.com/extensions/browserAction): Add an icon, tooltip, badge, and popup to the toolbar.
  * [Commands](https://developer.chrome.com/extensions/commands): Add keyboard shortcuts that trigger actions.
  * [Context Menus](https://developer.chrome.com/extensions/contextMenus): Add items to Google Chrome's context menu.
  * [Omnibox](https://developer.chrome.com/extensions/omnibox): Add keyword functionality to the address bar.
  * [Override Pages](https://developer.chrome.com/extensions/override): Create a version of the New Tab, Bookmark, or History page.
  * [Page Actions](https://developer.chrome.com/extensions/pageAction): Dynamically display icons in the toolbar.
* Build extension utilities
  * [Accessibility (a11y)](https://developer.chrome.com/extensions/a11y): Make an extension accessible to people with disabilities.
  * [Background Scripts](https://developer.chrome.com/extensions/background_pages): Detect and react when something interesting happens.
  * [Internationalization](https://developer.chrome.com/extensions/i18n): Work with language and locale.
  * [Identity](https://developer.chrome.com/extensions/identity): Get OAuth2 access tokens.
  * [Management](https://developer.chrome.com/extensions/management): Manage extensions that are installed and running.
  * [Message Passing](https://developer.chrome.com/extensions/messaging): Communicate from a content script to its parent extension, or vice versa.
  * [Options Pages](https://developer.chrome.com/extensions/options): Let users customize an extension.
  * [Permissions](https://developer.chrome.com/extensions/permissions): Modify an extension's permissions.
  * [Storage](https://developer.chrome.com/extensions/storage): Store and retrieve data.
* Modify and observe the Chrome Browser
  * [Bookmarks](https://developer.chrome.com/extensions/bookmarks): Create, organize, and manipulate bookmark behavior.
  * [Browsing Data](https://developer.chrome.com/extensions/browsingData): Remove browsing data from a user's local profile.
  * [Downloads](https://developer.chrome.com/extensions/downloads): Programmatically initiate, monitor, manipulate, and search for downloads.
  * [Font Settings](https://developer.chrome.com/extensions/fontSettings): Manage Chrome's font settings.
  * [History](https://developer.chrome.com/extensions/history): Interact with the browser's record of visited pages.
  * [Privacy](https://developer.chrome.com/extensions/privacy): Control Chrome privacy features.
  * [Proxy](https://developer.chrome.com/extensions/proxy): Manage Chrome's proxy settings.
  * [Sessions](https://developer.chrome.com/extensions/sessions): Query and restore tabs and windows from a browsing session.
  * [Tabs](https://developer.chrome.com/extensions/tabs): Create, modify, and rearrange tabs in the browser.
  * [Top Sites](https://developer.chrome.com/extensions/topSites): Access users most visited URLs.
  * [Themes](https://developer.chrome.com/extensions/themes): Change the overall appearance of the browser.
  * [Windows](https://developer.chrome.com/extensions/windows): Create, modify, and rearrange windows in the browser.
* Modify and observe the web
  * [Active Tab](https://developer.chrome.com/extensions/activeTab): Securely access websites by removing most needs for <all_urls> host permission.
  * [Content Settings](https://developer.chrome.com/extensions/contentSettings): Customize websites features such as cookies, JavaScript, and plugins.
  * [Content Scripts](https://developer.chrome.com/extensions/content_scripts): Run JavaScript code in the context of web pages.
  * [Cookies](https://developer.chrome.com/extensions/cookies): Explore and modify the browser's cookie system.
  * [Cross-Origin XHR](https://developer.chrome.com/extensions/xhr): Use XMLHttpRequest to send and receive data from remote servers.
  * [Declarative Content](https://developer.chrome.com/extensions/declarativeContent): Perform actions on the content of a page without requiring permission.
  * [Desktop Capture](https://developer.chrome.com/extensions/desktopCapture): Capture content of screen, individual windows or tabs.
  * [Page Capture](https://developer.chrome.com/extensions/pageCapture): Save a tab's source information as MHTML.
  * [Tab Capture](https://developer.chrome.com/extensions/tabCapture): Interact with tab media streams.
  * [Web Navigation](https://developer.chrome.com/extensions/webNavigation): Status updates of navigation requests in-flight.
  * [Web Request](https://developer.chrome.com/extensions/webRequest): Observe and analyze traffic. Intercept block, or modify requests in-flight.
* Package, deploy and update
  * [Autoupdating](https://developer.chrome.com/extensions/autoupdate): Update extensions automatically.
  * [Hosting](https://developer.chrome.com/extensions/hosting): Host extensions on Google or a designated server.
  * [Other Deployment Options](https://developer.chrome.com/extensions/external_extensions): Distribute extensions on a designated network or with other software.
  * [Packaging](https://developer.chrome.com/extensions/packaging): Create a .crx file to distribute an extension outside of the Chrome Webstore.
* Expand Chrome DevTools
  * [Debugger](https://developer.chrome.com/extensions/debugger): Instrument network interaction, debug JavaScript, mutate the DOM and CSS.
  * [Devtools](https://developer.chrome.com/extensions/devtools): Add features to Chrome Developer Tools.

# Chrome Extensions
Extensions are small software programs that customize the browsing experience. They enable users to tailor Chrome functionality and behavior to individual needs or preferences. They are built on web technologies such as HTML, JavaScript, and CSS. An extension must fulfill a single purpose that is narrowly defined and easy to understand. A single extension can include multiple components and a range of functionality, as long as everything contributes towards a common purpose. A screenshot of an extension's icon in the browser barUser interfaces should be minimal and have intent. They can range from a simple icon to overriding an entire page. Extension files are zipped into a single .crx package that the user downloads and installs. This means extensions do not depend on content from the web, unlike ordinary web apps. Extensions are distributed through the Chrome Developer Dashboard and published to the Chrome Web Store. For more information, see the store developer documentation.

# Hello Extensions
Take a small step into extensions with this quick Hello Extensions example. Start by creating a new directory to store the extension's files, or download them from the sample page.

Next, add a file called `manifest.json` and include the following code:
```
{
    "name": "Hello Extensions",
    "description" : "Base Level Extension",
    "version": "1.0",
    "manifest_version": 2
}
```
Every extension requires a manifest, though most extensions will not do much with just the manifest. For this quick start, the extension has a popup file and icon declared under the browser_action field:
```
  {
    "name": "Hello Extensions",
    "description" : "Base Level Extension",
    "version": "1.0",
    "manifest_version": 2,
    "browser_action": {
      "default_popup": "hello.html",
      "default_icon": "hello_extensions.png"
    }
  }
```
Download hello_extensions.png here and then create a file titled hello.html:
```
  <html>
    <body>
      <h1>Hello Extensions</h1>
    </body>
  </html>
```
The extension now displays hello.html when the icon is clicked. The next step is to include a command in the manifest.json that enables a keyboard shortcut. This step is fun, but not necessary:
```
  {
    "name": "Hello Extensions",
    "description" : "Base Level Extension",
    "version": "1.0",
    "manifest_version": 2,
    "browser_action": {
      "default_popup": "hello.html",
      "default_icon": "hello_extensions.png"
    },
    "commands": {
      "_execute_browser_action": {
        "suggested_key": {
          "default": "Ctrl+Shift+F",
          "mac": "MacCtrl+Shift+F"
        },
        "description": "Opens hello.html"
      }
    }
  }
```
The last step is to install the extension on your local machine.

* Navigate to chrome://extensions in your browser. You can also access this page by clicking on the Chrome menu on the top right side of the Omnibox, hovering over More Tools and selecting Extensions.
* Check the box next to Developer Mode.
* Click Load Unpacked Extension and select the directory for your "Hello Extensions" extension.

Congratulations! You can now use your popup-based extension by clicking the hello_world.png icon or by pressing Ctrl+Shift+F on your keyboard.

## Articles
["How to make a Chrome Extension"](https://thoughtbot.com/blog/how-to-make-a-chrome-extension)
