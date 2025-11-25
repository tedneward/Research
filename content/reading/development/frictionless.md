title=Frictionless
tags=reading, software development, process, management
summary=Notes and thoughts from the book of the same name.
~~~~~~

*(Nicole Forsgren, Abi Noda; Shift Key Press Nov 2025; ISBN 978-1662966378)*

As a general rule, this book is following the social media style of authorship, at a slightly larger scale: Instead of one sentence paragraphs, they're doing one- or two-page chapters. Overall, I'm not entirely impressed so far, particularly since I think a good chunk of the "seven steps" are just a retelling of Kotter's Change Management steps. Actually, as I go through the material, I begin to suspect a good chunk of it was written by an LLM. The case studies and examples probably aren't, but a lot of the prose in between feels very LLM-ish.

# PART I Understanding DevEx 

## Chapter 1 - What is Developer Experience?

"Developer experience isn’t just about making developers happy--it’s about removing friction that slows down your entire business."

## Chapter 2 - Why Developer Experience Matters 

"Poor developer experience isn’t just about productivity--it can hide catastrophic business risks in plain sight."

"One morning in 2012, a developer at Knight Capital pushed a routine update. Nothing seemed off--until the system started hemorrhaging money. In just 45 minutes, a single change triggered $460 million in losses. The culprit? An old feature flag, long retired, accidentally reactivated by a deployment script. But the real problem wasn’t the bug--it was a development environment that made problems impossible to detect and fix quickly, turning a routine mistake into a company-ending disaster." -- Dolfing, Henrico. “Case Study 4: The $440 Million Software Error at Knight Capital.” 5 June 2019, www.henricodolfing.com/2019/06/project-failure-case-study-knight-capital.html.

"Fast-forward to July 2025: Jason Lemkin was using Replit’s AI coding assistant to build a database for his company SaaStr.AI. He explicitly set a “code freeze”—no changes to live data. But the AI ignored his instructions and deleted his entire production database." -- https://www.pcmag.com/news/vibe-coding-fiasco-replite-ai-agent-goes-rogue-deletes-company-database

* "AI acceleration makes existing friction even more costly."
* "Poor DevEx creates a competitive disadvantage that compounds over time."
* "Developer experience has a positioning problem."
* "Good developer experience isn’t just about making developers happy--it’s about removing friction to accelerate business outcomes."
* "Developer experience acts as a force multiplier."

## Chapter 3 - Friction: The Value Killer 

"Friction can slow any progress, especially in software, which is why improving DevEx is so important."

"Friction is anything that slows down or gets in the way of completing work:

* *Onboarding friction.* New developers spend days or weeks struggling with incomplete documentation, waiting for system access approvals, and learning unintuitive toolsets before writing a single line of productive code. Even experienced developers face similar friction during laptop refreshes or system reimaging—losing valuable time during active sprints when their contributions are most needed. Remote developers struggle to find answers in documentation because reaching out for help means scheduling a meeting. 
* *Codebase friction.* Insufficient abstractions force developers to touch many places to make simple changes, brittle monolithic fixtures accumulate over time making tests hard to extend, and patterns that once served the code well become obstacles as the system evolves. 
* *Integration friction.* Misconfigured APIs and incompatible toolchains break developer flow, turning what should be seamless connections into frustrating workarounds and manual steps. 
* *Process friction.* Multi-step approval processes, several iterations of review, and bureaucratic requirements often delay actual development work. The cost of this friction often becomes apparent during hackathons when process requirements are relaxed and innovation happens quickly. 
* *Review friction.* Code reviews that should take hours stretch into days due to inefficient PR assignment, unclear code or module ownership (especially in monorepo environments), multiple review cycles caused by unclear requirements, and large and complicated PRs due to developers working in isolation. 
* *Development friction.* Painfully slow build times, test suites that are unreliable and take ages to complete, incomplete test coverage, and flaky tests that fail intermittently without real issues waste developers’ time and break concentration during active coding sessions. 
* *Deployment friction.* Rather than one-click deploys, developers write custom scripts for every code push because automation is incomplete, or spend hours manually gathering data from disparate systems to make deployment decisions."

"Eliminating these friction points creates immediate business value."

"“Productivity” sets off alarm bells--”Experience” opens conversations."

# PART II The Three Essential Elements of DevEx 

## Chapter 4 - The DevEx Framework

*Feedback loops, flow state, and cognitive load, each of which is examined further in its own chapter.*

## Chapter 5 - Feedback Loops

*See OODA.*

## Chapter 6 - Flow State

*See Csikszentmihalyi.*

## Chapter 7 - Cognitive Load

"Excessive cognitive load directly impedes developers’ ability to deliver value to customers."

"The solution is systematic reduction of unnecessary complexity."

"AI presents both opportunities and risks for cognitive load."

## Chapter 8 - Use the Framework to Identify and Remove Friction

"The three elements of DevEx provide a framework for spotting and fixing friction."

# PART III Making the Business Case

## Chapter 9 - Translate Developer Experience into Business Value

"C-suite executives speak the language of business outcomes."

"Talk about recovering time: Convert developer hours into dollar value."

"Talk about saving money: Quantify cost savings."

"Talk about making money: Accelerating revenue through DevEx."

*"Capital One's DevEx transformation" citation here.*

"Talk about proven correlations: Link technical metrics to business outcomes." ... "A specific example of this approach is the developer experience index (DXI), developed by DX. The DXI score is the average of 14 survey questions that ask developers about different aspects of their development process. By correlating this score against self-reported time loss, DX has found that each one-point gain in DXI score translates to saving 13 minutes per week per developer, equivalent to 10 hours annually. (Noda, Abi, and Laura Tacho. “The One Number You Need to Increase Roi per Engineer.” DX, 2025, getdx.com/research/the-one-number-you-need-to-increase-roi-per-engineer/.) This correlation allows organizations to predict financial impact from DevEx improvements."

## Chapter 10 - Connect Your Work to What Others Care About

"To gain leadership support, demonstrate how developer experience directly solves their specific business problems."

"Align your DevEx work with the problems that keep your CEO and CTO up at night."

"Tie it to your company’s biggest priority."

"Give senior leaders something to brag about."

"Reveal performance gaps."

"Always reframe developer experience from a technical nice-to-have into a strategic business enabler."

# PART IV Improving DevEx: A 7-Step Process

## STEP 1 Start Your DevEx Journey

> Reminder: [Kotter's 8 steps](/management/leading-change):
> 
> 1. Establishing a sense of urgency
> 2. Forming a powerful guiding coalition
> 3. Creating a vision
> 4. Communicating the vision
> 5. Empowering others to act on the vision
> 6. Planning for and creating short-term wins
> 7. Consolidating improvements and producing still more change
> 8. Mantaining new approaches

### Chapter 11 - Interview Developers

"To get good information, you’ll need to interview a diverse set of developers." 12-15. Consider factors such as years of experience, product area, type of development (e.g., legacy, mobile, cloud, data science). Make two planning lists: 1. Demographics that matter. For example, work location (onsite, remote, hybrid) and experience level (junior or senior devs). 2. Work types and organizational areas where devs work.

"Let developers know that talking to you is a good use of their time."

"Building strong developer experience starts with earning developers’ trust."

"Most importantly, honor developers’ reality."

"During the interview, let them know you are there to listen and learn."

"You’ll know you’ve done enough interviews when you start hearing the same problems repeatedly—this is called saturation. It usually happens at around 12-15 interviews, but you might need fewer if clear patterns emerge earlier (generally no less than 7), or more if you’re consistently getting new information."

### Chapter 12 - Synthesize What You Learn

"Start identifying labels while you’re still in interview mode."

"Build a flexible framework that evolves with your understanding."

"Capture these themes and supporting evidence in a simple document."

"Take a second pass through your notes."

### Chapter 13 - Visualize Your Developers’ Workflow, Tools, and Friction

"List the steps your developers have to do to write and ship code."

"List *everything*, even if it seems trivial—you never know where friction might be lurking."

"Don’t forget specialized developer workflows."

"Consider turning your lists into workflow diagrams."

### Chapter 14 - Understand Your Stakeholders

"You might be surprised just how many stakeholders you have."

Start by listing all potential stakeholder groups. These may include: 

* Engineering teams: Developers, tech leads, and engineering managers directly affected by improvements. 
* Auxiliary functions: SREs, data scientists, and customer success engineers may not be product engineers, but your investigations and solutions will likely impact their work. 
* Leadership: CTOs, VPs of engineering, and other decision-makers who approve resources. 
* Adjacent functions: Product managers, designers, and QA professionals who interface with development. 
* Support functions: HR professionals interested in retention metrics, Finance team members monitoring costs, Security teams concerned with compliance aspects 
* External groups: Customers or partner teams who may benefit from improved developer productivity

### Chapter 15 - Share What You’ve Learned

"Once you’ve synthesized what you learned, be sure to share your findings."

"Once your summaries are shared, be prepared for continued dialogue."

## STEP 2 Start Small and Get a Quick Win

### Chapter 16 - Pick the Right Projects

"When kicking off a DevEx improvement initiative, you need visible wins that validate your approach and transform skeptics into advocates."

"The RICE framework--Reach, Impact, Confidence, Effort--gives you a simple way to evaluate opportunities without getting bogged down in analysis paralysis. RICE can help you tease out projects that have a higher likelihood of success, targeting those with high reach, high impact, and high confidence, while keeping effort low. For early project selection, think of this as “Quick RICE” or “gut-check RICE”—you’re making rapid assessments to identify promising candidates, not conducting detailed analysis. That deeper dive comes later when you have more data. 

* Reach: How many developers feel this pain? 

    * Focus on broad reach. Choose improvements that can benefit many developers rather than solving deep problems for a few. 

    * Consider frequency. Areas of friction that impact developers frequently (e.g., daily or multiple times a day) are great candidates for early projects. 
* Impact: Will developers immediately notice the improvement? 

    * Target visible impact. Pick improvements that developers immediately feel, reducing the need to prove value later. Example: Implementing automated dependency checks and standardized PR templates to reduce code review cycles from three days to one day. 

    * Focus on problems developers recognize. Target issues that developers already know about and feel personally. While it’s tempting to tackle underlying root causes, developers and their managers want to see and feel progress. These wins build credibility and naturally gain leadership attention. 

* Confidence: Can you deliver this successfully? 

    * Look for clear milestones where you can show progress. Select initiatives where you can easily identify visible checkpoints that stakeholders can track. Milestones let you demonstrate incremental success, maintain momentum, and identify when something isn’t working before you’ve invested too much time. 

    * Choose measurable projects. Select projects where progress and value can be measured through existing or easy-to-capture metrics. This approach eliminates the double burden of both delivering value and proving it exists, allowing your team to focus on solving problems rather than measuring them. 

* Effort: How quickly can you show results? 

    * Find low-hanging fruit. Look for annoying but fixable issues (some people call these “paper cuts”). Common examples include automating repetitive tasks, fixing flaky tests, improving a difficult UI, or streamlining access to development environments. Depending on your context, some of these may require more work, so evaluate and look for things that can be addressed within weeks (or maybe a few months). 

    * Target medium complexity. Choose projects complex enough to deliver meaningful value but not so complex that they risk getting stuck. These “goldilocks” initiatives— such as fixing flaky test suites, improving monitoring dashboards, or finishing data migrations—demonstrate competence while maintaining momentum. Avoid both trivial changes that feel like busywork and ambitious refactors that could take quarters to complete. 

    * Consider timelines. Early projects should show results in three months, while later efforts should have visible milestones every six to nine months. For example, avoid choosing an initial project that requires a significant re-architecture, as these typically take a significant amount of time and offer little visible progress until they are complete.

When evaluating your candidate projects from interview synthesis: 

1. Score each project on a simple scale (High/Medium/Low) for each RICE component. 
2. Look for patterns--projects scoring High on reach and impact with Medium or Low effort are often winners. 
3. Trust your instincts--if something feels off despite good scores, dig deeper. 
4. Consider combinations--sometimes two smaller projects together create more impact than one large one.

"Turn evaluation into clarity."

"Your DevEx breakthrough might be a process, not a tool."

### Chapter 17 - Share Early Wins to Gain Momentum

"Fail fast and share your learnings."

"Celebrate wins along the way."

"Bring others along on the journey."

"Share your findings thoughtfully."

"Keep the conversation going."

### Chapter 18 - Avoid Common Pitfalls

Van Buren and Safferstone studied 5,400 leaders implementing new initiatives in companies. Their work reveals common pitfalls that can undermine long-term success. (Van Buren, Mark E., and Todd Safferstone. “The quick wins paradox.” Harvard Business Review 87.1 (2009): 54-61.) Here’s how successful leaders navigate these challenges: 

* Handling feedback. 

    * Don’t get defensive when questioned. It’s natural to feel protective of work you’ve invested in, but defensiveness shuts down dialogue. Instead, explain your rationale and reasoning—this builds understanding rather than resistance. DevEx teams often assume their experience represents the broader engineering org—a common blind spot. 

    * Do treat criticism as valuable input. Engineers are your customers, and their feedback shapes better solutions. Stay curious, seek early feedback, and remember that listening builds trust. 

* Team dynamics. 

    * Don’t be overconfident when prescribing solutions. Teams may have tried similar approaches and encountered hidden challenges. Focus on identifying and prioritizing problems. 

    * Do balance knowledge with genuine curiosity. Let empowered teams explore solutions to the problems you identify, and continue to gather insights from listening tours. 

* Decision making. 

    * Don’t build solutions in isolation. Even with the best intentions to show quick progress, DevEx teams often fall into the trap of working alone to avoid dealing with different opinions. This is especially true in DevEx initiatives because your customers often have strong opinions about the right sonlution. 

    * Do embrace collaboration. Choose initiatives that engage the broader engineering organization. While individual quick fixes may seem more efficient, projects with shared ownership create better solutions and stronger buy-in.

* Execution style. 

    * Don’t micromanage engineers—trust empowered teams across the organization to explore solutions. The best initiatives—and products—are those where leaders identify and prioritize problems, and empowered engineering teams explore solutions. 

    * Do invest in sharing context. When engineers understand the broader picture, they design better solutions and make informed decisions. This also builds trust in team judgment. Create clear communication channels for updates and decisions. The research shows that the most successful leaders don’t avoid quick wins—they embrace them. The key difference is their focus on building team capability and shared success rather than individual achievements.

## STEP 3 Use Data to Optimize Your Own DevEx Work

### Chapter 19 - Establish Your Data Foundation

There are a few kinds of data to think about, and they overlap a bit.

* Qualitative data is descriptive, and includes things like interview transcripts and open-text responses in surveys.
* Quantitative data is numerical, specifically in ways that can be calculated, for example a response on a 1-5 survey scale, or statistics from version control system use.

We will also talk about self-report and system data, each of which can be either qualitative or quantitative.

* Self-report data comes from people’s perceptions and experiences. It can be qualitative (like interviews or open-text responses) or quantitative (like 1-5 scale survey responses). 
* System data can be observed and measured externally. This is also called objective data. It’s typically quantitative (such as number of commits or turnaround time on a PR) but can also be qualitative (such as error messages).

. | Qualitative Data | Quantitative Data
--- | -------------- | ------------------
Self-report Data | Interview transcripts; Open-ended survey responses; Feedback comments | Survey ratings; Satisfaction scores; Self-reported productivity metrics
System Data | Error messages; Log entries; Documentation content; User flow | Build times; Deployment frequencies; Error rates; System performance metrics

"Surveys and system data are strategic partners, each with unique strengths."

"The most successful DevEx initiatives use both self-report and system data."

### Chapter 20 - Identify and Use the Data You Already Have

"Most organizations have untapped metrics that can provide valuable insights into developer experience."

For example: 

* Development activity. Version control metrics, pull request patterns, code review times, AI assistant adoption and code generation. 
* Build and test performance. CI/CD pipeline metrics, test coverage, build times, failure rates—both for traditional and AI-assisted development. 
* Operations. Deployment frequency, infrastructure costs, monitoring and logging information. 
* Process. Ticket resolution times, incident response data, feature delivery cycles. 
* Feedback. Existing developer surveys, retrospective notes, onboarding feedback.

Find early insights from existing data. Once you find and document your existing data sources, here are some ways to extract valuable insights: 

* Development history analysis. 

    * Analyze commit patterns: Look for frequency trends, time-of-day patterns, and areas with high churn. 

    * Examine pull request metrics: Review time-to-merge, review cycles, and comment patterns. 

    * Track feature lifecycles: Identify abandoned projects, reverted changes, and their contexts. 

    * Compare AI vs. non-AI development patterns: Review metrics between developers using AI tools and those using traditional approaches. Look for learning curves, productivity changes, and new friction points. 

* Incident and failure analysis. 

    * Connect code changes to incidents: Map specific commits or deployment patterns to system failures. Look for correlations with AI-assisted coding and AI-enabled toolchains. 

    * Study incident reports: Identify recurring issues, response times, and root causes. 

    * Review postmortem documentation: Extract lessons learned and improvement recommendations, and note any recurring patterns. 

* Project documentation mining. 

    * Analyze archived project specs: Understand reasons for project cancellations or pivots. 

    * Review technical debt notes: Identify areas where shortcuts were taken and why. 

    * Examine architecture decision documents: Learn from past decisions and their outcomes. 

* Tool and platform usage. 

    * Monitor CI/CD pipeline performance: Track build times, failure rates, and bottlenecks across both traditional and AI-assisted workflows. 

    * Review platform support ticket patterns: Identify recurring developer pain points.

    * Analyze tool adoption data: Understand which tools developers actually use vs. available tools.

### Chapter 21 - Use Surveys for Fast Insights

"You can get actionable insights now through surveys."

"A powerful DevEx survey doesn’t need to be long—and it shouldn’t be."

"Measure value with the Sean Ellis Test. While active user metrics and satisfaction scores provide valuable signals, occasionally you need a more direct assessment of how essential your solution—or an existing tool—has become to users. The Sean Ellis Test offers a simple and powerful method that startup companies use to determine product-market fit, and it works equally well for internal developer tools. The test centers on a single powerful question: *“How would you feel if you could no longer use [your platform/tool]?”* With just three possible responses: Very disappointed; Somewhat disappointed ;Not disappointed (it isn’t that useful). Through extensive work with startups, Ellis found that products with strong market fit consistently have at least 40 percent of users answering they would be “very disappointed” if they could no longer use the tool. This threshold has become a reliable benchmark for product success." ... "However, be cautious when interpreting results for mandated tools where users have no alternatives. In these cases, consider adapting the question. For example: *“**If you had a choice of developer tools**, how would you feel if you could no longer use [current tool]?”* This framing helps distinguish between genuine tool value and organizational dependency. You can also pair the Ellis Test with satisfaction questions to better understand whether high disappointment scores reflect tool love or job necessity."

### Chapter 22 - Invest in System Metrics Over Time
### Chapter 23 - Make Sure You Capture the Right Data
### Chapter 24 - Turn Data Into Actionable Insights

## STEP 4 Decide Strategy and Priority

### Chapter 25 - Focus Your DevEx Efforts
### Chapter 26 - Use Relevant Criteria to Set Priority for Developer Experience
### Chapter 27 - See the Bigger Picture: Use a Quick Rubric

## STEP 5 Sell Your Strategy

### Chapter 28 - Leverage Your Stakeholder Analysis for Effective Communication
### Chapter 29 - Effective Messaging Takes Customization and Repetition

## STEP 6 Drive Change at (Your) Scale

### Chapter 30 - Adapt Your Approach to Your Scope
### Chapter 31 - Drive Change With Global Scope of Control
### Chapter 32 - Drive Change With Local Scope of Control
### Chapter 33 - Drive Change With Middle Ground Scope of Control

## STEP 7 Evaluate Your Progress and Show Value

### Chapter 34 - Analyze Your Data
### Chapter 35 - Prepare to Communicate Your Results
### Chapter 36 - Share Progress
### Chapter 37 - Navigate Conflicting Metrics
### Chapter 38 - Learn and Improve
### Chapter 39 - Evaluation Is Just One Step in a Virtuous Cycle 

# PART V Evolving and Sustaining DevEx

## THE FIRST PRACTICE Resource Your DevEx Initiative

### Chapter 40 - Bootstrap Your Early Efforts
### Chapter 41 - Build a Dedicated Function
### Chapter 42 - Developing Talent for DevEx Roles
### Chapter 43 - Make Developer Experience Everyone’s Job
### Chapter 44 - Secure Budget at Different Organizational Stages
### Chapter 45 - Making DevEx Stick

## THE SECOND PRACTICE Create Structures to Support Change

### Chapter 46 - A Framework For DevEx Change
### Chapter 47 - Support Teams Through Change
### Chapter 48 - Guide Organizations Through Change
### Chapter 49 - Support Yourself Through Challenging Work

## THE THIRD PRACTICE Make Technology Sustainable and Effective

### Chapter 50 - Adopt a Product Mindset
### Chapter 51 - Use Product Management Principles to Build Better Solutions
### Chapter 52 - Use Tooling Standardization to Drive Efficiency
### Chapter 53 - Deal with Technical Debt in DevEx Initiatives
### Chapter 54 - Bring It All Together: The Sustainable Technology Mindset

## THE FOURTH PRACTICE Design Metrics That Evolve and Amplify Impact

### Chapter 55 - Design Metrics for Your Stakeholders
### Chapter 56 - Use Metrics to Solve Your Stakeholders’ Problems
### Chapter 57 - Fast Is Relative to Your Competition
### Chapter 58 - Start Simple and Scale Smartly
### Chapter 59 - How AI Changes (and Doesn’t Change) the Metrics You Need
### Chapter 60 - Maintain Your Metrics Like Any Product 

# Final Thoughts

### Chapter 61 - What Are You Waiting For?
