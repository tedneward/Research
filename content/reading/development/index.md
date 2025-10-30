title=Software reading
tags=reading, language, tool, library, vm, architecture
summary=A collection of links and articles on software development.
~~~~~~

[Competitive Programmer's Handbook](https://cses.fi/book/book.pdf) (Not sure where else this belongs.)

[Computer Science Education](https://github.com/ossu/computer-science)

[Why Engineers Should Invest in Decision Making Skills Early](https://www.reforge.com/blog/technical-decision-making): "... to make more successful technical calls and advance careers, engineers actually need to develop better strategic decision-making skills — not just technical execution skills. In fact, an over-reliance on technical execution skills early in a career leads to untapped impact and stalled growth opportunities down the road."

["Education of a Programmer"](https://terrycrowley.medium.com/education-of-a-programmer-aaecf2d35312): "When I left Microsoft in October 2016 after almost 21 years there and almost 35 years in the industry, I took some time to reflect on what I had learned over all those years. This is a lightly edited version of that post."

["My guiding principles after 20 years of programming"](https://alexewerlof.medium.com/my-guiding-principles-after-20-years-of-programming-a087dc55596c): 
1. Don’t fight the tools: libraries, language, platform, etc. Use as much native constructs as possible. Don’t bend the technology, but don’t bend the problem either. Pick the right tool for the job or you’ll have to find the right job for the tool you got.
2. You don’t write the code for the machines, you write it for your colleagues and your future self (unless it’s a throw away project or you’re writing assembly). Write it for the junior ones as a reference.
3. Any significant and rewarding piece of software is the result of collaboration. Communicate effectively and collaborate openly. Trust others and earn their trust. Respect people more than code. Lead by example. Convert your followers to leaders.
4. Divide and conquer. Write isolated modules with separate concerns which are loosely coupled. Test each part separately and together. Keep the tests close to reality but test the edge cases too.
5. Deprecate yourself. Don’t be the go-to person for the code. Optimize it for people to find their way fixing bugs and adding features to the code. Free yourself to move on to the next project/company. Don’t own the code or you’ll never grow beyond that.
6. Security comes in layers: each layer needs to be assessed individually but also in relation to the whole. Risk is a business decision and has direct relation to vulnerability and probability. Each product/organization has a different risk appetite (the risk they are willing to take for a bigger win). Often these 3 concerns fight with each other: UX, Security, Performance.
7. Realize that every code has a life cycle and will die. Sometimes it dies in its infancy before seeing the light of production. Be OK with letting go. Know the difference between 4 categories of features and where to put your time and energy:
    * Core: like an engine in a car. The product is meaningless without it.
    * Necessary: like a car’s spare wheel. It’s rarely used but when needed, its function decides the success of the system.
    * Added value: like a car’s cup-holder. It’s nice to have but the product is perfectly usable without it.
    * Unique Selling Point: the main reason people should buy your product instead of your rivals. For example, your car is the best off-road vehicle.
8. Don’t attach your identity to your code. Don’t attach anyone’s identity to their code. Realize that people are separate from the artifacts they produce. Don’t take code criticism personally but be very careful when criticizing others’ code.
9. Tech debt is like fast food. Occasionally it’s acceptable but if you get used to it, it’ll kill the product faster than you think (and in a painful way).
10. When making decisions about the solution all things equal, go for this priority: **Security > Reliability > Usability (Accessibility & UX) > Maintainability > Simplicity (Developer experience/DX) > Brevity (code length) > Finance > Performance** But don’t follow that blindly because it is dependent on the nature of the product. Like any career, the more experience you earn, the more you can find the right balance for each given situation. For example, when designing a game engine, performance has the highest priority, but when creating a banking app, security is the most important factor.
11. Bugs’ genitals are called copy & paste. That’s how they reproduce. Always read what you copy, always audit what you import. Bugs take shelter in complexity. “Magic” is fine in my dependency but not in my code.
12. Don’t only write code for the happy scenario. Write good errors that answer why it happened, how it was detected and what can be done to resolve it. Validate all system input (including user input): fail early but recover from errors whenever possible. Assume the user hold a gun: put enough effort into your errors to convince them to shoot something other than your head!
13. Don’t use dependencies unless the cost of importing, maintaining, dealing with their edge cases/bugs and refactoring when they don’t satisfy the needs is significantly less than the code that you own.
14. Stay clear from hype-driven development. But learn all you can. Always have pet projects.
15. Get out of your comfort zone. Learn every day. Teach what you learn. If you’re the master, you’re not learning. Expose yourself to other languages, technologies, culture and stay curious.
16. Good code doesn’t need documentation, great code is well documented so that anyone who hasn’t been part of the evolution, trial & error process and requirements that led to the current status can be productive with it. An undocumented feature is a non-existing feature. A non-existing feature shouldn’t have code.
17. Avoid overriding, inheritance and implicit smartness as much as possible. Write pure functions. They are easier to test and reason about. Any function that’s not pure should be a class. Any code construct that has a different function, should have a different name.
18. Never start coding (making a solution) unless you fully understand the problem. It’s very normal to spend more time listening and reading than typing code. Understand the domain before starting to code. A problem is like a maze. You need to progressively go through the code-test-improve cycle and explore the problem space till you reach the end.
19. Don’t solve a problem that doesn’t exist. Don’t do speculative programming. Only make the code extensible if it is a validated assumption that it’ll be extended. Chances are by the time it gets extended, the problem definition looks different from when you wrote the code. Don’t overengineer: focus on solving the problem at hand and an effective solution implemented in an efficient manner.
20. Software is more fun when it’s made together. Build a sustainable community. Listen. Inspire. Learn. Share.

"Junior engineer: Take this tightly defined feature & build it
Mid-level engineer: Take this vaguely defined feature & build it
Senior engineer: Take this known problem & figure out how to solve it
Staff engineer: Take this goal & find the problems we should be solving." --[@ZainRzv](https://twitter.com/ZainRzv/status/1502550200396750851)

---

["Questions for a new technology."](https://kellanem.com/notes/new-tech):

1. What problem are we trying to solve? (Tech should never be introduced as an end to itself)

2. How could we solve the problem with our current tech stack? (If the answer is we can’t, then we probably haven’t thought about the problem deeply enough)

3. Are we clear on what new costs we are taking on with the new technology? (monitoring, training, cognitive load, etc)

4. What about our current stack makes solving this problem in a cost-effective manner (in terms of money, people or time) difficult?

5. If this new tech is a replacement for something we currently do, are we committed to moving everything to this new technology in the future? Or are we proliferating multiple solutions to the same problem? (aka “Will this solution kill and eat the solution that it replaces?”)

6. Who do we know and trust who uses this tech? Have we talked to them about it? What did they say about it? What don’t they like about it? (if they don’t hate it, they haven’t used it in depth yet)

7. What’s a low risk way to get started?

8. Have you gotten a mixed discipline group of senior folks together and thrashed out each of the above points? Where is that documented?

