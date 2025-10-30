title=Technical debt
tags=reading, development, business
summary=Notes and links about the subject.
~~~~~~

## Thoughts

### Metrics

Tracking technical debt with metrics: Keeping track of technical debt is essential for maintaining the health and sustainability of a software project.

* Documentation and record keeping

    * Document Technical Debt: Whenever technical debt is incurred, document it. This includes the reasons for the debt, the expected impact, and any plans for resolution.
    * Maintain a Technical Debt Register: Create a centralized document or tool where all instances of technical debt are recorded and tracked. This should include details like the nature of the debt, associated code or modules, and any deadlines for resolution.

* Code reviews and analysis:

    * Regular Code Reviews: Implement a process where code is regularly reviewed by peers. This helps in identifying potential technical debt early.
    * Static Code Analysis Tools: Use tools that automatically analyze code for potential issues, such as code smells, complexity, duplication, and other indicators of technical debt.

* Integration with Issue Tracking Systems:

    * Link Debt to Issues: When technical debt results in bugs or issues, link these in your issue tracking system. This provides a clear connection between the debt and its consequences.
    * Prioritize Debt Issues: Make sure that technical debt issues are prioritized alongside other work items in your backlog.

* Testing and Coverage Metrics:

    * Monitor Test Coverage: Regularly review test coverage metrics to ensure that your codebase is adequately tested. Low test coverage can be an indicator of technical debt.
    * Automated Testing: Implement automated testing to continuously monitor the health of your codebase and catch issues early.

* Regular Refactoring Sessions:

    * Dedicated Refactoring Time: Allocate regular time slots for refactoring and addressing technical debt. This ensures that debt is actively being paid down.
    * Refactor as You Go: Encourage developers to refactor and improve code as part of their regular development process, not just during dedicated sessions.

* Metrics and Dashboards:

    * Use Metrics: Track key metrics to get a quantitative view of your technical debt.
    * Dashboards: Create dashboards that visualize technical debt metrics. This helps in quickly assessing the health of the project and identifying areas that need attention.

##### Tech Debt Index (TDI)
*Measurement: Metric* (Goal will depend on how the metric is calcuated)

A composite metric that combines various indicators of technical debt into a single index.

***Mechanism:***

Combining various technical debt metrics (like code complexity, bug count, etc.) into a single index.

***Benefits:***

* Provides a holistic view of technical debt in the project.
* Can be used to track changes in technical debt over time.
* Offers a high-level overview of technical debt, useful for management and stakeholder communication.

***Risks:***

The construction of the index can be subjective, depending on which metrics are included.
May oversimplify complex aspects of technical debt.


##### Tech Debt Ratio (TDR)
*Goal: Low* *Measurement: percentage*

TDR is a measure of the cost to fix the technical debt relative to the size of the codebase. Use TDR to assess and communicate the overall health of the codebase to both technical and non-technical stakeholders.

***Mechanism:***

1. **Identifying components.** Decide which parts of the application are to be evaluated for technical debt.
2. **Code analysis.** Use static code analysis tools suitable for the programming languages and frameworks used in the fintech app (e.g., ESLint for JavaScript, SonarQube for a range of languages).
3. **Calculating remediation cost.** Estimate the time required to address the code issues identified. Consider the complexity of the fintech environment, which might require specialized skills. Assume an average cost per developer hour specific to fintech development expertise (e.g., $80/hour). Example: If it takes 15 hours to refactor the complex code and update libraries, the cost is 15 hours * $80/hour = $1,200.
4. **Calculating development cost.** Estimate the total cost of developing the app or its specific modules, including design, coding, testing, deployment, and any other expenses. Example: The development cost of the investment portfolio manager might be $30,000.
5. **Calculating Technical Debt Ratio.** Technical Debt Ratio = (Remediation Cost / Development Cost) * 100
Calculation: For the investment portfolio manager, the ratio is ($1,200 / $30,000) * 100 = 4%.
6. **Interpretation and action.** Interpretation: A 4% technical debt ratio indicates a moderate level of debt. Action: Prioritize fixing critical issues, especially those related to security, data integrity, and regulatory compliance.

***Benefits:***

* Provides a quick snapshot of the quality of code being produced 
* Provides a monetary perspective on the impact of technical debt
* Helps in prioritizing debt reduction based on cost
* A higher ratio suggests a significant portion of development effort goes into addressing technical debt
* Can be used to justify investment in reducing technical debt

***Limitations:***

* Estimating the cost to fix issues can be subjective.
* Doesn't capture non-code aspects of technical debt (like architectural issues).
* Might not reflect the impact of non-quantifiable aspects of debt.


##### Defect count
*Goal: Low* *Measurement: Instances of defects within a system*

This metric tracks the number of open bugs. High numbers can indicate underlying quality issues contributing to technical debt.

***Mechanism:***

Use a defect tracker or other system (spreadsheet).

***Benefits:***

* Useful as overall guide to health of development.

***Risks:***

* Bug counts alone don't give a complete picture of the software's health.


##### Defect age
*Goal: Low* *Measurement: Time per defect*

Bugs that have been open for a long time can indicate that technical debt is being neglected. This can lead to a deteriorating codebase and user experience.

***Mechanism:***

Use a defect tracker or other system (spreadsheet). Timestamps must be present for each defect report.

***Benefits:***

* Useful for prioritizing bug fixes.
* Helps prioritize bug fixes and identify areas needing improvement.

***Risks:***

* The severity and impact of bugs vary; not all bugs contribute equally to technical debt.


##### Defect growth rate
*Goal: Low, preferably negative* *Measurement: instance delta (number of new bugs reported versus the number of bugs that have been resolved or closed over a specific period)*

***Mechanism:***

Track the number of new bugs reported and the number of bugs closed in your issue tracking or project management software over regular intervals (e.g., weekly, monthly).

***Benefits:***

* **Balance of Bug Creation and Resolution:** A high number of new bugs compared to closed ones could indicate growing technical debt, as it suggests issues are being introduced faster than they are being resolved.
* **Software Stability:** A sudden spike in new bugs might indicate problems introduced in recent updates, reflecting the impact of rushed development or insufficient testing, both of which can contribute to technical debt.
* **Project Health Monitoring:** Regularly comparing new and closed bugs can help in assessing the health and progress of a project. A project with decreasing technical debt should ideally show a trend of decreasing new bugs or an increasing rate of bug closure.
* **Prioritization and Resource Allocation:** This metric can help in prioritizing bug fixing and allocating resources effectively, which is crucial for managing and reducing technical debt.
* Helps in understanding the dynamics of bug occurrence and resolution in a project.
* Can signal when technical debt might be increasing, requiring attention to areas of the codebase that are generating new bugs.
* Assists in resource planning for bug fixing and technical debt reduction efforts.

***Risks:***

* **Not All Bugs are Equal:** This metric doesn't account for the severity or complexity of the bugs. Therefore, the raw numbers might be misleading without the context of bug impact.
* **Quality of Bug Reporting:** The reliability of this metric depends on the consistency and quality of bug reporting practices. Inconsistent reporting can skew the data.
* **Does Not Reflect Underlying Causes:** While this metric can signal potential problems, it doesn't directly point to the causes of technical debt.


##### Defect ratio, Defect density
*Goal: Low* *Measurement: number of defects in a software system relative to its size*

Helps in tracking the quality of the software over time, indicating whether technical debt is causing an increase in defects. Can guide decisions about where to focus development efforts, particularly in identifying areas of the codebase that may be contributing disproportionately to the defect count. Assists in prioritizing technical debt reduction strategies, especially when correlated with other metrics like code complexity or code churn.

Applied to whole systems, this is essentially a bug count. Applied to individual files or components, it highlights (heatmaps) the 20% of the code where 80% of the defects live.

***Benefits:***

* **Quality vs. Debt:** While a high defect ratio directly points to quality issues, it indirectly suggests technical debt. For instance, rushed features, lack of testing, or poor design decisions can lead to both more defects and more debt.
* **Actionable Insights:** Knowing the defect ratio can help teams prioritize refactoring, improve testing strategies, or revise development practices to reduce both defects and technical debt.
* **Indicator of Software Quality:** A high defect ratio suggests lower quality, which could be a result of accumulated technical debt due to issues like rushed development or poor design.
* **Maintenance and Refactoring Needs:** An increasing defect ratio over time can indicate that the software is becoming more difficult to maintain, suggesting the need for refactoring and addressing technical debt.
Project Health Assessment: It provides a quick snapshot of the current state of the project, helping to assess whether technical debt is impacting the software negatively.

***Limitations:***

* **Not All-Encompassing:** The defect ratio alone doesn't capture all aspects of technical debt, such as architectural issues or code complexity.
* **Quality of Defect Reporting:** The metric's accuracy depends on the thoroughness and consistency of defect reporting practices.
* **Variability in Defect Severity:** Not all defects have the same impact or require the same effort to fix, which this ratio doesn't account for.

***Mechanism:***

* Count the total number of defects (reported bugs or issues) and divide it by a measure of software size (like lines of code, function points, or modules).
* Defect Ratio = Size of the Software/Number of Defects​
* Number of Defects is the total number of defects found in the software.
* Size of the Software could be measured in different units, such as lines of code, function points, or number of modules/components.


##### Cycle Time
*Goal: Low* *Measurement: Time*

Measures the time it takes for a unit of work to be completed from start to finish. Unlike throughput, which measures the amount of work completed in a given time period, cycle time focuses on the amount of time. This metric is useful for understanding how long it takes to complete a specific task, and can be useful for identifying bottlenecks or inefficiencies in the development process.


##### Lead time for changes, Time to Market (TTM)
*Goal: Low* *Measurement: Time*

Lead time for changes is the time it takes to go from code committed to code successfully running in production. TTM is typically customer-facing and at largerscale than a single feature. This metric is important for measuring the speed and agility of your software delivery process. Lead time takes into account the time it takes to plan, prioritize, and start work on a unit of work, as well as the time it takes to complete it. It can be useful for understanding how long it takes to deliver new features or improvements to customers.

***Mechanism:***

Measure the duration from when a feature is planned to when it is available to users.

***Benefits:***

* Longer lead times can be a symptom of high technical debt, as existing issues slow down new development.
* Helps in identifying bottlenecks in the development process.
* Longer time to market can indicate inefficiencies and potential technical debt.
* Striving for shorter time to market can sometimes lead to accruing more technical debt.
* If the team is able to quickly implement new features or fix bugs and get them into production, the organization can respond more quickly to changes in the market or user needs. This can lead to a competitive advantage.

***Risks:***

* Time to market is influenced by many factors, not just technical debt.
* Short time to market isn't always positive, especially if it leads to lower quality.
* Influenced by many factors beyond technical debt, such as team size and resource allocation.
* Not all delays are due to technical debt.


##### Code Churn
*Goal: Low* *Measurement: percentage of a developer's own code that is recently edited (added, modified, deleted) after being written.*

Code churn can be indicative of indecision, lack of clarity, or misunderstanding – all of which contribute to technical debt. High code churn, especially late in a development cycle, can be a red flag that code may be less reliable or harder to maintain. High churn may indicate unstable or problematic areas in the codebase. Helps identify features or modules that are frequently changed and might be accumulating debt.

***Mechanism:***

* Calculate the percentage of lines of code that have been changed, added, or deleted during a specific time frame.

***Benefits:***

* Identifying areas of frequent changes helps to pinpoint unstable code and prevent potential future issues related to constant modifications.
* Analyzing code churn alongside bug count can provide insights into whether the churn is constructive (refactoring, improving code) or destructive (introducing more defects).
* It helps in prioritizing areas for refactoring and understanding the impact of changes.

***Limitations:***

* High churn isn’t always negative; it can reflect healthy iterative development.
* Doesn’t directly measure code quality.


##### Development Throughput, Velocity
*Goal: High* *Measurement: Instances (stories, features, etc) within time*

Throughput is a way of measuring how much work your team is able to complete in a specific period of time. It's a way of tracking progress and understanding how well your processes are working. By keeping an eye on throughput, you can make changes to improve the efficiency of your team’s work. Tracking throughput is like keeping a pulse on the health of the development process. 

***Mechanism:***

1. **Define the unit of work.** The first step is to define what constitutes a unit of work in your development process. For example, you may decide that a unit of work is a completed user story, a fixed bug, or a feature that meets acceptance criteria. Whatever you choose, it's important that the definition of a unit of work is consistent and clear for everyone on the team.
2. **Track progress.** Next, track how many units of work are being completed in a given time period. For example, you might track the number of completed user stories over the course of a sprint, or the number of fixed bugs over the course of a week.
3. **Calculate the throughput.** Finally, calculate the throughput by dividing the number of units of work completed by the amount of time it took to complete them. For example, if your team completed 20 user stories in a two-week sprint, the throughput would be 20 user stories / 2 weeks. Important: You can’t measure a weekly throughput by dividing this number by 2. For that, you need to assess a week as a separate entity.

Example: Development team of 5 people completed a total of 20 user stories in 4 weeks. The team's throughput would be 20 user stories / 4 weeks.

***Benefits:***

* **Early access to potential efficiency problems.** Throughput shows you if your process remains efficient. It’s the first indicator of something going wrong. Then, you can get deeper and look for detailed causes of this problem. By that, you’re continuously making sure you’re on the right path to deliver value to your customers in a timely manner and can prioritize tasks accordingly.
* **Improved processes.** Measuring throughput helps you to identify problems early on and make changes before they become bigger issues. By tracking this metric, you can identify bottlenecks, optimize the workflow, and prioritize tasks effectively. After that, you can make changes to improve efficiency and reduce waste, which entails working in accordance with lean methodology.
* **Better resource allocation.** Throughput helps to determine the amount of work that can be completed in a given time period, which in turn helps to allocate resources effectively.
* **Enhanced decision-making.** By tracking this metric, you can make informed decisions that drive continuous improvement and help you meet your goals.

***Risks:***

* **Oversimplification.** Focusing solely on throughput can lead to an oversimplification of the complex processes involved in software development. This can result in an incomplete understanding of performance and a failure to identify other key factors that impact development outcomes.
* **Misinterpretation.** If not properly understood, throughput metrics can be misinterpreted, leading to incorrect conclusions and misguided decisions. The issue is that throughput metrics on their own only provide a small piece of information about the overall performance of a system. If they're looked at in isolation, without considering other factors, it's possible to come to incorrect conclusions. For example, if you see an increase in throughput, it could be due to an increase in the number of resources or an improvement in processes. If you make decisions based solely on this increase, you might be misled into thinking that you're making progress, when in fact the underlying issues causing problems in the system are still there.
* **Lack of reference to complexity and size of tasks.** Throughput doesn’t incorporate two aspects: complexity and size of tasks. That way, a team still can process tasks of various types, and in that case throughput won’t give much insight into your process.
* **Incentivizing negative behaviors.** If throughput becomes the primary focus, team members may be incentivized to prioritize speed over quality, leading to decreased productivity and increased errors.
* **Neglect of important factors.** Focusing on throughput to the exclusion of other important factors, such as code quality or collaboration, can lead to an unbalanced approach to software development.
* **Over-reliance on metrics.** Relying too heavily on throughput metrics can result in a lack of attention to other important indicators of performance, such as customer satisfaction and employee engagement.
* **Must still be conscious while assessing performance.** Assessing the performance of individual developers is controversial. Throughput as a single source of truth also isn't good for that goal since it doesn’t refer to quality and complexity of tasks. That way, developers who complete a lot of small tasks and do it carelessly would have higher results than the ones who deliver the code of the highest quality and work with complex tasks. 


##### Pull Request Size
*Goal: Low* *Measurement: bytes, lines of code, # of files*

Pull request size refers to the extent of code changes introduced within a single pull request, typically measured by the number of files modified and lines of code added or removed.

Measuring pull request size helps streamline code reviews, accelerate feedback cycles, and improve code quality by breaking down changes into manageable units and facilitating efficient collaboration among team members.


##### Code Duplication
*Goal: Low* *Measurement: percentage*

Code duplication often leads to maintenance challenges. If a bug is found in a piece of duplicated code, it needs to be fixed in all instances. This increases the likelihood of missed defects and future issues.

***Mechanism:***

Analyze the codebase using static code analysis tools to identify and quantify duplicated blocks of code.

***Benefits:***

* High duplication indicates poor code quality and higher maintenance costs.
* Points to potential areas for code reuse and refactoring.
* Reducing code duplication enhances maintainability and reduces the likelihood of introducing inconsistencies during updates.

***Risks:***

* Some duplication might be necessary or intentional.
* Doesn’t measure other quality aspects like code complexity.


##### Cyclomatic Complexity
*Goal: Low* *Measurement: instances of linearly independent paths through a unit of code*

High cyclomatic complexity indicates that the code may be harder to test thoroughly and more prone to defects. It can also be harder to read and understand, increasing the likelihood of introducing errors during future changes. ‍Use this metric to identify complex code that may be harder to maintain and more prone to defects. Analyzing cyclomatic complexity at a method, class, and module level can help identify specific areas that may benefit most from refactoring.

***Mechanism:***

‍Use static analysis tools to calculate the number of independent paths through the code.

***Benefits:***

* Higher complexity often indicates harder-to-maintain code, contributing to technical debt.
* Can help identify areas that need refactoring.
* Helps in estimating the effort required for testing and maintenance.
* Evaluate the intricacy and potential risks associated with modifications. This approach provides a deeper understanding of the impact on code quality and maintainability.

***Risks:***

* Doesn’t measure code readability or maintainability directly.
* Can be misleading for certain code structures.
* Some level of duplication might be unavoidable or even preferable in certain cases.
* Doesn't indicate other aspects of code quality.


##### Test Coverage
*Goal: High* *Measurement: percentage over lines of code and/or files*

It measures the extent to which the modified code is covered by automated tests. Higher test coverage indicates more confidence in the changes and reduces the risk of regressions. Test coverage analysis helps ensure code quality and stability. While high test coverage is not a guarantee of code quality, inadequate test coverage can mean that the codebase is not well-protected against regressions, making it riskier to address technical debt through refactoring.

***Mechanism:***

Use testing tools and frameworks to calculate the percentage of code executed during testing.

***Benefits:***

* High test coverage can reduce the likelihood of bugs and technical debt.
* Indicates the robustness of testing practices.
* Low test coverage can lead to undiscovered bugs and increase technical debt.
* High coverage helps ensure code changes don't introduce new issues.

***Risks:***

* High coverage doesn't guarantee high-quality tests or code.
* Can lead to a false sense of security if tests are not well-designed.


##### Deployment Frequency
*Goal: High* *Measurement: Instances within time*

Deployment frequency is the number of times code is deployed to production in a given period of time. This metric is important for measuring the speed and agility of a software delivery process. 

For example, if your team is able to deploy code to production frequently, it can lead to a faster feedback loop and quicker response to issues or changes. This can lead to a better product and increased user satisfaction.

A high deployment frequency indicates that teams are able to deliver changes quickly, responding to the needs of the business.


##### Changed Failure Rate
*Goal: Low* *Measurement: percentage (of changes (e.g., deployments or code commits) that fail and require immediate remediation (like a hotfix or rollback))*

***Mechanism:***

Tracking the success and failure rates of deployments and code changes.

***Benefits:***

* A high change failure rate can indicate poor code quality or inadequate testing, contributing to technical debt.
* Helps identify the stability and reliability of the development and deployment processes.

***Risks:***

* Some failures are normal and not indicative of technical debt.
* Doesn't capture the underlying causes of the failures.


##### Number of Failed CI/CD Events
*Goal: Low* *Measurement: instances (number of times continuous integration (CI) or continuous deployment (CD) processes fail.)*

***Mechanism:***

***Benefits:***

* Frequent CI/CD failures can indicate underlying issues in code quality, testing, or the build process, contributing to technical debt.
* Helps in identifying the reliability and efficiency of automated processes.

***Risks:***

* Some failures might be due to external factors unrelated to technical debt.
* Doesn't provide insights into the nature of the issues causing the failures.


##### Mean time to recovery (MTTR)
*Goal: Low* *Measurement: Time*

MTTR is the average time it takes to repair a system after a failure. This metric is important for measuring the reliability and availability of a system. 

For example, let's say your company has a web application that experiences a failure. The MTTR is the time it takes for your team to identify the failure and fix the issue. A low MTTR means your team is able to quickly detect and resolve issues, ensuring that your application is available to users.

A low MTTR indicates a system that is reliable and easy to recover from failures.


##### Mean time between failures (MTBF)
*Goal: High* *Measurement: Time*

MTBF is the average time between failures in a system. This metric is important for measuring the reliability and availability of a system.

For example, if your web application has a high MTBF, it means that your users will experience fewer issues and downtime due to system failures. This can lead to increased user satisfaction and a better overall experience with your product.

A high MTBF indicates a system that is reliable and has fewer failures.


##### Mean time to detect (MTTD)
*Goal: Low* *Measurement: Time*

MTTD is the average time it takes to detect a failure in a system. This metric is important for measuring the effectiveness of monitoring and alerting systems. 

For example, if you have a monitoring system set up to detect issues with your web application, the MTTD is the time it takes for your team to receive an alert after a failure occurs. A low MTTD means your team can quickly identify and address issues, minimizing the impact on users.

A low MTTD indicates that failures are detected quickly, allowing teams to respond and recover more quickly.


##### User value and impact
*Goal: High* *Measurement: opinion/human analysis*

It involves considering factors like user feedback, customer requests, or business goals. By prioritizing value-driven changes, your team will ensure that their efforts align with the needs and expectations of stakeholders. 


##### Peer review
*Goal: High* *Measurement: opinion/human analysis*

Instead of relying solely on metrics, emphasize the feedback and insights provided during peer code reviews. Human judgment and expertise play a crucial role in evaluating code changes. Peer reviews provide an opportunity for knowledge sharing, identifying potential issues, and enhancing overall code quality. 



## Reading

### Articles/Blogs/Essays

* Martin Fowler:

    * [Technical Debt](https://martinfowler.com/bliki/TechnicalDebt.html)
    * [Technical Debt Quadrant](https://martinfowler.com/bliki/TechnicalDebtQuadrant.html)

* LeadDev:

    * [What leaders get wrong about latent cost of technical debt](https://leaddev.com/technical-direction/what-leaders-wrong-about-latent-cost-technical-debt): **Problem:** "Accruing technical debt isn’t necessarily a negative issue, and usually starts with good intentions. For instance, you may have made the call to accept a tech debt trade-off with the view to finishing a feature or meeting a deadline. But what happens when this becomes the norm – an ingrained component of the culture? I have seen the process of teams normalizing broken tests, sluggish builds, and tribal knowledge to the point that no one asks questions about it anymore. The longer this debt remains unaddressed, the more it interferes with the velocity of development and cognitive load, demotivating team members." ... Operational instability: "Technical debt is not always about messy code; it is instability that sneaks into operations. Even the slightest quality problem in a regulated industry can turn into an existential threat. For example, an FAA audit conducted on Boeing found that the airplane company failed 33 out of 89 quality audits of their 737 Max production, because they were not following approved manufacturing processes. What is the cause of most of these failures? Missing documentation, haphazard tooling, and a lack of process; technical debt at scale. Similar to the weak APIs and undocumented programs in our world, these were not merely bugs, but time bombs that had systemic implications. The parallel fragility in software teams is that the [mean time to recovery](https://leaddev.com/reporting/solving-mean-time-repair-problem) (MTTR) is slower, and more often, rollbacks or on-call escalations are required. You may not be building planes, but when a service fails and no one understands who owns the fallback logic or how it is tested, you are closer to the risk than you imagine." ... The silencing effect of accumulated complexity: "Systems are bound to become more complex as they evolve. However, when technical debt accumulates without oversight, such as a *lack of documentation*, *unclear ownership*, or *postponed refactoring*, it accelerates complexity with no structural checks in place. When I was working in a fintech company, we learned that more than 40% of their microservices lacked identifiable owners, alongside the fact that uneven test coverage was rampant. Although the engineering department had grown at a high rate, no one bothered to assess the structural debt being incurred; issues such as tightly coupled services, legacy monoliths with hardcoded integrations, or ownership gaps that made critical systems unmaintainable. These findings illustrated how entrenched silence was in the team culture. Engineers cease to raise issues since this is how things are. New employees do not challenge inconsistencies since they presume it is deliberate. This normalization is what makes technical debt so dangerous; it becomes unseen, but highly influential." ... Strategic cost isn’t just financial: "In addition to operational anarchy, debt constrains strategic options. It traps teams in unstable architectures, makes experimentation less desirable, and change more expensive. ... The moral is obvious: technical debt minimizes optionality. It denies organizations the flexibility to react to threats or innovate promptly when needed." **Approach:** Start with full-scope visibility: "[R]unning engineering surveys, conducting service maturity audits, and analyzing operational metrics. These efforts often revealed debt artifacts like unowned scripts, deprecated libraries, or undocumented APIs – elements that rarely show up in standard project tracking tools.  Without a structured inventory like this, teams often focus their efforts on the most obvious pain points, such as slow tests or deployment delays, rather than the most strategically important ones. Full-scope visibility means going beyond surface issues to identify and document what’s genuinely slowing down delivery, scaling, or incident response. A more modern strategy for understanding the scope of your tech debt issue incorporates telemetry-driven scans. These will be able to surface broken pipelines and flaky tests. It’s also important to gather qualitative feedback: developer pain points, support tickets, and onboarding feedback. If new engineers repeatedly encounter setup failures or unclear integration steps with a specific legacy module during onboarding, that module is a visibility gap. It’s not just a one-time inconvenience; it reflects debt that directly affects developer experience and onboarding velocity. These recurring issues should be logged and scored, as they indicate systemic friction with measurable impact." Score by impact, not just frustration: "Not every debt is alike. An abandoned configuration file is an inconvenience to engineers, but a closely-coupled authentication system that drags every product update has significantly steeper consequences. I suggest a light scoring model that is determined by three factors: *Severity*: What is the downstream risk of this debt going unaddressed? *Frequency*: How frequently does it create issues? *Strategic impact*: Does the debt limit your ability to scale systems, like handling more users, data, or teams? Does it impede your ability to adapt your product direction, e.g., shift to a new architecture, integrate with new services, or launch a different feature? With a simple scoring system (e.g., 1-5), you will have a shared language to compare debts between teams and make decisions on what to work on first. Debt isn't solved by scope; it's solved by relevance." Choose the right fix: Refactor, replace, or bypass: *Refactor* when the debt compounds daily costs; things like developer frustration, poor test coverage, or sluggish performance. For instance, in one of our back-end services, a shared utility function was frequently modified and regularly broke downstream dependencies. A simple refactor to isolate concerns reduced change failure rates by over 30% in just two sprints. *Replace* when you’re scaling past its original intent, e.g., hardcoded workflows or in-memory stores. At a previous role, our real-time analytics relied on an in-memory store that had no sharding or durability guarantees. It worked at launch, but as our usage scaled 10x, data loss and throttling became common. We replaced it with a distributed store designed for high throughput and persistence. *Bypass* when the effort-to-impact ratio is too high, fix only what’s necessary, and document the rest. One team I worked with had a legacy admin portal with hardcoded permissions logic. Rewriting it would have taken months, but it was rarely used. We documented its quirks, added a banner to warn users of limitations, and created a wrapper for the one feature it still supported.
The lesson: don’t assume all tech debt deserves your best engineering. Sometimes, clarity and containment are more valuable than cleanup." Accountability is a team sport: "The ownership of the debt cannot rest with tech leads alone. Teams require incentives and rituals, such as quarterly debt review, shared dashboards, and making ownership based on service health scores. An organization I consulted with tied debt scores directly to performance reviews at the top management level, not as a stick, but as an indication that quality was not a choice. Within two quarters, they saw a 25% increase in resolved debt items and a measurable drop in incident frequency across critical systems, indicating that visibility and ownership alone can drive behavior change."

* [BrainHub](https://brainhub.eu/library):

    * [Solving the Tech Debt Puzzle](https://brainhub.eu/library/tech-debt-puzzle): A case study (Express/JS). "Approach:

        * Performing a tech audit to highlight the problems, risks, and start to raise awareness.
        * Connecting the technical challenges with business priorities.
        * Establishing a testing strategy (unit tests didn’t fit, Testing Trophy was a solution).
        * Adopting a structured approach that leverages testing, refactoring, and careful planning.
        * Encapsulating legacy code within the existing system and developing new features in the Nest framework.
        * Making incremental improvements through minor rewrites.
    
    * [Business Costs of Technical Debt](https://brainhub.eu/library/cost-of-technical-debt)
    * [Refactoring Legacy Code](https://brainhub.eu/library/refactoring-legacy-code-strategy)
    * [Top 7 Refactoring Techniques](https://brainhub.eu/library/refactoring-best-practices)
    * [Technical Debt in Microservices](https://brainhub.eu/library/technical-debt-in-microservices)
    * [Technical Debt Repayment](https://brainhub.eu/library/prioritizing-technical-debt-repayment)
    * [How to Avoid Technical Bankruptcy](https://brainhub.eu/library/avoid-technical-bankruptcy-tips)
    * [Tech Debt Metrics](https://brainhub.eu/library/technical-debt-metrics)
    * [Tech Debt Ratio](https://brainhub.eu/library/technical-debt-ratio)
    * [Managing Tech Debt](https://brainhub.eu/library/how-to-deal-with-technical-debt)
    * [Tools to Measure Tech Debt](https://brainhub.eu/library/tools-to-measure-technical-debt)
    * [Examples](https://brainhub.eu/library/technical-debt-examples)
    * [Application Modernization Challenges](https://brainhub.eu/library/application-modernization-challenges)
    * [Legacy Application Modernization Roadmap - a Step-by-Step Guide](https://brainhub.eu/library/legacy-app-modernization-roadmap)
    * [Legacy Systems Examples](https://brainhub.eu/library/legacy-systems-examples)
    * [Legacy Application Migration to Cloud](https://brainhub.eu/library/legacy-application-migration-to-cloud)
    * [Business Costs of Technical Debt](https://brainhub.eu/library/cost-of-technical-debt)
    * [Red Green Refactor](https://brainhub.eu/library/red-green-refactor-legacy-systems)
    * [The Strangler Pattern for Legacy Modernization](https://brainhub.eu/library/strangler-pattern-legacy-modernization)
    * [Monolith to Microservices Using Strangler Pattern](https://brainhub.eu/library/monolith-to-microservices-using-strangler-pattern)
    * [Big Bang Migration vs Trickle Migration](https://brainhub.eu/library/big-bang-migration-vs-trickle-migration)
    * [Top 15 Data Migration Tools](https://brainhub.eu/library/top-data-migration-tools)
    * [Data Migration Challenges](https://brainhub.eu/library/data-migration-challenges-risks-legacy-modernization)
    * [Data Migration Strategy for a Legacy App](https://brainhub.eu/library/data-migration-strategy-legacy-app)
    * [Microservices vs Monolith](https://brainhub.eu/library/microservices-vs-monolith-which-to-use-when)
    * [When Monolith Is Better Than Microservices](https://brainhub.eu/library/monolith-better-than-microservices)
    * [Modular Monolith – When to Choose It](https://brainhub.eu/library/modular-monolith-architecture)
    * [Master Data Management Strategy](https://brainhub.eu/library/master-data-management-strategy)
    * [Cloud Migration Challenges](https://brainhub.eu/library/cloud-migration-challenges)
    * [Mean Time Between Failures](https://brainhub.eu/library/mean-time-between-failures-mtbf)
    * [Lead Time for Changes](https://brainhub.eu/library/how-to-measure-lead-time-for-changes)
    * [Software Delivery Speed](https://brainhub.eu/library/improve-software-delivery-speed)
    * [How to Measure and Improve Deployment Frequency](https://brainhub.eu/library/how-to-measure-deployment-frequency)
    * [Change Failure Rate](https://brainhub.eu/library/change-failure-rate-best-practices)
    * [Mean Time to Detect (MTTD)](https://brainhub.eu/library/mean-time-to-detect-mttd-explained)
    * [Pull Request Size](https://brainhub.eu/library/pull-request-size-best-practices)



