title=SmartMock
tags=distribution, ai, testing, service
summary=An AI-powered API mock server built with Spring Boot, Ollama, and LangChain4j that, instead of serving hardcoded responses, uses an LLM to generate realistic, context-aware mock data directly from your OpenAPI specifications.
~~~~~~

[Article](https://bazlur.substack.com/p/building-smart-mock-an-ai-powered) | [Source](https://github.com/rokon12/smart-mock.git)

## Getting Started

Prerequisites
* Java 21+
* Maven 3.6+
* Ollama (for LLM support)

```
# Start Ollama with your preferred model
ollama pull codellama:7b
ollama serve

# Clone and run Smart Mock
git clone https://github.com/rokon12/smart-mock.git
cd smart-mock
./mvnw spring-boot:run

# Open http://localhost:8080
```

### Configuration
Configure via environment variables or application.yml:

```
ollama:
  base-url: http://localhost:11434
  model-name: llama3.1:8b
  temperature: 0.6
  timeout: 60

cache:
  max-size: 1000
  expire-minutes: 15
```

## Using the Web Interface
Once Smart Mock is running, open your browser and navigate to

        http://localhost:8080

You’ll see the Smart Mock dashboard:

From here you can:

* Load the samples to try out the features instantly.
* Upload your own OpenAPI specification (YAML).
* Explore endpoints directly from the UI with “Explore & Test API.”

The interface allows you to switch between loaded schemas, activate one as the current mock API, and immediately test it without any extra configuration.

