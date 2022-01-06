title=Reading
type=categorypage
category=reading
tags=reading
summary=Lots of theory and/or category-wide research and related links.
~~~~~~

Collections of articles and on various topics. Liberal crosslinking expected.

A key paper to read before reading any academic papers: https://blog.acolyer.org/2018/01/26/a-practitioners-guide-to-reading-programming-languages-papers/  

[Competitive Programmer's Handbook](https://cses.fi/book/book.pdf) (Not sure where else this belongs.)

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
* [Why Engineers Should Invest in Decision Making Skills Early](https://www.reforge.com/blog/technical-decision-making): "... to make more successful technical calls and advance careers, engineers actually need to develop better strategic decision-making skills — not just technical execution skills. In fact, an over-reliance on technical execution skills early in a career leads to untapped impact and stalled growth opportunities down the road."

---

[The Sound of Sorting](https://panthema.net/2013/sound-of-sorting/): demo program for sortings algorithms, which both visualizes the algorithms internals and their operations, and generates sound effects from the values being compared.
