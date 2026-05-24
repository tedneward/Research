title=Oracle Free App
tags=tool, storage, relational, macos
summary=A Mac app that will give you an Oracle AI Database, leveraging the containerized binaries underneath.
~~~~~~

[Website](https://www.geraldonit.com/introducing-the-oracle-ai-database-free-macos-app/) | [Source](https://github.com/gvenzl/OracleFreeApp)

As a Mac user, I know how nice a user experience it is to just drag and drop an app into the Applications folder, double-click on it, and just have your app running. No lengthy install, no registry leftovers when you delete it, etc. Although technically speaking, I’ve seen that there are a lot more files left over these days in the ~/Library/Application Support folder than there used to be. But anyway, Mac is made for graphical user interfaces.

Oracle AI Database does not come as a Mac app. Oracle does not even provide a Mac-native port for the database (it does provide some Mac-native Instant Client libraries), and that is somewhat of a catch-22 situation. Oracle database software is ported to many operating systems and across multiple platforms. Adding another is not a 2-day job. It requires ongoing porting, testing, validation, and potentially certification work. Oracle does go through this work because its customers are running production systems on these platforms. But Apple is no longer in the server business, and here comes the catch-22. There won’t ever be a customer running Oracle databases in production on a Mac server, so a Mac port seems much less important than any other platform that customers (still) use for production environments. Even AIX is still a thing, believe it or not. So, currently, there is no Mac-native port of Oracle database software. But Oracle AI Database Free does run on Linux ARM, and hence, it can run as a podman container on a Mac ARM.

Yet Mac users expect Mac apps. And although these days I get by a lot with brew and podman/containers, I understand that some folks simply want to drag and drop an app on their Mac and have a graphical user interface. So, how can one make the containerized experience more Mac-like? Well, here it comes.

I’m not a Swift coder, never was. I wish I had had the time to learn Swift and code an iPhone app that would make me rich, but I just never got to it. But thanks to AI, I no longer have to be a Swift coder. I just have to be someone who can lay out requirements, validate, and steer the code generation. So I 100% vibe coded a Mac app that will give you an Oracle AI Database Mac app, leveraging the containerized binaries underneath.

Welcome to the Oracle Free App!

