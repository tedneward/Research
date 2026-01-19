title=ThespianPy
tags=distribution, python, actor
summary=
~~~~~~

[Website](https://thespianpy.com/doc/) | [Docs](https://thespianpy.com/doc/#outline-container-org9461c8f): [Using Thespian](https://thespianpy.com/doc/using.html) | [Source](https://github.com/thespianpy/Thespian)

## Getting Started

### Simple Installation
Install the Thespian library on your local host system using pip:

    $ pip install thespian

### Starting a Thespian Instance
Start a default Thespian Actor System on the current host system:

    $ python
    >>> from thespian.actors import *
    >>> ActorSystem("multiprocTCPBase")

### Hello World
A Hello World example:

    from thespian.actors import *

    class Hello(Actor):
        def receiveMessage(self, message, sender):
            self.send(sender, 'Hello, World!')

    if __name__ == "__main__":
        hello = ActorSystem().createActor(Hello)
        print(ActorSystem().ask(hello, 'hi', 1))
        ActorSystem().tell(hello, ActorExitRequest())

The above will create an Actor, send it a message and get a "Hello World" response, and then tell that Actor to exit because it is no longer needed.

    $ python helloActor.py
    Hello, World!
    $

Note that any additional ActorSystem().ask() calls following the tell of ActorExitRequest above will return None because the target actor does not exist

… except the first such ask() call, because an Actor is always called with its ActorExitRequest message before being killed; this allows the Actor to perform shutdown activities, which is just sending another greeting back in the case of the Hello Actor, and the tell does not read a response, so the next ask() will return that queued response.

### Hello World Redux
It's easy to extend the Hello World example to include multiple actors which communicate with each other. This example shows a number of additional details:

* the messages exchanged between the Actors can be anything that can be pickled.
* Actors can create other Actors dynamically
* Actor Addresses can be passed around
* Actors remain until they are removed by sending them an ActorExitRequest()

    from thespian.actors import *
   
    import sys
   
    class Greeting(object):
        def __init__(self, msg):
           self.message = msg
        def __str__(self): return self.message
   
    class Hello(Actor):
        def receiveMessage(self, message, sender):
            if message == 'hi':
                greeting = Greeting('Hello')
                world = self.createActor(World)
                punct = self.createActor(Punctuate)
                greeting.sendTo = [punct, sender]
                self.send(world, greeting)
    
    class World(Actor):
        def receiveMessage(self, message, sender):
            if isinstance(message, Greeting):
                message.message = message.message + ", World"
                nextTo = message.sendTo.pop(0)
                self.send(nextTo, message)
    
    class Punctuate(Actor):
        def receiveMessage(self, message, sender):
            if isinstance(message, Greeting):
                message.message = message.message + "!"
                nextTo = message.sendTo.pop(0)
                self.send(nextTo, message)
    
    if __name__ == "__main__":
        hello = ActorSystem().createActor(Hello)
        print(ActorSystem().ask(hello, 'hi', 0.2))
        print(ActorSystem().ask(hello, 'hi', 0.2))
        ActorSystem().tell(hello, ActorExitRequest())
        print(ActorSystem().ask(hello, 'hi', 0.2))

Running above will create an Actor and send it a message. That Actor will create two other Actors, passing the message along to the first which then passes it to the second before finally sending the message back to the original requestor.

The original requestor is code outside of the Actor environment. This external requestor uses the ask() API call which assigns it an Actor Address just like any other Actor.

    $ python helloActor.py
    Hello, World!
    $

### Hello World, Distributed
In the previous example, there were three Actors that participated in generating the desired result. One of the key principals of an Actor is that while it may maintain internal state, it does not share state with other Actors. This principal allows each Actor to run independently… in some cases, independently can mean that each Actor is run on a different system!

Thespian will automatically handle delivery of a message to an Actor running on a different system when the `self.send()`, `ActorSystem.tell()`, or `ActorSystem.ask()` functions are called. There is no change needed to the logic of each Actor, aside from a staticmethod that can indicate whether the Actor should run on the current system or not.

Thespian uses a "capabilities"-based methodology, along with the notion of a "Convention" of Actor Systems for determining where to run an Actor. On each host system that will potentially run an Actor, an instance of Thespian is started, with parameters to indicate the Convention that this instance should join, along with a dictionary of capabilities for the current ActorSystem instance.

The capabilities are simply a dictionary of values: the keys and values are completely up to the implementer. When `createActor()` is called to create a new Actor, and if that Actor class has a special staticmethod, that staticmethod is called with the current ActorSystem's capabilities dictionary as an argument. The staticmethod returns a `True` or `False` to indicate whether the Actor should be run on the current system, based on examining the dictionary of capabilities. If the staticmethod returns `False` then Thespian will automatically pass the createActor operation to other instances in the Convention until one is found where the Actor's staticmethod returns `True`: the Actor will then be created on that system and the Actor's address will ensure that messages are routed to that Actor on that destination system.

The distribution of Actors across multiple host systems is thusly controlled simply by the capabilities that the Thespian instance on each host system is initialized with. The `receiveMessage()` of each Actor is unchanged for supporting distributed systems, and the manner and configuration of the distribution is controlled independently of the functioning of each Actor. It is even possible for a Thespian ActorSystem's capabilities to be updated dynamically after startup to reflect changes in the distributed system.

Controlling the distribution configuration independently of the business logic is a powerful separation of concerns that makes it easier to adapt the Actor-based application to changing needs and to scale the application as needed to handle the demand.

### Hello World, Semi-Deterministic
Actors are a concurrency mechanism whereby each Actor runs independently. The invocation of each Actor's `receiveMessage()` method is determined by network delivery and the system scheduler and may change from one run of the Actor-based application to the next. While parallelism is highly useful for efficiency and scalability, it can be very difficult to diagnose or even reproduce issues given this level of variability.

It would be much easier to debug problems and write unit tests if the behavior was deterministic and predictable. This can be done easily for Thespian actor-based applications simply by using the `simpleSystemBase` when starting the application. The Actors themselves are unchanged: the `simpleSystemBase` simply executes each Actor's `receiveMessage()` sequentially in the order that messages are generated. When run multiple times, the same scheduling order will be followed, and the sequential invocation of `receiveMessage()` methods ensures that only one thing occurs at a time.

The downside to the `simpleSystemBase` is that there is no parallelism in execution, and that it does not support distributed configurations. It is therefore highly useful for certain situations (which could include production uses), but it is also very limited in its capabilities. Just as with the distributed Thespian convention arrangement however, this re-configuration of the actor-based application occurs without any changes to the actor's internal logic: it's a separation of concerns that is handled without needing to modify code involved in other areas of concern.

