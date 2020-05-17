title=E
tags=language, object, distribution, dynamic, jvm
summary=An object-oriented programming language for secure distributed computing.
~~~~~~

From [Wikipedia](https://en.wikipedia.org/wiki/E_(programming_language):
> E is an object-oriented programming language for secure distributed computing, created by Mark S. Miller, Dan Bornstein, and others at Electric Communities in 1997. E is mainly descended from the concurrent language Joule and from Original-E, a set of extensions to Java for secure distributed programming. E combines message-based computation with Java-like syntax. A concurrency model based on event loops and promises ensures that deadlock can never occur. ... The E language is designed with secure computing in mind; this is accomplished chiefly by strict adherence to the object-oriented computing model, which in its pure form has properties that support secure computing. The E language and its standard library employ a capability-based design philosophy throughout in order to help programmers build secure software and to enable software components to co-operate even if they don't fully trust each other. In E, object references serve as capabilities, hence capabilities add no computational or conceptual overhead costs. The language syntax is designed to be easy for people to audit for security flaws. For example, lexical scoping limits the amount of code that has to be examined for its effects on a given variable. As another example, the language uses the == operator for comparison and the := operator for assignment; to avoid the possibility of confusion, there is no = operator.

> In E, all values are objects and computation is performed by sending messages to objects. Each object belongs to a vat (analogous to a process). Each vat has a single thread of execution, a stack frame, and an event queue. Distributed programming is just a matter of sending messages to remote objects (objects in other vats). All communication with remote parties is encrypted by the E runtime. Arriving messages are placed into the vat's event queue; the vat's event loop processes the incoming messages one by one in order of arrival. E has two ways of sending messages: the immediate call and the eventual send. An immediate call is just like a typical function or method call in a non-concurrent language: the sender waits until the receiver finishes and returns a value. An eventual send sends the message while producing a placeholder for the result called a promise. The sender proceeds immediately with the promise. Later, when the receiver finishes and yields a result, the promise resolves to the result. Since only eventual sends are allowed when communicating with remote objects, deadlocks cannot happen. In distributed systems, the promise mechanism also minimizes delays caused by network latency.

Example code:
```
println("Hello, world!")

def factorial(n :int) :int {
  if (n == 1) {
    return 1
  } else if (n > 0) {
    return n * factorial(n-1)
  } else {
    throw("invalid argument to factorial: "+n)
  }
}
```

The canonical example for E programs is the mint, a simple electronic money system in just a few lines of E. The following code defines a function that makes mints, where each mint has its own currency. Each mint can make purses that hold its currency, and any holder of two purses of the same currency can securely transfer money between the purses. By quick examination of the source code, an E programmer can easily verify that only mints may change the amount of money in circulation, that money can only be created and not destroyed, that mints can only create money of their own currency, and that only the holder of a purse can change its balance.
```
def makeMint(name) :any {
  def [sealer, unsealer] := makeBrandPair(name)
  def mint {
    to makePurse(var balance :(int >= 0)) :any {
      def decr(amount :(0..balance)) :void {
        balance -= amount
      }
      def purse {
        to getBalance() :int { return balance }
        to sprout() :any { return mint.makePurse(0) }
        to getDecr() :any { return sealer.seal(decr) }
        to deposit(amount :int, src) :void {
          unsealer.unseal(src.getDecr())(amount)
          balance += amount
        }
      }
      return purse
    }
  }
  return mint
}
```
Objects in E are defined with the def keyword, and within the object definition, the to keyword begins each method. The guard expressions in this example illustrate how to specify a value constraint (as in :(int >= 0) or :(0..balance)). The mint example makes use of a built-in mechanism called a sealer. The function makeBrandPair creates two associated objects, a sealer and an unsealer, such that the sealer can seal an object in a box and the unsealer is the only object that can retrieve the contents of the box. See the E website for a more detailed explanation of this money example.

