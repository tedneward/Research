title=HashLink
tags=vm
summary=Virtual machine target for the Haxe programming language.
~~~~~~

[Website](https://hashlink.haxe.org/) | [Source](https://github.com/HaxeFoundation/hashlink/)

Can be either executed directly or converted to C.

Appears to replace [NekoVM](./neko) in practice.

Performance-oriented features:

* HL bytecode is strictly typed
* Fast anonymous objects access using typed "virtuals"
* Static dispatch of object methods when no override exists
* Compact memory representation for all values
* Inference to reduce null field access checks to the minimum (soon)
* Low level access for pointers, single float, 8 and 16 bits integers
