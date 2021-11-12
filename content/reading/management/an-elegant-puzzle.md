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

* **Product management: exploration, selection, validation**



* Visions and strategies

* Metrics and baselines

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

