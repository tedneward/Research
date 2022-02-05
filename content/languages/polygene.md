title=Apache Polygene
tags=language, jvm
summary=(Retired) Composite Oriented Programming implementation.
~~~~~~

[Website](http://polygene.apache.org/)

# Highlights
Principles: Composite Oriented Programming builds on some principles that are not addressed by Object Oriented Programming at all.

* Behavior depends on Context
* Decoupling is a virtue
* Business Rules matters more.
* Classes are dead, long live interfaces.
* Behavior Depends on Context

Many objects has life cycles that are more extensive than the simple model that Object Oriented Programming model wants us to believe. A few simple examples;

An egg becomes a chicken which in turn becomes food.
I am a programmer at work, a father+husband at home, a victim in a traffic accident and hunter and pray in the jungle.
But it is more to it than that. The composition of the object may change over time. My home now has a garage and my car have different kind of problems with their own state related to it.

In the programming world, we are constantly faced with change of requirements. These changes are often not related to any real world changes, but people coming to new insights of the problem domain. OOP makes those changes a big deal, and often we have to tear up large chunks of the model and redo the work.

But wait, there is more.

Some objects traverses different scope boundaries to the extreme. For instance, a Person will have its attributes changing slightly over time, new abilities be learnt and so forth, that is mentioned above. But the Person will eventually die, but that doesn’t mean that the Person object should be deleted from a system, since the "memory of" that Person may live on for a long time. In a OOP system, we would need to transfer some of the state from a LivingPerson class to a DeadPerson class. In Composite Oriented Programming, it is the same object with different behavior.

We think that one of the the main flaws in OOP is that it is not object oriented at all, but in fact class oriented. Class is the first class citizen that objects are derived from. Not objects being the first-class citizen to which one or many classes are assigned.

### Decoupling is Virtue
Decoupling is more important than developers in general think. If you could have every OOP class decoupled from all other classes, it is easy to re-use that class. But when that class references another class and the chain never ends, your chances of re-use diminishes quickly.

Object Oriented Programming is suffering a lot from this, and many mechanisms have been introduced over time to counter this problem. But in reality, the best we can manage is subsystems of functionality, which client code can re-use. And these subsystems tend to be infrastructure related, since domain models are less prone to be similar enough from one project to the next, and since OOP in reality constrains the the re-use of individual domain classes, we need to re-do the domain model from scratch ever time.

### Business Rules matters more
Smart developers often think that low-level, infrastructure and framework code is more important and more cool to work with, than the simple domain model. But in reality, it is the Domain Model that reflects the actual need and pays the bills. Infrastructure is just a necessary evil to get things done.

If most developers could focus on the Business Rules and Domain Model, and not having to worry about any infrastructure issues, such as persistence, transactions, security or the framework housing it all, the productivity would surge. Eric Evans has written an excellent book about Domain Driven Design, where he goes through the real process that makes the money for companies. However, it is very hard to follow that book, since one is constantly caught up in constraints irrelevant to the domain model, introduced by the underlying framework, from the so called smart developers.

## Background
Polygene™ is the first Composite Oriented Programming implementation leveraging the Java 5 platform, so that everything you know from Java 5 still applies. You can mix Polygene™ with your ordinary Java code as much as you want. All your existing Java tools works just like before, and Polygene™ does not introduce any new programming language, no special development tools needed and no XML is required.

## Purpose
Polygene™ addresses the programming problems from the top-down, starting with the Domain Model and Business Rules needs, and let those requirements flow downwards in the software stack and dictate the requirements for underlying layers such as persistence, messaging, querying and more. This means that the business value developer is left to concentrate on the domain models and the actual application bringing the value, instead of creating massive amounts of glue code to tie underlying technologies together.

Problem Descriptions
Polygene™ didn’t appear out of the blue, when the founders of the project had nothing better to do. It is the result of observation of problems in real applications, and the experience from previous attempts to address or correct these problems, that has led to the Polygene™ vision.

Object Oriented Programming (OOP)
How can OOP be a problem? We and others have observed that there is a fundamental flaw in the OOP model. In fact, we would like to even state that OOP as it is commonly practiced today is not object oriented at all. The object is not the primary citizen, instead the class is the primary artifact. In most mainstream OOP languages, Objects are derived from classes, not that classes are assigned to created objects. Therefore, we think it should have been called Class Oriented Programming. We can also see this class focus in many of the technologies in Java today: in Spring you declare class names in application contexts, JSP uses class names to declare beans and so forth.

This in turn leads to that there is no good OOP solution for the problem we describe below.

### Behavior depends on Context
Once you start thinking of "Behavior depends on Context", you have a hard time understanding how people for the last 20 years or so of Object Oriented Programming (OOP) has ignored this fact.

#### Who am I?
When I sitting in front of the computer, I am a software developer, but if I go out in the jungle, I am suddenly hunter-gatherer and prey. A large set of me is the same, but my interaction with the surroundings, i.e. the context, is very different. I need different interfaces, so to speak, in these two different contexts.

Now, the above example is perhaps a bit extreme, but we see it in everyday life of the developer. When an object is stored in the database it is of a different class, than when it is transported to the client and possibly when it is displayed in the GUI. We see the effect of this problem in many of the design patterns and so called "best practices" in Java EE development. Facades, delegation, data transport objects and many more.

#### Coupling
The OOP proponents once proclaimed that classes can be re-used, since the code is encapsulated with the class, so the class is an independent unit which lends itself well to re-use. In reality, however, we have found that classes becomes tightly coupled with many other classes in their neighborhood, leading to impossibilities of single class re-use. Many tricks are introduced to minimize the "Coupling Hell", such as Inversion of Control and Dependency Injection. Although those tools are good, the underlying problem remains.

Why do we end up with large coupled class network graphs?

Essentially, it boils down to "scope". Classes are too large, their scope is too large, and for each small functional unit within the class, there will be additional coupling to other classes. And this often progresses to the full boundary of the entire domain the class remains in.

#### Application layer impedance mismatch
Almost all technologies used in modern software development, starts by looking at an infrastructural problem and try to solve that the best way. This is often done in a vacuum and layers on top will be struggling to map or translate the solution into the higher abstraction, and the higher up we get, the harder it becomes to ignore the assumptions, problems and limitations of the underlying technologies. It is also common that the underlying technologies "bleeds" through the layers all the way into the domain models. The "bleed" combined with the problem of using independently developed technologies, puts a large burden on the application developer, whose job it is to bring business value. And often, the most skilled developers end up doing the bottom layers, leaving the hardest job to the least suitable. Another interesting consequence is that each layer needs to anticipate every single use-case - real, potential or perceived - and deal with it in a specifiable and useful manner. This leads to overly complex solutions, compared to if the system is built from the top layer down, where each layer beneath knows exactly what is expected from it, and only needs to handle those use-cases.

#### Abstracting away meaning.
To paraphrase a famous proverb about a hammer: "If all you have are objects, everything looks like a dependency." We think that increasing abstraction often also increases complexity, and that the abstraction benefits are somewhat linear whereas the complexity negatives are exponential. So, our conclusion is that by making no distinction between different kinds of objects, many sound technologies run into incredibly difficult problems. The implementation of the programming platform (e.g. Java) is of course easier to implement with a hefty amount of scope reduction into as few as possible abstractions. But that is not the situation for the user. The abstraction is then required to be reversed when the rubber hits the road, e.g. ORM mapping must be declared explicitly by the programmer, often using separate tools and languages.

### Solution
We think the solution was expressed more than 2500 years ago, first by Indian scholars and slightly later by Leucippus and Democritus. We are of course talking about atoms, and by using really small building blocks, we can express arbitrarily complex structures. By reducing the classes into what we in Composite Oriented Programming call Fragments, we limit the coupling network graph substantially. Re-use of Fragments becomes a reality, and by combination of Fragments, we compose larger structures, the Composites.

#### Composition
Composite Oriented Programming also view the object, we call it the Composite instance, as the first class citizen. The Composite instance can be cast to any context, meaning a different behavior can be applied to the Composite instance, without affecting its underlying state. And back. This in turn means that we can for instance create a ServerContextualInvoiceEntity, transport that across to a client, cast it to a GuiContextualInvoiceEntity do the modifications to the underlying state, possibly using extra interfaces and methods for interacting with the GUI environment, and then transport the modified object back to the server, cast it back to the ServerContextualInvoiceEntity, and then persist the changes.

#### Domain Driven Design focus
Composite Oriented Programming is heavily influenced by the book "Domain Driven Design" by Eric Evans. And we are trying to use his analysis of the problem to provide the mechanisms needed to get the job done quicker and more reliably. Mr Evans talks about Applications, Layers, Modules, Specifications, SideEffects and so forth, and all of these should be present in a Composite Oriented Programming implementation, and to a large extent it is in Polygene™.

# Composite-Oriented Programming (COP)
I’ve written a series of post on AOP lately ([here](https://web.archive.org/web/20090417052136/http://www.iridescence.no/post/Aspect-Oriented-Programming---A-Primer.aspx), [here](https://web.archive.org/web/20091222150653/http://www.iridescence.no/post/Implementing-an-AOP-Framework-Part-1.aspx) and [here](https://web.archive.org/web/20130417090819/http://www.iridescence.no/post/Implementing-an-AOP-Framework-Part-2.aspx)), and in the last part I promised to tackle mixins and introductions in a future post. When I was doing my research for just that, I came cross a Java framework (just humor me :p) called Apache Polygene™, written by Swedish Richard Öberg, pioneering the idea of Composite Oriented Programming, which instantly put a spell on me. Essentially, it takes the concepts from Aspect Oriented Programming to the extreme, and for the past week I’ve dug into it with a passion. This post is the first fruits of my labor.

### OOP is Not Object Oriented!
One of the things that Richard Öberg argues, is that OOP is not really object oriented at all, but rather class oriented. As the Polygene™ website proclaims, "class is the first class citizen that objects are derived from. Not objects being the first-class citizen to which one or many classes are assigned". Composite oriented programming (COP) then, tries to work around this limitation by building on a set of core principles; that behavior depends on context, that decoupling is a virtue, and that business rules matter more. For a short and abstract explanation of COP, see this page. In the rest of this post I’ll try and explain some of its easily graspable benefits through a set of code examples, and then in a future post we’ll look at how I’ve morphed the AOP framework I started developing in the previous posts in this series into a lightweight COP framework that can actually make it compile and run.

### Lead by Example
Lets pause for a short aside: obviously the examples presented here are going to be architectured beyond any rational sense, but the interesting part lies in seeing the bigger picture; imagine the principles presented here applied on a much larger scale and I’m sure you can see the benefits quite clearly when we reach the end.

Imagine that we have a class Division, which knows how to divide one number by another:

```
public class Division
{
    public Int64 Dividend { get; set; }
    private long _divisor = 1;
 
    public Int64 Divisor
    {
        get { return _divisor; }
        set
        {
            if(value == 0)
            {
                throw new ArgumentException("Cannot set the divisor to 0; division by 0 is not allowed.");
            }
            _divisor = value;
        }
    }
 
    public Int64 Calculate()
    {
        Trace.WriteLine("Calculating the division of " + this.Dividend + " by " + this.Divisor);
        Int64 result = this.Dividend/this.Divisor;
        Trace.WriteLine("Returning result: " + result);
        return result;
    }
}
```

Consider the code presented above. Do you like it? If you’ve followed the discussion on AOP in the previous posts, then you should immediately be able to identify that there are several aspects tangled together in the above class. We’ve got data storage (the Dividend and Divisor properties), data validation (the argument check on the Divisor setter), business logic (the actual calculation in the Calculate method) and diagnostics (the Trace calls), all intertwined. To what extent is this class reusable if I wanted to implement addition, subtraction or multiplication calculations? Not very, at least not unless we refactored it. We could make the Calculate method and the properties virtual, and thus use inheritance to modify the logic of the calculation - and since this is a tiny example, it would probably look OK. But again, think bigger - how would this apply to a huge API? It would easily become quite difficult to manage as things got more and more complex.

Design by Composition
With a COP framework, we can implement each aspect as a separate object and then treat them as mixins which blend together into a meaningful composite. Sounds confusing? Lets refactor the above example using an as of yet imaginary COP framework for .NET (which I’m currently developing and will post the source code for in a follow-up post), and it’ll all make sense (hopefully!).

Above, we identified the four different aspects in the Division class - so let’s implement each of them. First, we have the data storage:

```
public interface ICalculationDataAspect // aspect contract
{
    long Number1 { get; set; }
    long Number2 { get; set; }
}
 
public class CalculationDataAspect : ICalculationDataAspect // aspect implementation
{
    public long Number1 { get; set; }
    public long Number2 { get; set; }
}
```

In this example, the data storage is super easy – we just provide a set of properties (using the C# 3.0 automatic properties notation) that can hold the values in-memory. The second aspect we found, was the business logic – the actual calculation:

```
public interface ICalculationLogicAspect
{
    long Calculate();
}
 
public class DivisionLogicAspect : ICalculationLogicAspect
{
    [AspectRef] ICalculationDataAspect _data;
 
    public long Calculate()
    {
        return _data.Number1 / _data.Number2;
    }
}
```

Here we follow the same structure again, by defining the aspect as an interface and providing an implementation of it. In order to perform the calculation however, we need access to the data storage aspect so that we can read out the numbers we should perform the calculation on. Using attributes, we can tell the COP framework that we require this reference, and it will provide it for us at runtime using some dependency injection trickery behind the scenes. It is important to notice that we’ve now placed a constraint on any possible composition of these aspects – the DivisionLogicAspect now requires an ICalculationDataAspect to be present in any composition it is part of (our COP framework will be able to validate such constraints, and tell us up front should we break any). It is still loosely coupled however, because we only hold a constraint on the contract of that aspect, not any specific implementation of it. We’ll see the benefit of that distinction later.

The third aspect we have, is validation. We want to ensure that the divisor is never set to 0, because trying to divide by zero is not a pleasant experience. Validation is a type of advice, which was introduced at length earlier in my AOP series. We’ve seen it implemented using the IAdvice interface of my AOP framework, allowing us to dynamically hook up to a method invocation. However, the advice we’re implementing here is specific to the data aspect, so with our COP framework we can define it as concern for that particular aspect, which gives us a much nicer implementation than an AOP framework could - in particular because of its type safety. Just look at this:

```
public abstract class DivisionValidationConcern : ICalculationDataAspect
{
    [ConcernFor] protected ICalculationDataAspect _proceed;
 
    public abstract long Number1 { get; set; }
 
    public long Number2
    {
        get { return _proceed.Number2; }
        set
        {
            if (value == 0)
            {
                throw new ArgumentException("Cannot set the Divisor to 0 - division by zero not allowed.");
            }
            _proceed.Number2 = value; // here, we tell the framework to proceed with the call to the *real* Number2 property
        }
    }
}
```

I just love that, it’s so friggin' elegant ;). Remember that an advice is allowed to control the actual method invocation by telling the target when to proceed – we’re doing the exact same thing above, only instead of dealing with a generic method invocation we’re actually using the interface of the aspect we’re advising to control the specific invocation directly. In our validation, we validate the value passed into the Divisor setter, and if we find it valid then we tell the target (represented by a field annotated with an attribute which tells the COP framework to inject the reference into it for us, much like we did with aspects earlier) to proceed with the invocation; otherwise we throw an exception. This particular concern is abstract, because we only wanted to advise a subset of the methods in the interface. That’s merely a convenience offered us by the framework - under the covers it will automatically complete our implementation of the members we left abstract.

Only one aspect remains now, and that is the logging:

```
public class LoggingAdvice : IAdvice
{
    public object Execute(AdviceTarget target)
    {
        Trace.WriteLine("Invoking method " + target.TargetInfo.Name + " on " + target.TargetInfo.DeclaringType.FullName);
 
        object retValue;
 
        try
        {
            retValue = target.Proceed();
        }
        catch(Exception ex)
        {
            Trace.WriteLine("Method threw exception: " + ex.Message);
            throw;
        }
        Trace.WriteLine("Method returned " + retValue);
        return retValue;
    }
}
```

We’ve implement it as a regular advice, like we’ve seen earlier in AOP, because it lends itself to much wider reuse than the validation concern did.

Having defined all our aspects separately, it is now time to put them back together again into something that can actually do something. We call this the composite, and it is defined as follows:

```
[Mixin(typeof(ICalculationDataAspect), typeof(CalculationDataAspect))]
[Mixin(typeof(ICalculationLogicAspect), typeof(DivisionLogicAspect))]
[Concern(typeof(DivisionValidationConcern))]
[Concern(typeof(LoggingAdvice))]
public interface IDivision : ICalculationDataAspect, ICalculationLogicAspect
{ }
```

Basically, we’ve just defined the implementation of an interface IDivision as a composition of the data and logic aspects, and sprinkled it with the two concerns (the validation concern and the logging advice). We can now use it to perform divisions:

```
IDivision division = Composer.Compose<IDivision>().Instantiate();
division.Number1 = 10;
division.Number2 = 2;
 
Int64 sum = division.Calculate();
```

That’s pretty cool, no? Take a moment to just think about what doors this opens. To what extent do you think our code is reusable now, if we wanted to implement addition, subtraction and so forth? That’s right – all we’d need to do is substitute the implementation of the calculation aspect with one that performs the required calculation instead of division, and we’re done. Let’s do subtraction, for example:

```
public class SubtractionLogicAspect : ICalculationLogicAspect
{
    [AspectRef] ICalculationDataAspect _data;
 
    public long Calculate()
    {
        return _data.Number1 - _data.Number2;
    }
}
```

That’s it! The rest we can reuse as is, building a new composite:

```
[Mixin(typeof(ICalculationDataAspect), typeof(CalculationDataAspect))]
[Mixin(typeof(ICalculationLogicAspect), typeof(SubtractionLogicAspect))]
[Pointcut(typeof(LoggingAdvice))]
public interface ISubtraction : ICalculationDataAspect, ICalculationLogicAspect
{ }
```

Notice that we just left out the validation concern in this composite, as it is no longer needed. What if we wanted our subtraction to only ever return positive numbers? Easy! We’ll just implement an absolute number concern:

```
public class AbsoluteNumberConcern : ICalculationLogicAspect
{
    [ConcernFor] protected ICalculationLogicAspect _proceed;
 
    public long Calculate()
    {
        long result = _proceed.Calculate();
 
        return Math.Abs(result);
    }
}
```
And then update the composition to include it:

```
[Mixin(typeof(ICalculationDataAspect), typeof(CalculationDataAspect))]
[Mixin(typeof(ICalculationLogicAspect), typeof(SubtractionLogicAspect))]
[Concern(typeof(AbsoluteNumberConcern))]
[Pointcut(typeof(LoggingAdvice))]
public interface ISubtraction : ICalculationDataAspect, ICalculationLogicAspect
{ }
```

# What’s an Object anyway?
In OOP the main idea is that we should model our reality by creating Objects. Objects have state, and they have methods. Methods in an object are used to operate on the internal state and understands the domain that is being modeled.

By contrast, in procedural programming the focus is on algorithms, which can use several data structures to perform some task. The focus is on what is going on, rather than the "objects" involved.

With OOP it becomes more difficult to "read" algorithms, as they are spread out in many objects that interact. With procedural programming it becomes difficult to encapsulate and reuse functionality. Both represent extremes, neither of which is "correct". The tendency to create anemic domain models is an indication that we have lost the algorithmic view in OOP, and there is a need for it.

The main flaw of OOP, which COP addresses, is the answer to the fundamental question "What methods should an object have?". In traditional OOP, which really should be called "class oriented programming", the classes tend to have a rather narcissistic point of view. Classes are allowed to dictate what methods are in there - regardless of the algorithms which they are part of - and algorithms then need to be aware of these classes when object instances collaborate in an algorithm. Why? This seems like complete madness to me!! Keep in mind that if there were no algorithms, there would be no need for methods at all!! Algorithms, then, are primary, and objects are what we use as helper structures. In philosophical terms, if there is noone around to observe the universe, there would be no need for the universe itself!

In COP the responsibility for defining the methods is reversed: algorithms which implement interactions between objects get to declare what roles it needs the objects to implement, and the composites can then implement these. For each role there will be an interface, and for each composite wanting to implement a role there will be a mixin in that composite. This mixin can be specific for that composite implementation, or it can be generic and reused. The key point is that it is the OBSERVER of the object, meaning, the algorithm, that gets to decide what the object should be able to do.

This is the same in real life. I don’t get to decide how I communicate with you. I have to use english, and I have to use email, and I have to send it to a specific mailing list. It is the algorithm of the interaction between us, the Polygene™ dev mailing list, that has set these rules, not I as a participant in this interaction. The same should, obviously, be the case for objects.

So, with the understanding that algorithms should define roles for collaborating objects, and objects should then implement these in order to participate in these algorithms, it should be trivial to realize that what has passed for OOP so far, in terms of "class oriented programming", where this role-focus of objects is difficult to achieve, if not even impossible, is just plain wrong. I mean seriously, catastrophically, terminally wrong.

Let that sink in.

The method that has been used so far to get around this has been the composite pattern, where one object has been designated as "coordinator", which then delegates to a number of other objects in order to implement the various roles. This "solution", which is caused by this fundamental flaw in "class oriented programming", is essentially a hack, and causes a number of other problems, such as the "self schizophrenia" problem, whereby there is no way to tell where the object really is. There is no "this" pointer that has any relevant meaning.

The Composite pattern, as implemented in COP and Polygene™, gets around this by simply saying that the composite, as a whole, is an object. Tada, we now have a "this" pointer, and a coherent way to deal with the object graph as though it was a single object. We are now able to get back to the strengths of the procedural approach, which allows the implementer of the algorithm to define the roles needed for the algorithm. The roles can either be specific to an algorithm, or they can be shared between a number of algorithms if there is a generic way for them to be expressed.

Goodness!

The question now becomes: how can we use this insight to structure our composites, so that what is part of the algorithm is not too tightly encoded in the composites, thereby making the algorithms more reusable, and making it less necessary to read composite code when trying to understand algorithms. The assumption here is that we are going to write more algorithms than composites, therefore it has to be easy to ready algorithms, and only when necessary dive down into composite code.

When talking about Composites as Objects in Polygene™ it is most relevant to look at Entities, since these represent physical objects in a model, rather than algorithms or services, or other non-instance-oriented things.

If Entities should implement roles, via mixins, in order to interact with each other through algorithms, then the majority of their behaviour should be put into those role-mixins. These are exposed publically for clients to use. However, the state that is required to implement these roles should not be exposed publically, as they represent implementation details that may change over time, may be different depending on role implementation, and usually has a lot of rules regarding how it may be changed. In short, the state needs to be private to the composite.

This leads us to this typical implementation of an Entity

@Mixins( SomeMixin.class )
interface MyEntity extends Some, Other, HasIdentity {}
where Some and Other are role interfaces defined by one or more algorithms. SomeMixin is the implementation of the Some interface. There is NO interface that is defined by the author of MyEntity. Algorithms first, objects second!

The state needed for these mixins would then be put into separate interfaces, referred to by using the @This injection in the mixins.

interface SomeState
{
    Property<String> someProperty();
}
These interfaces will pretty much ONLY contain state declarations. There might be some methods in there, but I can’t see right now what they would be.

In order to be able to get an overview of all the state being implemented by the Entity we introduce a "superstate" interface:

interface MyState extends SomeState, OtherState //, ...
{}
This lets us see the totality of all the state that the Entity has, and can be used in the builder phase:

EntityBuilder<MyEntity> builder = uow.newEntityBuilder(MyEntity.class);
MyState state = builder.instanceFor(MyState.class);
 
//... init state ...
 
MyEntity instance = builder.newInstance();
This lets us divide our Entity into two parts: the internal state and the external roles of the domain that the object takes part in. Due to the support for private mixins the state is not unnecessarily exposed, and the mixin support in general allow our role-oriented approach to modeling. The role interfaces are strongly reusable, the mixins are generally reusable, and the state interfaces are usually reusable. This minimizes the need for us to go into the mixin code and read it. If we have read the mixin code once, and the same mixin is reused between objects, then this makes it easier for us to understand it the next time we see it being used in another algorithm.

To summarize thus far, we have looked at why OOP so far has not worked out, why this is the case, and how COP deals with it, and how we can implement a better solution of Entities using Polygene™. All is well!

The next step is to start using these Entities in algorithms. Algorithms are usually stateless, or at least they don’t have any state that survives the execution of the algorithm. There is input, some calculation, and then output. In other words, our notion of services fit perfectly here!

Algorithms, then, should(/could?) be modeled using services. If an algorithm needs other algorithms to compute something, that is, if a service needs another service to do something, we can accomplish this using dependency injection, so that the user of the initial algorithm does not have to know about this implementation detail.

In a "Getting Things Done" domain model, with Projects and Actions, you might then have an algorithm like so for task delegation:

void delegate(TaskExecutor from, Completable completable, TaskExecutor to)
{
   to.inbox().createTask( createDelegatedTask( completable ) );
 
   completable.complete(); // Delegated task is considered done
 
   from.inbox().createTask( createWaitingTask( completable ) );
}
In the above I don’t know if "from" and "to" are human users or systems that automatically execute tasks. I also don’t know if Completable is an entire Project or a single Action. From the point of view of the algorithm I don’t need to know! All the algorithm cares about is that the roles it needs are fulfilled somehow. This means that I will be able to extend my domain model later on, and have it be a part of these kinds of algorithms, without having to change my algorithms. And as long as my composites implement the role interfaces, such as TaskExecutor and Completable, they can participate in many different algorithms that use these as a way to interact with the domain objects.

This shows the place of services, as points of contact between objects in a domain model, or more generally, "interactions". These will change often, and will increase in number as the system grows, so it is important that they are easy to read, and that they are easy to participate in. With a focus on roles, rather than classes, this becomes much easier to accomplish!

With the responsibilities of entities, as objects, and services, as algorithms, more clearly defined, the last part to deal with is how these are put together. The services, with the methods now being role-oriented, can obviously be applied to a wide variety of entities, but we now go from general to specific. In our software each general algorithm is typically applied to specific objects in specific use-cases.

How is this done?

This is done by implementing context objects, which pick specific objects and pass them into algorithms. This is typically a UI-centric thing, and as such is difficult to encapsulate into a single method. With the previous example we would need to get the three objects involved, and cast them to the specific roles we are interested in. The "TaskExecutor from" could be the user running the application, the "Completable completable" could be the currently selected item in a list, and "TaskExecutor to" could be a user designated from a popup dialog. These three are then taken by the context and used to execute the "delegate" interaction, which performs all the steps necessary.

The interaction method "delegate" is testable, both with mocks of the input, and with specific instances of the various roles. The implementations are also testable, and if the same mixin is used over and over for the implementation, then only one set of tests is needed for each role interface.

To summarize we have in COP/Polygene™ a way to get the best from procedural and object-oriented programming. As we have seen the functionality falls into three categories, the entities implementing objects, the services implementing interactions, and the user interface implementing the context. This also maps well to the ideas of ModelViewController, which in turn maps well to the new ideas from Mr Reenskaug (inventor of MVC) called DCI: Data-Context-Interaction. As a side-effect of this discussion we have therefore also seen how COP/Polygene™ can be used to implement DCI, which is an important next step in understanding objects and their interactions, the fundamentals of which (I believe) are captured on this page.

That’s it. Well done if you’ve read this far :-)

