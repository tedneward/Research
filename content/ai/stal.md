title=Hitchhiker's Guide to AI, Software Architecture, and Everything Else
tags=ai, place, architecture, agent
summary=Links and notes on Dr Michael Stal's blog entries.
~~~~~~

[Blog Root](https://stal.blogspot.com/)

### Articles/Blogs/Essays

#### [IMPLEMENTING AN LLM-BASED CALCULATOR SYSTEM FOR MU...](https://stal.blogspot.com/2026/04/implementing-llm-based-calculator.html)
Large Language Models have revolutionized how humans interact with computational systems. Rather than requiring users to learn specific syntax or programming languages, LLMs enable natural language interfaces where users can describe their computational needs in plain English. However, LLMs themselves are not designed to perform precise mathematical calculations. They excel at understanding intent, reasoning about problems, and generating human-like text, but they struggle with arithmetic precision and complex mathematical operations. The solution is to combine the natural language understanding capabilities of LLMs with specialized computational tools. This hybrid approach allows users to express their needs naturally while ensuring that actual calculations are performed by reliable, precise computational engines. The LLM acts as an intelligent orchestrator, interpreting user requests, determining which computational tools are needed, invoking those tools with appropriate parameters, and presenting results in a human-friendly format. This article describes how to build such a system that handles mathematics, statistics, physics, chemistry, business calculations, and financial analysis. The architecture uses tool calling, where the LLM can invoke external functions to perform specific computational tasks. Each domain has specialized calculator implementations that handle the precise numerical work.

#### [TOKENIZERS FOR LARGE LANGUAGE MODELS](https://stal.blogspot.com/2026/04/tokenizers-for-large-language-models.html)
Tokenizers are the unit-conversion layer between human language and the mathematical machinery of a large language model. Get them wrong, and everything downstream is broken, no matter how sophisticated your neural network is. Get them right, and you unlock the full expressive power of the model. Most tutorials on LLMs treat the tokenizer as a black box: you call `encode()`, you get a list of integers, you move on. This tutorial refuses to do that. We will open the black box, examine every gear and spring inside, and then build our own from scratch. By the end, you will understand not only how tokenizers work but why they are designed the way they are, what trade-offs each design decision involves, and how to build one that is fast, correct, and production-ready. We will also connect our tokenizer to real LLM inference backends so that you can use it immediately with actual models running on your hardware, whether that hardware is an Apple Silicon Mac, an NVIDIA GPU, an AMD GPU, an Intel accelerator, or a plain CPU. No prior knowledge of tokenizers, NLP, or machine learning is required. You do need to be comfortable with Python and have a basic understanding of what a neural network is at a conceptual level.

#### [THE TRUTH ABOUT LLM-GENERATED CODE: A DEEP DIVE IN...](https://stal.blogspot.com/2026/04/the-truth-about-llm-generated-code-deep.html)
When we talk about code quality, we are referring to multiple dimensions: correctness, efficiency, readability, maintainability, and security. LLM-generated code exists on a spectrum across all these dimensions, and understanding where it typically falls is crucial for effective use. At the high end of the quality spectrum, LLMs excel at generating boilerplate code, implementing well-established algorithms, and creating standard utility functions. When you ask an LLM to write a function that sorts an array, implements a binary search, or creates a REST API endpoint using a popular framework, the results are often remarkably good. These are patterns the model has seen thousands of times during training, and it can reproduce them with high fidelity. In the middle of the spectrum, we find more complex tasks that require domain-specific knowledge or the integration of multiple concepts. Here, LLMs begin to show their limitations. They might generate code that works for common cases but fails on edge cases. They might use deprecated APIs or combine libraries in ways that technically work but are not considered best practices. The code might be functionally correct but inefficient, using algorithms with poor time complexity when better alternatives exist. At the lower end of the quality spectrum are tasks requiring deep reasoning, novel problem-solving, or understanding of complex system interactions. LLMs frequently struggle with these challenges. They might generate code that looks plausible but contains subtle logical errors, race conditions in concurrent code, or security vulnerabilities that are not immediately obvious. They might hallucinate function names or library features that do not exist, creating code that will not even compile or run.

**Prompt engineering is perhaps the most important skill for working effectively with LLMs.** The quality of the generated code is heavily dependent on the quality of the prompt. Be specific about requirements, constraints, and edge cases. Instead of asking "write a function to sort an array," ask "write a function to sort an array of integers in ascending order, handling empty arrays and arrays with duplicate values, using an efficient algorithm with O(n log n) time complexity." The more context and constraints you provide, the better the results will be.

**Iterative refinement** is a powerful technique. Rather than expecting perfect code on the first try, use the LLM to generate an initial implementation, then ask it to improve specific aspects. You might first ask for a basic implementation, then request that it add error handling, then ask it to optimize for performance, and finally request that it add comprehensive documentation. This step-by-step approach often yields better results than trying to get everything right in a single prompt.

**Breaking down complex tasks into smaller, manageable pieces** is crucial. LLMs perform much better on focused, well-defined tasks than on large, complex problems. Instead of asking an LLM to "build a user authentication system," break it down into smaller tasks: generate the database schema, write the password hashing function, implement the login endpoint, create the session management logic, and so on. This modular approach not only improves code quality but also makes testing and debugging easier.

**Providing examples and context can significantly improve results.** If you have existing code in your codebase that follows certain patterns or conventions, show those examples to the LLM and ask it to generate new code in the same style. If you are working with a specific library or framework, provide documentation or example code to help the LLM understand how to use it correctly.

**Specifying the programming language version and library versions is important** for avoiding compatibility issues. Make it clear which version of Python, Node.js, or other runtime you are using, and which versions of libraries and frameworks are available. This helps the LLM avoid generating code that uses features or APIs that are not available in your environment.

**Requesting tests along with implementation** is a valuable practice. Ask the LLM to generate unit tests for the code it produces. This serves multiple purposes: it helps verify that the code works correctly, it documents the expected behavior, and it often causes the LLM to think more carefully about edge cases and error conditions.

**Setting constraints and requirements explicitly** can prevent many common issues. Specify performance requirements, security considerations, error handling expectations, and coding standards. If you need the code to be thread-safe, say so. If it needs to handle large datasets efficiently, make that clear. If it must follow specific security practices, spell those out.

#### [LLM GARDENING: CULTIVATING SAFE AND TRUSTWORTHY AI...](https://stal.blogspot.com/2026/04/llm-gardening-cultivating-safe-and.html)
The practice of LLM Gardening is [an] act of cultivation: the ongoing, thoughtful, and systematic effort to guide, prune, and protect your AI systems so that they flourish safely and serve their intended purpose with reliability and integrity. LLM Gardening encompasses several key principles that distinguish it from a naive "set it and forget it" approach to AI safety:

1. *Safety is a living process, not a one-time configuration*. The threats to your AI system evolve constantly. New jailbreaking techniques are discovered, new forms of prompt injection emerge, and the ways in which users interact with your system change over time. Your guardrails must evolve with these changes.

2. *Guardrails should be layered*. No single guardrail is sufficient to protect against all threats. Just as a garden benefits from multiple layers of protection, from physical fences to natural pest deterrents to careful plant selection, an AI system benefits from multiple layers of guardrails that catch different categories of problems.

3. *Guardrails should be transparent and auditable*. You should always be able to explain why a particular input was rejected or why a particular output was modified. This transparency is essential for debugging, for compliance, and for maintaining user trust.

4. *Guardrails should be proportionate to the risk*. A weather forecasting assistant does not need the same level of guardrail sophistication as an AI system that handles medical diagnoses or financial transactions. Over-engineering your guardrails can introduce unnecessary latency, reduce usability, and create a frustrating user experience.

At the highest level, guardrails can be divided into two broad categories: internal guardrails and external guardrails. These two categories differ fundamentally in where they operate and how they interact with the LLM.

Internal guardrails are mechanisms that are embedded within or very closely coupled to the LLM itself. They operate at the level of the model's behavior, shaping what the model is willing to say and how it responds to different types of inputs. Internal guardrails include techniques such as fine-tuning the model on curated datasets, Reinforcement Learning from Human Feedback (RLHF), Constitutional AI, and embedding-based topic restriction systems that are tightly integrated with the model's inference pipeline.

External guardrails, by contrast, are mechanisms that sit outside the LLM and operate on the inputs and outputs of the model. They do not change the model itself but rather act as a protective layer around it. External guardrails include input validation and filtering systems, output validation and filtering systems, prompt injection detectors, bias checkers, PII (Personally Identifiable Information) detectors, and hallucination detection systems.

Within the external guardrail category, we can further distinguish between input guardrails, which process the user's message before it reaches the LLM, and output guardrails, which process the LLM's response before it reaches the user. This distinction is crucial because the threats and the appropriate responses differ significantly between these two stages.

#### [BUILDING AGENT007: A POWERFUL YET SIMPLE LOCAL LLM...](https://stal.blogspot.com/2026/04/building-agent007-powerful-yet-simple.html)
Agent007 ... is a sophisticated yet accessible chatbot system that runs entirely on your local machine, giving you complete control over your data and conversations. The system follows a modular architecture where each component has a specific responsibility, and these components communicate through well-defined interfaces. At the foundation lies the GPU detection and optimization layer. When Agent007 starts, it examines your system to determine what hardware acceleration is available. This layer abstracts away the complexity of different GPU frameworks, allowing the rest of the system to work uniformly regardless of whether you are using Apple's Metal, NVIDIA's CUDA, AMD's ROCm, or Intel's acceleration technologies. The next layer is the LLM management system. This component is responsible for loading the language model into memory, managing its lifecycle, and providing a consistent interface for generating responses. It uses the HuggingFace Transformers library, which has become the de facto standard for working with language models. The LLM manager handles model initialization, tokenization, and generation parameters. When documents are involved, the RAG system comes into play. This system consists of several interconnected parts. First, there is the document processor, which can read various file formats and extract their textual content. The extracted text is then split into manageable chunks that preserve semantic meaning. Each chunk is converted into a mathematical representation called an embedding using a specialized model. These embeddings are stored in a vector database, which allows for efficient similarity searches. When you ask Agent007 a question in RAG mode, the system converts your question into an embedding, searches the vector database for the most relevant document chunks, and then provides these chunks as context to the language model. The model then generates a response that is informed by your specific documents rather than just its general training. The conversation management layer keeps track of your interactions with Agent007. It maintains the history of messages, allowing the model to understand context and provide coherent responses across multiple turns. This layer also handles saving conversations to disk and retrieving them later. The template system provides a way to store and reuse common patterns. System messages, which define the AI's behavior and personality, can be saved as templates. Similarly, frequently used prompts or question patterns can be templated. This makes it easy to switch between different AI personas or use cases. Finally, there are two interface layers: the console interface and the web interface. The console interface is straightforward, presenting a text-based interaction model. The web interface is more sophisticated, consisting of a backend server that handles API requests and a frontend application that provides the visual experience with animations, controls, and history management.

*(Full code appears in blog post)*

#### [DETECTING LLM-GENERATED CONTENT IN ACADEMIC AND PR...](https://stal.blogspot.com/2026/04/detecting-llm-generated-content-in.html)
When a university assigns an essay or a coding project, the purpose is not merely to obtain a deliverable. The purpose is to assess whether the student has internalized the material, can reason about it independently, and can communicate that reasoning clearly. If the deliverable is produced entirely or substantially by an LLM, the assessment loses its validity. The grade awarded no longer reflects the student's knowledge but rather the student's ability to prompt a machine, which is a very different skill. This creates a fairness problem for students who do the work honestly, because they compete against peers who have effectively outsourced the cognitive labor.

Beyond fairness, there is a deeper epistemic concern. LLMs are trained on vast corpora of text and code, and they are extraordinarily good at producing plausible-sounding content. However, they do not understand the material in any meaningful sense. They predict tokens based on statistical patterns. This means that LLM-generated text can contain subtle errors, hallucinated facts, and logically inconsistent arguments that are difficult to spot without deep domain knowledge. In a medical, legal, or engineering context, such errors can have serious consequences. A student who submits LLM-generated work and receives a passing grade may enter professional practice without the knowledge they were supposed to have acquired. The detection of LLM usage is therefore not just an academic integrity issue but a safety issue.

In the corporate world, the stakes are different but equally real. When a consultant submits a report, a lawyer drafts a brief, or an engineer writes a specification, the client or employer expects that the work reflects genuine expertise and judgment. If the work is largely LLM-generated, the professional is misrepresenting their contribution. Intellectual property questions also arise, because LLM outputs may incorporate patterns from copyrighted training data in ways that create legal liability. Companies that use LLM-generated code in production systems without proper review may introduce security vulnerabilities, licensing violations, or subtle logic errors that are hard to trace.

There is also a pedagogical dimension. The process of struggling with a problem, making mistakes, and refining one's thinking is how humans develop expertise. If LLMs short-circuit this process, students may graduate with credentials but without the underlying competence those credentials are supposed to certify. Detection tools are therefore not just punitive instruments. They are also diagnostic tools that help educators understand where students are struggling and where additional support is needed.

Finally, there is the question of intellectual honesty and attribution. Academic and professional norms require that authors take responsibility for the claims they make. If a significant portion of a document was generated by a machine, the human author cannot fully stand behind every claim, because they may not have verified or even understood all of it. Proper attribution of LLM assistance is therefore an ethical obligation, and tools that detect undisclosed LLM usage help enforce this norm.

Detecting whether text or code was generated by an LLM is a genuinely difficult problem, and no single method is perfectly reliable. The field has evolved rapidly, and practitioners typically combine multiple signals to arrive at a confident assessment. Understanding each method deeply is essential before building a detection tool, because the quality of the tool depends entirely on the quality of the signals it uses.

1. Perplexity and Burstiness Analysis: Perplexity is a measure of how surprised a language model is by a given piece of text. Formally, if a language model assigns probability P to a sequence of n tokens, the perplexity is defined as: 

    ```
    PP = exp( - (1/n) * sum( log P(token_i | context) ) )
    ```

    A low perplexity means the model found the text highly predictable, which is exactly what you would expect if the text was generated by a similar model. Human-written text tends to have higher perplexity because humans make idiosyncratic word choices, use unusual constructions, and occasionally violate statistical norms in ways that reflect genuine thought rather than pattern completion.

    The burstiness concept captures a related but distinct phenomenon. Human writers tend to alternate between complex, long sentences and short, punchy ones. Their perplexity scores vary considerably from sentence to sentence. LLMs, by contrast, tend to produce text with more uniform perplexity across sentences. The variance of perplexity scores is therefore a useful signal. Low variance suggests LLM generation, while high variance suggests human authorship.

    The practical challenge with perplexity-based detection is that it requires access to a language model to compute the scores, and the model used for detection may not be the same model that generated the text. Different models have different statistical fingerprints, so a text generated by GPT-4 may not appear low-perplexity to a LLaMA-based detector. Despite this limitation, perplexity analysis remains one of the most principled and theoretically grounded approaches to LLM detection.

2. Stylometric Analysis: Stylometry is the study of linguistic style as a fingerprint of authorship. It has a long history in literary scholarship, where it has been used to attribute anonymous texts to known authors. In the context of LLM detection, stylometric features serve as signals that distinguish machine-generated from human-generated text.

    The most informative stylometric features for LLM detection include the following. Vocabulary richness, measured by the type-token ratio or more sophisticated measures like the Yule K characteristic, captures how diverse the vocabulary is relative to the total number of words. LLMs tend to use a moderately rich vocabulary that is neither too repetitive nor too exotic, whereas human writers show more extreme patterns in both directions. Sentence length distribution captures how varied the sentence lengths are. LLMs tend to produce sentences of moderate and relatively uniform length, while human writers show more dramatic variation. Function word usage captures the distribution of words like "the", "a", "of", "in", and "that", which are highly stable within a given author's style but differ between LLMs and humans. Punctuation patterns capture how commas, semicolons, dashes, and other marks are used. LLMs tend to use punctuation correctly but somewhat mechanically, while human writers show more idiosyncratic patterns. Hedging and uncertainty language captures how often phrases like "it seems", "arguably", "one might say", or "it is worth noting" appear. LLMs are notorious for overusing such phrases, particularly at the beginnings and ends of paragraphs.

    Transition phrase overuse is one of the most reliable single indicators of LLM- generated text. Phrases like "Furthermore,", "Moreover,", "In conclusion,", "It is important to note that", "In summary,", "Delving into", "It is worth mentioning", and "In the realm of" appear with dramatically higher frequency in LLM outputs than in human writing. This is because LLMs learn from text that includes many such connective phrases, and they tend to reproduce them as a default structural scaffolding.

    Another powerful stylometric signal is the absence of personal voice. Human writers, even when writing formally, tend to leave traces of their personality, their particular way of framing problems, their preferred analogies, and their characteristic rhetorical moves. LLM-generated text tends to be more generic, more balanced, and more neutral than human text, because the model is optimizing for broad acceptability rather than expressing a genuine point of view.

3. Semantic Coherence and Logical Structure Analysis: LLMs are very good at producing locally coherent text, meaning that each sentence follows plausibly from the previous one. However, they sometimes struggle with global coherence, meaning that the overall argument of a long document may be less tightly organized than a human expert would produce. This is because LLMs generate text token by token without a global plan, relying instead on the local context window to maintain coherence.

    A detection tool can exploit this by analyzing the semantic similarity between adjacent paragraphs and between distant paragraphs. In human-written text, there is typically a clear argumentative thread that connects the introduction to the conclusion, with each section building on the previous one in a purposeful way. In LLM-generated text, the connections between sections are often more superficial, consisting of transition phrases rather than genuine logical dependencies.

    Another related signal is the presence of contradictions or inconsistencies. Because LLMs generate text without a persistent memory of what they have already said, they sometimes make claims in one section that are subtly inconsistent with claims in another section. A detection tool that uses an LLM to check for internal consistency can therefore use the model's own capabilities against itself.

4. Code-Specific Detection Signals: When the work being analyzed contains code rather than prose, a different set of signals becomes relevant. LLM-generated code has several characteristic patterns that distinguish it from code written by experienced human developers. 

    The most prominent pattern is the overuse of comments. LLMs tend to add a comment to almost every line or block of code, explaining what the code does in a way that is often redundant and sometimes slightly inaccurate. Experienced human developers follow the principle that good code is self-documenting and that comments should explain why, not what. LLM-generated code typically violates this principle systematically.

    Variable and function naming in LLM-generated code tends to be very descriptive and verbose, following a pattern like "calculate\_total\_price\_including\_tax" rather than the more varied and sometimes abbreviated naming that human developers use. This is because LLMs are trained on code from tutorials and documentation, which tends to use very explicit naming for pedagogical clarity.

    Error handling in LLM-generated code is often either absent or overly generic. LLMs frequently produce try-except blocks that catch all exceptions with a broad "except Exception as e" clause and print a generic error message, rather than handling specific error conditions in a principled way. This pattern is a strong indicator of LLM generation.

    The structure of LLM-generated code also tends to be very regular and modular in a somewhat mechanical way. Functions are typically short, well-separated, and follow a predictable template. Human-written code, especially in production systems, tends to show more organic growth, with some functions that are longer and more complex than others, and with structural choices that reflect the specific constraints and history of the project.

    Import organization in LLM-generated Python code typically follows the PEP 8 standard perfectly, with standard library imports first, then third-party imports, then local imports. While this is good practice, the mechanical perfection of the organization is itself a signal, because human developers often have slightly messier import sections that reflect the iterative nature of their development process.

5. Watermark Detection: Some LLM providers embed statistical watermarks in their outputs by subtly biasing the token selection process during generation. The idea is to partition the vocabulary into "green" and "red" tokens and to preferentially select green tokens during generation. A detector that knows the partitioning scheme can then check whether a piece of text contains an unusually high proportion of green tokens, which would indicate that it was generated by the watermarked model.

    The main limitation of watermark detection is that it requires knowledge of the specific watermarking scheme used by the model, and most commercial LLM providers do not publish this information. Furthermore, watermarks can be removed by paraphrasing the text, so a determined user can evade watermark detection with relatively little effort. Watermark detection is therefore most useful in controlled environments where the specific model used is known and the watermark scheme is accessible.

6. LLM-as-Judge Detection: A particularly powerful approach is to use a capable LLM as a judge to evaluate whether a piece of text or code was generated by another LLM. This approach leverages the fact that LLMs have internalized the statistical patterns of their own outputs and can often recognize those patterns in new text. The judge is given the text to be analyzed along with a detailed prompt that describes the specific signals to look for, and it returns a structured assessment.

    The LLM-as-judge approach has several advantages. It can handle nuanced cases that rule-based methods would miss. It can provide natural language explanations for its assessments, which are useful for communicating findings to students or employees. It can be updated simply by changing the prompt, without retraining any models. And it can combine multiple signals in a flexible, context-sensitive way.

    The main disadvantage is that the judge LLM can be wrong, and its errors are not always predictable. It may also be biased toward flagging text that is simply well-written or that follows academic conventions, even if it was written by a human. Calibration and validation against known human-written and LLM- generated texts is therefore essential.

*(Provides full code for LLMJudge application)*

#### [THE ULTIMATE GUIDE TO FINDING THE BEST LLM FOR YOU...](https://stal.blogspot.com/2026/04/the-ultimate-guide-to-finding-best-llm.html)
This article presents a comprehensive catalog of patterns for building LLM-based and Agentic AI systems. Each pattern is described using the classic pattern format: Name, Context, Problem, Solution, Benefits and Liabilities, and Consequences. The patterns are organized into thematic chapters that follow a natural red thread, starting from the most fundamental concerns (how you talk to an LLM) and progressing through resilience, agency, security, efficiency, memory, and finally architecture.

#### [PATTERNS FOR BUILDING LLM AND AGENTIC AI APPLICATIONS](https://stal.blogspot.com/2026/04/patterns-for-building-llm-and-agentic.html)
This article presents a comprehensive catalog of patterns for building LLM-based and Agentic AI systems. Each pattern is described using the classic pattern format: Name, Context, Problem, Solution, Benefits and Liabilities, and Consequences. The patterns are organized into thematic chapters that follow a natural red thread, starting from the most fundamental concerns (how you talk to an LLM) and progressing through resilience, agency, security, efficiency, memory, and finally architecture.

*(Patterns catalog follows)*

#### [CONTEXT ENGINEERING: THE NEW FRONTIER - How Fillin...](https://stal.blogspot.com/2026/04/context-engineering-new-frontier-how.html)
There is a moment every developer working with Large Language Models eventually reaches. You have spent hours crafting the perfect prompt. You have been precise, structured, and even poetic in your phrasing. You have added examples, specified the tone, defined the output format, and triple-checked your grammar. You send the request to the model and receive back something that is confidently, fluently, and utterly wrong.

The model did not fail because your prompt was bad. It failed because it did not know enough. It lacked the right documents, the right history, the right tools, and the right memory. It was like asking a brilliant surgeon to perform an operation while blindfolded and without instruments. No amount of eloquent instruction compensates for a missing scalpel.

This realization is the birthplace of Context Engineering, a discipline that has quietly become the most important skill in applied AI development. Andrej Karpathy, one of the most respected voices in the field and a co-founder of OpenAI, crystallized the idea in 2024 when he described context engineering as "the delicate art and science of filling the context window with just the right information for the next step." That single sentence contains more practical wisdom than most textbooks on AI application development.

**THE WORKFLOW OF CONTEXT ENGINEERING**

Context Engineering does not happen in a single place or at a single moment. It is a continuous process that spans the entire lifecycle of an AI application, from initial design through deployment and ongoing maintenance. Understanding who does what and when is essential for building effective systems.

During the design phase, the AI architect is the primary context engineer. This person makes the foundational decisions: What is the model's role? What external knowledge sources will it need? What tools should it have access to? How will conversation history be managed? What are the token budget allocations for each layer? These decisions shape the entire system architecture and are extraordinarily difficult to change later without significant rework.

During the development phase, the software engineer takes over as the primary context engineer. This person implements the retrieval pipelines, the memory systems, the tool integrations, and the context assembly logic. They write the code that dynamically builds the context window at inference time, pulling from databases, vector stores, and APIs to assemble the optimal information payload for each request. This is where Context Engineering becomes a software engineering discipline in its own right.

During the deployment and operations phase, the MLOps engineer and the data engineer share context engineering responsibilities. The MLOps engineer monitors context quality metrics in production, detecting when the model's performance degrades because the context is stale, poisoned, or overflowing. The data engineer maintains the knowledge bases, vector stores, and memory systems that feed the context pipeline, ensuring that the information available for retrieval is accurate, up-to-date, and well-organized.

The end user also participates in context engineering, though usually without realizing it. Every message a user sends becomes part of the conversation history and thus part of the context. Users who provide rich, detailed inputs are inadvertently doing excellent context engineering. Users who send terse, ambiguous messages are creating context engineering challenges that the system must compensate for.

#### [BUILDING AN LLM-POWERED SPOTIFY PLAYLIST MANAGEMEN...](https://stal.blogspot.com/2026/04/building-llm-powered-spotify-playlist.html)

#### [THE COSMIC COMPANION: HOW AMATEUR ASTRONOMERS CAN ...](https://stal.blogspot.com/2026/04/the-cosmic-companion-how-amateur.html)

#### [MEMORY FOR AI AGENTS: ANDREJ KARPATHY'S TAXONOMY A...](https://stal.blogspot.com/2026/04/memory-for-ai-agents-andrej-karpathys.html)

#### [YOUR PERSONAL TUTORIAL GENERATOR: BUILDING AN INTE...](https://stal.blogspot.com/2026/04/your-personal-tutorial-generator.html)

#### [CREATING FULLY FUNCTIONAL ADD-INS FOR VISUAL STUDI...](https://stal.blogspot.com/2026/04/creating-fully-functional-add-ins-for.html)

#### [GAME DEVELOPMENTS THAT USE LARGE LANGUAGE MODELS](https://stal.blogspot.com/2025/10/writing-games-that-use-large-language.html)

#### [ORCHESTRATING INTELLIGENCE: HOW TO BUILD LARGE, CO...](https://stal.blogspot.com/2026/04/orchestrating-intelligence-how-to-build.html)

#### [MEMPALACE: A COMPLETE TECHNICAL TUTORIAL](https://stal.blogspot.com/2026/04/mempalace-complete-technical-tutorial.html)

#### [ALL WHAT YOU (N)EVER WANTED TO KNOW ABOUT SOFTWARE...](https://stal.blogspot.com/2026/04/all-what-you-never-wanted-to-know-about.html)

#### [THE GARDEN OF DIGITAL EDEN - A Complete Beginner's...](https://stal.blogspot.com/2026/04/the-garden-of-digital-eden-complete.html)

#### [PROPOSAL AND CONCEPT - DESIGNING A DOMAIN-SPECIFIC...](https://stal.blogspot.com/2026/04/proposal-and-concept-designing-domain.html)

#### [LEVERAGING LARGE LANGUAGE MODELS FOR YOUR OWN IMPL...](https://stal.blogspot.com/2026/04/leveraging-large-language-models-for.html)

#### [Building an LLM-Based Agent for Code Refactoring a...](https://stal.blogspot.com/2026/04/building-llm-based-agent-for-code.html)

#### [LLM-Based Agentic AI Analysis - Architectural Cons...](https://stal.blogspot.com/2026/04/llm-based-agentic-ai-analysis.html)

#### [THE INTELLIGENT EDGE: HOW AI AND LARGE LANGUAGE MO...](https://stal.blogspot.com/2026/04/the-intelligent-edge-how-ai-and-large.html)

#### [Self-Extending AI: How to Teach an LLM to Build It...](https://stal.blogspot.com/2026/04/self-extending-ai-how-to-teach-llm-to.html)

#### [The Evolution of Software Development with Model-D...](https://stal.blogspot.com/2026/04/the-evolution-of-software-development.html)

#### [Collatz Conjecture Proof Sketch](https://stal.blogspot.com/2026/04/collatz-conjecture-proof-sketch.html)

#### [Liquid Foundation Models](https://stal.blogspot.com/2026/04/liquid-foundation-models.html)

#### [WHY HUMANS MUST STAY IN THE LOOP: THE INDISPENSABL...](https://stal.blogspot.com/2026/04/why-humans-must-stay-in-loop.html)

#### [Creating a Programming Language for AI-Centric Multi-Agent Systems: AgentScript](https://stal.blogspot.com/2026/03/creating-programming-language-for-ai.html) 
*(Currently, AgentScript is just a conceptual study without implementation.)*

#### [Agentic AI with N8N: A Complete developer's tutorial](https://stal.blogspot.com/2026/03/agentic-ai-with-n8n-complete-developers.html)

Part 1: The Big Picture

    Chapter 1  - What Is a Workflow Engine and Why Should You Care?
    Chapter 2  - Meet N8N: The Workflow Engine Built for the AI Era
    Chapter 3  - Installing and Deploying N8N

Part 2: N8N Fundamentals

    Chapter 4  - Your First Workflow: Nodes, Connections, and Triggers
    Chapter 5  - Working with Data: JSON, Expressions, and the Code Node
    Chapter 6  - Connecting to the Outside World: HTTP Requests and Webhooks

Part 3: Building Agentic AI

    Chapter 7  - What Is Agentic AI? The Theory Behind the Magic
    Chapter 8  - Your First AI Agent: Connecting an LLM to N8N
    Chapter 9  - Local LLMs with Ollama: Private, Free, and Powerful
    Chapter 10 - Giving Your Agent a Memory: Vector Stores and RAG
    Chapter 11 - Giving Your Agent Tools: HTTP Request Tools and Custom Actions
    Chapter 12 - Multi-Agent Orchestration: Building Agent Teams
    Chapter 13 - A Complete Agentic AI Project: The Research Assistant

Appendix A  - Environment Variables Reference
Appendix B  - Troubleshooting Common Issues


