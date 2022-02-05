title=Essays on Programming
tags=reading
summary=Collection of thoughts.
~~~~~~

## References

- [How Team Obama's tech efficiency left Romney IT in dust](https://arstechnica.com/information-technology/2012/11/how-team-obamas-tech-efficiency-left-romney-it-in-dust/)

["Does DNA have the equivalent of IF-statements, WHILE loops, or function calls? How about GOTO?"](https://biology.stackexchange.com/questions/30116/does-dna-have-the-equivalent-of-if-statements-while-loops-or-function-calls-h): Short answer, sort of:

    "Molecular biological processes cannot be directly compared to a computer code. It is the underlying logic that is important and not the statement construct itself and these examples should not be taken as absolute analogies. It is also to be noted that DNA is just a set of instructions and not really a fully functional entity (it is functional to some extent). However, even being just a code it is comparable to a HLL code that has to be compiled to execute its functions. See this post too.

    "It is also important to note that the cell, like many other physical systems, is analog in nature. Therefore, in most situations there is no 0/1 (binary) value of variables. Consider gene expression. If a transcriptional activator is present, the gene will be transcribed. However, if you keep increasing the concentration of the activator, the expression of that gene will increase until it reaches a saturation point. So there is no digital logic here. Having said that, I would add that switching behaviour is possible in biological systems (including gene expression) and is also used in many cases. Certain kinds of regulatory network structures can give rise to such dynamics. Co-operativity with or without positive feedback is one of the mechanisms that can implement switching behaviour."

[The Rise of "Worse is Better"](http://doc.cat-v.org/programming/worse_is_better) by Richard P. Gabriel:

## Steve Yegge's rants

- [Universal Design Pattern](http://steve-yegge.blogspot.com/2008/10/universal-design-pattern.html): "Today I thought I'd talk about a neat design pattern that doesn't seem to get much love: the Properties Pattern. In its fullest form it's also sometimes called the Prototype Pattern." Talks about three forms of modeling:

    * Class modeling: "Class-based OO design is the 800-pound gorilla of domain modeling these days. Its appeal is that it's a natural match for the way we already model things in everyday life. Although the industry loves OO design, it's not especially well liked as an academic topic. This is because OO design has no real mathematical foundation to support it — at least, not until someone comes along and creates a formal model for side effects. The concepts of OOP stem not from mathematics but from fuzzy intuition. This in some sense explains its popularity, and it also explains why OOP has so many subtly different flavors in practice: whether (and how) to support multiple inheritance, static members, method overloading vs. rich signatures, and so on. Industry folks can never quite agree on what OOP is, but we love it all the same."
    * Relational modeling: "Relational database modeling is a bit harder and takes more practice, because its strength stems from its mathematical foundation. Relational modeling can be intuitive, depending on the problem domain, but most people would agree that it is not necessarily so: it takes some real skill to learn how to model arbitrary problems as relational schemas. Object modeling and relational modeling produce very different designs, each with its strengths and weaknesses, and one of the trickiest problems we face in our industry has always been the object-relational mapping (ORM) problem. It's a big deal. Some people may have let you to believe that it's simple, or that it's automatically handled by frameworks such as Rails or Hibernate. Those who know better know just how hard ORM is in real-world production schemas and systems.
    * XML (hierarchical) modeling: "XML provides yet another technique for modeling problems. Usually XML is used to model data, but it can also be used to model code. For instance, XML-based frameworks such as Apache Ant and XSLT offer computational facilities: loops or recursion, conditional expressions and setting variables." (He goes on to say that this is a "mostly solved problem" and he basically loses any respect I have for this essay at that point. Mostly.)

    "Two other obvious candidates are Functional modeling (in the sense of Functional Programming, with roots in the lambda calculus) and Prolog-style logical modeling. Both are mature problem-modeling strategies, each with its pros and cons, and each having varying degrees of overlap with other strategies. And there are still other schools, perhaps dozens of them."

    (TODO: Fill in the rest: Hofstadter, properties modeling, etc)

## [Essays on programming I think about a lot](https://www.benkuhn.net/progessays/):

### [Computers can be understood](https://blog.nelhage.com/post/computers-can-be-understood/):
> I approach software with a deep-seated belief that computers and software systems can be understood. …

> In some ways, this belief feels radical today. Modern software and hardware systems contain almost unimaginable complexity amongst many distinct layers, each building atop each other. …

> In the face of this complexity, it’s easy to assume that there’s just too much to learn, and to adopt the mental shorthand that the systems we work with are best treated as black boxes, not to be understood in any detail.

> I argue against that approach. You will never understand every detail of the implementation of every level on that stack; but you can understand all of them to some level of abstraction, and any specific layer to essentially any depth necessary for any purpose.

### [Choose Boring Technology](https://mcfunley.com/choose-boring-technology):
> Let’s say every company gets about three innovation tokens. You can spend these however you want, but the supply is fixed for a long while. You might get a few more after you achieve a certain level of stability and maturity, but the general tendency is to overestimate the contents of your wallet. Clearly this model is approximate, but I think it helps.

> If you choose to write your website in NodeJS, you just spent one of your innovation tokens. If you choose to use MongoDB, you just spent one of your innovation tokens. If you choose to use service discovery tech that’s existed for a year or less, you just spent one of your innovation tokens. If you choose to write your own database, oh god, you’re in trouble.
  
### [The Wrong Abstraction](https://www.sandimetz.com/blog/2016/1/20/the-wrong-abstraction):
> Time passes. A new requirement appears for which the current abstraction is almost perfect. Programmer B gets tasked to implement this requirement. Programmer B feels honor-bound to retain the existing abstraction, but since isn’t exactly the same for every case, they alter the code to take a parameter.... ... Loop until code becomes incomprehensible. You appear in the story about here, and your life takes a dramatic turn for the worse.
  
### [Falsehoods Programmers Believe About Names](https://www.kalzumeus.com/2010/06/17/falsehoods-programmers-believe-about-names/):

### [The Hiring Post](https://sockpuppet.org/blog/2015/03/06/the-hiring-post/):
> Nothing in Alex’s background offered a hint that this would happen. He had Walter White’s resume, but Heisenberg’s aptitude. None of us saw it coming. My name is Thomas Ptacek and I endorse this terrible pun. Alex was the one who nonced.

> A few years ago, Matasano couldn’t have hired Alex, because we relied on interviews and resumes to hire. Then we made some changes, and became a machine that spotted and recruited people like Alex: line of business .NET developers at insurance companies who pulled Rails core CVEs out of their first hour looking at the code. Sysadmins who hardware-reversed assembly firmware for phone chipsets. Epiphany: the talent is out there, but you can’t find it on a resume.

> Our field selects engineers using a process that is worse than reading chicken entrails. Like interviews, poultry intestine has little to tell you about whether to hire someone. But they’re a more pleasant eating experience than a lunch interview.
  
### [The Product-Minded Engineer](https://blog.pragmaticengineer.com/the-product-minded-engineer/):
> Proactive with product ideas/opinions • Interest in the business, user behavior and data on this • Curiosity and a keen interest in “why?” • Strong communicators and great relationships with non-engineers • Offering product/engineering tradeoffs upfront • Pragmatic handling of edge cases • Quick product validation cycles • End-to-end product feature ownership • Strong product instincts through repeated cycles of learning
  
### [Write code that is easy to delete, not easy to extend](https://programmingisterrible.com/post/139222674273/write-code-that-is-easy-to-delete-not-easy-to):
> If we see ‘lines of code’ as ‘lines spent’, then when we delete lines of code, we are lowering the cost of maintenance. Instead of building re-usable software, we should try to build disposable software.

> Business logic is code characterised by a never ending series of edge cases and quick and dirty hacks. This is fine. I am ok with this. Other styles like ‘game code’, or ‘founder code’ are the same thing: cutting corners to save a considerable amount of time.

> The reason? Sometimes it’s easier to delete one big mistake than try to delete 18 smaller interleaved mistakes. A lot of programming is exploratory, and it’s quicker to get it wrong a few times and iterate than think to get it right first time.

### [The Law of Leaky Abstractions](https://www.joelonsoftware.com/2002/11/11/the-law-of-leaky-abstractions/):
> Back to TCP. Earlier for the sake of simplicity I told a little fib, and some of you have steam coming out of your ears by now because this fib is driving you crazy. I said that TCP guarantees that your message will arrive. It doesn’t, actually. If your pet snake has chewed through the network cable leading to your computer, and no IP packets can get through, then TCP can’t do anything about it and your message doesn’t arrive. If you were curt with the system administrators in your company and they punished you by plugging you into an overloaded hub, only some of your IP packets will get through, and TCP will work, but everything will be really slow.

> This is what I call a leaky abstraction. TCP attempts to provide a complete abstraction of an underlying unreliable network, but sometimes, the network leaks through the abstraction and you feel the things that the abstraction can’t quite protect you from. This is but one example of what I’ve dubbed the Law of Leaky Abstractions:

> **All non-trivial abstractions, to some degree, are leaky.**

> Abstractions fail. Sometimes a little, sometimes a lot. There’s leakage. Things go wrong. It happens all over the place when you have abstractions. Here are some examples.

### [Reflections on software performance](https://blog.nelhage.com/post/reflections-on-performance/):
> It’s probably fairly intuitive that users prefer faster software, and will have a better experience performing a given task if the tools are faster rather than slower.

> What is perhaps less apparent is that having faster tools changes how users use a tool or perform a task. Users almost always have multiple strategies available to pursue a goal — including deciding to work on something else entirely — and they will choose to use faster tools more and more frequently. Fast tools don’t just allow users to accomplish tasks faster; they allow users to accomplish entirely new types of tasks, in entirely new ways. I’ve seen this phenomenon clearly while working on both Sorbet and Livegrep:

### Brandur Leach’s series on using databases to ensure correct edge-case behavior: 

> I want to convince you that ACID databases are one of the most important tools in existence for ensuring maintainability and data correctness in big production systems. Lets start by digging into each of their namesake guarantees.

> There’s a surprising symmetry between an HTTP request and a database’s transaction. Just like the transaction, an HTTP request is a transactional unit of work – it’s got a clear beginning, end, and result. The client generally expects a request to execute atomically and will behave as if it will (although that of course varies based on implementation). Here we’ll look at an example service to see how HTTP requests and transactions apply nicely to one another.

> In APIs *idempotency* is a powerful concept. An idempotent endpoint is one that can be called any number of times while guaranteeing that the side effects will occur only once. In a messy world where clients and servers that may occasionally crash or have their connections drop partway through a request, it’s a huge help in making systems more robust to failure. Clients that are uncertain whether a request succeeded or failed can simply keep retrying it until they get a definitive response.

* [Building Robust Systems with ACID and Constraints](https://brandur.org/acid)
* [Using Atomic Transactions to Power an Idempotent API](https://brandur.org/http-transactions)
* [Transactionally Staged Job Drains in Postgres](https://brandur.org/job-drain
* [Implementing Stripe-like Idempotency Keys in Postgres](https://brandur.org/idempotency-keys):

### [End-to-End Arguments in System Design](http://web.mit.edu/Saltzer/www/publications/endtoend/endtoend.pdf):
> This paper presents a design principle that helps guide placement of functions among the modules of a distributed computer system. The principle, called the end-to-end argument, suggests that functions placed at low levels of a system may be redundant or of little value when compared with the cost of providing them at that low level. Examples discussed in the paper include bit error recovery, security using encryption, duplicate message suppression, recovery from system crashes, and delivery acknowledgement. Low level mechanisms to support these functions are justified only as performance enhancements.
  
### [Inventing on Principle](https://vimeo.com/36579366):
> I’ve spent a lot of time over the years making creative tools, using creative tools, thinking about them a lot, and here’s something I’ve come to believe: Creators need an immediate connection to what they’re creating.
