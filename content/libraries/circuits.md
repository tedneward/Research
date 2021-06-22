title=Circuits
tags=library, python, component
summary=A Lightweight Event driven and Asynchronous Application Framework for the Python Programming Language with a strong Component Architecture.
~~~~~~

circuits also includes a lightweight, high performance and scalable HTTP/WSGI compliant web server as well as various I/O and Networking components.

To take full advantage of circuits and its architecture, circuits encourages you to design your application in terms of loosely coupled components. Circuits has a very powerful message passing system that enables components to interact with each other via events. Applications written this way tend to be more maintainable, easier to develop and scale to complex systems.

circuits’ Loosely Coupled Component Architecture allows for a high level of Reuse and Scalability. Simpler components can be combined together to form Complex Components and provide higher level functionality and abstraction. Much of the circuits component library is designed and built this way.

Features

* event driven
* concurrency support
* component architecture
* asynchronous I/O components
* no required external dependencies
* full featured web framework (circuits.web)
* coroutine based synchronization primitives

### Tutorial

#### The Component
First up, let’s show how you can use the Component and run it in a very simple application.

    #!/usr/bin/env python

    from circuits import Component

    Component().run()

Let’s try to create our own custom Component called MyComponent.

    #!/usr/bin/env python

    from circuits import Component

    class MyComponent(Component):
        """My Component"""

    MyComponent().run()

Okay, so this still isn’t very useful! But at least we can create components with the behavior we want.

#### Event Handlers
Let’s now extend our little example to say “Hello World!” when its started.

    #!/usr/bin/env python

    from circuits import Component

    class MyComponent(Component):

        def started(self, *args):
            print("Hello World!")

    MyComponent().run()

Here we’ve created a simple Event Handler that listens for events on the “started” channel. Methods defined in a Component are converted into Event Handlers.

Running this we get:

    Hello World!

Alright! We have something slightly more useful! Whoohoo it says hello!

#### Registering Components
So now that we’ve learned how to use a Component, create a custom Component and create simple Event Handlers, let’s try something a bit more complex by creating a complex component made up of two simpler ones.

Let’s create two components:

* Bob
* Fred

    #!/usr/bin/env python

    from circuits import Component

    class Bob(Component):

        def started(self, *args):
            print("Hello I'm Bob!")

    class Fred(Component):

        def started(self, *args):
            print("Hello I'm Fred!")

    (Bob() + Fred()).run()

Notice the way we register the two components Bob and Fred together? Don’t worry if this doesn’t make sense right now. Think of it as putting two components together and plugging them into a circuits board.

Running this example produces the following result:

    Hello I'm Bob!
    Hello I'm Fred!

Cool! We have two components that each do something and print a simple message on the screen!

#### Complex Components
Now, what if we wanted to create a Complex Component? Let’s say we wanted to create a new Component made up of two other smaller components?

We can do this by simply registering components to a Complex Component during initialization.

    #!/usr/bin/env python

    from circuits import Component
    from circuits.tools import graph

    class Pound(Component):

        def __init__(self):
            super(Pound, self).__init__()

            self.bob = Bob().register(self)
            self.fred = Fred().register(self)

        def started(self, *args):
            print(graph(self.root))

    class Bob(Component):

        def started(self, *args):
            print("Hello I'm Bob!")

    class Fred(Component):

        def started(self, *args):
            print("Hello I'm Fred!")

    Pound().run()

So now Pound is a Component that consists of two other components registered to it: Bob and Fred

The output of this is identical to the previous:

    * <Pound/* 3391:MainThread (queued=0, channels=1, handlers=3) [R]>
    * <Bob/* 3391:MainThread (queued=0, channels=1, handlers=1) [S]>
    * <Fred/* 3391:MainThread (queued=0, channels=1, handlers=1) [S]>
    Hello I'm Bob!
    Hello I'm Fred!

The only difference is that Bob and Fred are now part of a more Complex Component called Pound. This can be illustrated by the following diagram:

    digraph G {
      "Pound-1344" -> "Bob-9b0c";
      "Pound-1344" -> "Fred-e98a";
    }

Cool :-)

#### Component Inheritance
Since circuits is a framework written for the Python Programming Language it naturally inherits properties of Object Orientated Programming (OOP) – such as inheriaence.

So let’s take our Bob and Fred components and create a Base Component called Dog and modify our two dogs (Bob and Fred) to subclass this.

    #!/usr/bin/env python

    from circuits import Component, Event


    class Woof(Event):
        """Woof Event"""


    class Pound(Component):

        def __init__(self):
            super(Pound, self).__init__()

            self.bob = Bob().register(self)
            self.fred = Fred().register(self)

        def started(self, *args):
            self.fire(Woof())


    class Dog(Component):

        def woof(self):
            print("Woof! I'm %s!" % self.name)


    class Bob(Dog):
        """Bob"""


    class Fred(Dog):
        """Fred"""

    Pound().run()

Now let’s try to run this and see what happens:

    Woof! I'm Bob!
    Woof! I'm Fred!

So both dogs barked! Hmmm

#### Component Channels
What if we only want one of our dogs to bark? How do we do this without causing the other one to bark as well?

Easy! Use a separate channel like so:

    #!/usr/bin/env python

    from circuits import Component, Event


    class Woof(Event):
        """Woof Event"""


    class Pound(Component):

        def __init__(self):
            super(Pound, self).__init__()

            self.bob = Bob().register(self)
            self.fred = Fred().register(self)

        def started(self, *args):
            self.fire(Woof(), self.bob)


    class Dog(Component):

        def woof(self):
            print("Woof! I'm %s!" % self.name)


    class Bob(Dog):
        """Bob"""

        channel = "bob"


    class Fred(Dog):
        """Fred"""

        channel = "fred"

    Pound().run()

Events can be fired with either the .fire(...) or .fireEvent(...) method.

If you run this, you’ll get:

    Woof! I'm Bob!

#### Event Objects
So far in our tutorial we have been defining an Event Handler for a builtin Event called Started (which incidentally gets fired on a channel called “started”). What if we wanted to define our own Event Handlers and our own Events? You’ve already seen how easy it is to create a new Event Handler by simply defining a normal Python method on a Component.

Defining your own Events helps with documentation and testing and makes things a little easier.

Example:

    class MyEvent(Event):
      """MyEvent"""

So here’s our example where we’ll define a new Event called Bark and make our Dog fire a Bark event when our application starts up.

    #!/usr/bin/env python

    from circuits import Component, Event

    class Bark(Event):
        """Bark Event"""

    class Pound(Component):

        def __init__(self):
            super(Pound, self).__init__()

            self.bob = Bob().register(self)
            self.fred = Fred().register(self)

    class Dog(Component):

        def started(self, *args):
            self.fire(Bark())

        def bark(self):
            print("Woof! I'm %s!" % self.name)

    class Bob(Dog):
        """Bob"""

        channel = "bob"

    class Fred(Dog):
        """Fred"""

        channel = "fred"

    Pound().run()

If you run this, you’ll get:

    Woof! I'm Bob!
    Woof! I'm Fred!

#### The Debugger
Asynchronous programming has many advantages but can be a little harder to write and follow. A silently caught exception in an Event Handler, or an Event that never gets fired, or any number of other weird things can cause your application to fail and leave you scratching your head.

Fortunately circuits comes with a Debugger Component to help you keep track of what’s going on in your application, and allows you to tell what your application is doing.

Let’s say that we defined out bark Event Handler in our Dog Component as follows:

    def bark(self):
      print("Woof! I'm %s!" % name)

Now clearly there is no such variable as name in the local scope.

For reference here’s the entire example...

    #!/usr/bin/env python

    from circuits import Component, Event

    class Bark(Event):
        """Bark Event"""

    class Pound(Component):

        def __init__(self):
            super(Pound, self).__init__()

            self.bob = Bob().register(self)
            self.fred = Fred().register(self)

    class Dog(Component):

        def started(self, *args):
            self.fire(Bark())

        def bark(self):
            print("Woof! I'm %s!" % name)

    class Bob(Dog):
        """Bob"""

        channel = "bob"

    class Fred(Dog):
        """Fred"""

        channel = "fred"

    Pound().run()

If you run this, you’ll get... 

That’s right! You get nothing! Why? Well in circuits any error or exception that occurs in a running application is automatically caught and dealt with in a way that lets your application “keep on going”. Crashing is unwanted behavior in a system so we expect to be able to recover from horrible situations.

SO what do we do? Well that’s easy. circuits comes with a Debugger that lets you log all events as well as all errors so you can quickly and easily discover which Event is causing a problem and which Event Handler to look at.

If you change Line 34 of our example...

From:

    Pound().run()

To:

    from circuits import Debugger

    (Pound() + Debugger()).run()

Then run this, you’ll get the following:

    <Registered[bob:registered] [<Bob/bob 3191:MainThread (queued=0, channels=2, handlers=2) [S]>, <Pound/* 3191:MainThread (queued=0, channels=5, handlers=5) [R]>] {}>
    <Registered[fred:registered] [<Fred/fred 3191:MainThread (queued=0, channels=2, handlers=2) [S]>, <Pound/* 3191:MainThread (queued=0, channels=5, handlers=5) [R]>] {}>
    <Registered[*:registered] [<Debugger/* 3191:MainThread (queued=0, channels=1, handlers=1) [S]>, <Pound/* 3191:MainThread (queued=0, channels=5, handlers=5) [R]>] {}>
    <Started[*:started] [<Pound/* 3191:MainThread (queued=0, channels=5, handlers=5) [R]>, None] {}>
    <Bark[bob:bark] [] {}>
    <Bark[fred:bark] [] {}>
    <Error[*:exception] [<type 'exceptions.NameError'>, NameError("global name 'name' is not defined",), ['  File "/home/prologic/work/circuits/circuits/core/manager.py", line 459, in __handleEvent\n    retval = handler(*eargs, **ekwargs)\n', '  File "source/tutorial/009.py", line 22, in bark\n    print("Woof! I\'m %s!" % name)\n'], <bound method ?.bark of <Bob/bob 3191:MainThread (queued=0, channels=2, handlers=2) [S]>>] {}>
    ERROR <listener on ('bark',) {target='bob', priority=0.0}> (<type 'exceptions.NameError'>): global name 'name' is not defined
      File "/home/prologic/work/circuits/circuits/core/manager.py", line 459, in __handleEvent
    retval = handler(*eargs, **ekwargs)
      File "source/tutorial/009.py", line 22, in bark
        print("Woof! I'm %s!" % name)

    <Error[*:exception] [<type 'exceptions.NameError'>, NameError("global name 'name' is not defined",), ['  File "/home/prologic/work/circuits/circuits/core/manager.py", line 459, in __handleEvent\n    retval = handler(*eargs, **ekwargs)\n', '  File "source/tutorial/009.py", line 22, in bark\n    print("Woof! I\'m %s!" % name)\n'], <bound method ?.bark of <Fred/fred 3191:MainThread (queued=0, channels=2, handlers=2) [S]>>] {}>
    ERROR <listener on ('bark',) {target='fred', priority=0.0}> (<type 'exceptions.NameError'>): global name 'name' is not defined
      File "/home/prologic/work/circuits/circuits/core/manager.py", line 459, in __handleEvent
        retval = handler(*eargs, **ekwargs)
      File "source/tutorial/009.py", line 22, in bark
        print("Woof! I'm %s!" % name)

    ^C<Signal[*:signal] [2, <frame object at 0x808e8ec>] {}>
    <Stopped[*:stopped] [<Pound/* 3191:MainThread (queued=0, channels=5, handlers=5) [S]>] {}>
    <Stopped[*:stopped] [<Pound/* 3191:MainThread (queued=0, channels=5, handlers=5) [S]>] {}>

You’ll notice whereas there was no output before there is now a pretty detailed output with the Debugger added to the application. Looking through the output, we find that the application does indeed start correctly, but when we fire our Bark Event it coughs up two exceptions, one for each of our dogs (Bob and Fred).

From the error we can tell where the error is and roughly where to look in the code.

You’ll notice many other events that are displayed in the above output. These are all default events that circuits has builtin which your application can respond to. Each builtin Event has a special meaning with relation to the state of the application at that point.

See: circuits.core.events for detailed documentation regarding these events.

The correct code for the bark Event Handler should be:

    def bark(self):
        print("Woof! I'm %s!" % self.name)

Running again with our correction results in the expected output:

    Woof! I'm Bob!
    Woof! I'm Fred!

That’s it folks!