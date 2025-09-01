title=SuperCollider
tags=presentation, audio, language
summary=A platform for audio synthesis and algorithmic composition, used by musicians, artists and researchers working with sound.
~~~~~~

[Website](https://supercollider.github.io/) | [Source](https://github.com/supercollider/supercollider) | [sclang Tutorial](https://docs.supercollider.online/Tutorials/Getting-Started/01-Introductory-Remarks.html)

SuperCollider is actually three programs:

* The text editor you are looking at (also referred to as the IDE or Integrated Development Environment),
* the language (sclang or the "client" app),
* and the server, which does the actual synthesis and calculation of audio.

The sclang part is a sophisticated programming language with nice features for building GUIs (Graphical User Interfaces); and the server part is a lean, mean, efficient UNIX command line application (meaning it runs without any GUI representation).

They communicate by a protocol called OSC (Open Sound Control), over either UDP (User Datagram Protocol) or TCP (Transmission Control Protocol), which are network protocols also used on the internet. Because the client and server communicate this way, more advanced projects might run them on separate computers for performance reasons. In fact, it's even possible that they could be running in different parts of the world! However, just because these two applications communicate using common internet protocols does not mean they must be connected to the internet or on different computers. Most of the time they will be running on the same computer, and the "networking" aspect of things will be relatively transparent for you. Especially while you're still getting started.

You can only communicate with the server using OSC messages over the network, but luckily the language app has lots of powerful objects which represent things on the server and allow you to control them easily and elegantly.

## Examples

Hello, world
```
"Hello World!".postln;
```

