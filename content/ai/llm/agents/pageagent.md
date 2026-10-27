title=PageAgent
tags=ai, llm, agent, browser, ecmascript, library
summary=AI agent in your webpage.
~~~~~~

[Website](https://alibaba.github.io/page-agent/) | [Source](https://github.com/alibaba/page-agent)

## [Quick Start](https://alibaba.github.io/page-agent/docs/introduction/quick-start/)

### 📦 NPM Install (Recommended)

```
// npm install page-agent 
import { PageAgent } from 'page-agent'
```

### 2\. Initialize Configuration

```
const agent = new PageAgent({ model: 'qwen3.5-plus', baseURL: 'https://dashscope.aliyuncs.com/compatible-mode/v1', apiKey: 'YOUR_API_KEY', language: 'en-US' })
```

### 3\. Start Using

```
// Execute natural language instructions programmatically 
await agent.execute('Click submit button, then fill username as John'); 
// Or: 
// Show panel for user to input instructions 
agent.panel.show()
```
