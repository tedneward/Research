title=ModelJars
tags=library, jvm, ai, llm
summary=In-JVM small language model inference.
~~~~~~

[Website](https://integrallis.github.io/models/) | [Source](https://github.com/integrallis/models)

```
// Generated reference to a qualified artifact
import static org.modeljars.catalog.Qwen3_0_6b_Q4_0.MODEL;

try (var runtime = ModelJars.openRuntime(MODEL)) {
    var prompt = runtime.chatTemplate().render(messages);
    String answer = runtime.model().generate(prompt, options);
}
```

or

```
// Exact Maven-style marker coordinate
try (var runtime = ModelJars.openRuntime(
        "org.modeljars.huggingface:" +
        "ggml-org.qwen3-0.6b-gguf.q4_0:" +
        "3.0.0-q4_0.1")) {
    var prompt = runtime.chatTemplate().render(messages);
    String answer = runtime.model().generate(prompt, options);
}
```

or

```
// Apple's on-device SystemLanguageModel
try (var client = AppleFoundationModels.create()) {
    if (client.availability().available()) {
        String answer = client.generate(prompt).text();
    }
}
```

[Local models](https://integrallis.github.io/models/docs/models/current/routing.html)

