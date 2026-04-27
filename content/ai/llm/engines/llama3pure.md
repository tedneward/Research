title=llama3pure
tags=ai, engine
summary=Three inference engines for Llama 3: pure C for desktop systems, pure JavaScript for Node.js, and pure JavaScript for Web environments.
~~~~~~

[Source](https://github.com/lrusso/llama3pure)

Supports both Llama and Gemma architectures. Try the Web engine [here](https://lrusso.github.io/llama3pure/llama3pure-web-demo.htm).

![demo](https://github.com/lrusso/llama3pure/blob/main/README.gif?raw=true)

## Table of Contents

- [Building the engine (macOS / Linux)](#building-the-engine-macos--linux)
- [Building the engine (Windows)](#building-the-engine-windows)
- [Running the engine (macOS / Linux / Windows)](#running-the-engine-macos--linux--windows)
- [Running in Node.js](#running-in-nodejs)
- [Running in Web Environments](#running-in-web-environments)
- [Suggested Models and Engines](#suggested-models-and-engines)
- [Tested Models](#tested-models)
- [Author's Notes](#authors-notes)
- [Credits](#based-on-the-work-of)

## Building the engine (macOS / Linux)

```bash
make llama3pure
```

## Building the engine (Windows)

Use the x64 Native Tools Command Prompt for VS.

```bash
cl /O2 llama3pure-c-engine.c /Fe:llama3pure.exe
```

## Running the engine (macOS / Linux / Windows)

```bash
# On macOS / Linux
./llama3pure -model Llama3.gguf -prompt "Tell me in 1 line what is Microsoft."
./llama3pure -model Llama3.gguf -chathistory chat.txt

# On Windows
llama3pure.exe -model Llama3.gguf -prompt "Tell me in 1 line what is Microsoft."
llama3pure.exe -model Llama3.gguf -chathistory chat.txt
```

| Argument       | Required | Description                                                                                             |         Default Value          |
| :------------- | :------: | :------------------------------------------------------------------------------------------------------ | :----------------------------: |
| -model         |   Yes    | Path to a GGUF model file.                                                                              |               -                |
| -prompt        |    No    | Input prompt text (single-turn, alternative to -chathistory).                                           |               -                |
| -chathistory   |    No    | Path to a .txt file containing a JSON chat history (multi-turn, alternative to -prompt).                |               -                |
| -system_prompt |    No    | System prompt prepended to every conversation.                                                          | `You are a helpful assistant.` |
| -max_tokens    |    No    | Maximum number of tokens to generate per response.                                                      |         -1 (unlimited)         |
| -context_size  |    No    | Context window size (capped by the model's own limit).                                                  |          Model's max.          |
| -temperature   |    No    | Sampling temperature. Higher values produce more varied output.                                         |              0.9               |
| -top_p         |    No    | Nucleus sampling threshold. Only tokens whose cumulative probability reaches this value are considered. |              0.9               |
| -top_k         |    No    | Top-K sampling. Only the K most probable tokens are considered at each step.                            |               40               |
| -debug         |    No    | Show detailed model loading and performance logs (including tok/s).                                     |            disabled            |

Sample chat history in [tests.txt](https://github.com/lrusso/llama3pure/blob/main/tests.txt).

## Running in Node.js

- Step 1: Load a model

Read the GGUF file into an ArrayBuffer and pass it to `llama3pure` with `type: "load"`.

```javascript
import llama3pure from "./llama3pure-js-engine.js"
import fs from "fs"

const readFileAsArrayBuffer = (filePath) => {
  const fd = fs.openSync(filePath, "r")
  const fileSize = fs.fstatSync(fd).size
  const arrayBuffer = new ArrayBuffer(fileSize)
  const fileUint8 = new Uint8Array(arrayBuffer)
  const chunkSize = 256 * 1024 * 1024
  let pos = 0
  while (pos < fileSize) {
    const toRead = Math.min(chunkSize, fileSize - pos)
    fs.readSync(fd, fileUint8, pos, toRead, pos)
    pos = pos + toRead
  }
  fs.closeSync(fd)
  return arrayBuffer
}

llama3pure({
  type: "load",
  model: readFileAsArrayBuffer("/path/to/your-model.gguf"),
  cbRender: (token) => {
    process.stdout.write(token)
  },
  systemPrompt: "You are a helpful assistant.",
  maxTokens: 256,
  contextSize: 2048,
  temperature: 0.9,
  topP: 0.9,
  topK: 40,
})
```

| Parameter    |    Type     | Required | Description                                                                                             |         Default Value          |
| :----------- | :---------: | :------: | :------------------------------------------------------------------------------------------------------ | :----------------------------: |
| type         |   string    |   Yes    | Must be `load`                                                                                          |               -                |
| model        | ArrayBuffer |   Yes    | The GGUF model file contents.                                                                           |               -                |
| cbRender     |  function   |   Yes    | Callback invoked with each generated token as a string.                                                 |               -                |
| systemPrompt |   string    |    No    | System prompt prepended to every conversation.                                                          | `You are a helpful assistant.` |
| maxTokens    |   number    |    No    | Maximum number of tokens to generate per response.                                                      |         -1 (unlimited)         |
| contextSize  |   number    |    No    | Context window size (capped by the model's own limit).                                                  |          Model's max.          |
| temperature  |   number    |    No    | Sampling temperature. Higher values produce more varied output.                                         |              0.9               |
| topP         |   number    |    No    | Nucleus sampling threshold. Only tokens whose cumulative probability reaches this value are considered. |              0.9               |
| topK         |   number    |    No    | Top-K sampling. Only the K most probable tokens are considered at each step.                            |               40               |

- Step 2: Generate a response

Call `llama3pure` with `type: "generate"` and a `chatHistory` array. The engine uses the `cbRender` callback provided during load to stream tokens. The last message in `chatHistory` should have `role: "user"` - that is the message the model will respond to. Previous messages provide conversation context, enabling multi-turn conversations.

```javascript
llama3pure({
  type: "generate",
  chatHistory: [
    { role: "user", content: "Tell me in 1 line what is Microsoft." },
    {
      role: "assistant",
      content:
        "Microsoft is a global technology leader known for its innovative products and services.",
    },
    { role: "user", content: "Tell me in 1 line the names of the founders." },
  ],
})
```

| Parameter   |  Type  | Required | Description                                             |
| :---------- | :----: | :------: | :------------------------------------------------------ |
| type        | string |   Yes    | Must be `generate`.                                     |
| chatHistory | array  |   Yes    | Array of message objects representing the conversation. |

Full example in [llama3pure-nodejs-demo.js](https://github.com/lrusso/llama3pure/blob/main/llama3pure-nodejs-demo.js).

## Running in Web Environments

- Step 1: Load a model

Read the GGUF file as an ArrayBuffer and send it to the worker with type: "load". The ArrayBuffer is transferred (not copied) for performance.

```javascript
const reader = new FileReader()

reader.onload = (event) => {
  const arrayBuffer = event.target.result
  worker.postMessage(
    {
      type: "load",
      model: arrayBuffer,
      systemPrompt: "You are a helpful assistant.",
      maxTokens: 256,
      contextSize: 2048,
      temperature: 0.9,
      topP: 0.9,
      topK: 40,
    },
    [arrayBuffer]
  )
}

reader.readAsArrayBuffer(file)
```

| Parameter    |    Type     | Required | Description                                                                                             |         Default Value          |
| :----------- | :---------: | :------: | :------------------------------------------------------------------------------------------------------ | :----------------------------: |
| type         |   string    |   Yes    | Must be `load`                                                                                          |               -                |
| model        | ArrayBuffer |   Yes    | The GGUF model file contents.                                                                           |               -                |
| systemPrompt |   string    |    No    | System prompt prepended to every conversation.                                                          | `You are a helpful assistant.` |
| maxTokens    |   number    |    No    | Maximum number of tokens to generate per response.                                                      |         -1 (unlimited)         |
| contextSize  |   number    |    No    | Context window size (capped by the model's own limit).                                                  |          Model's max.          |
| temperature  |   number    |    No    | Sampling temperature. Higher values produce more varied output.                                         |              0.9               |
| topP         |   number    |    No    | Nucleus sampling threshold. Only tokens whose cumulative probability reaches this value are considered. |              0.9               |
| topK         |   number    |    No    | Top-K sampling. Only the K most probable tokens are considered at each step.                            |               40               |

- Step 2: Generate a response

```javascript
worker.postMessage({
  type: "generate",
  chatHistory: [
    { role: "user", content: "Tell me in 1 line what is Microsoft." },
    {
      role: "assistant",
      content:
        "Microsoft is a global technology leader known for its innovative products and services.",
    },
    { role: "user", content: "Tell me in 1 line the names of the founders." },
  ],
})
```

| Parameter   |  Type  | Required | Description                                             |
| :---------- | :----: | :------: | :------------------------------------------------------ |
| type        | string |   Yes    | Must be `generate`.                                     |
| chatHistory | array  |   Yes    | Array of message objects representing the conversation. |

- Step 3: Receiving messages from the Worker

```javascript
worker.onmessage = function (e) {
  var data = e.data
  switch (data.type) {
    case "progress":
      // Fired during model loading
      break

    case "loaded":
      // Fired once the model is fully loaded and ready
      break

    case "token":
      // Fired for each generated token during inference
      console.log(data.token)
      break

    case "complete":
      // Fired when generation is finished
      console.log(data.output)
      break
  }
}
```

| Event    |     Fields      | Description                                                                              |
| :------- | :-------------: | :--------------------------------------------------------------------------------------- |
| progress |        -        | Emitted during model loading to indicate progress.                                       |
| loaded   |        -        | Emitted once when the model has been fully loaded and is ready for inference.            |
| token    | token (string)  | Emitted for each token as it is generated, enabling real-time streaming of the response. |
| complete | output (string) | Emitted when generation finishes. Contains the full generated text.                      |

Try the Web engine [here](https://lrusso.github.io/llama3pure/llama3pure-web-demo.htm) or with custom `maxTokens`, `contextSize`, `topP` and `topK` [here](https://lrusso.github.io/llama3pure/llama3pure-web-demo.htm?maxTokens=2048&contextSize=4096&topP=0.9&topK=40).

A standalone version is available [here](https://lrusso.github.io/llama3pure/llama3pure-web-standalone.htm); it offers the same functionality as the standard version but uses a base64-embedded Worker, allowing you to run it as a local file without a web server.

## Suggested Models and Engines

| MODEL                                                                                                                                                     |  C  | NODE.JS | WEB |
| :-------------------------------------------------------------------------------------------------------------------------------------------------------- | :-: | :-----: | :-: |
| [Gemma-3-1B-it-Q8_0.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-Q8_0.gguf?download=true)                           | ✅  |   ✅    | ✅  |
| [Llama-3.2-1B-Instruct-Q8_0.gguf](https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q8_0.gguf?download=true) | ✅  |   ✅    | ✅  |
| [Llama-3.2-3B-Instruct-Q8_0.gguf](https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q8_0.gguf?download=true) | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-Q8_0.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-Q8_0.gguf?download=true)                           | ✅  |   ✅    | ❌  |

## Tested Models

| MODEL                                                                                                                                                             |  C  | NODE.JS | WEB |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-: | :-----: | :-: |
| [Gemma-3-270M-it-Q2_K_L.gguf](https://huggingface.co/unsloth/gemma-3-270m-it-GGUF/resolve/main/gemma-3-270m-it-Q2_K_L.gguf?download=true)                         | ✅  |   ✅    | ✅  |
| [Gemma-3-270M-it-Q3_K_M.gguf](https://huggingface.co/unsloth/gemma-3-270m-it-GGUF/resolve/main/gemma-3-270m-it-Q3_K_M.gguf?download=true)                         | ✅  |   ✅    | ✅  |
| [Gemma-3-270M-it-Q4_K_M.gguf](https://huggingface.co/unsloth/gemma-3-270m-it-GGUF/resolve/main/gemma-3-270m-it-Q4_K_M.gguf?download=true)                         | ✅  |   ✅    | ✅  |
| [Gemma-3-270M-it-Q5_K_M.gguf](https://huggingface.co/unsloth/gemma-3-270m-it-GGUF/resolve/main/gemma-3-270m-it-Q5_K_M.gguf?download=true)                         | ✅  |   ✅    | ✅  |
| [Gemma-3-270M-it-Q6_K.gguf](https://huggingface.co/unsloth/gemma-3-270m-it-GGUF/resolve/main/gemma-3-270m-it-Q6_K.gguf?download=true)                             | ✅  |   ✅    | ✅  |
| [Gemma-3-270M-it-Q8_0.gguf](https://huggingface.co/unsloth/gemma-3-270m-it-GGUF/resolve/main/gemma-3-270m-it-Q8_0.gguf?download=true)                             | ✅  |   ✅    | ✅  |
| [Gemma-3-270M-it-F16.gguf](https://huggingface.co/unsloth/gemma-3-270m-it-GGUF/resolve/main/gemma-3-270m-it-F16.gguf?download=true)                               | ✅  |   ✅    | ✅  |
| [Gemma-3-1B-it-Q2_K_L.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-Q2_K_L.gguf?download=true)                               | ✅  |   ✅    | ✅  |
| [Gemma-3-1B-it-Q3_K_M.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-Q3_K_M.gguf?download=true)                               | ✅  |   ✅    | ✅  |
| [Gemma-3-1B-it-Q4_K_M.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-Q4_K_M.gguf?download=true)                               | ✅  |   ✅    | ✅  |
| [Gemma-3-1B-it-Q5_K_M.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-Q5_K_M.gguf?download=true)                               | ✅  |   ✅    | ✅  |
| [Gemma-3-1B-it-Q6_K.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-Q6_K.gguf?download=true)                                   | ✅  |   ✅    | ✅  |
| [Gemma-3-1B-it-Q8_0.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-Q8_0.gguf?download=true)                                   | ✅  |   ✅    | ✅  |
| [Gemma-3-1B-it-BF16.gguf](https://huggingface.co/unsloth/gemma-3-1b-it-GGUF/resolve/main/gemma-3-1b-it-BF16.gguf?download=true)                                   | ✅  |   ✅    | ✅  |
| [Llama-3.2-1B-Instruct-Q3_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q3_K_L.gguf?download=true)     | ✅  |   ✅    | ✅  |
| [Llama-3.2-1B-Instruct-Q4_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q4_K_L.gguf?download=true)     | ✅  |   ✅    | ✅  |
| [Llama-3.2-1B-Instruct-Q5_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q5_K_L.gguf?download=true)     | ✅  |   ✅    | ✅  |
| [Llama-3.2-1B-Instruct-Q6_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q6_K_L.gguf?download=true)     | ✅  |   ✅    | ✅  |
| [Llama-3.2-1B-Instruct-Q8_0.gguf](https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q8_0.gguf?download=true)         | ✅  |   ✅    | ✅  |
| [Llama-3.2-1B-Instruct-f16.gguf](https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-f16.gguf?download=true)           | ✅  |   ✅    | ❌  |
| [Llama-3.2-3B-Instruct-Q3_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q3_K_L.gguf?download=true)     | ✅  |   ✅    | ❌  |
| [Llama-3.2-3B-Instruct-Q4_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q4_K_L.gguf?download=true)     | ✅  |   ✅    | ❌  |
| [Llama-3.2-3B-Instruct-Q5_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q5_K_L.gguf?download=true)     | ✅  |   ✅    | ❌  |
| [Llama-3.2-3B-Instruct-Q6_K_L.gguf](https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q6_K_L.gguf?download=true)     | ✅  |   ✅    | ❌  |
| [Llama-3.2-3B-Instruct-Q8_0.gguf](https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-Q8_0.gguf?download=true)         | ✅  |   ✅    | ❌  |
| [Llama-3.2-3B-Instruct-f16.gguf](https://huggingface.co/bartowski/Llama-3.2-3B-Instruct-GGUF/resolve/main/Llama-3.2-3B-Instruct-f16.gguf?download=true)           | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-Q2_K_L.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-Q2_K_L.gguf?download=true)                               | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-Q3_K_M.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-Q3_K_M.gguf?download=true)                               | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-Q4_K_M.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-Q4_K_M.gguf?download=true)                               | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-Q5_K_M.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-Q5_K_M.gguf?download=true)                               | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-Q6_K.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-Q6_K.gguf?download=true)                                   | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-Q8_0.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-Q8_0.gguf?download=true)                                   | ✅  |   ✅    | ❌  |
| [Gemma-3-4b-it-BF16.gguf](https://huggingface.co/unsloth/gemma-3-4b-it-GGUF/resolve/main/gemma-3-4b-it-BF16.gguf?download=true)                                   | ✅  |   ✅    | ❌  |
| [Llama-3-8B-Instruct-Q2_K.gguf](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q2_K.gguf?download=true)     | ✅  |   ✅    | ❌  |
| [Llama-3-8B-Instruct-Q3_K_M.gguf](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q3_K_M.gguf?download=true) | ✅  |   ✅    | ❌  |
| [Llama-3-8B-Instruct-Q4_K_M.gguf](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q4_K_M.gguf?download=true) | ✅  |   ✅    | ❌  |
| [Llama-3-8B-Instruct-Q5_K_M.gguf](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q5_K_M.gguf?download=true) | ✅  |   ✅    | ❌  |
| [Llama-3-8B-Instruct-Q6_K.gguf](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q6_K.gguf?download=true)     | ✅  |   ✅    | ❌  |
| [Llama-3-8B-Instruct-Q8_0.gguf](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-Q8_0.gguf?download=true)     | ✅  |   ✅    | ❌  |
| [Llama-3-8B-Instruct-fp16.gguf](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF/resolve/main/Meta-Llama-3-8B-Instruct-fp16.gguf?download=true)     | ✅  |   ✅    | ❌  |

## Author's Notes

- Using quantizations below Q4 is generally discouraged because the loss in logic and coherence makes them nearly unusable for most tasks.

- Due to universal browser memory constraints regarding ArrayBuffer size limits, the Web engine can only read GGUF files up to 2 GB.

- There isn't a Python engine because a ported and pure version would be very slow. Using NumPy wouldn't make sense because it uses C under the hood, and for that, there is already a C engine.

## Resources

### Reading

- [This dev made a Llama with three inference engines](https://www.theregister.com/2026/02/08/llama3pure_incorporates_three_inference_engines/)

## Based on the work of

https://github.com/karpathy/llama2.c

