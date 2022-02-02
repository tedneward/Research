title=An Elegant Puzzle
tags=reading, management, books
summary=Systems of engineering management.
~~~~~~
*(by Will Larson)*

# 2. Organizations

An organization is a collection of people working toward a shared goal. ... When I have a problem that I want to solve quickly and cheaply, I start thinking about process design. A problem I want to solve permanently and we have time to go slow? That's a good time to evolve your culture. If process is too weak a force, and culture too slow, then organizational design lives between those two.

* **Sizing teams**: The fundamental challenge of organizational design is sizing teams. **An important property of teams is that they abstract the complexities of the individuals that compose them.**
    - Managers should support six to eight engineers. 
        - Managers supporting less than four engineers tend to function as Tech Lead Managers (TLMs), taking on a share of design/implementation work. (It's a role with limited career opportunities; to progress as a manager, they'll want more time to focus on developing their mgmt chops, but to progress towards higher IC roles, they'll need time to focus on technical details.) 
        - Managers supporting more than eight engineers typically act as coaches/safety nets. Too busy to actively invest in their team or the team's responsibilities.
    - Managers-of-managers should support four to six engineers.
        - Managers supporting fewer than four other managers should be in a position of active learning on either the problem domain or transitioning fro supporting engineers to supporting managers.
        - Supporting a large team of managers means functioning purely as a problem-solving coach.
    - Two-tier 24/7 on-call support requires eight engineers. Shared rotations are a bad long-term idea--most folks find being on-call for components that they don't know is stressful.
    - Small teams (fewer than four) are not teams. Too leaky an abstraction--to reason about a small team's delivery, you have to know about each on-call shift, vacation, interruption, etc. Too fragile (one departure wrecks the team).
    - Keep innovation and maintenance together. Avoids creating a two-tiered class system of innovators and maintainers.
    - Playbook:
        * Teams should be 6 - 8 during steady state.
        * To create a new team, grow an existing team to eight to ten, then bud into two teams of four or five.
        * Never create empty teams.
        * Never leave managers supporting more than eight individuals.
* **Staying on the path to high-performing teams**
    * Four states of a team
        * *Falling behind*: each week their backlog is longer than it was the week before.
        * *Treading water*: they're able to get their critical work done, but are not able to start paying down tech debt or begin major new projects.
        * *Repaying debt*: they're able to start paying down tech debt, and are beginning to benefit from the debt repayment snowball (each piece of debt you repay leads to more time to repay more debt).
        * *Innovating*: their tech debt is sustainable low, morale is high, and the majority of work is satisfying new user needs.

        Teams want to climb from *falling behind* to *innovating*, while entropy drags them backward. Each state requires a different tact.
    * System fixes and tactical support
        * *Falling behind*: system fix: hire more (net new/external-sourced) people until the team moves into treading water. Tactical support: setting expectations with users, beating the drum around the easy wins you can find, and injecting optimism. 
        * *Treading water*: system fix: consolidate the team's efforts to finish more things, and to reduce concurrent work until they're able to begin repaying debt (limit work-in-progress). Tactical: help people transition from a personal view of productivity to a team view.
        * *Repaying debt*: system fix: add time--find space to allow the compounding value of paying down tech debt to grow. Tactical support: try to find way sto support your users while also repaying debt, to avoid disappearing from your users' perspective--stakeholders are antsy waiting for the team to start delivering new stuff, and your obligation is to prevent that impatience from causing a backslide.
        * *Innovating*: system fix: maintain enough slack in your team's schedule that the team can build quality into their work, operate continuously in innovation, and avoid backtracking. Tactical support: ensure that the work the team is doing is valued: ***the quickest path out of innovation is to be viewed as a team that builds science projects, which inevitably leads to the team being defunded.***
    
        These fixes are slow; this is because systems accumulate months or years of static, and you have to drain all that away; this also means these fixes are extremely durable once in effect.
    * Consolidate your efforts; prioritize one team at a time. Hire into one team, then move on to the next. Adding new individuals to a team disrupts that team's gelling process, so do rapid growth for the team followed by a consolidation period in which the team gels. The organization will never stop growing, but each team will.
* A case against top-down global optimization: can't we rotate team members around to other teams as each team repays its tech debt? *(Fungible resources!)* Bad idea.
    * Team first: sustained productivity comes from high-performing teams, and disassembling a high-performing team leads to a significant loss of productivity, even if the members are fully retained. *(Changing group membership changes group dynamics.)* 
    * Fixed costs: most teams have high fixed costs ("keeping the lights on" work, precommitted contracts, support questions from other teams, etc) and relatively small variable costs, so moving one person can shift an innovating team back into falling behind, and now neither team is doing particularly well.
    * Slack: The expected time to complete a new task approaches infinity as a team's utilization approaches 100%, and most teams have many dependencies on other teams; this means you can often slow a team down by shifting resources to it, because doing so creates new upstream constraints. Teams also put spare capacity to great use by improving areas within their aegis, in both incremental and novel ways. (Bonus: they tend to do these improvements with minimal coordination costs, such that the local productivity doesn't introduce a drag on the surrounding system.)
    * What *does* work: Shift scope; rotate. 
        Move scope between teams, preserving the teams themselves. Shifting scope works better than moving people because it avoids re-gelling costs, and it preserves system behavior (which keeps your mental model intact); can always revert a workload change with less disruption than would be caused by a staffing change.
        Rotate individuals for a fixed period into an area that needs help. The fixed duration allows them to retain their identity and membership in their current team, giving their full focus towards helping out, rather than splitting their focus between performing the work and finding membership in the new team. (Also a good way to measure the slack the team (the source team) really has!) 
* Productivity in the age of hypergrowth
    * More engineers, more problems. All real-world systems have some degree of inherent self-healing properties (an overloaded database will slow down enough that someone fixes it; overwhelmed employees will get slow at finishing work until someone finds a way to help); very few real-world systems have efficient and deliberate self-healing properties--productively integrating large numbers of engineers is hard. *(Measure onboarding time against size/growth-doubling time; if you're doubling every six months and it takes six to twelve months to ramp up, things get wonky.)* *(Also include interviewing time--including prep time, execution time, decision time, divided by the number of hires-to-interviews.)*
        1. For every additional order of magnitude of engineers, you need to design and maintain a new layer of management.
        2. For every ~10 engineers, you need an additional team, which requires more coordination.
        3. Each engineer means more commits and deployments per day, adding load to dev tools/toolchain.
        4. Most outages are caused by deployments, so more deployments => more outages => more incident management time, mitigations, and post-mortems.
        5. More engineers => more specialized teams and systems => require increasingly small on-call rotations so that your on-call engineers have enough system context to debug and resolve production issues. Relative time invested in on-call goes up. (Only trained engineers can go on-call, too.)

        This is where the "hiring is slowing us down" concern comes from. At high enough rates, the marginal added value of hiring gets very slow, especially if your training process is weak.

    * Systems survive one magnitude of growth:
        1. Most system-implemented systems are designed to support one or two orders of magnitude growth from the current load.
        2. If your traffic doubles every six months, then your load increases an order of magnitude every 18 months.
        3. The cardinality of supported systems increases over time as you add teams, and as "trivial" systems become "business-critical" and reach scaling plateaus.

        The real productivity killer is not system rewrites but the migrations that follow those rewrites; poorly-designed migrations expand the consequences of this rewrite loop from the individual teams supporting the systems to the entire surrounding organization. If each migration takes a week, each team is eight engineers, and you're doing four migrations a year, then you're losing about 1% of your company's total productivity. If each of those migrations takes a month, or if they are only possible for your small cadre of trained engineers the impact is far larger.
    * Ways to manage entropy: "you only get value from projects when they finish: to make progess, above all else, you must ensure that some of your projects finish." (from *The Phoenix Project*)
        - First time thief: hiring and training. Rotate people among these tasks.
        - Second time thief: ad hoc interruptions (taps on the shoulder, alerts from the on-call, high-volume email lists, etc). Funnel interruptions into an increasingly small area, and then automate as much as possible. Create a rotation for people who are available to answer questions, and train the team not to answer other forms of interruptions. Specific useful tool: ownership registry. Similar variant: ad-hoc meeting requests. Block out a few large chunks of time each week to focus. "One thing I've found at companies with very few interruptions: really great, consistently available documentation.
        - Most important opportunity is designing your software to be flexible: "fail open and layer policy".
        - Gatekeeper antipattern: having humans who perform gatekeeping activities creates very odd social dynamics, and is rarely a great use of a human's time. When at all possible, build systems with sufficient isolation that you can allow most actions to go forward. When they do fail, make sure that they fail with a limited blast radius. Treat gatekeeping as a significant implementation bug.
    * Closing thoughts
* Where to stash your organizational risk? Organizational debt: the organizational sibling of technical debt; represents things like biased interview processes and inequitable compensation mechanisms--systemic problems that are preventing your org from reaching its potential. Like tech debt, these risks linger because they are never the most pressing problem... until they are. There is a volatile subset of org debt most likely to come due--organizational risk (toxic team culture, toilsome fire drill, a struggling leader). These bubble up from your peers, skip-level 1:1s, and org health surveys. Identify a few areas to improve, ensure you're making progress on those, and give yourself permission to do the rest poorly. Work with your manager to write this up as an explicit plan and agree on what reasonable progress looks like. What do you do about the problems you can't address quickly? Keep them close; only delegate solvable risk. ***As an organizational leader, you'll always have a portfolio of risk, and you'll always be doing very badly at some things that are important to you. That's not only okay, it's unavoidable.*** 
* Succession planning: thinking through how the organization would function without you, documenting those gaps, and starting to fill them in.
    * What do you do? Like, literally, figure out what you do. Consider your work from several angles:
        * Examine the calendar and write down your role in meetings. Explicit (owning the meeting's agenda) and implicit (being the first person to champion others' ideas, being the diplomat to raise difficult concerns, etc).
        * Take second pass on calendar for non-meeting stuff, like interviewing and closing candidates.
        * Look back over the past six months for recurring processes, like roadmap planning, performance calibrations, or head count decisions, and document your role in each of those processes.
        * For each of the individuals you support, in which areas are your skills and actions most complementary to theirs? How do you help them? What do they rely on you for (authorization, advice navigating the org, experience in tech, ...)?
        * Audit inbound chats and emails for requests and questions coming your way.
        * If you keep a to-do list, look at the categories of the work you've completed over the last six months, as well as the stuff you've been wanting to do but keep putting off.
        * Think through external relationships that have been important for you in your current role. What kinds of folks ahve been important, and who are the strategic partners that someone needs to know?
    * Close the gaps
        * For each item on the list, try to identify the individual(s) who could readily take on that work. Cross those out.
        * For items without someone who is ready today, identify a handful of individuals who could potentially take it over.
        * Filter the remaining gaps down into two lists:
            1. The easiest gaps to close (just requiring a written doc or quick intro), such that you could close the gap in less than four hours.
            2. These are the riskiest gaps, and the areas where you're uniquely valuable to the company, where other folks are missing skills, and where getting the tasks done is truly important. Expect that closing one of these gaps to require ongoing effort over several months.
        
        Write up a plan to close all of the easy gaps and one or two of the riskiest gaps. Add it to your personal goals, congrats, you've completed a round of succession planning. (Try taking a 2- or 3-week vacation and see what falls through the cracks.)

# 3. Tools

This chapter provides a box of tools for managing change, both from the abstract chair of guiding change and form the more visceral role of serving as glue during periods of transition.

* **Introduction to systems thinking**

    * Stocks and flows: the links between events are often more subtle than they appear. We want to describe events causally but few events occur in a vacuum. Big changes appear to happen in a moment, closer examination reveals the big change is a slow accumulation of small changes. These accumulations are called *stocks*, and are the memory of changes over time. A stock might be the number of trained managers at the company.

        Changes to stocks are called *flows*: inflows or outflows. Taining a new manager is an inflow, and a departing trained manager is an outflow.

        The other relationship is an *information link*. This indicates that the value of a stock is a factor in the size of a flow.

        A stock outside of a diagram's scope will be represented as a cloud, indicating that something complex happened there that we're not currently exploring. It's best practice to label every flow; keep in mind that *every flow is a rate, and every stock is a quantity*.

        *(See [Dancoland](https://alexdanco.com/2021/08/21/dancoland/) and the Backpack of Knowledge)*

    * Developer velocity. *Accelerate: The Science of Lean Software and DevOp* suggests four measures of developer velocity:

        1. Delivery lead time: the time from the creation of code to its use in production.

        2. Deployment frequency: how often you deploy code.

        3. Change fail rate: how frequently changes fail.

        4. Time to restore service: the time spent recovering from defects.

        Modeling these into a system:

        * **Pull requests** are converted into **ready commits** based on our *code review rate*
        * **Ready commits** convert into **deployed commits** at *deploy rate*
        * **Deployed commits** convert into **incidents** at *defect rate*
        * **Incidents** are remediated into **reverted commits** at *recovery rate*
        * **Reverted commits** are debugged into new **pull requests** at *debug rate*

        Linking these pieces together we see a *feedback loop*--the system's downstream behavior impacts its upstream behavior; with a sufficiently high *defect rate* or slow *recovery rate*, you could easily see a world where each deploy leaves you even further behind.

        If your model is a good one, opportunities for improvement should be immediately obvious; however to truly identify where to invest, you need to identify the true values of these stocks and flows. (For example: if you don't have a backlog of **ready commits**, speeding up your *deploy rate* may not be valuable; if your *defect rate* is very low, then reducing your *recovery time* will have little impact.)

    * Model away. Once you start thinking about systems, it's hard to stop; pretty much any difficult problem is worth trying to represent as a system. Tools: Stella (gold standard but expensive), Insight Maker (quirky by donation-based payment).

* **Product management: exploration, selection, validation** Product management is an iterative elimination tournament, with each round consisting of _problem discovery_, _problem selection_, and _solution validation_.

    * Problem Discovery: Taking the time to evaluate which problem to solve is one of the best predictors of a team's long-term performance. Themes of analysis include _users pain_, _users purpose_, _benchmarking_, _competitive advantages_, _competitive moats_, and _compounding leverage_.
        
        * Moats represent a sustaining competitive advantage, which makes it possible for you to pursue offerings that others simply cannot.

        * Identify tasks that don't seem important enough to prioritize, but whose compounding value makes the work possible to prioritize.

    * Problem selection: To curate a problem portfolio, consider _what's needed to survive this round, the next round, and to win a round_, _different time frames_, _industry trends_, and _return on investment_. Disagreement about what to work on is often rooted in different assumptions about what time frame to optimize for. Usually people under-prioritize quick, easy wins.

    * Solution validation: Effective techniques include _writing a customer letter_, _identifying prior art_, _finding first users_, _experimenting_, _building cheaply_, and _ensuring low switching costs_. Prefer experimentation over analysis, as it's far easier to get good at cheaply validating than it is to get great at always picking the right solution.

* Visions and strategies: Strategies are grounded documents that explain trade-offs and actions to address a specific challenge. Visions are aspirational documents that enable individuals who don't work closely together to make decisions that fit together cleanly.

    * Strategy: An effective structure for good strategy has three sections: _diagnosis_, _policies_, and _actions_.The diagnosis describes the challenge, calling out the factors and constraints that define it. It is a very thorough problem statement. Policies describe the general approach you'll take to address the challenge. Bad guiding policies entrench the status quo, and good ones take a clear stance on competing goals. Actions are the steps to implement policies. Good actions make you feel both uncomfortable and hopeful, while bad actions shirk changing anything.

    * Vision: An effective vision helps people think beyond the constraints of their local maxima, and lightly aligns progress without tight centralized coordination. A good vision defines a _vision statement_, _value proposition_, _capabilities_, _solved constraints_, _future constraints_, _reference materials_, and a _narrative_. The _vision_statement_ is a one- or two-sentence aspirational statement to summarize the rest of the document. The _value proposition_ defines how you will be valuable to your users and to your company, and what kinds of success you will enable them to achieve. The _solved constraints_ explain what you're limited by today but will no longer be constrained by in the future. The _narrative_ is a one-page summary of everything that is easy to digest. This typically immediately follows the vision statement. A vision is succeeding when people reference it to make their own decisions, and is struggling when decisions keep happening that don't fit its direction.Have one vision for every distinct area. Having two articulated visions in one place is worse than having zero.

* Metrics and baselines: Good goals are a composition of four specific kinds of numbers: A _target_ states where you want to reach; a _baseline_ indicates where you are today; a _trend_ defines the current velocity; a _time frame_ sets bounds for the change. Investments describe a future state that you want to reach, and baselines describe aspects of the present that you want to preserve. Baseline metrics are useful for narrowing the solution space that you explore in order to accomplish your investment goals. Specify as few investment goals as possible, maybe three, and focus discussion on those. You should identify more baseline goals.

* Guilding broad organizational change

* Migrations

* Running an engineering reorg

* Identify your controls

* Career narratives

* The briefest of media trainings

* Model, document, and share

* Scaling consistency

* Presenting to senior leadership

* Time management

* Communities of learning

# 4. Approaches

# 5. Culture

# 6. Careers

# 7. Appendix

* Recommended reading/references list

    * Books

        * *Accelerate: The Science of Lean Software and DevOp* (by Forsgren, Kim, Humble)

        * *Thinking in Systems: A Primer* (Meadows)

    * Papers


---


### Chapter 3: Tools

#### 3.4: Metrics and baselines


#### 3.5: Guiding broad organizational change with metrics

* pg 78: Metrics can be an extremely effective way to lead change with little or no organizational authority.
* pg 79: First identify where the levers for change are, then dive deep on building a mental model around them.
* pg 79: Diving deep also kicks off a relationship between you and the teams who you'll want to partner with most closely.
* pg 79: Build a system of second-degree attribution for metric performance, thereby allowing you to build data around teams using the platform.
* pg 79: Once you have attribution data, begin benchmarking, which is particularly powerful because it automatically adapts to changes in behavior.
* pg 80: Nudge teams by emailing teams whose metrics has changed recently, both in terms of absolute change and their benchmarked performance.
* pg 80: If nudges aren't effective, work with key teams to agree on baseline metrics.
  * pg 80: This ensures baselines are top-of-mind and gives them a powerful tool for negotiating priorities with stakeholders.

#### 3.6: Migrations: the sole scalable fix to tech debt

* pg 81: The fact that something stops working at significantly increased scale is a sign that it was not originally over-designed.

##### 3.6.1: Why migrations matter

* pg 82: Migrations are usually the only available avenue to make meaningful progress on technical debt.
* pg 82: Migrations occupy the awkward territory of reduced immediate contribution today in exchange for more capacity tomorrow.

##### 3.6.2: Running good migrations

* pg 83: De-risk
  * pg 83: After you have buy-in on a new design, embed into the one or two most challenging teams and work with them to build and migrate to the new system.
  * pg 83: If you leave one migration partially finished, then people will be exceedingly suspicious of participating in the next one.
* pg 83: Enable
  * pg 83: Instead of generating tracking tickets for teams to implement, build tooling to programmatically migrate the easy 90 percent.
  * pg 83: After programmatically migrating as much as possible, write out the self-service tooling and documentation for the remaining teams.
* pg 84: Finish
  * pg 84: By ensuring that all newly written code uses the new approach, time becomes your friend because you are making progress by default.
  * pg 84: Generate tracking tickets for teams that need to migrate.
  * pg 84: If a team isn't working on a migration, it's typically because their leadership has not prioritized it.
  * pg 84: And for the remaining work, finish it yourself, and reserve celebration and recognition for when it is completed successfully.

#### 3.7: Running an engineering re-org

##### 3.7.1: Is a re-org the right tool?

* pg 85: The best kind of re-org solves a structural problem. The worst kind of re-org is done to avoid a people management issue.
* pg 87: Only re-org if the problem it will solve already exists, because it's remarkably hard to predict future problems.

##### 3.7.2: Project head count a year out

* pg 87: Use the historical hiring rate to project this.

##### 3.7.4: Defining teams and groups

* pg 89: Ensure that you can write a crisp mission statement for each team, define their areas of ownership, and define the interfaces between them.
* pg 89: Put teams that work together (especially poorly) as close together as possible. This close proximity helps fill harmful information gaps between them.
* pg 89: Avoid implicitly creating holes of ownership, instead explicitly defining such holes (i.e. defining an unstaffed team).

##### 3.7.5: Staffing the teams and groups

* pg 90: Accidentally missing someone is the cardinal sin of a reorganization.

##### 3.7.6: Commit to moving forward

* pg 91: Organizational change is very resistant to rollback, and so you must be collectively committed to moving forward with it in the face of adversity.

##### 3.7.7: Roll out the change

* pg 91: A good roll-out requires explaining the reasoning driving the re-org, documenting how each person and team is impacted, and availability and empathy to impacted individuals.
* pg 91: To execute, _discuss with heavily impacted individuals in private_, _prepare managers and key individuals_, _send out an email_, _be available for discussion_, and _have more skip-level one-on-ones_.

#### 3.8: Identify your controls

* pg 92: Controls are the mechanisms that you use to align with other leaders you work.
* pg 92: Controls include _metrics_, _visions_, _strategies_, _organization design_, _roadmaps_, _performance reviews_, and more.
* pg 93: For whatever controls you pick, you must then agree on the degree of alignment for each one.
* pg 93: Levels of alignment include _do it yourself_, _preview_, _review_, _notes_, _no surprises_, and _let me know if something comes up_.
  * pg 93: If you do something yourself, it's better to be explicit and avoid confusion on responsibilities.
  * pg 93: The _no surprises_ level only requires updates to keep your mental model current. This is important when you are evaluated on your ability to stay on top of new problems.
* pg 94: Analyzing your distribution across levels can reveal whether you are micromanaging or not.

#### 3.9: Career narratives

* pg 94: Most of us are always at the furthest point in our career, each change a step into the unknown, with limited visibility into upcoming opportunities.

##### 3.9.1: Artificial competition

* pg 95: Climbing the career ladder isn't bad, but it has the side-effect of funneling most folks toward a constrained pool of opportunity.

##### 3.9.2: Translating goals

* pg 96: Managers have a strong sense of the business's needs, allowing them to find the intersection of your interests and the business's priorities.
* pg 96: Your goals, once aligned to your company's priorities, should become a central artifact for how you and your manager collaborate on your career evolution.

#### 3.10: The briefest of media trainings

* pg 97: Three rules for speaking with the media:
  * pg 97: _Answer the question you want to be asked_, re-framing a difficult or challenging question into one you're comfortable with.
  * pg 97: _Stay positive_, by finding a positive frame and sticking to it.
  * pg 97: _Speak in threes_, narrowing down your message to three concise points that you make your refrain.

#### 3.11: Model, document, and share

* pg 98: One of the trickiest, but most common, leadership scenarios is leading without authority.

##### 3.11.1: How it works

* pg 98: When needing to effect change, it's a hard sell to convince someone that your personal experience should invalidate their personal experience.
* pg 99: To _model_ a behavior, just begin doing it. Frame it as a short experiment, and keep iterating on it until you're confident it works.
* pg 99: Then _document_ the problem you set out to solve, the learning process you went through, and how another team would adopt the practice.
* pg 99: Finally _share_ your documented approach in a short email, without asking anyone to adopt the practice or lobbying for change.

##### 3.11.2: Where it works

* pg 99: A _mandate_ assumes it's better to adopt a good-enough approach quickly.
* pg 100: A _model, document, and share approach_ assumes it's better to adopt a great approach slowly.

#### 3.12: Scaling consistency: designing centralized decision-making groups

* pg 101: We create a centralized, accountable group whenever a problem becomes truly acute.

##### 3.12.1: Positive and negative freedoms:

* pg 101: A _positive freedom_ is the freedom to do something, such as pick a programming language that you prefer.
* pg 101: A _negative freedom_ is the freedom from something happening to you, such as not having to support a programming language, even if someone prefers it.
* pg 102: When ownership is extremely diffuse, a group should increase net positive freedom without greatly reducing negative freedom.
* pg 102: Group design considers _influence_, _interaction modes_, _size_, _time commitment_, _identity_, _selection process_, _length of term_, and _representation_.
  * pg 102: If a group is six or fewer individuals, then they are able to gel and shift a portion of their individual identities to the team.
  * pg 103: The best default is fixed terms for members, while allowing current individuals to remain eligible, and without enacting term limits.
* pg 104: Failure modes for groups are being _domineering_, _bottlenecked_, _status-oriented_, and _inert_.
  * pg 104: A domineering group is most common when decision-makers are abstracted from the consequences of their decisions.
  * pg 104: A bottlenecked group attempts to do too much, thereby burning out its members, and slowing down folks who need their authority.
  * pg 104: An inert group doesn't do much of anything; their members have not gelled or are too busy.

#### 3.13: Presenting to senior leadership

* pg 107: Senior leaders pierce into areas to debug problems. Instead of hiding problems, use them as an opportunity to explain your plans to address them.
* pg 108: A playbook is _tie topic to business value_, _establish narrative_, _make ask_, _show data_, _present decision-making principles_, _present actions with timeline_, and _reiterate ask_.
  * pg 108: You must tie the topic to business value to answer "Why should anyone care?"
  * pg 108: The historical narrative should be two to four sentences explaining how things are going, how we got here, and the next planned step.
  * pg 108: Present enough raw data to allow people to follow your analysis. Providing only an analysis without data is evasive.
  * pg 108: Explain your mental model and principles that you're applying against the diagnosis; it should be clear how your actions follow from them.

#### 3.14: Time management

* pg 109: You have to prioritize long-term success over short-term quality, even if it's personally unrewarding to do so.
* pg 111: _Finish small, leveraged things_: Each thing you finish should create more bandwidth to do more work, and it's rewarding to finish things.
* pg 111: _Stop doing things_: If you're very underwater, alert your team and management chain that you're not doing some work. But don't drop work silently.
* pg 111: _Delegate handling exceptions_: By holding onto the authority to handle exceptions, you lose much of the system's leverage.
* pg 112: _Decouple participation from productivity_: Don't assume that attending every meeting is valuable.
* pg 112 :_Hire until you are slightly ahead of growth_: Having a clear organizational design allows hiring folks before their absence is crippling.

#### 3.15: Communities of learning

* pg 113: For a community, _facilitate, don't lecture_, _brief presentations and long discussions_, _use breakout groups_, _bring learnings to the full group_, _choose known topics_, _encourage tenured folks to attend_, _provide optional pre-reads_, and _start by checking in_.
  * pg 113: Folks want to learn from each other more than they want to learn from a single presenter.
  * pg 113: Successful topics are ones that people have already thought about, typically because these concepts are core to their daily work.
  * pg 115: Encourage the most senior folks to attend, because there is so much for them to teach newer folks.

### Chapter 4: Approaches

#### 4.1: Work the policy, not the exceptions

* pg 119: Environments that tolerate frequent exceptions are not only susceptible to bias but also inefficient.

##### 4.1.1: Good policy is opinionated

* pg 120: Every policy you write is a small strategy, built by identifying your goals and the constraints that bring actions into alignment with those goals.
* pg 121: A bad policy is one that does little to constrain behavior.

##### 4.1.2: Exception debt

* pg 121: Applying policy consistently is challenging because of:
  * pg 121: _Accepting reduced opportunity space_: This is incurred by establishing good constraints.
  * pg 121: _Local sub-optimality_: Sometimes teams must deal with challenging circumstances to support a broader goal that they experience little benefit from.
* pg 122: Granting exceptions undermines people's sense of fairness, and sets a precedent that undermines future policy.
* pg 122: Organizations spending significant time on exceptions are experiencing _exception debt_, and they must instead _work the policy_.

##### 4.1.3: Work the policy

* pg 122: Once you've collected enough escalations, revisit your constraints, merge in challenges discovered from applying the policy, and either preserve the existing constraints or generate new ones that handle escalations more effectively.

#### 4.2: Saying no

##### 4.2.1: Constraints

* pg 123: Folks who communicate a no are able to convincingly explain their team's constraints and articulate why the proposed path is unattainable or undesirable.
* pg 124: When articulating your constraints, the two most frequent disagreements are over _velocity_ and _prioritization_.

##### 4.2.2: Velocity

* pg 124: When folks want you to commit to more work than you believe you can deliver, your goal is to provide a compelling explanation of how your team finishes work.
* pg 125: Once you can explain your constraints and how time is being spent, then you're having a useful conversation about whether you can shift time from other behaviors toward your constraints.
* pg 125: The only two ways to add capacity are by moving existing resources to the team (away from their current work) or creating new resources (usually through hiring).

##### 4.2.3: Priorities

* pg 125: To communicate your priorities: document all your incoming tasks, develop guiding principles for selecting work, and then share subsets of selected tasks.
* pg 126: If a stakeholder has a request that is more important than your current work, shift priorities at your next planning session.

##### 4.2.4: Relationships

* pg 126: If you've explained your velocity and priorities but your perspective isn't resonating, then you likely have a relationship problem to address.

#### 4.3: Your philosophy of management

##### 4.3.1: An ethical profession

* pg 127: Remember that you leave a broad wake, and that your actions have a profound impact on those around you.

##### 4.3.2: Strong relationships > any problem

* pg 127: Almost every internal problem can be traced back to a missing or poor relationship, and that great relationships allow us to come together and solve almost anything.

##### 4.3.3: People over process

* pg 128: Process is a tool to make it easy to collaborate, and the process that the team enjoys is usually the right process.

##### 4.3.4: Do the hard thing now

* pg 128: Instead of avoiding the hardest parts, double down on them. As a leader you can't run from problems, so you must engage them.

##### 4.3.5: Your company, your team, yourself

* pg 129: Do the right thing for the company, then do the right thing for the team, and then do the right thing for yourself.
* pg 129: While this puts you last, it is a reminder to "pay yourself": Give as much as you can sustainably give, and draw the line there.

##### 4.3.6: Think for yourself

* pg 130: The best theory of management evolves as it comes into contact with reality. The worst theory is to not have one at all, and the second worst is one that doesn't change.

#### 4.4: Managing in the growth plates

* pg 130: At a mid-size company, parts of it are growing quickly with an emphasis on execution, and other parts have stabilized with ideas becoming the more valued currency.

##### 4.4.1: In the growth plates

* pg 131: What folks in the growth plates need is help reducing and executing the existing backlog of ideas, not adding more ideas to be evaluated.
* pg 131: It is extremely hard to do the basics well in the growth plates, because you don't have enough time to do them well.

##### 4.4.2: Outside the growth plates

* pg 132: All slow-growth environments used to be high-growth environments, meaning a sufficiently effective executor evolved them into a slow-growth environment.

##### 4.4.3: Aligning with values

* pg 132: Leadership is matching appropriate action to your current context, and it's uncommon that any two situations will flourish from the same behaviors.

#### 4.5: Ways engineering managers get stuck

* pg 132: New managers _only manage down_, _only manage up_, _never manage up_, _optimize locally_, _assume hiring never solves problems_, _don't spend time building relationships_, _define their role too narrowly_, and _forget their manager is human_.
  * pg 133: If you never manage up, then excellent work goes unnoticed because it was never shared.
  * pg 133: If your business is growing quickly, then eventually you hire or burn out.
  * pg 133: Managers are the glue in their team, filling any gaps – and that may mean doing things you don't want to do in order to set a good example.
* pg 133: More experienced managers _do what worked at their previous company_, _spend too much time building relationships_, _assume that more hiring can solve every problem_, _abscond rather than delegate_, and _become disconnected_.
  * pg 133: Pause to listen and foster awareness before "fixing" things, or else you may fix problems that don't exist with tools that may not be appropriate.
* pg 134: Managers at all levels of experience _mistake team size for impact_, _mistake title for impact_, _confuse authority with truth_, _don't trust the team enough to delegate_, _let other people manage their time_, and _only see problems_.
  * pg 134: Authority lets you get away with weak arguments and poor justifications, which causes people to leave quickly.

#### 4.6: Partnering with your manager

* pg 135: To partner with your manager _you must know a few things about them_, _they must know a few things about you_, and _you should occasionally update the things you know about each other_.
* pg 136: Tell your manager _what you're trying to solve_, _that you're making progress_, _what you prefer to work on_, _how busy you are_, _your professional goals and growth areas_, and _how you believe you're being measured_.
* pg 136: Success hinges on finding the communication mechanism that works for your manager.
* pg 136: If a manger doesn't seem to care, it's likely they do care but are too stressed to participate in successful communication.
* pg 137: Ask your manager _their current priorities_, _how stressed they are_, _what you can do to help_, _their management's priority_, and _what their goals are_.

#### 4.7: Finding managerial scope

* pg 138: To grow we should pursue scope – not enumerating people, but taking responsibility for the success of increasingly important and complex facets of the organization and company.
* pg 139: This means can can always find ways to increase your scope and learning, even if your company doesn't have room for more directors or vice presidents.

#### 4.8: Setting organizational direction

##### 4.8.1: Scarce feedback, vague direction

* pg 140: When things go poorly, you're swamped with more direction and input than you can absorb. When things are going well, you must supply your own direction and that of your team.

##### 4.8.2: Mining for direction

* pg 140: The first step to setting direction is to cast the widest possible net for ideas.
* pg 141: From the ideas form a strategy, define its key pivots, and let that set your direction.
* pg 141: No one will have the time to soak up all the detail of your overly precise document, so distill it down to three of four bullet points.

#### 4.9: Close out, solve, or delegate

* pg 142: Upon transitioning to management, your ability to put your head down and solve gritty, important problems is now the wrong answer to most of your problems.
* pg 142: For every problem that comes your way, either _close out_, _solve_, or _delegate_.
  * pg 142: _Closing out_ means making a decision and communicating it to all involved participants.
  * pg 142: _Solving_ means designing a solution such that you won't need to spend time on this particular kind of ask again in the next six months.
  * pg 142: _Delegate_ means passing it to someone who has the specialized skills to close it or solve it, or who can work in the system.

### Chapter 5: Culture

#### 5.1: Opportunity and membership

* pg 147: An inclusive organization is one in which individuals have access to opportunity and membership.
  * pg 147: Opportunity is having access to professional success and development.
  * pg 147: Membership is participating as a version of themselves that they feel comfortable with.

##### 5.1.1: Opportunity

* pg 148: The most effective way to provide opportunity to members of your organization is structured application of good process.
* pg 148: To create opportunity, _employ rubrics_, _have a structured approach to choosing leads_, _have explicit budgets_, _nudge involvement_, and _create education programs_.
  * pg 148: It's effective to reach out to people and encourage them to apply to opportunities or use available resources. Even more powerful is showing where they are on a distribution.
* pg 149: To measure opportunity, focus on _retention_, _who leads critical projects_, _level distribution_, and _time at level_.
  * pg 149: Retention is the first thing you pay attention to, but it is the slowest to show change.

##### 5.1.2: Membership

* pg 150: Impactful programs include _recurring weekly events_, _employee resource groups_, _team offsites_, _coffee chats_, and _team lunches_.
* pg 151: To measure membership, focus on _retention_, _referral rate_, _attendance rates for recurring events_, and the _number of completed coffee chats_.
* pg 151: Balancing opportunities for membership across a large population is tricky; success requires a broad portfolio of options and a willingness to balance concerns across events and time.

#### 5.2: Select project leads

* pg 152: The number of people who can lead critical projects both measures the company's ability to execute and the extent that its members have access to growth.
* pg 152: For a critical project _define its scope and goals with selection criteria_, _announce it_, _nudge good candidates_, _select a lead_, _find an advisor to sponsor it_, _notify whoever wasn't selected_, and _kick it off_.
  * pg 153: This is a great learning opportunities for the sponsors, who aren't used to teaching others how to lead large and ambiguous projects.
  * pg 153: When notifying those who weren't selected, provide feedback on why they weren't selected. Saying you want to create room for another person to learn is reasonable.
* pg 154: Done well, selecting project leads like this can be the cornerstone to your efforts of creating an inclusive organization.

#### 5.3: Make your peers your first team

* pg 154: The best collaboration happens when teams had managers willing to disappoint the teams they managed in order to help their peers succeed.
* pg 155: Members of such a team have shifted their _first team_ from the folks they support to their peers.
* The ingredients for this are:
  * pg 155: _Awareness of each other's work_: A member cannot optimize for their team if they're not familiar with other members' work.
  * pg 155: _Evolution from character to person_: Spending time together, often at an offsite, will transform strangers into people.
  * pg 155: _Refereeing deflection_: If someone acts in self-interest, then other team members will do the same. A manager must referee and ensure good behavior.
  * pg 155: _Avoiding zero-sum culture_: No one will coordinate in such cultures, where perceived success depends on capturing scarce resources like headcount.
* pg 156: The more fully you embrace optimizing for your collective peers, the closer your priorities will mirror your manager's.
* pg 156: A first team provides a community of learning, where your team's rate of learning is the sum of everyone's challenges – not just your own experiences.

#### 5.4: Consider the team you have for senior positions

* pg 157: Fair consideration doesn't mean that we prefer internal candidates, but that there is a structured way for them to apply, and for us to consider them.
* pg 157: Evaluating candidates tests _partnership_, _execution_, _vision_, _strategy_, _spoken and written communication_, and _stakeholder management_.
* pg 158: To test these categories, _collect written feedback_, _see a 90-day plan_, _see a strategy/vision doc_, and them have them _present it to peers_ and _present it to an executive_.
  * pg 158: When collecting feedback, lean into controversial feedback and listen to the concerns of would-be dissenters.
  * pg 158: The 90-day plan is a great opportunity to understand their diagnosis of the situation, and having them incorporate your feedback is an opportunity to try out working together.
* pg 159: This process creates intentional practice: Folks get to take risks in their plans, and you get to give direct feedback without micromanaging.

#### 5.5: Company culture and managing freedoms

* pg 160: Each positive freedom we enforce strips away a negative freedom, and each negative freedom we guarantee eliminates a corresponding positive freedom.
* pg 160: We ramp toward negative freedom to keep the times rolling, and ramp toward positive freedom to help adapt to new and challenging circumstances.

#### 5.6: Kill your heroes, stop doing it harder

* pg 161: Unless people aren't trying hard, the mantra "work harder" only breeds hero programmers whose heroic ways make it difficult for non-heroes to contribute meaningfully.
* pg 161: Eventually you have a cadre of burned-out heroes, everyone else is alienated, and your project is still totally screwed.

##### 5.6.2: Kill the hero programmer

* pg 163: You must either kill the environment that breeds the hero programmers, or kill the hero programmer by burnout.

##### 5.6.3: A long time coming, a long time going

* pg 163: Working at a frenetic pace for weeks or months may feel like a major outpouring of effort and energy, but you cannot quickly counteract a deficit created over months of poor implementation or management choices.

##### 5.6.4: Resetting broken systems

* pg 164: If you set the original direction and have the leverage to change directions, then stand up and taking the bullet for the fiasco you're in.
* pg 164: Without policy, step back and allow the brokenness to collapse under its own weight. Conserve your energy for the system that comes next.

### Chapter 6: Careers

#### 6.1: Roles over rocket ships, and why hypergrowth is a weak predictor of personal growth

* pg 170: Thriving in a company requires finding a way to succeed in each new era and successfully navigating the transitional periods.

##### 6.1.2: Opportunities for growth

* pg 170: Transitions allow raising the floor by building competencies in new skills, and stable periods allow raising the ceiling by developing mastery in skills that the era values.

#### 6.2: Running a humane interview process

* pg 172: To interview candidates: _be kind_, _establish requirements_, _understand the signal you're looking for_, _come prepared_, _express interest in candidates_, _create feedback loops_, and _optimize_.

##### 6.2.1: Be kind

* pg 173: You can't conduct a kind, candidate-centric interview process if you're interviewers are tightly time-constrained.
* pg 173: Unkind interviewers are either suffering from burnout from doing so many interviews, or are so busy with other work that they view interviewing as a burden rather than a contribution.

##### 6.2.3: Finding signal

* pg 174: Each skill should be covered by two different interviews to create some redundancy in signal detection, in case one interview doesn't go cleanly.
* pg 174: You must also ensure that the interviewer and the interview format actually ecpose that signal.

##### 6.2.4: Be prepared

* pg 175: Being unprepared is the cardinal sin of interviewing, because it shows a disinterest in the candidate's time, your team's time, and your own time.
* pg 175: Interview preparedness is much more company-dependent than it is individual-dependent.

##### 6.2.5: Deliberately express interest

* pg 176: Whenever you extend an offer to a candidate, have every interviewer send a note to them saying that they enjoyed the interview.

##### 6.2.6: Feedback loops

* pg 176: Since your goal is to create a consistent experience for your candidates, shadow interviews are as important for new hires who are experienced interviewing elsewhere as they are for new college grads.
* pg 177: If you own or design the interview loop, the best place to get feedback is from the candidate and from the interview debrief session.

#### 6.3: Cold sourcing: hire someone you don't know

* Referrals come with two major drawbacks:
  * pg 180: Your personal network will always be quite small, especially when you consider the total candidate pool.
  * pg 180: By hiring within these circles, it's easy to end up with a company whose employees think, believe, and sometimes even look similar.

##### 6.3.1: Moving beyond your personal networks

* pg 181: A concise, thoughtful invitation to discuss a job opportunity is an opportunity, not an infringement, especially for those who are on career networking sites like LinkedIn.

##### 6.3.2: Your first cold sourcing recipe

* pg 183: When sending someone a message on LinkedIn, customization doesn't matter, because people mostly choose to respond based on their circumstances, not on the quality of your message.
* pg 184: When scheduling phone calls or coffee chats, interact with each person as if they'll be providing feedback on whether or not to hire you at your next job.
* pg 184: When you meet, explain why you're personally excited about the company and the role, how the interview process works, and then leave ample time for them to ask questions.
* pg 185: Coordinate reaching out; having multiple folks from the same company reach out around the same time can paint a picture of chaos.

##### 6.3.3: Is this high-leverage work?

* pg 185: Be cautiously concerned if an engineering manager spends more than an hour of week on sourcing (excluding follow-up chats, which take up more time).

#### 6.4: Hiring funnel

##### 6.4.1: Funnel fundamentals

* pg 186: The four major steps are identifying candidates, motivating them to apply, evaluating them, and then closing them on joining.
* To motivate candidates:
  * pg 187: Have the people the candidate would work with spend time with them.
  * pg 187: Clearly define the role. Always give an accurate description of the work, but try to find the best frame for describing that work.
* pg 188: When evaluating a candidate, one of the worst outcomes of the hiring funnel is that the candidate is no longer interested in being a part of your company.

##### 6.4.2: Instrument and optimize

* pg 189: Put your effort where there is the most room to improve, but understand that the reasonable upper bound for each stage of your funnel is not obvious.

##### 6.4.3: Extending the funnel

* pg 189: Extend your funnel with _onboard_, _impact_, _promote_ and _retain_ stages:
  * pg 189: To measure the effectiveness of your onboarding process, measure how long it takes new hires to reach P40 productivity.
  * pg 190: To measure the impact of your hires, a good proxy is looking at the performance rating distribution for new hires based on time since hiring.
  * pg 190: Measuring how long it takes individuals to get promoted is useful for understanding whether they have access to opportunity within the organization.
  * pg 190: Measuring retainment of employees is a lagging indicator, since it typically takes years for folks to leave.

#### 6.5: Performance management systems

* pg 190: If you want to shape your company's culture, inclusion, or performance, this is your most valuable entry point.
* pg 191: Most approaches to performance management are composed of _career ladders_, _performance designations_, and _performance cycles_.

##### 6.5.1: Career ladders

* pg 192: Any ladder with more then 10 individuals should probably be fully fleshed out, but smaller functions can survive with something rough.
* pg 192: Crisp level boundaries provide those on a ladder with a useful mental model of where they are on their journey, who their peers are, and whom they should view as role models.
* pg 193: If you can only invest in one component of performance management, make it the career ladders; everything else builds on this foundation.

##### 6.5.2: Performance designations

* pg 193: It is a cause of concern and debugging if the explicit designation doesn't match the implicit signals someone has received.
* pg 195: Calibrations fall soundly in the category of things that are terrible but have no obvious replacement.
* pg 195: Useful rules for calibrations are _adopt a shared quest or consistency_, _read and don't present_, _compare against the ladder and not others_, and _study but don't enforce the distribution_.
  * pg 195: Steer managers in a calibration away from anchoring on the designations they enter with, and toward shared inquiry.
  * pg 195: To reduce bias, everyone read the manager review instead of allowing managers pitch their candidates to the room.
* pg 196: Waiting for performance designations to deal with performance issues is typically a sign of managerial avoidance.

##### 6.5.3: Performance cycles

* pg 196: The most important factor for effective performance cycles is forcing folks to practice.
* pg 197: You want to change the cycle at most once every second time, thereby allowing everyone to adapt fully and allowing you to observe how well changes work.

#### 6.6: Career levels, designation momentum, level splits, etc.

* pg 197: _Designation momentum_ is the natural tendency of a performance process to consistently produce the same evaluations of the same people despite performance changes.
  * pg 198: If you're not happy with the direction of your designation momentum, and your manager isn't prescribing a path to high performance, then you must be an active participant.
  * pg 198: If your manager is pushing back on your goals' ambition, this is probably their way of saying that their peers will challenge their difficulty.
* pg 199: _Tit-for-tat_ favor trading, via silence by participants instead of raising concerns, pushes all responsibility on the calibration referee.
* pg 199: A company experiencing frequent _level expansion_ is a sign that progression, compensation, or recognition is overly tied to the level system.
* pg 199: Levels added at the top introduce _level drift_ by downward pressure on existing levels, so that expectations at a given level decrease over time.
* pg 200: _Time-at-level limits_ are typically used as a backstop for situations in which performance management seems appropriate but is not occurring.
* pg 200: A _level split_ of the career level into two halves extends the runway of career progression, but tends to solidify the moat guarding post-career levels.
* pg 201: _Retention-driven performance designations_ reset expectations permanently in ways that sacrifice long-term usefulness of the system in order to manage short-term difficulty.

#### 6.7: Creating specialized roles, like SRE or TPMs

##### 6.7.1: Challenges

* pg 202: Folks often look at new roles as less important, framing them as service roles to absorb work they're not interested in.
* pg 203: Moving from generalized roles toward specialists introduces more single points of failure; this is especially acute in organizations with frequent structural changes.
* pg 203: Many individuals will offload challenging, difficult, or uninteresting tasks, leading to the new roles being immediately underwater.
* pg 204: Requiring the first hires to be strong role models leads to a proliferation of requirements until it's impossible for any candidate to pass the bar.

##### 6.7.2: Facilitating success

* pg 204: If you can't find an executive sponsor, it's a sign that leadership doesn't believe the new role will have a good return on invested energy.
* pg 204: Every role to recruit for has a high fixed cost, so new roles can make it difficult for recruiters to hit the targets that their performance is measured against.
* pg 205: Don't frame roles as auxiliary support functions. You must frame the role's work without referencing other existing roles for it to succeed long-term.
* pg 205: It's not possible for a  role to be valued or evaluated coherently without a thoughtful career ladder.

##### 6.7.3: Advantages

* pg 206: Specialized efficiency can lead to more throughput without increasing head count. This is the most important for teams where financial resources are the limit on growth.
* pg 206: With specialists, you can add exactly the capacity you are missing, which is very powerful for effectively solving constraints.
* pg 206: Creating a new role allows you to consider a new pool of candidate sin your hiring funnel.

##### 6.7.4: What to do?

* pg 207: Some questions to decide whether to create the new role include:
  * pg 207: Do you have a plan for changing how the compnay values the work? Creating a new role won't inherently change how the company values this work.
  * pg 207: Who will pay the maintenance costs for the new role? And if it's you, who will take up the torch when you leave?
* pg 207: Always create a new role if it immediately covers 20 individuals; reluctantly create one if it would cover 20 individuals within two months; and otherwise, be skeptical.

#### 6.8: Designing an interview loop

* pg 208: Do not start designing a new interview loop until you've instrumented your metrics funnel.
* pg 208: To understand the current loop's performance, look at funnel performance, employee trajectory after hiring, and perform candidate debriefs.
* pg 210: Identify skills to test for from role models and a career ladder, and then for each one design a test where the candidate shows their strength instead of tells you about it.
* pg 210: If you find it difficult to identify a useful rubric for a test, then you should look for a different test that is easier to assess.
* pg 211: Avoid designing by committee, and instead prefer a working group of one or two people that is then tested against a bunch of candidates for feedback.
* pg 211: Don't hire for potential, which is a major vector for bias and should be strictly avoided.
* pg 212: To summarize the approach: Avoid reusing stuff you know doesn't work, creatively approach the matter from first principles, and keep iterating on it.
