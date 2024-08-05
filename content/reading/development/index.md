title=Reading in software
tags=reading, language, tool, library, vm, architecture
summary=A collection of links and articles on software and development.
~~~~~~

[Pair Programming Guide](https://tuple.app/pair-programming-guide/), including the [Pair Programming Antipatterns](https://tuple.app/pair-programming-guide/antipatterns)

["The 'tag team': tools, tasks and roles in collaborative software development"](https://salfreudenberg.wordpress.com/2017/03/26/the-tag-team-tools-tasks-and-roles-in-collaborative-software-development/) ([PDF](https://salfreudenberg.files.wordpress.com/2017/03/finalthesis.pdf))

["28 Sprint Anti-Patterns"](https://age-of-product.com/sprint-anti-patterns/)

[Competitive Programmer's Handbook](https://cses.fi/book/book.pdf) (Not sure where else this belongs.)

[Computer Science Education](https://github.com/ossu/computer-science)

Using RFCs internally for decision-making:

* [Bring Back the RFCs](https://medium.com/better-programming/bring-back-the-rfcs-afda4f332ee)
* [6 Lessons I learned while implementing technical RFCs as a decision making tool](https://buriti.ca/6-lessons-i-learned-while-implementing-technical-rfcs-as-a-management-tool-34687dbf46cb)
    - "Process is what I *(author is a VP of Engineering)* ship"
    - Deciding when to RFC is difficult. You should write an RFC if you:
        - are building something from scratch. New endpoint, component, system, library, application, etc.
        - the need rewrite has crossed your mind
        - will impact more than one system or other team members.
        - would like to define a contract or interface between clients or systems.
        - are adding a new dependency.
        - are adding or replacing languages or tools to the stack
        - are in doubt of whether you should write one
    - Inclusion requires responsibility. If you want to be included, you must participate.
    - Trust issues become more evident
    - Power dynamics can be managed
    - The newbie tag enables psychological safety *(by convention; a tag of "[newbie]" indicated that its author is coming from a vulnerable place)
    - Engineering leadership can participate at right level of abstraction

* [Scaling Engineering Teams via RFCs: Writing Things Down](https://blog.pragmaticengineer.com/scaling-engineering-teams-via-writing-things-down-rfcs/)
    "When working at large companies like Microsoft or smaller ones like Skyscanner, there have been two things related to planning that have always bugged me. First, the lack of visibility on others building or having built the same thing as my team. Second, the tech and architecture debt accumulated due to different teams building things very differently, both approach-wise and quality-wise. ... What if I said there is a way to tackle both these issues pretty well, using a few simple steps? A word of warning, one of the steps will sound a little crazy. Here they are:

    * Do planning before building something new. This can be in-person whiteboarding or just talking it through with the team members, as long as you're all clear on how you will get things done.
    * Capture this plan in a short, written document. Once it is clear to the team how and what you do, it should be relatively quick to write down the "how". Don't go overboard.
    * Have a few, select people approve this plan before starting work. Similar to how it's a good quality gate to only merge a pull request after someone does a review on it, it makes a huge difference if before starting work on a project, a few, relevant people validate the planned work. These can be senior engineers, people on a team who will use the feature and so on.
    * Send this planning document out to all engineers in the company and let anyone and everyone comment on it. Yes, this the step that probably sounds crazy.
    * Have everyone follow the above steps for every project that is beyond some super trivial complexity and iterate on a lightweight, RFC-like process so it works well for your org or company.

    "As unlikely it might sound, the above process both works and scales really well, from a handful of engineers to teams of thousands. It addresses not only issues on visibility or reducing tech/architecture debt, but also spreading knowledge and having engineers be more engaged day to day. This is the one, simple process I recommend any small or medium tech team to do, especially if they are in a growth phase. It's also the process we've successfully used and iterated on at Uber, going from tens of engineers to a couple of thousand ones.

    "The part of sending out the plan on how this project will be built, to all the engineering organization, via email, is something that can sound crazy. People often worry about this creating a lot of noise. This is both true and not. The noise levels will definitely increase. Thankfully, email filters are easy to create - just make it easy to filter for these kinds of emails. At the same time, there are a lot less project plans being sent out, even with an engineering size in the hundreds or thousands, than people typically expect.

    "The type of information pushed to people in an organization shapes the culture considerably. Having an organization with a culture to push engineering plans to everyone - for example, via email - and invite anyone to comment sets a tone of trust and responsibility. During my first few months at Uber, I used to obsess on reading planning docs from a variety of teams, chiming into ones where I had relevant domain knowledge e.g. on the technology. In these first few months, I learned a lot more about what other teams worked on, than I did in years working at a large company where this information was not visible. To this day, I still look through plans that teams make, getting a sense of what is going on outside my little bubble.

    "Finally, allowing anyone and everyone to chime in is a key part of keeping a consistent engineering bar across the organization. At Uber, I have seen multiple cases of people on one side of the organization realize that another team on the other side of the organization is planning to do something similar to what they have done, but with a very different approach, often with a different quality bar. For example, a US team building a new feature might have not considered other parts of the world and a team in India pointing out gaps in their localization approach. The teams having transparency, self-balancing and self-correction happens quite naturally."
* [Design Docs at Google](/architecture/design-docs)
* [Making technical decisions using RFCs](https://eltonminetto.dev/en/post/2021-05-22-rfc/)
* [A Structured RFC Process](https://philcalcado.com/2018/11/19/a_structured_rfc_process.html)
* [ADRs](/architecture/adr)

---

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

