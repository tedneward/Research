title=AI Glossary
tags=ai, glossary
summary=A collection of terms and definitions around artificial intelligence.
~~~~~~

**_Agent._** There are a lot of uses of the term ‘agent’ but in this specific area of AI and LLMs, an Agent is a process that has access to an LLM but also access to run time and tools or APIs. You can think of it this way — an LLM can produce code for you but an Agent can write the code and execute it.

**_Agent Skill._** An agent skill is a predefined capability or behavior that an AI agent uses to accomplish specific tasks like searching the web, writing code, sending emails, or reading files. Skills give agents a structured way to interact with tools, APIs, or data sources, making them more reliable and reusable across workflows. Think of them as modular “superpowers” you can plug into an agent.

At a minimum, skills are just folders the agent reads, containing logic, instructions, assets, templates, and more. Most of today’s state-of-the-art agent apps let you create your own custom skills.

**_Agent Tool._** A tool is a function (code) that an AI agent can execute when it decides to. That’s why each tool has a name and a description, which influence when the model chooses to use it (for example, “Use this function to pull the latest tickets from a Jira project”).

Besides the name and description, the function contains the code that the AI agent runs with the required arguments. For example, the agent could call:

        jira_fetch_tickets(project="AI", limit=10)

Tools are also components that power MCP servers. In Open WebUI project, users can even write custom Python tools that agents can invoke.

**_AGI or Artificial General Intelligence._** It means AI that performs and has all the capabilities that a human has — deep general knowledge on a lot of things, the ability to dynamically improve via usage, abilities to learn and acquire new skills. This is the realm of science fiction and alarmist views on AI.

**_AI Agent._** An AI agent is a software system powered by LLMs that performs tasks, answers questions, and automates processes for users. They can range from simple chatbots to advanced digital or robotic systems capable of running complex workflows autonomously. Key features include planning, using tools, perceiving their environment, and remembering past interactions, which help them improve performance over time.

**_Bot._** I use this term synonymously with an Agent, though I believe Bot is a more generalized version of the concept whereas an Agent has a specific meaning. You will hear this term often in names of things / frameworks.

**_Cognition._** Awareness of the world / environment around an AI / Agent / Model.

**_Collaborative AI._** A paradigm for building AI by uniting multiple AI models/engines in a way that they can work together for a single goal.

**_Context Window._** (1) The amount of input that can be fed into an LLM. The window length is measured in tokens — the fragments of text that LLMs use to break down words for more understandability. [Read more.](https://medium.com/@crskilpatrick807/context-windows-the-short-term-memory-of-large-language-models-ab878fc6f9b5) (2) The context window is the number of tokens an LLM can process as input or generate as output. Input and output limits are usually different, with the input capacity typically much larger than the output. For example, GPT-4o has an input limit of 128.000 tokens and an output limit of 16.384 tokens.

**_Digital Twin._** Digital twins are virtual representations of assets, people, or processes and their environments that simulate strategies and optimize behaviors. In the CPaaS space, this usually refers to AI agents that mimic people using audio and video modalities.

**_Embedding._** This is a powerful concept and enabling technology for AI powered applications. Embeddings are representations of text as numbers. These numbers have meaning though — a car and a truck will be mathematically closer than a car and a tree.

**_Embedding Model._** An embedding model is a machine learning model trained to convert input text into numerical vectors, which can then be used for vector similarity search. Embedding models are a key part of the RAG (Retrieval-Augmented Generation) pipeline, as they transform user questions into vector representations.

**_Ethical AI._** The growing field related to both policy and technical governance around AI with the intention of reducing harm.

**_Fine tuning._** (1) The process of creating specialized model by starting with an existing, trained model and running a short training cycle with task specific input. (2) Fine-tuning is the process of modifying a language model’s neural network using your own data. It’s different from simply adding documents to a conversation or adjusting prompts, which don’t change the model’s underlying structure (see RAG for an alternative approach).

**_GenAI or Generative AI._** The class of AI solutions around creating content of some sort. The current major areas are text and image generation.

**_GPU._** This stands for Graphical Processing Unit. This is the hardware component that has made the creation of modern AI models possible. GPUs allow for millions of simultaneous computations but are often limited by the amount of data that can be stored in memory (VRAM).

**_Hallucination._** The phenomenon in which AI seemingly makes up reality — either real world facts or facts from an interaction like details from a chat history.

**_Hybrid Search._** Hybrid search combines the strengths of vector search and traditional full-text search to improve the relevance of retrieved results. Vector search captures the semantic meaning of queries, matching based on context and intent, while full-text search ensures precise keyword matches. By blending these approaches, hybrid search increases the likelihood of retrieving the most relevant documents, even when queries are vague or phrased differently from the source content. This boosts the accuracy of retrieval and enhances the overall effectiveness of the RAG (Retrieval-Augmented Generation) pipeline.

**_Inference._** This simply means “using” a model, as opposed to creating or training it.

**_LLM or Large Language Model._** (1) This is a specific type of AI model which has been trained to generate text. These models are called “large” because they consist of billions of parameters which allow them to understand very complex and nuanced elements of natural language. _Examples_: GPT, Bard, Claude, LLaMa. (2) An AI model within the deep learning spectrum, primarily designed for language understanding and content generation. LLMs excel at processing and generating human-like text.

**_LLM Based App._** This doesn’t have to mean a “chat” application. This simply means an application that uses an LLM to perform some part of it’s core functionality. There may not even be any visible language component.

**_LLM Parameters._** LLM parameters are the components within a large language model that determine its behavior and capabilities. Learned during training, they include weights and biases that help the model understand and generate language. Generally, more parameters mean a smarter model, but they also require more computing power, especially memory (RAM), to run.

**_LoRA or Low Rank Adaptation._** A technique to capture the result of fine-tuning on a model in a memory and storage efficient way. “Low Rank” refers the smaller matrices stored separately from the model which can be used as needed to create a modified model for inference. This is a type of PEFT.

**_Metacognition._** Awareness of “self” inside the world / environment around an AI / Agent / Model.

**_MCP._** (Model Context Protocol) is an open standard that lets AI agents connect to external tools and data sources consistently. Instead of creating a custom integration for every service (like Slack, Google Drive, or GitHub…) MCP provides a universal “plug-in” format, allowing any MCP-compatible server to communicate with any MCP-compatible AI. Think of it as USB-C, but for AI tool integrations.

**_ML or Machine Learning._** I hear some confusion about ML vs AI. ML is specifically the process of taking a set of inputs (training set) and producing a set of outputs. The quality or accuracy of those outputs improves with more training.

**_Model._** A model is the output of training and the real brain of AI. Once a model is trained, it can be used (called inference) by asking it to produce outputs given some new input.

**_MoE or Mixture of Experts._** A technique used to create large but computationally efficient models by effectively creating separate smaller models that work together to produce a single output. OpenAI’s GPT and [Mistral AI](https://medium.com/tales-of-tomorrow/a-quiet-revolution-mistral-ai-releases-sensational-new-ai-model-c17c663287f0).

**_Multimodal._** Multimodal refers to the ability of AI systems to process and combine multiple types of data inputs (text, images, audio, video) to perform tasks or generate outputs. This approach allows AI models to understand and create content across different modalities, resulting in more comprehensive and context-aware applications.

**_Neural Network._** The technical way in which a model is architected. Neural nets are intended to mimic the way human brains work and learn by strengthening or weakening connections, which neural nets do by adjusting weights.

**_One-Shot._** (See _Shot below_) This means one example of what an appropriate answer should look like is included in the prompt given to the AI.

**_Orchestration._** In the LLM space this refers the concept of using a process to combine an LLM with an executable process, as well as with tools/APIs that are available. An _agent_ is what performs the _orchestration_.

**_PEFT or Parameter-Efficient Fine Tuning._** This is the general term for techniques that involve fine tuning a model in an efficient way that does not require as much time or compute resources as training the model itself. Not only does fine-tuning imply less training cycles applied to an existing model, but the efficiency implies that the number of parameters that are effected are a subset of the full model which are now in the hundreds of billions.

**_PI or Position Interpolation._** A technique to effectively extend the usable size of a context window. \[[Link](https://arxiv.org/abs/2306.15595)\]

**_Prompt._** A prompt is the user’s input that kicks off the model’s text generation. It guides the model to produce relevant and coherent responses based on the context or question. Prompts can be simple or detailed, shaping the quality and direction of the output.

    * **_System Prompt._** A system prompt is a set of instructions or guidelines given to a language model to set its behavior, tone, and limits during a conversation.

**_Prompt Engineering._** (1) This term implies much more than simply improving results by improving the text sent into a GenAI model. The full scope of prompt engineering includes things like understanding the state and history of a user in order to feed the important information into the model. It also would include the document retrieval techniques popular in the RAG architecture. (2) Prompt engineering is the practice of designing and refining prompts to optimize a language model’s performance and output. It involves crafting specific inputs that guide the model to produce the desired responses, improving accuracy, relevance, and coherence.

**_Prompt Injection._** Prompt injection is a type of cyberattack on large language models (LLMs), where malicious inputs are disguised as normal prompts to manipulate the model’s behavior or output. These attacks can make the model ignore safeguards, reveal sensitive information, or carry out unauthorized actions.

**_RAG or Retrieval Augmented GenAI._** (1) This popular architecture allows for the realtime injection of knowledge into a model by finding information that may be helpful to the model as it generates content and including this information as input. This is different from a traditional model / fine-tuning approach where new information is added into a model itself via a training process. (2) Retrieval-Augmented Generation (RAG) is a system that uses a vector database to store ingested data, such as documents, web pages, and other sources. When a question is asked, relevant data is retrieved and combined with the question before being sent to a language model (LLM). The LLM itself doesn’t change, but it “sees” the retrieved information, allowing it to answer based on this additional context.

**_RoPE or Rotary Positional Embedding._** A type of embedding model that leads to better results around computing distances by looking at calculated distances from several vantage points.

**_QLoRA or Quantized LoRA._** This is a LoRA (see above) which uses the additional technique of quantization which essentially means further reducing GPU memory needs by reducing the precision of the math involved in the training process.

**_Shot or One-Shot or Zero-Shot or N-Shot._** A _shot_ in this context means the number of examples of expected results given in as part of the prompt.

**_Step-back Prompting or STP._** A prompt engineering technique in which you start an answer by first asking an LLM to consider fundamentals behind a question before trying to answer the question itself.

**_Token._** (1) How LLMs break down amount of text. While not strictly accurate, a decent way to think about tokens is as syllables. Tokens are used to measure input and output from LLMs and are often used to bill usage of LLM APIs. (2) In Generative AI, a token is the smallest unit of information a language model processes. Depending on the language and the model’s design, a token can represent a whole word, part of a word, or even a single character. Tokens are the building blocks that language models use to understand and generate text.

**_Training._** The process of creating or fine-tuning a model by using the model to perform a task based on training data, measuring the result based on expected outcomes, and adjusting the weights in the model to try to improve results.

**_Vector Database._** (1) A special kind of datastore that allows for storage of embeddings which are really just a list of numbers. This allows the retrieval of stored text which is deemed to be relevant to a search text based on similarity of their embeddings. (2) Unlike traditional databases that store structured data in tables, vector databases are optimized for operations like similarity search, allowing efficient retrieval of data points that are mathematically close to a given query vector. This capability is essential for applications such as recommendation systems, image recognition, natural language processing, and other AI-driven tasks where data is represented as vectors. For a common implementation, see RAG (Retrieval-Augmented Generation).

**_VRAM or Video RAM._** The amount of memory available on board on a GPU. Often the most important limiting factor for training / using a model because the models must fit into memory.

**_Weights._** The values in a model that numerically represent the strength of relationships and features. These values are what changes over time when a model is trained or fine-tuned.

**_Zero-Shot._** (See _Shot_ above) This means prompting for an answer with zero examples of what an appropriate response should look like.

## sources

- https://byronsalty.medium.com/my-growing-list-of-ai-and-llm-terminology-26d8b109a14f
- https://shiftmag.dev/the-glossary-you-must-read-if-you-wanna-talk-about-ai-8413/

