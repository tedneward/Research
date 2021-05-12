title=Working Backwards
tags=reading, books, management
summary=An insider look at Amazon's internal practices and philosophies.
~~~~~~

*(by Colin Bryar, Bill Carr)*

# Chapter 1: Building Blocks (Leadership Principles and Mechanisms)

1. **Customer Obsession.** Leaders start with th customer and work backwards. They work vigorously to earn and keep customer trust. Although leaders pay attention to competitors, they obsess over customers.
2. **Ownership.** Leaders are owners. They think long term and don't sacrifice long-term value for short-term results. They act on behalf of the entire company, beyond just their own team. They never say, "That's not my job."
3. **Invent and Simplify.** Leaders expet and require innovation and invention from their teams and always find ways to simplify. They are externally awware, look for new ideas from everywhere, and are not limited by "not invented here". As we do new things, we accept that we may be misunderstood for long periods of time.
4. **Are Right, A Lot.** Leaders are right a lot. They have strong judgment and good instincts. They seek diverse perspective and work to disconfirm their beliefs.
5. **Learn and Be Curious.** Leaders are never done learning and always seek to improve themselves. They are curious about new possibilities and act to explore them.
6. **Hire and Develop the Best.** Leaders raise the performance bar with every hire and promotion. They recognize exceptional talent, and willingly move them throughout the organization. Leaders develop leaders and take seriously their role in coaching others. We work on behalf of our people to invent mechanisms for development like Career Choice.
7. **Insist on the Highest Standards.** Leaders have relentlessly high standards--many people may think these standards are unreasonably high. Leaders are continually raising the bar and drive their teams to delivery high-quality products, services, and processes. Leaders ensure that defects do not get sent down the line and that problems are fixed so they stay fixed.
8. **Think Big.** Thinking small is a self-fulfilling prophecy. Leaders create and communicate a bold direction that inspires results. They think differently and look around corners for ways to serve customers.
9. **Bias for Action.** Speed matters in business. Many decisions and actions are reversible and do not need extensive study. We value calculated risk-taking.
10. **Frugality.** Accomplish more with less. Constraints breed resourcefulness, self-sufficiency, and invention. There are no extra points for growing headcount, budget size, or fixed expense.
11. **Earn Trust.** Leaders listen attentively, speak candidly, and treat others respectfully. They are vocally self-critical, even when doing so is awkward or embarrassing. Leaders do not believe their or their team's body odor smells of perfume. They benchmark themselves and their teams against the best.
12. **Dive Deep.** Leaders operate at all levels, stay connected to the details, audit frequently, and are skeptical when metrics and anecdotes differ. No task is beneath them.
13. **Have Backbone; Disagree and Commit.** Leaders are obligated to respectfully challenge decisions when they disagree, even when doing so is uncomfortable or exhausting.Leaders have conviction and are tenacious. They do not compromise for the sake of social cohesion. Once a decision is determined, they commit wholly.
14. **Deliver Results.** Leaders focus on the key inputs for their business and deliver them with the right quality and in a timely fashion. Despite setbacks, they rise to the occasion and never settle.

### Annual Planning: OP1 and OP2
Autonomous, single-threaded teams keep the company nimble, moving quickly with a minimum of external friction, but their autonomy must be paired with precise goal-setting to align each team's independent plans with the company's overarching goals. Planning for the calendar year beings in the summer, a painstaking process that requires four to eight weeks of intensive work.

The S-Team begins by creating a set of high-level expectations or objectives for the entire company. Once these high-level expectations are established, each group begins work on its own more granular operating plan (OP1) which sets out the individual group's "bottom up" proposal. Through the narrative process (Chap 4), evaluate about ten times as much information as the typical company does in a similar time frame. The main components of an OP1 narrative are:

* Assessment of past performance, including goals achieved, goals missed, and lessons learned
* Key initiatives for the following year
* A detailed income statement
* Requests (and justifications) for resources, which may include things like new hires, marketing spend, equipment, and other fixed assets
  
Each group works in partnership with its finance and HR counterparts to create their detailed plan, whic is then presented to a panel of leaders whose level (director, VP, S-Team) depends on the size, impact, or strategic importance of the group. The panel then reconciles any gaps between the bottom-up proposal and the top-down goals the group has been asked to meet, and iterate.

The OP1 process runs through the fall and completed before fourth-quarter. In January, OP1 is adjusted as necessary to reflect the fourth-quarter results, as well as to udpate the trajectory. This shorter process is called OP2, and it generates the plan of record for the calendar year.

# Chapter 2: Hiring (Bar Raiser Process)

### Bar Raiser Process
(The need for a rigorous interview process. Bezos: "We want missionaries, not mercenaries.")

(What's wrong with a conventional approach: interviewers who lack a rigorous model for their role in the hiring process leave themselves open to a range of pitfalls; even the smartest interviewer can wander off-script and ask questions that lack a clear objective, leading to answers that reveal nothing about a candidate's likely job performance. Interviewer feedback is often communicated to the broader team with insufficient clarity and unintentional bias. Focusing on candidate qualities that don't reliably predict performance can also skew decisions in the wrong direction. Unstructured hiring decision meetings can give rise to groupthink, confirmation bias, and other cognitive traps that feel right at the time but produce poor decisions.)

### The Bar Raiser Solution
The name of both a larger process and the group of individuals (Bar Raisers) central to that process. They get special training in the process. One participates in every interview loop. Cannot be the hiring manager or a recruiter; can veto any hire and override the hiring manager. By raising the bar with each new hire, the team would get progressively stronger and produce increasingly powerful results.

Eight steps in the hiring process:
* Job Description: specific and focused.
* Resume Review: if the candidates are off-target, the JD probably needs work.
* Phone Screen: have a rubric ahead of time; solicit examples of the candidate's past behavior; focus on a subset of the Amazon Leadership Principles. Decide on bringing the candidate in for an interview; if on the fence, the answer is no. One in four is a reasonable success rate at this stage.
* In-House Interview: 5 - 7 hours to complete, involving expensive people, so must be carefully planned, prepared, and executed.
* Written Feedback
* Debrief/Hiring Meeting
* Reference Check
* Offer Through Onboarding
  
Track and report on the volume and rate at which candidates pass through the funnel and use this data to make process changes as well as to coach and train recruiters and hiring managers.

# Chapter 3: Organizing (Separable, Single-Threaded Leadership)
> "The best way to fail at inventing something is by making it somebody's part-time job."

"Single-threaded leadership": a single person, unencumbered by competing responsibilities, owns a single major initiative and heads up a separable, largely autonomous team to deliver its goals.

### Technical Dependencies
Dependency discoveries inside of Amazon on Obidos, a monolithic massive executable:
* **Gotchas in Shared Code.** Each team had to coordinate with other teams, and had to dedicate its own time to reviewing other teams' changes.
* **Protectors of the Database.** Steering group (the "DB Cabal": the CTO, head of DBA, and head of Data) set up to review every proposed change, approve/reject it, then deploy it. Massive bottleneck.
The system was tightly coupled.

### Organizational Dependencies
Scaling up had created long distances to find the people you needed; project teams needed to pitch their request to other project teams, who in turn had their own requests to pitch. Org structures had become tightly coupled as well.

### Better Coordination Was the Wrong Answer
"If we wanted Amazon to be a place where builders can build, we needed to eliminate communication, not encourage it." Solution: API-centric standlone entities, loosely-coupled.

### NPI (New Project Initiative)
Global prioritization across all projects. 

Force-Ranking Our Options: Teams would submit one-pagers describing their project that required outside resources; small group would screen all NPI submissions through several rounds of filtering before it goes in front of a review board; that small group would then true up the resource/payback estimates, and decide which projects would actually go forward.

Choosing Our Priorities: Predictions (costs, consumer behavior, etc) were largely too broad or too difficult to predict to be helpful. Feedback loop introduced, but it took year(s) to complete the cycle of estimate-judge-review-refactor.

### First Proposed Solution: Two-Pizza Team
Reorganize into smaller autonomous teams connected to other teams only loosely, and only when unavoidable. Plan: A two-pizza team will:
* **Be small.** No more than ten people.
* **Be autonomous.** No need to coordinate with other teams to get their work done.
* **Be evaluated by a well-defined "fitness function".** The sum of a weighted series of metrics.
* **Be monitored in real time.** Real-time score on its fitness function would be displayed on a dashboard next to all the other two-pizza teams' scores.
* **Be the business owner.** The team will own and be responsible for all aspects of its area of focus, including design, technology, and business results.
* **Be led by a multidisciplined top-flight leader.** The leader must have deep technical expertise, know how to hire world-class software engineers and product managers, and possess excellent business judgment.
* **Be self-funding.** Team's work will pay for itself.
* **Be approved in advance by the S-Team.**

Tearing Down Monoliths: Werner Vogels quote about service-orientation: "Encapsulating hte data with the business logic that operates on the data, with the only access through a published service interface. No direct database access is allowed from outside the service, and there's no data sharing among the services." Microservices.

The First Autonomous Teams: Autonomous teams are built for speed; when they are aligned, they can go a long way in a short time; when they are poorly aligned, the team can veer far off course just as quickly. Before any two-pizza team was approved, they needed to meet with the S-Team to discuss team's composition, charter, and fitness function; meeting the following criteria:

1. The team had a well-defined purpose.
2. The boundaries of ownership were well understood.
3. The metrics used to measure progress were agreed upon.

Teams needed to focus on removing their dependencies from upstream areas; those that focused initially instead on features, failed.

A well-instrumented two-pizza team also were better at course correcting--detecting and fixing mistakes as they arose.

### Some Challenges Still Remained

Two-Pizza Teams Worked Best in Product Development: Attempts to implement them in retail, legal, HR, and other areas didn't work due to the lack of tangled dependencies.

Fitness Functions Were Actually Worse Than Their Component Metrics: Teams spent a lot of effort to construct meaningful fitness functions. Some of these functions combined seven or more metrics, a few of which were composite numbers made up of their submetrics, and it was often impossible to discern what the team was doing right/wrong and how to respond. Eventually reverted to relying directly on the underlying metrics instead of the fitness function.

Great Two-Pizza Team Leaders Proved to be Rarities: They turned out to be hard to find. *(duh)* We found instead that two-pizza teams could also operate successfully in a matrix organization model, where each team member would have a solid-line reporting relationship to a functional manager who matched their job description (director of software development or director of product management) and a dotted-line reporting relationship to their two-pizza manager. This meant that individual two-pizza team managers could lead successfully even without expertise in every single discipline required on their team.

Sometimes You Need More Than Two Pizzas: We came later to realize that the biggest predictor of a team's success was not whether it was small but whether it had a leader with the appropriate skills, authority, and experience to staff and manage a team whose sole focus was to get the job done. "Single-threaded leaders" and "Separable, single-threaded teams" were born.

### Bigger and Better Still: The Single-Threaded Leader (STL)
"Seperable means almost as separate organizationally as APIs are for software. Single-threaded means they don't work on anything else." Such teams have clear, unambiguous ownership of specific features or functionality and can drive innovations with a minimum of resilience or impact upon others. Appointing a single-threaded leader is necessary but not sufficient. Separable, single-threaded teams have fewer organizational dependencies than conventional teams. They clearly demarcate the boundaries of what they own and where the interests of the other teams begin and end. Good rule of thumb is deployment: can the team build and roll out their changes without coupling, coordination, and approvals from other teams?

# Chapter 4: Communicating (Narratives and the Six Pager)

# Chapter 5:

# Chapter 6:

