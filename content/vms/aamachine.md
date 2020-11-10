title=aamachine
tags=vm, gamedev
summary=A virtual machine for delivering interactive stories.
~~~~~~

[Website](https://www.linusakesson.net/dialog/aamachine/index.php) 

It is designed for stories implemented in the Dialog programming language. 

In a sense, the Å-machine is to Dialog what Glulx is to Inform 7. It eliminates the tight restrictions on story size, and extends the basic functionality with a carefully balanced set of new features. But the Å-machine is designed to run the same stories on everything from 8-bit systems to modern web browsers. Data structures and encodings are economical, and the overall word size has not increased. Large stories are supported, but small stories still have a very compact binary representation.

Compared to the Z-machine and Glulx, the Å-machine operates at a higher level of abstraction. This improves performance on vintage hardware, both by making story files smaller, which improves loading times, and by allowing larger chunks of computation to be implemented as native machine code. The downside is that the virtual machine is more tightly coupled to the idiosyncracies of a particular high-level language, in this case Dialog.