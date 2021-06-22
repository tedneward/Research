title="Serverless"
tags=architecture, cloud, distribution
summary=The serverless architecture, usually implying smaller atoms of functionality executing on cloud servers.
~~~~~~

[Serverless Patterns](https://medium.com/@taibi.davide/serverless-patterns-e1fb3f1d753e) ([Publication](https://www.researchgate.net/publication/340121613_Serverless_Cloud_Computing_Function-as-a-Service_Patterns_A_Multivocal_Literature_Review)):
* Orchestration and Aggregation
    * Aggregator (aka "durable functions")
    * Data Lake
    * Fan-in Fan-Out (aka "virtual actors", "Processor", "Data transformation")
    * Function Chain
    * Proxy
    * Queue-Based Load Leveling
    * The Frugal Consumer
    * The Internal API
    * The Robust API
    * The Router
    * Thick Client
    * The State Machine
* Event Management
    * Responsibility Segregation
    * Distributed Trigger
    * FIFO
    * The Internal Hand-off
    * Periodic Invoker
    * Polling Event Processor
* Availability Patterns
    * Bulkhead
    * Circuit Breaker
    * Compiled Functions
    * Function warmer
    * Oversized Function
    * Read-heavy report engine
    * The Eventually Consistent
    * Timeout
* Communication Patterns
    * Data Streaming
    * Externalized State
    * Publish/Subscribe
* Authorization Patterns
    * The Gatekeeper
    * Valet Key
