title=Product Roadmaps
tags=reading, book
summary=Developing product roadmaps
~~~~~~
# Product Roadmaps
(by Lombardo, McCarthy, Ryan, Connors)

### Chapter 1: Relaunching Roadmaps
Roadmap is a strategic communication tool, a statement of intent and direction; describes how you intend to achieve your product vision. It focuses on the value you propose to deliver for your customer and your organization in order to rally support and coordinate effort among stakeholders.

Product: how you deliver value to your organization's customers.
Stakeholder: all the internal and external colleagues and partners who are involved with the product being developed, marketed, sold, and serviced.
Customer: the recipient of the value your product provides. Buyer and user are often the same, but not always.

Product roadmap should:
	* Put the organization's plans in a strategic context
		* Problem: Nobody understands why things are on the roadmap
		* Solution: Tie the roadmap to a compelling vision of the future
	* Focus on delivering value to customers and the organization
		* Problem: You are shipping a lot but not making progress
		* Solution: Focus the roadmap on delivering value
	* Embrace learning as part of a successful product development process
		* Problem: Executives and customers demand commitments
		* Solution: Commit to outcomes rather than output
	* Rally the organization around a single set of priorities
		* Problem: Marketing and sales are not selling what you are making
		* Solution: Align everyone around common goals and priorities
	* Get customers excited about the product's direction
		* Problem: Customers aren't excited about your new features
		* Solution: Use the roadmap to reality-check your direction with customers

Product roadmap should NOT:
	* Make promises a team cannot deliver
		* Problem: Your stakeholders and customers expect a firm commitment on dates for your product releases
		* Solution: Prioritization is critical to deliver on your commitments
	* Require wasteful up-front design and estimation
		* Problem: Time spent estimating design and development efforts takes time away from actually implementing them
		* Solution: Let the teams determine the solutions, and allow them to solve the problem
	* Should not be confused with a release plan or a project plan
		* Problem: Your team looks at the roadmap as if it were a project plan when features will be released
		* Solution: Commit to outcomes rather than output

### Chapter 2: Components of a Roadmap
Primary components:
	* Product vision is your guiding principle
	* Business objectives help to measure progress
	* Themes focus on outcomes rather than output; "What would need to be true for our product to realize its vision and attain its business objectives?"
	* Broad timeframes avoid overcommitment
	* Disclaimer protects you (and your customer)

Secondary components to answer the concerns of certain stakeholders:
	* Features and solutions show how you intend to deliver on your themes
	* Confidence 
	* Stage of development
	* Target customers (if your product serves more than one customer)
	* Product areas

Complementary information to provide context for your roadmap:
	* Project information
	* Platform considerations
	* Financial context
	* External drivers

### Chapter 3: Gathering Inputs


### Chapter 4: Establishing the Why with Product Vision and Strategy
Mission defines your intent. Four key elements: value (what value does your mission bring to the world), inspiration (how does your mission inspire your team to make the vision a reality), plausibility (is your mission realistic and achievable), and specificity (is your mission specific to your business, industry and/or sector).

Vision is the outcome you seek.

Values are beliefs and ideals.

Product vision: Why your product exists.

Value proposition template:
For: (target customer)
Who: (target customer's needs)
The: (product name)
Is a: (product category)
That: (product benefit/reason to buy)
Unlike: (competitors)
Our product: (differentiator)

Supports our: (objective(s)

Universal business objectives:
	* Sustainable value:
		* Support the product's core value
		* Create barriers to competition
	* Growth
		* Grow market share
		* Fulfill more demand
		* Develop new markets
		* Improve recurring revenue
	* Profit
		* Support higher prices
		* Improve lifetime value
		* Lower costs
		* Leverage existing assets

### Chapter 5: Uncovering Customer Needs Through Themes
Identifying customer needs is the most important aspect of your roadmapping process. Draw a clear distinction between the product roadmap and the release plan. Themes are an organizational construct for defining what's important to your customers at the present time. A theme is a high-level customer need. A subtheme is a more specific need. Themes are about outcomes, not outputs.

Opportunity-Solution Trees (https://www.producttalk.org/opportunity-solution-tree)

Expected Outcome (Objective)
	* Opportunity (Themes)
	* Opportunity
	* Opportunity
		* Solution (Features)
		* Solution
			§ Experiment
			§ Experiment

Job stories (similar to user stories):
When (situation/motivation)
I need (desire)
So I can (result)

Themes:
Ensure (result) for (stakeholder)

Tie the themes back to your strategic objective. (Product vision -> Objectives -> Themes and subthemes)

### Chapter 6: Deepening Your Roadmap
Add secondary information to flesh out the picture.

Features and Solutions: How They Can Work with Themes
	* Probable solutions (with a relatively high degree of confidence)
	* Infrastructure solutions
	* Carryover solutions

Stages of Development: discovery, market research, R&D, design, testing, prototyping, development, pre-production, alpha, beta, early access, and so on. Spotify uses "think it", "ship it" or "tweak it".

Confidence: Nothing should ever be 100% confident. (0.2 to 0.8 confidence levels)

Identifying Target Customers.

Strive for Balance--don't bury the roadmap in secondary details.

### Chapter 7: Prioritizing--with Science!
Why Prioritization is Crucial
	* Opportunity Cost
	* Shiny Object Syndrome
	* Exponential Test Matrix Growth
Bad Ways to Prioritize
	* Your (or someone else's) gut
	* Analyst opinions
	* Popularity
	* Sales requests
	* Support requests
	* Competitive me-too features
Prioritization frameworks
	* Critical path: What is the one thing (or set of things) our solution needs to get right?
		* Use to: Identify the "one thing" that will drive a customer to buy
		* Choose When: Designing an MVP or making a major expansion in product scope
		* Downsides: Does not take into account effort, risk, or business goals; does not rank needs finer than "critical" or "noncritical"
	* Kano (from Dr Noriaki Kano): classifying customer expectations into three broad categories: expected needs, normal needs, and exciting needs. Expected needs not met lead to dissatisfiers. Normal needs are satisfiers. Exciting needs are delighters and go beyond the customer's experience.
		* Use to: Understand how customers perceive relative value
		* Choose When: Identifying possible add-ons or enhancements
		* Downsides: Does not take into account effort, risk or business goals
	* Desirability (Do customers want it?), Feasibility (Can we--and how easily can we--build it?), Viability (Can we make money on it?); use a 1 (low), 2 (medium), 3 (high) scale for each possibility
		* Use to: Identify opportunities that meet all key criteria for success
		* Choose When: Prioritizing a relatively small set of initiatives or solutions to a particular problem
		* Downsides: Categories are not clearly defined in terms of customer needs, organization goals, or different types of effort or risk
	* ROI scorecard: Value/Effort = Priority
		* Strategy defines value; Value = Customer's Needs + Organization's Goals
		* Deliberate imprecision; be wary of complexity here
		* Estimating effort; don't scare engineers away; T-shirt sizing
		* Think cross-functionally
		* Risks and unknowns
		* Full Formula: ((CN1 + CN2 + CNn + … + BO1 + BO2 + BOn…) / (E1 + E2 + En…)) x C = P
			§ CN: Customer's Need
			§ BO: Business Objective
			§ E: Effort
			§ C: Confidence
			§ P: Priority
		* Use to: Rank ideas according to return-on-investment criteria
		* Choose When: Weighing multiple factors and/or a long list of possible initiatives, problems to solve, features, or solutions
		* Downsides: More complex model requires alignment on different components of value and effort
	* MoSCoW method: Must-have, Should-have, Could-have, Won't-have
		* Use to: Communicate launch criteria
		* Choose When: Feeling uncertain about what must be included in a product/service/release
		* Downsides: Does not help set priorities, only communicate them


### Chapter 8: Achieving Alignment and Buy-in
Alignment (concerted effort to help people understand the issues and what their respective roles are), consensus (a group of people reaching a mutually agreed-upon decision; in practice, a potential for a passive-aggressive mess), collaboration (individuals cooperate to accomplish a common goal or outcome; individuals work together for a shared purpose--they may not concur on everything each step of the way, but they do agree on the final outcome).

Shuttle diplomacy: meeting with each party individually to reach decisions that require compromise and trade-offs. Politics (and strong voices drowning out quieter ones) can ruin attempts at alignment--much more manageable in one-on-one meetings. You can focus the conversation on common goals if it's just you and them, with nobody else in the room for them to answer to or try to impress. Entice stakeholders with a draft of your roadmap and ask for their input; always tie the meeting to goals and objectives. Use GROW (Goals/Reality/Options/Way forward) to guide the conversation.

Co-creation workshop. Needs to have clear plan and outcomes before you hold it. Outcome is to finalize the roadmap for the upcoming period. Loose agenda:
	* Intro and rules (5 min)
	* Hopes and fears (5 min): each individual writes their hopes for the product's future on one color of Post-It/index card, and fears on another color. Objective is to draw out everyone's emotional aspirations and fears and see how they align with each other and with the established business objectives.
	* Vision and goals (10 min): articulate the product vision (if it's not already determined). Follow this prompt: "A world where the (target customer) no longer suffers from the (identified problem) because of (product differentiator) they (benefit)." Pare this down to: "To (benefit realized) by (product differentiator)."
	* Back-plan (15 min): start with the end result of the cover story (PR/FAQ) and work gradually backward to the present. Each step backward must be realistic, so teams are forced to think through all the different changes necessary.
	* Sizing and prioritizing (40 min): Example: spend $100 on particular customer needs.
	* Wrap-up (10 min)


### Chapter 9: Presenting and Sharing Your Roadmap
(Why, risks, different types of presentations to different kinds of audiences, etc)


### Chapter 10: Keeping It Fresh
(When, where and how to incorporate change into the roadmap)


### Chapter 11: Relaunching Roadmaps in Your Organization
(Steps for re-launching roadmaps into an organization that has gotten away from them)



