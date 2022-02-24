title=Team Topologies
tags=reading, management, organizational design
summary=Organizing business and technology teams for fast flow.
~~~~~~

*(by Skelton, Pais; ISBN 978-1942788812)* [Infographic](../TeamTopologiesInfographic.pdf) ([Source](https://yoan-thirion.gitbook.io/knowledge-base/xtrem-reading/resources/book-notes/team-topologies))

Summary:

* Use the Inverse Conway: Whereby an organisation focuses on organising team structures to match the architecture they want the system to exhibit, rather than expecting teams to follow a mandated architecture design.

* Minimise Extraneous Team Cognitive Load so that teams can focus on the work that really matters.

* The four-team topologies, interaction modes and effective software boundaries will help improve the flow of value.

    ![](/reading/management/TeamTopologiesTeamStructures.png)

# Preface

Teams are always a work in progress.

Ideally teams should be long-lived, autonomous (*not* isolated), with engaged team members.

Team interactions need to evolve over time to support the distinct phases of discovery and execution that products and technology go through during their lifetimes.

(This book) is not a universal formula for building and running software systems successfully. (This book) is meant to provide clear patterns. *(Orchestra/band analogy; these patterns are "printed music".)*

***Key Influences that Informed This Book***
First, we assume that an organization is a sociotechnical system or ecosystem that is shaped by the interaction of individuals and the teams within it; in other words, that an organization is the interaction between people and technology. In this aspect, the book fits with ideas from the fields of cybernetics, system thinking, and approaches such as the Cynefin framework for assessing domain complexity. *(From HBR 2007, ["A Leader's Framework for Decision Making"](https://hbr.org/2007/11/a-leaders-framework-for-decision-making))*

Second, we assume that "the team" is something that behaves differently from a mere collection of individuals, and that the team should be nurtured and supported in its evolution and operation.

Third, we assume that Conway's Law (or a variant of it) is a strong driver of software product shape and that organizations would benefit from explicitly addressing the implications of this law.

# Part I: Teams As the Means of Delivery

Key Takeaways:

Chapter 1

* Conway's law suggests minor gains from designing software architectures and team interactions together, since they are similar forces.
* Team Topologies clarifies team purpose and responsibilities, increasing the effectiveness of their interrelationships.
* Team Topologies takes a humanistic approach to building software systems while setting up organizations for strategic adaptability.

Chapter 2

* Organizations are constrained to produce designs that reflect communication paths.
* The design of the organization constrains the "solution search space," limiting possible software designs.
* Requiring everyone to communicate with everyone else is a recipe for a mess.
* Choose software architectures that encourage team-scoped flow.
* Limiting communication paths to well-defined team interactions produces modular, decoupled systems.

Chapter 3

* The team is the most effective means of software delivery, not individuals.
* Limit the size of multi-team groupins within the organization based on Dunbar's number.
* Restrict team responsibilities to match the maximum team cognitive level.
* Establish clear boundaries of responsibility for teens.
* Change the team working environment to help teams succeed.

## Chapter 1 - The Problem with Org Charts

Tech teams build software, software runs the world, and building software is a team activity. Despite this, many orgs are organizing their teams in counterproductive ways. Good news is that it is possible to be fast and safe with the right mindset and with tools that emphasize adaptability and repeatability, while putting teams and people at the center. *We must shift our thinking from treating teams as collections of commodity people following "correct" processes using "right" tools, to treating people and technology as a single human/computer carbon/silicon sociotechnical ecosystem.*

Obstacles to Fast Flow:

* Pushing against Conway's Law
* Disengaged teams
* Too Many Surprises
* Flow is Blocked
* Painful re-org every few years
* Team pulled in many directions
* Confusing org design options
* Software too big for teams

### Communication Structures of an Organization

The org chart: a single view of an org's teams, depicting the teams, departments, units, and other org entities, as well as how they relate to each other (typically hierarchically). In a highly collaborative environment, relying on the org chart as the principal mechanism of splitting the work leads to unrealistic expectations. *We need to rely on decoupled, long-lived teams that can collaborate effectively to meet the challenges of balancing speed and safety.* Actual people-to-people communication lines look quite different from org chart lines.

### Org Chart Thinking is the Problem

Orgs need to develop more realistic pictures of the expected and actual commnication happening between individuals and teams. Decisions based on org-chart structure tend to optimize for only a part of the org, ignoring upstream/downstream effects; the impact might be tiny if there are larger bottlenecks.

> Example: having teams adopting cloud and infrastructure-as-code can reduce the time to provision new infrastructure from weeks or months to minutes or hours. But if every change requires deployment (to production) approval from a board that meets once a week, then delivery speed will remain weekly at best.

Systems thinking focuses on optimizing for the whole. Team Topologies focuses on how to set up dynamic team structures and interaction modes that can help teams adapt quickly.

An org chart is always out of sync with reality.

### Beyond the Org Chart

If org charts aren't accurate, what is?

1. Formal structure (org chart): facilitates compliance
2. Informal structure: the "realm of influence" between individuals
3. Value creation structure: how work actually gets done based on inter-personal and inter-team reputation

The key to successful knowledge work organizations is in the interactions between the informal structure and the value creation structure (that is, the interactions between people and teams). By empowering teams, and treating them as fundamental building blocks, individuals inside those teams move closer together to act as a team rather than just a group of people. By explicitly agreeing on interaction modes with other teams, expectations on behaviors become clearer and inter-team trust grows. *The Team topologies approach adds the dynamic and sensing aspects required for technology orgs that are missing from traditional org design.*

It is increasingly clear that relying on a single, static org structure is untenable for effective outcomes with modern software systems. What is needed is a model that is adaptable to the current situation--one that takes into consideration how teams grow and interact with each other.

Naomi Stanford lists five rules of thumb for designing organizations:

1. Design when there is a compelling reason.
2. Develop options for deciding on a design.
3. Choose the right time to design.
4. Look for clues that things are out of alignment.
5. Stay alert to the future.

### A New Way of Thinking About Teams

Four fundamental team types: *stream-aligned*, *platform*, *enabling*, and *complicated-subsystem*

Three core team interaction models: *collaboration*, *X-as-a-Service*, and *facilitating*

Combine with awareness-of-Conway's-Law, team cognitive load, and how to become a sensing organization.

"By emphasizing an adaptive model for organization design and actively prioritizing the interrelationship of teams, the Team Topologies approach provides a key technology-agnostic mechanism for modern software-intensive enterprises to sense when a change in strategy is required (either frmo a business or technology viewpoint). The end goal is to help teams produce software that aligns with customer needs and is easier to build, run, and own. ... [It] also emphasizes a humanistic approach to designing and building software systems. It sees the team as an indivisible element of software delivery and acknowledges that teams have a finite capacity that needs to be respected. Together with the dynamic team design solidly grounded on Conway's Law, Team Topologies becomes a strategic tool for solution discovery."

### The Revivial of Conway's Law

Conway's Law: "Organizations which design systems... are constrained to produce designs which are copies of the communication structures of these organizations." Eric Raymond, *New Hacker's Dictionary*: "If you have four groups working on a compiler, you'll get a 4-pass compiler."

> ***Team structures must match the required software architecture or risk producing unintended designs.***

Inverse Conway maneuver: An organization focuses on organizing team structures to match the architecture they want the system to exhibit rather than expecting teams to follow a mandated architecture design. *Thinking of software architecture as a standalone concept that can be designed in isolation and then implemented by any group of teams is fundamentally wrong. ... That is why monoliths (in particular, any indivisible software part that exceeds the cognitive capacity of any one team) need to be broken down while keeping team focus.

### Cognitive Load and Bottlenecks

Cognitive load: the limit on how much info any one person can hold in their brains at any given moment.

We hardly ever discuss cognitive load when assigning responsibilities or software parts to a given team. When we don't, teams are spread thin trying to cover an excessive amount of responsibilities and domains. Such a team lacks bandwidth to pursue mastery and struggles to switch contexts. The number of services and components for which a product team is responsible (the demand on the team) keeps growing over time, but the development of new services is often planned as if the team had full-time availability and zero cognitive load. We need to put the team first, advocating for restricting their cognitive loads.

Team Topologies approach advocates for org design that optimizes for *flow of change* and feedback from running systems. This requires restricting cognitive load on teams and explicitly designing the intercommunications between them to help produce the software-systems architecture that we need.

## Chapter 2 - Conway’s Law and Why It Matters

*(Chapter opens by offering up some examples and citations as proof of the veracity of Conway's Law)*

### Understanding and Using Conway's Law

Ruth Malan: "If the architecture of the system and the architecture of the organization are at odds, the architecture of the organization wins."

In particular, an org that is arranged in functional silos (such as QA, DBA, security) is unlikely to ever produce software systems that are well-architected for end-to-end flow. Similarly, an org that is arranged primarily around sales channels for different geographic regions is unlikely to produce effective software architecture that provides multiple different software services to all global regions.

Why are orgs unlikely to discover/sustain certain architectures? Conway: "Given any [particular] team organization, there is a class of design alternatives which cannot be effectively pursued by such an organization because the necessary communication paths do not exist." Comm paths effectively restrict the kinds of solutions that an organization can devise. Use this to our strategic advantage: If we want to discourage certain kinds of designs, we can reshape the organization to avoid this.

### The Reverse Conway Maneuver

*(Examples of how team orgs influence architecture; if that is what we want, "all is well")*

### Software Architectures that Encourage Team-Scoped Flow

Mike Nygard: "Team assignments are the first draft of the architecture."

Need to consider team-scoped flow and design the architecture to fit; the fundamental means of delivery is the team, so the system architecture needs to enable/encourage fast flow within each team:

* Loose coupling: components do not hold strong dependencies on other components
* High cohesion: components have clearly-bounded responsibilities, and their internal elements are strongly related
* Clear version compatibility
* Clear cross-team testing

Instead of a series of interconnected components, we should be designing flows on top of an underlying platform.

### Org Design Requires Tech Expertise

Anyone who makes decisions about shape/placement of engineering teams is strongly influencing architecture; Ruth Malan: "If we have managers deciding... which services will be built, by which teams, we implicitly have managers deciding on the system architecture." Org design and software design are two sides of the same coin, and both need to be undertaken by the same informed group of people.

### Restrict Unnecessary Communication

*One key implication of Conway's Law is that not all communication and collaboration is good.* It is important to define "team interfaces" to set expectations around what kind of work requires strong collaboration and what doesn't. What we need is focused communication between specific teams. If an API team and its consumers are communicating, is the API not good enough? If we can achieve low- or zero-bandwidth communication between teams and still build/release in a safe/effective/rapid way, we should.

*(Good Fences Make Good Neighbors!)*

Ways to restrict communication:

* Move two teams to different parts of the office, different floors, or different buildings
* Remote teams means we should be able to monitor volume/patterns of the team-to-team communications

If a large team regularly deals with two separate areas of the system, it can be useful to split this team into two smaller, dedicated, teams (although only if it's the same team members who work on different systems).

Sometimes two+ teams feel the need to communicate b/c the code for their parts of the system is in the same VCS or is part of the same application/service, whereas logically, it should be separate. *(THOUGHT: What about "library" components? I firmly believe the process boundary shouldn't matter here, only the nature of the thickness of the component boundary itself.)*

### Everyone Does Not Need to Communicate with Everyone

If the org has an expectation that everyone needs to communicate with everyone to accomplish something, we have an org design problem; Conway's Law suggests that this kind of many-to-many communication will produce monolithic, tangled, highly-coupled, interdependent systems that do not support fast flow.

## Beware: Naive uses of Conway's Law

There's a couple ways to misinterpret Conway's Law and have the opposite of the desired effect.

### Tool Choices Drive Communication Patterns

The way in which teams use software communication tools can have a strong influence on comm patterns. A common problem in orgs is a mismatch between the responsibility boundaries for teams/departments and those for tools. Sometimes an org has multiple tools when a single one (providing a common, shared view) should be used; other times, a single tool is used when teams need separation. When responsibility boundaries between two teams do not overlap (teams without much need to collaborate), we will not get much value from insisting on the same tool. Have separate tools for independent teams, and use shared tools for collaborative teams.

> TIP: **Make information visible while keeping security in place.** Don't give team members access to prod; ship the data they need to a less-sensitive location. Make sure that data still remains secure, though.

Don't select a single tool for the whole org without considering team inter-relationships first. Have separate tools for independent teams; use shared tools for collaborative teams.

### Many Different Component Teams

Component teams--better called complicated-subsystem teams--are only needed for exceptional cases; we need to optimize for fast flow, so stream-aligned teams are preferred.

### Repeated Reorganizations that Create Fiefdoms or Reduce Headcount

Some reorgs aim to reduce staff or create fiefdoms for managers/leaders. Organizing along Conway's Law is mutually exclusive to that kind of reorg. With software and "product" companies, structure should anticipate product architecture. Combined with a team-first approach, regular reorganizations for management reasons should become a thing of the past.

## Chapter 3 - Team-First Thinking

Driskell and Salas found that teams working as a cohesive unit perform far better than collections of individuals for knowledge-rich, problem-solving tasks that require high amounts of information. Even the US Army has adopted the team as the fundamental unit of operation: McChrystal notes that the best-performing teams "accomplish remarkable feats not simply because of the individual qualifications of their members but because those members coalesce intoa single organism."

There are multiple aspects to consider around teams as the unit for effective software delivery:

### Use Small, Long-Lived Teams as the Standard

#### Smaller Size Fosters Trust

Dunbar's numbers: 5, 15, 50, 150

* 5: limit of people with whom we can hold close personal relationships and working memory
* 15: limit of peopel with whom we can experience deep trust
* 50: limit of people with whom we can have mutual trust
* 150: limit of people whose capabilities we can remember

Teams are "stable group of 5 to 9 who work towards a shared goal as a unit. Forming a team takes from 2 weeks to 3 months. Stable teams, not static. In high trust orgs, it is ok to change teams once a year. In a typical org, 2 years.

Orgs can be composed from Dunbar-compatible groupings of these sizes; when a limit is reached, split off another unit as a semi-independent grouping

Every part of the SW system needs to be owned by exactly one team. Team members need a team first mindset: Put the needs of the team above your own. Embrace diversity. Reward the whole team, not individuals. Assign training budgets to the whole team and let them decide.

3 Types of cognitive load (the total amount of mental effort being used in the working memory (John Sweller)):

* Intrinsic: Fundamentals of the problem space. Example: programming language.
* Extraneous: Environment related. Example: how to deploy.
* Germane: Special attention is required. Value adding. Example: business domain.

Minimize intrinsic, eliminate extraneous to leave room for germane. To measure cognitive load, ask the team: Do you feel like you are effective and able to respond in a timely fashion to the work you are asked to do?

Heuristics; 3 types of domain:

* Simple.
* Complicated.
* Complex.

Each domain to one team. If domain is too big, split into subdomains. One team, either: 2-3 simple domains; 1 complex domain. Avoid 2 complicated domains, better split the team.

Define a Team API:

* Code: endpoints, libraries, clients, …
* Versioning.
* Documentation.
* Practices and principles.
* Communication tools.
* Work information: what is working on now, next and future.
* Consider the Team API for usability point of other teams.

Provide team, space, and money for guilds and communities of practice.

Design Physical and Virtual environment for:

* Focused individual work.
* Collaborative intra-team.
* Collaborative inter-team.

### 

# Part II: Team Topologies that Work for Flow

Chapter 4

Chapter 5

Chapter 6

## Chapter 4 - Static Team Topologies

## Chapter 5 - The Four Fundamental Team Topologies

## Chapter 6 - Choose Team-First Boundaries

# Part III: Evolving Team Interactions for Innovation and Rapid Delivery

Chapter 7

Chapter 8

Chapter 9

## Chapter 7 - Team Interaction Modes

## Chapter 8 - Evolve Team Structures with Organizational Sensing

## Chapter 9 - Conclusion

# Bibliography

* Improving Performance: How to manage the White Space on the Organization Chart (Geary Rummler, Alan Brache)
* Project to Product (Mik Kersten)
* Organize for Complexity (Niels Pflaeging)
* Holacracy (Brian Robertson)
* Reinventing Organizations (Frederic Laloux)
* Guide to Organisation Design: Creating High-Performing and Adaptable Enterprises (Naomi Stanford)
* "How do Committees Invent?", Datamation (Mel Conway, 1968)
* Accelerate: The Science of DevOps (Nicole Ferguson, Jez Humble, Gene Kim)
* The Modern Firm (John Roberts)
* The Principles of Product Development Flow (Don Reinertsen)
* Team of Teams (Gen Stanley McChrystal)
