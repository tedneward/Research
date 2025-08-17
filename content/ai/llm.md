title=Large Language Model (LLM)
tags=ai
summary=Collection of links, notes, and models.
~~~~~~

## Reading

* [Getting Started with LangChain: A Beginner’s Guide to Building LLM-Powered Applications](https://towardsdatascience.com/getting-started-with-langchain-a-beginners-guide-to-building-llm-powered-applications-95fc8898732c)
* [A Practical Guide to Building Local RAG Applications with LangChain](https://machinelearningmastery.com/a-practical-guide-to-building-local-rag-applications-with-langchain/)
* [Guidance](https://github.com/guidance-ai/guidance): "Guidance is an efficient programming paradigm for steering language models. With Guidance, you can control how output is structured and get high-quality output for your use case—while reducing latency and cost vs. conventional prompting or fine-tuning. It allows users to constrain generation (e.g. with regex and CFGs) as well as to interleave control (conditionals, loops, tool use) and generation seamlessly."
* [How to run a local LLM via LocalAI, an Open Source project](https://thenewstack.io/how-to-run-a-local-llm-via-localai-an-open-source-project/)
* ["Understanding the Dark Side of Large Language Models: A Comprehensive Guide to Security Threats and Vulnerabilities"](https://www.marktechpost.com/2023/09/01/understanding-the-dark-side-of-large-language-models-a-comprehensive-guide-to-security-threats-and-vulnerabilities/)
* ["Use of LLMs for Illicit Purposes: Threats, Prevention Measures, and Vulnerabilities"](https://arxiv.org/abs/2308.12833)
* ["Researchers from Virginia Tech and Microsoft Introduce Algorithm of Thoughts: An AI Approach That Enhances Exploration of Ideas And Power of Reasoning In Large Language Models (LLMs)"](https://www.marktechpost.com/2023/08/31/researchers-from-virginia-tech-and-microsoft-introduce-algorithm-of-thoughts-an-ai-approach-that-enhances-exploration-of-ideas-and-power-of-reasoning-in-large-language-models-llms/)
* ["How to Build a Large Language Model from Scratch Using Python"](https://www.freecodecamp.org/news/how-to-build-a-large-language-model-from-scratch-using-python/)
* ["How to build knowledge graphs using LLMs"](https://www.geeky-gadgets.com/building-knowledge-graphs-using-llms/)
* ["Boost your AI Apps with DSLs"](https://www.typefox.io/blog/boost-your-ai-apps-with-dsls/)

### Critique

- https://leaddev.com/velocity/writing-code-was-never-the-bottleneck
- https://zed.dev/blog/why-llms-cant-build-software
- https://garymarcus.substack.com/p/llms-are-not-like-you-and-meand-never
- ["Socio-Demographic Modifiers Shape Large Language Models’ Ethical Decisions"](https://link.springer.com/article/10.1007/s41666-025-00211-x): "The ethical alignment of large language models (LLMs) in clinical decision making remains unclear, particularly their susceptibility to socio-demographic biases. We therefore tested whether LLMs shift medical ethical decisions in healthcare when presented with socio-demographic cues. Using 100 clinical vignettes, each posing a yes or no choice between two ethical principles, we compared the responses of nine open-source LLMs (Llama 3.3-70B, Llama 3.1-8B, Llama-3.1-Nemotron-70B, Gemma-2-27B, Gemma-2-9B, Phi-3.5-mini, Phi-3-medium, Qwen-2.5-72B, and Qwen-2.5-7B). Each scenario and modifier combination was repeated 10 times per model for a total of approximately 0.5 million experiments. All models changed their responses when introduced with socio-demographic details (p < 0.001). High-income modifiers increased utilitarian choices and decreased beneficence and nonmaleficence preferences, and marginalized-group modifiers raised autonomy considerations. Although some models demonstrated greater consistency than others, none maintained consistency across all scenarios, with the largest shifts observed in utilitarian choices. These results reveal that current LLMs can be steered by socio-demographic cues in ways not clinically justified, posing risks for equitable care in healthcare-informatics applications. This underscores the need for careful auditing and alignment strategies that ensure LLMs behave in ways consistent with widely accepted ethical principles while remaining attentive to the diversity, complexity, and contextual sensitivity required in real-world clinical practice."

## Models

* qwen2.5-coder: Your go-to coding companion. "It's a specialized LLM from the same family as qwen 2.5, but it's fine-tuned specifically for coding tasks. It is trained on an enormous dataset of code, providing it with a deep understanding of over 40 programming languages. The qwen-coder2.5 comes in different sizes, from a small 0.5B model to a powerful 32B model."
* wizard-math: Your logic partner. "This model is a specialized version of the WizardLM family. It is trained to excel in complex mathematical problems, logical reasoning, and solving puzzles. There are three different sizes available for wizard-math – 7B, 13B, and 70B. With my little experience exploring wizard-math with 7B, I found it fantastic. It helps me test my solutions and explore new ways to approach difficult problems. The model's ability to handle these subjects with precision and clarity makes it my go-to partner for all things logic and numbers."
* reader-lm: Web to markdown, instantly. "The model is super practical for my needs. Instead of manually creating .md files from the web content, I can feed them to reader-lm to get a perfectly structured markdown file. In my experience, while reader-lm does an amazing job for most of my needs, it sometimes struggles with really large or messy HTML code. But, it works well enough most of the time."
* llma-guard3: An LLM for safe prompts. "When working with LLMs, it’s crucial that our interactions are safe and responsible. While we can’t control an LLM’s response, we can ensure our prompts are appropriate. That’s exactly why I self-hosted llama-guard 3. This powerful model acts as a dedicated content moderation tool for all my other local LLMs. The llama-guard 3's job is to classify every interaction against a set of safety categories. It checks our prompts for 13 different categories. When we give a prompt to this LLM, it will respond with a message stating whether the prompt message was safe or unsafe. If it is unsafe, it flags it with a specific reason, such as S1 (Hate Speech) or S2 (Sexual Content), etc."
* Gemma 3: My local Gemini experience. "ChatGPT and Gemini are two key benchmarks that made everyone accustomed to AI and LLMs. While self-hosting LLMs, I also did not want to compromise my experience with those platforms. That’s why I self-hosted Gemma 3. This model is built on the same research as Gemini. It provides a premium experience with the flexibility of running locally. It is basically my local ChatGPT / Gemini. Gemma 3 is available in various sizes. It can handle a massive 128k context window, processes both text and images, and understands over 140 languages. This makes it my personal go-to AI for creative tasks. I use it to generate ideas for social media content, draft captions, and research topics for my blog."

## Integrations

- https://www.infoq.com/news/2025/08/google-langextract-python/
* [Python Langchain](https://python.langchain.com/docs/get_started/introduction): LangChain is a framework for developing applications powered by language models. It enables applications that:
    
    * Are context-aware: connect a language model to sources of context (prompt instructions, few shot examples, content to ground its response in, etc.)
    * Reason: rely on a language model to reason (about how to answer based on provided context, what actions to take, etc.)


