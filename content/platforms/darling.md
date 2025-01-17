title=Darling
tags=platform, tool, macos, linux
summary=A translation layer for Linux to allow execution of macOS programs.
~~~~~~

[Website](https://www.darlinghq.org/) | [Source](https://github.com/darlinghq/darling)

Does it support GUI apps? Almost! This took us a lot of time and effort, but we finally have basic experimental support for running simple graphical applications.

Does it violate Apple's EULA? No! We only directly use those parts of Darwin that are released as fully free software.

Does the name Darling mean anything? The name Darling is a combination of “Darwin” and “Linux”. Darwin is the core operating system macOS and iOS are based on.

Can I run Darling on Windows using WSL? With WSL 2, yes! See the documentation for more details.

Do you know about opensource.apple.com, GNUstep, The Cocotron and other projects? We do, and in fact, Darling is largely based on the original Darwin source code published by Apple. We use The Cocotron as a basis for our Cocoa implementation, along with the Apportable Foundation and various bits of GNUstep.

Do you have plans for supporting iOS apps? Yes, in the long run, we'd like to be able to run iOS apps on ARM devices (like most Android phones). A significant challenge here would be to write our own implementation of UIKit. Come talk to us if you're interested in working on this!

