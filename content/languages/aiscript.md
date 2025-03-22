title=AIScript
tags=language, ai
summary=A language designed specifically for web development in the AI era, with AI capabilities as first-class language features, and an intuitive route DSL and directive design.
~~~~~~

[Blog](https://aiscript.dev/blog/announcing-aiscript) | [Source](https://github.com/aiscriptdev/aiscript)

Example:
```
$ export OPENAI_API_KEY=<your-openai-api-key>
$ cat web.ai
get / {
    """An api to ask LLM"""

    query {
        """the question to ask"""
        @string(min_len=3, max_len=100) // validate params with builtin directive @string
        question: str
    }

    // `ai` and `prompt` are keywords
    ai fn ask(question: str) -> str {
        let answer = prompt question;
        return answer;
    }
    // use query.name or query["name"] to access query parameter
    let answer = ask(query.question);
    return { answer };
}

$ aiscript serve web.ai
Listening on http://localhost:8080

$ curl http://localhost:8080
{
    "error": "Missing required field: question"
}

$ curl http://localhost:8080?question=Hi
{
    "error": "Field validation failed: question: String length is less than the minimum length of 3"
}

$ curl http://localhost:8080?question=What is the capital of France?
{
    "answer": "The capital of France is Paris."
}
```

