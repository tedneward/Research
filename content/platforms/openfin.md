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

--------------

**Content Discovery Service.** "Implements the GET methods of the FDC3 App Directory specification, with some additional optional properties for defining the content items. A content discovery service can provide apps or workspaces."

