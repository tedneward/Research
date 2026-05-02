title=AI
category=ai
type=categorypage
summary=A collection of links around artificial intelligence (and all the different permutations of that phrase).
tags=ai, machine learning, fuzzy logic, logic, expert system, nlp
~~~~~~

[AI Hands-On](https://github.com/Ramakm/ai-hands-on): A group of notebooks and other files which can help you learn AI from scratch.

## General

- [7 steps to mastering language model deployment](https://www.kdnuggets.com/7-steps-to-mastering-language-model-deployment)
- [Getting Started with Zero-Shot Text Classification](https://machinelearningmastery.com/getting-started-with-zero-shot-text-classification/)
- [How to Become an AI Engineer in 2026: A Self-Study Roadmap](https://www.kdnuggets.com/how-to-become-an-ai-engineer-in-2026-a-self-study-roadmap)
- [The 10+1 Commandments of Human AI Co-Existence](https://10plus1.ai/): "The 10+1 is a standard. Not everyone will adopt it - but those who do will lead the next era. If you're a policymaker, don't wait for regulation to catch up. If you're a CEO, don't wait for PR fallout to act with integrity. If you're building AI, don't just ask if it works - ask if it's worthy. We don't need more frameworks. We need a philosophical backbone. This is it."
- [AI Defeats the Purpose of a Humanities Education](https://www.thecrimson.com/article/2025/9/9/chiocco-farrell-harvard-ai/) (The Harvard Crimson)
- ["The Open-Source Toolkit for Building AI agents"](https://www.aitidbits.ai/p/open-source-agents)
- [Is Complexity an Illusion?](https://arxiv.org/pdf/2404.07227): "Simplicity is held by many to be the key to general intelligence. Simpler models tend to “generalise”, identifying the cause or generator of data with greater sample efficiency. The implications of the correlation between simplicity and generalisation extend far beyond computer science, addressing questions of physics and even biology. Yet simplicity is a property of form, while generalisation is of function. In interactive settings, any correlation between the two depends on interpretation. In theory there could be no correlation and yet in practice, there is. Previous theoretical work showed generalisation to be a consequence of “weak” constraints implied by function, not form. Experiments demonstrated choosing weak constraints over simple forms yielded a 110 − 500% improvement in generalisation rate. Here we show that all constraints can take equally simple forms, regardless of weakness. However if forms are spatially extended, then function is represented using a finite subset of forms. If function is represented using a finite subset of forms, then we can force a correlation between simplicity and generalisation by making weak constraints take simple forms. If function is determined by a goal directed process that favours versatility (e.g. natural selection), then efficiency demands weak constraints take simple forms. Complexity has no causal influence on generalisation, but appears to due to confounding."
- Rob Conery's posts exploring using AI in a dev setting:

    - ["Using Gemini CLI to Learn Something New"](https://thenext.dev/articles/all/using-gemini-cli-to-learn-something-new/)
    - ["Creating a Markdown Compiler"](https://thenext.dev/articles/copilot/creating-a-markdown-compiler/) (video)
    - ["Turning a Markdown Spec into a Database - With Test Data!"](https://thenext.dev/articles/video/turning-a-markdown-spec-into-a-database-with-test-data/)

- ["You're Building AI Apps Backwards: The Model-Product Problem"](https://thenewstack.io/youre-building-ai-apps-backwards-the-model-product-problem/)
- ["AI Models Need a Virtual Machine"](https://blog.sigplan.org/2025/08/29/ai-models-need-a-virtual-machine/)
- [Artificial Intelligence for a Better Future: An Ecosystem Perspective on the Ethics of AI and Emerging Digital Technologies](https://link.springer.com/book/10.1007/978-3-030-69978-9) - Bernd Carsten Stahl (PDF)
- [Artificial Intelligence: Foundations of Computational Agents (2017), 2nd Edition](https://artint.info) - David L. Poole, Alan K. Mackworth @ Cambridge University Press (HTML, Slides)
- [Artificial Intelligence: Foundations of Computational Agents (2010), 1st Edition](https://artint.info/aifca1e.html) - David L. Poole, Alan K. Mackworth @ Cambridge University Press (HTML)
- [Deep Learning](https://issuu.com/cmb321/docs/deep_learning_ebook?ff)
- [Introduction to Autonomous Robots](https://github.com/correll/Introduction-to-Autonomous-Robots/releases) - Nikolaus Correll (PDF)
- [On the Path to AI: Law’s prophecies and the conceptual foundations of the machine learning age](https://link.springer.com/book/10.1007/978-3-030-43582-0) - Thomas D. Grant, Damon J. Wischik (PDF)
- [Probabilistic Programming & Bayesian Methods for Hackers](http://camdavidsonpilon.github.io/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/) - Cam Davidson-Pilon (HTML, Jupyter Notebook)
- [MIT researchers propose a new model for legible, modular software](https://news.mit.edu/2025/mit-researchers-propose-new-model-for-legible-modular-software-1106?utm_source=Iterable&utm_medium=email&utm_campaign=newsletter-20251113): Their new approach breaks systems into “concepts,” separate pieces of a system, each designed to do one job well, and “synchronizations,” explicit rules that describe exactly how those pieces fit together. The result is software that’s more modular, transparent, and easier to understand. A small domain-specific language (DSL) makes it possible to express synchronizations simply, in a form that LLMs can reliably generate. In a real-world case study, the team showed how this method can bring together features that would otherwise be scattered across multiple services. The team, including Daniel Jackson, an MIT professor of electrical engineering and computer science (EECS) and CSAIL associate director, and Eagon Meng, an EECS PhD student, CSAIL affiliate, and designer of the new synchronization DSL, explore this approach in their paper “[What You See Is What It Does: A Structural Pattern for Legible Software](https://arxiv.org/abs/2508.14511),” which they presented at the Splash Conference in Singapore in October. The challenge, they explain, is that in most modern systems, a single feature is never fully self-contained. Adding a “share” button to a social platform like Instagram, for example, doesn’t live in just one service. Its functionality is split across code that handles posting, notification, authenticating users, and more. All these pieces, despite being scattered across the code, must be carefully aligned, and any change risks unintended side effects elsewhere. ... A concept bundles up a single, coherent piece of functionality, like sharing, liking, or following, along with its state and the actions it can take. Synchronizations, on the other hand, describe at a higher level how those concepts interact. Rather than writing messy low-level integration code, developers can use a small domain-specific language to spell out these connections directly. In this DSL, the rules are simple and clear: one concept’s action can trigger another, so that a change in one piece of state can be kept in sync with another. “Think of concepts as modules that are completely clean and independent. Synchronizations then act like contracts — they say exactly how concepts are supposed to interact. That’s powerful because it makes the system both easier for humans to understand and easier for tools like LLMs to generate correctly,” says Jackson. “Why can’t we read code like a book? We believe that software should be legible and written in terms of our understanding: our hope is that concepts map to familiar phenomena, and synchronizations represent our intuition about what happens when they come together,” says Meng. 
- [DORA 2025: Measuring Software Delivery After AI](https://redmonk.com/rstephens/2025/12/18/dora2025/): "Historically, DORA split metrics into two categories: Throughput (Lead Time for Changes, Deployment Frequency), and Stability (Time to Restore, Change Failure Rate). The problem was that Change Failure Rate consistently behaved like an outlier and didn’t load cleanly with the other metrics. So in 2024, DORA made a methodological adjustment: Time to Restore moved from stability to throughput; and Rework Rate was introduced as a stability metric. Rework Rate is about the number of unplanned deployments caused by production issues compared to total deployments. Change Failure Rate compares failed deployments to total deployments. You would typically expect more unplanned deployments than outright failed deployments, which makes Rework Rate a secondary proxy for measuring instability in systems. This metric shift was small potatoes compared to what the report introduced in 2025. In 2025, the DORA report moved away from low / medium / high / elite clusters entirely. Now the report introduces seven archetypes, based on eight measures: Throughput; Stability; Team performance; Product performance; Individual effectiveness; Time spent on valuable work; Friction; and Burnout"

## Automation with ...

* [How Google Workspace CLI Made My Claude Code Setup 10x More Powerful](https://aimaker.substack.com/p/google-workspace-cli-claude-code-daily-operating-system)
* [I automated my entire read-it-later workflow with a local LLM so every article I save gets summarized overnight](https://www.xda-developers.com/automate-read-it-later-workflow-with-local-llm-to-summarize-articles/)

### Suggestions

10 Agent Projects: a list of 10 AI agent projects you can try this weekend. They go from basic single agents to more advanced multi-agent systems.

-   **[Building an Agentic RAG Pipeline](https://amanxai.com/2025/12/30/building-an-agentic-rag-pipeline/)**
-   **[Build a Multi-Agent System With LangGraph](https://amanxai.com/2025/12/09/build-a-multi-agent-system-with-langgraph/)**
-   **[Build a Real-Time AI Assistant Using RAG + LangChain](https://amanxai.com/2025/11/18/build-a-real-time-ai-assistant-using-rag-langchain/)**
-   **[Build an AI Agent to Automate Your Research](https://amanxai.com/2025/11/11/build-an-ai-agent-to-automate-your-research/)**
-   **[Building a Multi-Agent System using Gemini API](https://amanxai.com/2025/09/16/building-a-multi-agent-system-using-gemini-api/)**
-   **[Build an AI Agent to Master a Game](https://amanxai.com/2025/09/09/build-an-ai-agent-to-master-a-game-using-python/)**
-   **[Building AI Agents with CrewAI](https://amanxai.com/2025/07/01/building-ai-agents-with-crewai-using-python/)**
-   **[Building an AI Agent using OpenAI API](https://amanxai.com/2025/04/29/building-an-ai-agent-using-openai-api/)**
-   **[AI Trading Agent using Reinforcement Learning](https://amanxai.com/2025/02/18/building-an-ai-agent-using-agentic-ai/)**
-   **[Building an AI Research Agent for Image Analysis](https://developer.ibm.com/tutorials/awb-build-ai-research-agent-image-analysis-granite/)**

## People-centric

* Dr Michael Stal

    - [Hitchhiker's Guide to AI, Software Architecture, and Everything Else](https://stal.blogspot.com/2026/04/patterns-for-building-llm-and-agentic.html)

## History

- [The Quest for Artificial Intelligence: A History of Ideas and Achievements](http://ai.stanford.edu/~nilsson/QAI/qai.pdf) - Nils J. Nilsson (PDF)

## [Criticism](/ai/critique)

## Tools

* [Lovable](https://lovable.dev/): Create apps and websites by chatting with AI
* ChatGPT-5

    - https://futurism.com/gpt-5-disaster
    - [ChatGPT Is Blowing Up Marriages as Spouses Use AI to Attack Their Partners](https://futurism.com/chatgpt-marriages-divorces)

## Reading

* [Himanshu](https://www.linkedin.com/posts/himanshu1707_generativeai-journey-through-paperbacks-activity-7357857323756761088-elA4/):

    1. *Natural Language Processing with Transformers*: Start with a thorough understanding of Transformers architecture and it's ecosystem through HuggingFace with Lewis Tunstall Leandro von Werra Thomas Wolf . Personally, There cannot be a better starting point. MUST follow their blogs.
    2. *Build a Large Language Model (From Scratch)*: Build your own Decoder Transformer(Architecture for "almost" all modern LLMs) from scratch with Sebastian Raschka, PhD . MUST follow his blogs too for the latest updates. Also, lucky he keeps his GitHub repo updated.
    3. Get acquainted with the GenerativeAI ecosystem with Jay Alammar Maarten Grootendorst building LLM pipelines for various tasks and learning nitty gritty details of Fine-Tuning and PEFT. *Hands-On Language Models*
    4. Explore *Generative AI on AWS* with Chris Fregly Antje Barth Shelbee Eigenbrode for an enterprise level challenges.
    5. Dive into the beauty of engineering a GenAI Application with *AI Engineering* by Chip Huyen . It will level you up to think from the whole system perspective.
    6. *Build Generative AI Services with FastAPI* with Ali Parandeh, CEng . A very practical book to knot all you have learnt and will help you in building a GenAI system.

* [LangGraph101: Let's build a deep research agent](https://towardsdatascience.com/langgraph-101-lets-build-a-deep-research-agent/)
* [Quantifying AI-Human Strategy](https://osf.io/preprints/psyarxiv/vbkmt_v1): "We introduce a novel Bayesian Item Response Theory framework to quantify human–AI  synergy, separating individual and  collaborative ability while controlling for task difficulty in interactive settings. Unlike standard static benchmarks, our approach models human–AI performance as a joint process, capturing both user-specific factors and moment-to-moment fluctuations. We validate the frame-work by applying it to human–AI benchmark data (n=667) and find significant synergy. We demonstrate that collaboration  ability is distinct from individual problem-solving ability. Users better able to infer and adapt to others’ perspectives achieve superior collaborative performance with AI--but not when working alone. Moreover, moment-to-moment fluctuations in perspective taking influence AI response quality, highlighting the role of dynamic user factors in collaboration. By introducing a principled framework to analyze data from human-AI collaboration, interactive benchmarks can better complement current single-task bench-marks and crowd-assessment methods. This work informs the design and training of language models that transcend static prompt benchmarks to achieve adaptive,socially aware collaboration with diverse and dynamic human partners."
* [The New Operational Stack: From IaC to Platforms to AI Agents](https://thenewstack.io/the-new-operational-stack-from-iac-to-platforms-to-ai-agents/)
* [The Three Best Pieces of Writing About AI in 2026 That You Must Read Right Now](https://www.thealgorithmicbridge.com/p/the-three-best-pieces-of-writing): The first is Matt Shumer’s “[Something Big Is Happening](https://x.com/i/status/2021256989876109403),” which amassed north of 80 million views on X, bringing together the entire timeline in a miracle not seen since St. Paul walked the paths of the old world proselytizing for Christ’s word (the godlike reach of Shumer’s essay can be explained by the fact that the title allows every single person to project the biggest thing in their lives right now as the thing happening to everyone else: we all have main character syndrome, especially myself). To Shumer, the big thing happening is AI, plain and simple, without caveats or nuances: AI is big and AI is happening (it's probably irrelevant that he's an AI founder himself with a tendency to hype up claims that don't hold up under scrutiny).

    The second is Citrini’s “[The 2028 Global Intelligence Crisis](https://www.citriniresearch.com/p/2028gic),” a financial variation of the take-off scenario where AI ends up doing everything that _doomer_ pundits and industry leaders have been warning of but instead of killing everyone it stops at killing the $13 trillion mortgage market (because of course, that’s the most dramatic thing that could happen if you’re a financial analyst). I read it until I reached a point where they give three examples of SaaS firms that could be affected—“[Monday.com](http://monday.com/), Zapier, and Asana”— because when I asked Claude 4.6 Opus about the “SaaSpocalypse” two weeks earlier, it gave those three exact examples to illustrate its point. It might be a coincidence, but stochastic parrots are usually more parrot than stochastic.

    The third one, and a personal favorite, is Sam Kriss’s Harper’s “[Child’s play](https://harpers.org/archive/2026/03/childs-play-sam-kriss-ai-startup-roy-lee/),” a retelling of Kriss’s experience among some of the most idiosyncratic personalities of the San Francisco tech scene. This is the last one chronologically and, in literary merit and arguably historical value, the best of the three. Kriss, unlike, I presume, Shumer and Citrini, is a veteran in the sport of disguising fiction as non-fiction—worthy heir to the Borgesian style, although perhaps born at the worst time possible now that everyone seems to be shamelessly copycatting his schtick—which is apparent from the fact that, among the three texts, his is the only one that feels real. His thesis is something I imagine everyone agrees with: obsessing over being “high agency” and living your life as a means to an end is, ultimately, a relentless run-up for a date with death.
  


## Definitions

### Assistants

* [DeepTutor: AI-Powered Personalized Learning Assistant](https://hkuds.github.io/DeepTutor/) [Source](https://github.com/HKUDS/DeepTutor): Your AI Learning Companion - Transform any document into an interactive learning experience

### [Expert Systems](/tags/expert%20system.html) / [Rules Engines](/tags/rules.html)

* [Wikipedia](https://en.wikipedia.org/wiki/Expert_system)

### Fuzzy Logic

* [Wikipedia](https://en.wikipedia.org/wiki/Fuzzy_logic)
* Tutorials: ["What is Fuzzy Logic"](https://www.guru99.com/what-is-fuzzy-logic.html) | ["Fuzzy Logic Explained: Master Class"](https://www.masterclass.com/articles/fuzzy-logic)
* [A Practical Introduction to Fuzzy Logic Using LISP](https://www.researchgate.net/publication/283225230_A_Practical_Introduction_to_Fuzzy_Logic_using_LISP)

Java:

- https://jfuzzylogic.sourceforge.net/
- https://github.com/sorend/fuzzy4j
- https://github.com/pcingola/jFuzzyLogic
- https://commons.apache.org/sandbox/commons-text/jacoco/org.apache.commons.text.similarity/FuzzyScore.java.html
- https://mvnrepository.com/artifact/com.github.cschen1205/java-fuzzy-logic/1.0.1

### Neural Networks

* [You Don't Need Backpropagation To Train Neural Networks Anymore](https://ai.gopubby.com/you-dont-need-backpropagation-to-train-neural-networks-anymore-e989d75564cb)

### [Natural Language](/ai/natural-language)

### [Large Language Models (LLMs)](/ai/llm/)

An advanced artificial intelligence (AI) system, built on deep learning and transformer architectures, that is pre-trained on massive amounts of text data to understand, process, and generate human-like language. LLMs learn to predict the next word in a sequence, enabling them to perform tasks like text generation, translation, summarization, and responding to complex queries, though they are not perfect oracles and can generate incorrect information or exhibit bias. 

* ["On the Biology of a Large Language Model"](https://transformer-circuits.pub/2025/attribution-graphs/biology.html): "We investigate the internal mechanisms used by Claude 3.5 Haiku — Anthropic's lightweight production model — in a variety of contexts, using our circuit tracing methodology."

### Recursive Language Models

- [Blog post](https://alexzhang13.github.io/blog/2025/rlm/): "We explore language models that recursively call themselves or other LLMs before providing a final answer. Our goal is to enable the processing of essentially unbounded input context length and output length and to mitigate degradation “context rot”. We propose Recursive Language Models, or RLMs, a general inference strategy where language models can decompose and recursively interact with their input context as a variable. We design a specific instantiation of this where GPT-5 or GPT-5-mini is queried in a Python REPL environment that stores the user’s prompt in a variable. We demonstrate that an RLM using GPT-5-mini outperforms GPT-5 on a split of the most difficult long-context benchmark we got our hands on (OOLONG [1]) by more than double the number of correct answers, and is cheaper per query on average! We also construct a new long-context Deep Research task from BrowseComp-Plus [2]. On it, we observe that RLMs outperform other methods like ReAct + test-time indexing and retrieval over the prompt. Surprisingly, we find that RLMs also do not degrade in performance when given 10M+ tokens at inference time."
- [rlm-minimal](https://github.com/alexzhang13/rlm-minimal): Super basic implementation (gist-like) of RLMs with REPL environments.

### [Small Language Models (SLMs)](/ai/slm/)

An AI model designed to handle specific tasks, using fewer parameters and less computational power than a large language model (LLM). This efficiency makes SLMs faster to train, more accessible, and suitable for deployment on devices with limited resources or for performing specialized functions, such as data extraction from documents, language translation, or specific conversational agents. In terms of size, SLM parameters range from a few million to a few billion, as opposed to LLMs with hundreds of billions or even trillions of parameters. Parameters are internal variables, such as weights and biases, that a model learns during training. These parameters influence how a machine learning model behaves and performs.

### [Retrieval Augmented Generation (RAG)](/ai/rag)

* [Wikipedia: Prompt Engineering - Retrieval Augmented Generation](https://en.wikipedia.org/wiki/Prompt_engineering#Retrieval-augmented_generation)
* ["Cognita: An Open Source Framework for Building Modular RAG Applications"](https://www.marktechpost.com/2024/05/27/cognita-an-open-source-framework-for-building-modular-rag-applications/)

### Coding Assistants

* [Create a Coding Assistant with StarCoder](https://huggingface.co/blog/starchat-alpha)
* ["How to use GPT as a natural language to SQL query engine"](https://www.infoworld.com/article/3700858/how-to-use-gpt-as-a-natural-language-to-sql-query-engine.html)
* ["Who owns the code?"](https://leaddev.com/software-quality/github-copilot-make-commits): "This shift raises an important question: who is accountable when something goes wrong – Copilot, the reviewer, or someone else?Rajesh Jethwa, CTO of software engineering consultancy Digiterre, describes this issue as a “minefield”, because there are a number of entities involved in creating the code. First, there are the providers of the models themselves, such as OpenAI or Anthropic. It is currently unclear whether these providers own the code generated by their models. Second, there are the authors of the code used to train the model. There are still questions around whether they have any claim to ownership of the resulting code, given the provenance of the training data. Third, there are employees and the organizations they work for. Typically, when an employee creates code as part of their job, the organization owns that code. However, it remains uncertain whether the organization or the individual employee should bear responsibility for the code that is produced with the help of a coding assistance."
* [In Which I Vibe-Code A Personal Library System](https://hackaday.com/2025/12/03/in-which-i-vibe-code-a-personal-library-system/)

### Generative AI

* https://www.kdnuggets.com/generative-ai-a-self-study-roadmap
* ["Godot isn't making it"](https://www.wheresyoured.at/godot-isnt-making-it/): "What if what we're seeing today isn't a glimpse of the future, but the new terms of the present? What if artificial intelligence isn't actually capable of doing much more than what we're seeing today, and what if there's no clear timeline when it'll be able to do more? What if this entire hype cycle has been built, goosed by a compliant media ready and willing to take career-embellishers at their word? (March 2024) The reason I'm repeating myself is that it's important to note how obvious the problems with generative AI have been, and for how long."
* [Generative AI exists because of the transformer](https://ig.ft.com/generative-ai/)
* ["Stable Diffusion in Java (SD4J) Enables Generating Images with Deep Learning"](https://www.infoq.com/news/2023/12/stable-diffusion-in-java/)
* [Stable Diffusion in C#](https://github.com/cassiebreviu/StableDiffusion/) (mentioned in the SD4J article)

### Science

- [Making large language models reliable data science programming copilots for biomedical research](https://www.nature.com/articles/s41551-025-01587-2): "Large language models (LLMs) can generate impressive data visualizations from simple requests, yet their accuracy remains underexplored. Here we present a benchmark of 293 coding tasks derived from 39 studies across 7 biomedical research areas, including biomarkers, integrative analysis, genomic profiling, molecular characterization, therapeutic response, translational research and pan-cancer analysis. Benchmarking eight proprietary and eight open-source LLMs under various prompting strategies reveals an overall accuracy below 40%. This low accuracy raises serious concerns about the risk of propagating incorrect scientific findings when blindly relying on AI-generated analyses. Therefore, we develop an AI agent that begins with and iteratively refines an analysis plan before generating code, achieving 74% accuracy. We embody this insight in a platform that enables users to codevelop analysis plans with LLMs and execute them within an integrated environment. In a user study with five medical researchers, the platform enabled users to complete over 80% of the analysis code for three studies."

## [Machine Learning](/ai/machine-learning)

* [Semantics derived automatically from language corpora contain human-like biases](https://arxiv.org/abs/1608.07187v4): Artificial intelligence and machine learning are in a period of astounding growth. However, there are concerns that these technologies may be used, either with or without intention, to perpetuate the prejudice and unfairness that unfortunately characterizes many human institutions. Here we show for the first time that human-like semantic biases result from the application of standard machine learning to ordinary language---the same sort of language humans are exposed to every day. We replicate a spectrum of standard human biases as exposed by the Implicit Association Test and other well-known psychological studies. We replicate these using a widely used, purely statistical machine-learning model---namely, the GloVe word embedding---trained on a corpus of text from the Web. Our results indicate that language itself contains recoverable and accurate imprints of our historic biases, whether these are morally neutral as towards insects or flowers, problematic as towards race or gender, or even simply veridical, reflecting the {\em status quo} for the distribution of gender with respect to careers or first names. These regularities are captured by machine learning along with the rest of semantics. In addition to our empirical findings concerning language, we also contribute new methods for evaluating bias in text, the Word Embedding Association Test (WEAT) and the Word Embedding Factual Association Test (WEFAT). Our results have implications not only for AI and machine learning, but also for the fields of psychology, sociology, and human ethics, since they raise the possibility that mere exposure to everyday language can account for the biases we replicate here.
* [10 Github Repositories to Master Reinforcement Learning](https://www.kdnuggets.com/10-github-repositories-master-reinforcement-learning)
* [Machine Learning for Software Engineering](https://github.com/saltudelft/ml4se): A curated list of papers, theses, datasets, and tools related to the application of Machine Learning for Software Engineering.
* [Adversarial Machine Learning: A Taxonomy and Terminology of Attacks and Mitigations](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-2e2023.pdf)
* [A Brief Introduction to Machine Learning for Engineers](https://arxiv.org/pdf/1709.02840.pdf) - Osvaldo Simeone (PDF)
* [A Brief Introduction to Neural Networks](http://www.dkriesel.com/en/science/neural_networks)
* [A Comprehensive Guide to Machine Learning](https://www.eecs189.org/static/resources/comprehensive-guide.pdf) - Soroush Nasiriany, Garrett Thomas, William Wang, Alex Yang (PDF)
* [A Course in Machine Learning](http://ciml.info/dl/v0_9/ciml-v0_9-all.pdf) (PDF)
* [A First Encounter with Machine Learning](https://web.archive.org/web/20210420163002/https://www.ics.uci.edu/~welling/teaching/ICS273Afall11/IntroMLBook.pdf) - Max Welling (PDF) *(:card_file_box: archived)*
* [A Selective Overview of Deep Learning](https://arxiv.org/abs/1904.05526) - Fan, Ma, and Zhong (PDF)
* [Algorithms for Reinforcement Learning](https://sites.ualberta.ca/~szepesva/papers/RLAlgsInMDPs.pdf) - Csaba Szepesvári (PDF)
* [An Introduction to Statistical Learning](https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf) - Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani (PDF)
* [Approaching Almost Any Machine Learning Problem](https://github.com/abhishekkrthakur/approachingalmost) - Abhishek Thakur (PDF)
* [Bayesian Reasoning and Machine Learning](http://web4.cs.ucl.ac.uk/staff/D.Barber/pmwiki/pmwiki.php?n=Brml.HomePage)
* [Deep Learning](http://www.deeplearningbook.org) - Ian Goodfellow, Yoshua Bengio and Aaron Courville
* [Deep Learning for Coders with Fastai and PyTorch](https://github.com/fastai/fastbook) - Jeremy Howard, Sylvain Gugger (Jupyter Notebooks)
* [Deep Learning with PyTorch](https://pytorch.org/assets/deep-learning/Deep-Learning-with-PyTorch.pdf) - Eli Stevens, Luca Antiga, Thomas Viehmann (PDF)
* [Dive into Deep Learning](http://d2l.ai)
* [Explorations in Parallel Distributed Processing: A Handbook of Models, Programs, and Exercises](https://web.stanford.edu/group/pdplab/pdphandbook) - James L. McClelland
* [Foundations of Machine Learning, Second Edition](https://mitpress.ublish.com/ereader/7093/?preview=#page/Cover) - Mehryar Mohri, Afshin Rostamizadeh, Ameet Talwalkar
* [Free and Open Machine Learning](https://nocomplexity.com/documents/fossml/) - Maikel Mardjan (HTML)
* [Gaussian Processes for Machine Learning](http://www.gaussianprocess.org/gpml/)
* [IBM Machine Learning for Dummies](https://www.ibm.com/downloads/cas/GB8ZMQZ3) - Judith Hurwitz, Daniel Kirsch
* [Information Theory, Inference, and Learning Algorithms](http://www.inference.phy.cam.ac.uk/itila/)
* [Interpretable Machine Learning](https://christophm.github.io/interpretable-ml-book/) - Christoph Molnar
* [Introduction to CNTK Succinctly](https://www.syncfusion.com/ebooks/cntk_succinctly) - James McCaffrey
* [Introduction to Machine Learning](http://arxiv.org/abs/0904.3664v1) - Amnon Shashua
* [Keras Succinctly](https://www.syncfusion.com/ebooks/keras-succinctly) - James McCaffrey
* [Learn Tensorflow](https://bitbucket.org/hrojas/learn-tensorflow) - Jupyter Notebooks
* [Learning Deep Architectures for AI](https://mila.quebec/wp-content/uploads/2019/08/TR1312.pdf) (PDF)
* [Machine Learning](http://www.intechopen.com/books/machine_learning)
* [Machine Learning for Data Streams](https://moa.cms.waikato.ac.nz/book-html/) - Albert Bifet, Ricard Gavaldà, Geoff Holmes, Bernhard Pfahringer
* [Machine Learning from Scratch](https://dafriedman97.github.io/mlbook/) - Danny Friedman (HTML, PDF, Jupyter Book)
* [Machine Learning, Neural and Statistical Classification](http://www1.maths.leeds.ac.uk/~charles/statlog/)
* [Machine Learning with Python](https://www.tutorialspoint.com/machine_learning_with_python) - Tutorials Point (HTML, [PDF](https://www.tutorialspoint.com/machine_learning_with_python/machine_learning_with_python_tutorial.pdf))
* [Mathematics for Machine Learning](https://gwthomas.github.io/docs/math4ml.pdf) - Garrett Thomas (PDF)
* [Mathematics for Machine Learning](https://mml-book.github.io) - Marc Peter Deisenroth, A Aldo Faisal, and Cheng Soon Ong
* [Neural Networks and Deep Learning](http://neuralnetworksanddeeplearning.com)
* [Practitioners guide to MLOps](https://services.google.com/fh/files/misc/practitioners_guide_to_mlops_whitepaper.pdf) - Khalid Samala, Jarek Kazmierczak, Donna Schut (PDF)
* [Probabilistic Models in the Study of Language](http://idiom.ucsd.edu/~rlevy/pmsl_textbook/text.html) (Draft, with R code)
* [Python Machine Learning Projects](https://www.digitalocean.com/community/books/python-machine-learning-projects-a-digitalocean-ebook) - Lisa Tagliaferri, Brian Boucheron, Michelle Morales, Ellie Birkbeck, Alvin Wan (PDF, EPUB, Kindle)
* [Reinforcement Learning: An Introduction](http://incompleteideas.net/book/RLbook2020.pdf) - Richard S. Sutton, Andrew G. Barto (PDF)
* [Speech and Language Processing (3rd Edition Draft)](https://web.stanford.edu/~jurafsky/slp3/ed3book.pdf) - Daniel Jurafsky, James H. Martin (PDF)
* [The Elements of Statistical Learning](https://web.stanford.edu/~hastie/ElemStatLearn/) - Trevor Hastie, Robert Tibshirani, and Jerome Friedman
* [The LION Way: Machine Learning plus Intelligent Optimization](https://intelligent-optimization.org/LIONbook/lionbook_3v0.pdf) - Roberto Battiti, Mauro Brunato (PDF)
* [The Mechanics of Machine Learning](https://mlbook.explained.ai) - Terence Parr and Jeremy Howard
* [The Python Game Book](https://web.archive.org/web/20210308080726/https://thepythongamebook.com/en%3Astart) - Horst Jens *(:card_file_box: archived)*
* [Top 10 Machine Learning Algorithms Every Engineer Should Know](https://www.dezyre.com/article/top-10-machine-learning-algorithms/202) - Binny Mathews and Omair Aasim
* [Understanding Machine Learning: From Theory to Algorithms](https://www.cs.huji.ac.il/~shais/UnderstandingMachineLearning) - Shai Shalev-Shwartz, Shai Ben-David
* [You Don't Need Backpropagation To Train Neural Networks Anymore](https://ai.gopubby.com/you-dont-need-backpropagation-to-train-neural-networks-anymore-e989d75564cb)

### Semantic Entity Resolution (Knowledge Graphs) (?)

* [The Rise of Semantic Entity Resolution](https://towardsdatascience.com/the-rise-of-semantic-entity-resolution/)

### AI Agent Knowledge Base

* [Anatomy of an AI Agent Knowledge Base](https://www.infoworld.com/article/4091400/anatomy-of-an-ai-agent-knowledge-base.html)
* [Graphiti](https://help.getzep.com/graphiti/getting-started/welcome) ([Source](https://github.com/getzep/graphiti)): a Python framework for building temporally-aware knowledge graphs designed for AI agents. It enables real-time incremental updates to knowledge graphs without batch recomputation, making it suitable for dynamic environments where relationships and information evolve over time.
* [6 agentic knowledge patterns emerging in the wild](https://thenewstack.io/agentic-knowledge-base-patterns/)
