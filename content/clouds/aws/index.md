title=Amazon Web Services (AWS)
tags=cloud
summary=Huge collection of cloud-hosted services.
~~~~~~

[Website](https://aws.amazon.com/) | [Documentation](https://docs.aws.amazon.com/index.html?nc2=h_ql_doc_do_v) (note that many docs are available as Kindle books)

[A Well-Architected Framework (PDF)](http://d0.awsstatic.com/whitepapers/architecture/AWS_Well-Architected_Framework.pdf) | [AWS Well-Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework) (PDF, HTML)

[How to optimize storage costs using Amazon S3](https://aws.amazon.com/s3/cloud-storage-cost-optimization-ebook/) - AWS (PDF)

## Articles/Blogs
[A Fully Self-Sustained Blog Running in S3](https://www.allthingsdistributed.com/2011/02/weblog_in_amazon_s3.html)

[Hosting a static website in S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)

[Amazon's DynamoDB, 10 years later](https://www.amazon.science/latest-news/amazons-dynamodb-10-years-later)

## Features

- [Mobile Hub](https://aws.amazon.com/mobile): AWS Mobile Hub lets you easily add and configure features for your mobile apps, including user authentication, data storage, backend logic, push notifications, content delivery, and analytics. After you build your app, AWS Mobile Hub gives you easy access to testing on real devices, as well as analytics dashboards to track usage of your app.
- [Cognito](https://aws.amazon.com/cognito/): Amazon Cognito lets you easily add user sign-up and sign-in to your mobile and web apps. Gives the option to authenticate users through social identity providers such as Facebook, Twitter, or Amazon, with SAML identity solutions, or by using your an individual identity system. In addition, Amazon Cognito allows saving data locally on users devices, even when the devices are offline. Data synchronization amongst several user devices possible.



### Messaging
AWS has a fleet of messaging services which reflects very similar architectural considerations as the Azure services.

* [SQS](https://aws.amazon.com/en/sqs/) corresponds to Azure Storage Queues and Service Bus Queues (FIFO)
* [MQ](https://aws.amazon.com/en/amazon-mq) corresponds to Azure Service Bus, albeit at far smaller scale and less managed
* [Kinesis](https://aws.amazon.com/en/kinesis/) corresponds to Azure Event Hubs
* [EventBridge](https://aws.amazon.com/de/eventbridge/) corresponds to Azure Event Grid
* [IoT Core](https://aws.amazon.com/en/iot-core/) corresponds to Azure IoT Hub.
* [Simple Notification Service (SNS)](https://aws.amazon.com/sns)** 
Amazon Simple Notification Service (SNS) is a fast, flexible, fully managed publish-subscribe based messaging service for mobile and enterprise messaging that is used by several leading brands and startups to send billions of messages every day. With Amazon SNS, you can send push notifications to iOS, Android, Windows, FireOS, Baidu and MacOS devices. Additionally, you can deliver messages to other destinations such as Amazon Simple Queueing Service (SQS) queues, HTTP endpoints, email, SMS and AWS Lambda functions. With Amazon SNS you can make 1M requests, 1M mobile push delivery attempts and send 1GB of data out of any AWS region at no-charge every month.

