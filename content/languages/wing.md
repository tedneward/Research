title=Wing
tags=language, cloud
summary=A cloud-oriented programming language that elevates the developer experience by combining infrastructure and runtime code, minimizing the complexity of the cloud.
~~~~~~

[Website](https://www.winglang.io/) | [Source](https://github.com/winglang/wing)

```
bring cloud;

let queue = new cloud.Queue(timeout: 2m);
let bucket = new cloud.Bucket();
let counter = new cloud.Counter(initial: 100);

queue.addConsumer(inflight (body: str): str => {
  let next = counter.inc();
  let key = "myfile-${next}.txt";
  bucket.put(key, body);
});
```

In this simple application, every message that goes into the queue is written to a new object inside a cloud bucket. An atomic counter is used to generate an incrementing and unique key for each object.

When compiling this code, the Wing compiler will produce a bundle of artifacts that are ready to be deployed to a cloud provider. This bundle includes Terraform files which define the infrastructure resources required for this application and JavaScript code bundles that include the code executed on the cloud.

When deployed to the cloud, this application can handle an infinite amount of traffic, with no need for you to explicitly take care of scaling, load balancing, security policies, or any other infrastructure-related concerns. For example, when targeting AWS, Wing will use Amazon S3 for the bucket, Amazon SQS for the queue, Amazon DynamoDB for the atomic counter, and AWS Lambda for the handler. It will also render least privilege IAM security policies, wire up environment variables and produce the code bundles needed for this to work.