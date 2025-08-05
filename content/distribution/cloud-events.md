title=Cloud Events
tags=distribution, format, specification, messaging
summary=A common information model for events.
~~~~~~

It defines what an event is and what a set of common attributes are that make the event useful in many contexts. CloudEvents then defines formats (JSON, Avro, AMQP, Protbuf, XML) in which a CloudEvent can be expressed and protocol bindings for how CloudEvents can be transported (HTTP, AMQP, MQTT, Kafka).  

* [CloudEvents Primer](https://github.com/cloudevents/spec/blob/main/cloudevents/primer.md) - An introduction to CloudEvents with architectural considerations.
* [CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/spec.md). This is the main specification.
    * [HTTP Protocol Binding for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/http-protocol-binding.md)
    * [HTTP 1.1 Web Hooks for Event Delivery - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/http-webhook.md)
    * [AMQP Protocol Binding for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/amqp-protocol-binding.md)
    * [Kafka Protocol Binding for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/kafka-protocol-binding.md)
    * [MQTT Protocol Binding for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/mqtt-protocol-binding.md)
    * [NATS Protocol Binding for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/nats-protocol-binding.md)
    * [WebSockets Protocol Binding for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/bindings/websockets-protocol-binding.md)
    * [Avro Event Format for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/formats/avro-format.md)
    * [JSON Event Format for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/formats/json-format.md)
    * [Protobuf Event Format for CloudEvents - Version 1.0.2](https://github.com/cloudevents/spec/blob/main/cloudevents/formats/protobuf-format.md)
* [CloudEvents 1.0.2 repo](https://github.com/cloudevents/spec/blob/main/cloudevents/) where you
  can find all the protocol bindings and format specs
* [CloudEvents working branch](https://github.com/cloudevents/spec/tree/main) where we do the current work, especially on schema and message catalogs and discovery.
    * [CNCF Schema Registry API Version 0.2-wip](https://github.com/cloudevents/spec/blob/main/schemaregistry/spec.md)
    * [CNCF CloudEvents – Subscriptions API - Version 0.1-wip](https://github.com/cloudevents/spec/blob/main/subscriptions/spec.md)
    * [Discovery and Subscription Primer - WIP](https://github.com/cloudevents/spec/blob/main/discovery/primer.md)
    * [CloudSubscriptions: Discovery - Version 0.1-wip](https://github.com/cloudevents/spec/blob/main/discovery/spec.md)
    * [CNCF Message and Event Catalog API (not yet merged)](https://github.com/clemensv/spec/blob/messagecatalog/messagecatalog/spec.md)
* [Talk: "CloudEvents Intro and Demos"](https://www.youtube.com/watch?v=yg7RuDWHwV8)
* [Talk: "CloudEvents 1.0 and Beyond"](https://www.youtube.com/watch?v=YpUQbxx3jkk)
* [Talk: "CloudEvents DeepDive", KubeCon Europe 2019](https://www.youtube.com/watch?v=-3gOqR_TGEs)
