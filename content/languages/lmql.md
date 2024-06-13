title=LMQL
tags=language, ai, llm
summary=A programming language for LLMs; Robust and modular LLM prompting using types, templates, constraints and an optimizing runtime.
~~~~~~

[Website](https://lmql.ai/) | [Source](https://github.com/eth-sri/lmql) | [Docs](https://lmql.ai/docs/) | [Playground](https://lmql.ai/playground)

Local install: `pip install lmql`; also requires NodeJS 14.20+

Example:
```
@lmql.query
def meaning_of_life():
    '''lmql
    # top-level strings are prompts
    "Q: What is the answer to life, the \
     universe and everything?"

    # generation via (constrained) variables
    "A: [ANSWER]" where \
        len(ANSWER) < 120 and STOPS_AT(ANSWER, ".")

    # results are directly accessible
    print("LLM returned", ANSWER)

    # use typed variables for guaranteed 
    # output format
    "The answer is [NUM: int]"

    # query programs are just functions 
    return NUM
    '''

# so from Python, you can just do this
meaning_of_life() # 42
```


https://github.com/eth-sri/lmql
LMQL is a programming language for large language models (LLMs) based on a superset of Python. LMQL offers a novel way of interweaving traditional programming with the ability to call LLMs in your code. It goes beyond traditional templating languages by integrating LLM interaction natively at the level of your program code.
