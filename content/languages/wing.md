title=Wing
tags=language, cloud
summary=A cloud-oriented programming language that elevates the developer experience by combining infrastructure and runtime code, minimizing the complexity of the cloud.
~~~~~~

[Website](https://www.winglang.io/) | [Source](https://github.com/winglang/wing)

```
bring cloud;

let bucket = new cloud.Bucket();

new cloud.Function(inflight (event: str): str => {
  bucket.put("greeting.txt", "hello, world!");
});
```

