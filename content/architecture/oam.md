title=OAM (Open Application Model)
tags=architecture, format, distribution
summary=A set of standard yet higher level abstractions for modeling cloud native applications on top of today's hybrid and multi-cloud environments.
~~~~~~

[Website](https://oam.dev/) | [Source](https://github.com/oam-dev)

Focused on **application** rather than container or orchestrator, Open Application Model brings modular, extensible, and portable design for defining application deployment with higher level API. This is the key to enable simple, consistent yet robust application delivery across hybrid environments including Kubernetes, cloud, or even IoT devices.

## Introduction

_"Developers think in terms of application architecture, not of infrastructure."_

[![How it works](https://github.com/oam-dev/spec/raw/master/assets/how-it-works.png)](https://github.com/oam-dev/spec/blob/master/assets/how-it-works.png)

### Why Open Application Model?

In today's hybrid deployment environments, delivering applications without application context is hard:

-   Developers spend time on infrastructure details instead of apps - clusters, ingresses, labels, DNS, etc, and learning how the infrastructure is implemented in different environments
-   Inextensible - upper layer platform may be introduced, but it's almost certain that the needs of your app will outgrow the capabilities of that platform soon.
-   Vendor lock-in - app deployment is tightly coupled with service provider and infrastructure, which heavily impact on how you configure, develop and operate the app across hybrid environments.

In Open Application Model, we propose an app-centric approach instead:

-   Application first - define the app deployment with a self-contained model, where operational behaviors as part of app definition, free of infrastructure, simply deploy.
-   Clarity and extensibility - an open standard to modularize app delivery into reusable pieces, assemble them into a deployment plan per your own needs, fully self-service.
-   Vendor agnostic - a consistent yet higher level abstraction to model app delivery across on-prem clusters, cloud providers or even edge devices. Zero lock-in.

The design of Open Application Model is driven by [KubeVela](https://github.com/oam-dev/kubevela) project - a modern application deployment platform that intends to make delivering and managing applications across today's hybrid, multi-cloud environments easier and faster.

