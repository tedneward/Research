title=OpenFin
tags=platform, browser
summary=A web runtime and operating environment designed for enterprise app development.
~~~~~~

[Website](https://www.openfin.co/) | [Source](https://github.com/openfin) | [Docs](https://developers.openfin.co/of-docs)

Basically looks like a unified Web "workspace" concept. May be low-code, hard to tell without diving into it more deeply. Dev environment appears to rely on NodeJS. 

## What is OpenFin?
> OpenFin is a web runtime and operating environment designed for enterprise app development. Built on web standards, OpenFin dramatically enhances the capabilities of web apps, enabling end-user experience and enterprise controls well beyond what is possible with browsers like Chrome and Edge or with frameworks like Electron and Chromium Embedded Framework.

> We offer an out of the box platform solution through OpenFin Workspace or the ability to build from scratch using APIs provided by OpenFin Container. Whichever path you choose, OpenFin dramatically improves the desktop experience by securely connecting disparate apps and content in intuitive, efficient, and meaningful ways.

Architecture diagram:
![](https://files.readme.io/3f54afa-Architecture_Diagram_v3.png)

Sounds like a portal/"work canvas"/Smalltalk-browser-like experience inside a web browser. "Notification Center" seems to imply a messaging-based backplane. Architecture diagram shows Electron and Chromium, possibly to allow for desktop apps?

## Workspace apps
> Workspace apps organize and connect content across the desktop with Home, Browser, Notification Center & Content Store. 

> OpenFin Workspace is a unified space for work, powered by an extensive set of tools designed to help your firm increase productivity and deliver exceptional employee experiences. Key components of Workspace include a keyboard-driven digital assistant for app discovery and search; a browser for displaying content with complex layouts and shared context; and a rich, actionable notification center, experiences that accelerate time to market, and easy-to-use APIs for hyper-customization.

> **Built by OpenFin.** Workspace components are built and managed by OpenFin. We enable customization through configuration. **Component Hosting.** Workspace components are hosted securely on OpenFin’s CDN. **Desktop Owner Settings.** Workspace can be configured using the OpenFin Desktop Owner Settings file. For example, this allows you to point Workspace at your own Content Store. **Content Discovery Service.** By default, Workspace components are configured to point at OpenFin’s Content Discovery Service, which powers the OpenFin Content Store. You can point Workspace at your own Content Discovery Service hosted on your own infrastructure. **Versioning.** Each release of Workspace is versioned. You can lock the version of Workspace that you run via Desktop Owner Settings.

## What is OpenFin Container?
OpenFin Container is a desktop runtime application environment that enables communication between all of your apps (web, legacy, third-party) for the enterprise desktop. It is built on top of Google Chromium and GitHub Electron and combines advanced interoperability, lightning-fast distribution, and robust security with an agile web development and deployment model.

Any web app that runs in Google Chrome can run on OpenFin OS unmodified and in a matter of seconds. With OpenFin, developers write 99% of their code with standard HTML5 and the JavaScript frameworks of their choice, including React and Angular. OpenFin APIs (usually <1% of code) enable windowing, interoperability and system access.

### Platform Provider
The Platform Provider is the main application window which is the communication hub that coordinates between all the windows in a Platform Application. The provider runs in a hidden window and enables application providers to extend or overwrite default Platform behavior through Platform Overrides. This is where you can control how your application will look and feel to create a custom branded experience.

### Platform Window
Platform Windows act as a “frame” for your Platform Views and can be leveraged to display UI controllers such as Minimize, Maximize and Close. These are child windows of the Provider and may contain 1 or many Platform Views.

### Platform View
Platform Views are your applications content and they reside within a Platform Window. The content (a web application) is loaded into a view and attached to a Platform Window. Views have their own JavaScript context that is distinct and unconnected to the window’s context, that have no DOM representation within the window. This allows views to move between windows without refreshing or otherwise destroying the context. Views can be tabbed/tabless and provide the end-user ease to arrange the layout of a Platform Window. For optimal performances, it is worth noting that views can be split into as many render processes as needed through processAffinity.

### Layout Management
Layout management enables applications providers to programmatically embed multiple views or “web apps” in a single Platform Window.

### Snapshot
A Snapshot defines the Platform Window and View configuration to be launched into a Platform. When added as a top-level option in your Platform manifest, the Platform will launch with that Snapshot by default. Snapshots also enable application providers the ability to replenish/restore saved configurations while the Platform is running.

### Platform Manifest
This is the file that defines how an OpenFin Platform works and tells the OpenFin Runtime what your workspace will look like at Launch.

### Process Affinity
By default, all child windows of a Platform Provider share a single renderer process, based on same-origin policy. Views can be separated into further processes by providing a processAffinity option. This enables application providers to have two or more views share a process separate from other views. This can be quite useful in architecting your application for views that have a heavier memory profile.

--------------

**Content Discovery Service.** "Implements the GET methods of the FDC3 App Directory specification, with some additional optional properties for defining the content items. A content discovery service can provide apps or workspaces."

