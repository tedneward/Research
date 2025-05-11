title=Time-series storage model
tags=storage, model, temporal
summary=Thoughts and links on time-series models.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Time_series_database)

"A time series database is a specialized database that efficiently stores and retrieves time-stamped data. Each time series is stored individually as an optimized list of values, enabling fast data retrieval and cost-effective storage." --[Honeycomb](https://www.honeycomb.io/blog/time-series-database)

"Time series databases are specialized databases designed to manage data that is organized and indexed by time. Unlike traditional databases, which are optimized for general-purpose data storage, TSDBs focus on efficiently storing, querying, and analyzing sequences of time-stamped data points." -- [Datacamp](https://www.datacamp.com/blog/time-series-database)

***Characteristics of Time Series Databases***: There are a few things that TSDBs do differently than traditional databases.

**Optimized for time-stamped data.** At their core, TSDBs are built to handle data with timestamps as a fundamental attribute. Every data point in a TSDB includes a timestamp, which serves as its primary index. This allows these databases to efficiently store and retrieve time-ordered sequences and provide quick access to historical trends or recent events. Most TSDBs use time-based partitioning, meaning the data is stored in partitions based on time intervals (e.g., hourly, daily). This enables efficient pruning, where queries ignore irrelevant partitions altogether.  They can also implement time buckets, grouping data into predefined time windows (e.g., 1 minute, 1 hour) for faster aggregations.

**High ingestion rates.** Time series data is often generated at a rapid pace—think of IoT devices sending thousands of data points per second or a server monitoring tool capturing system metrics in real time. TSDBs are optimized for these high write rates and can ingest vast amounts of data without slowing down or losing information. This is usually achieved using append-only data storage models and in-memory buffers to prevent locks or transactional bottlenecks.

**Efficient queries for time ranges.** Analyzing time series data often involves querying specific time intervals or windows, such as “last 24 hours” or “this year compared to last year.” TSDBs are built with this in mind, offering specialized query capabilities that allow users to quickly retrieve data over defined time ranges. They also support aggregations like averages, sums, or trends to offer valuable analytics without complex query logic.

The query optimization techniques include:

    * Pre-aggregated data: TSDBs often pre-calculate summaries for common time intervals (e.g., hourly or daily averages).
    * Sliding window algorithms: These help efficiently compute metrics over moving time windows, such as rolling averages.

**Data compression and retention policies.** To manage the vast amount of time series data generated over time, TSDBs use advanced data compression techniques. These methods reduce storage requirements while preserving query performance. TSDBs usually include retention policies so the users can define how long data should be kept. For example, a system might retain detailed data for the past month while downsampling for older data. Downsampling is the process of reducing the granularity of data over time. For example: Raw temperature readings might be recorded every 10 seconds for the most recent 7 days; or for older data, the system might downsample to hourly averages to save space while still retaining historical trends.

Examples of advanced compression techniques include:

    * Delta encoding: Storing the difference between consecutive values instead of the full value.
    * Gorilla compression: A method used to efficiently compress floating-point time series data by storing changes in binary format.



[Facebook Gorilla (paper)](https://www.vldb.org/pvldb/vol8/p1816-teller.pdf): "Large-scale internet services aim to remain highly-available and responsive for their users even in the presence of unexpected failures. As these services have grown to support a global audience, they have scaled beyond a few systems running on hundreds of machines to thousands of individual systems running on many thousands of machines, often across multiple geo-replicated datacenters. An important requirement to operating these large scale services is to accurately monitor the health and performance of the underlying system and quickly identify and diagnose problems as they arise. Facebook uses a time series database (TSDB) to store system measuring data points and provides quick query functionalities on top. We next specify some of the constraints that we need to satisy for monitoring and operating Facebook and then describe Gorilla, our new inmemory TSDB that can store tens of millions of datapoints (e.g., CPU load, error rate, latency etc.) every second and respond queries over this data within milliseconds.

**Writes dominate.** Our primary requirement for a TSDB is that it should always be available to take writes. As we have hundreds of systems exposing multiple data items, the write rate might easily exceed tens of millions of data points each second. In constrast, the read rate is usually a couple orders of magnitude lower as it is primarily from automated systems watching ’important’ time series, data visualization systems presenting dashboards for human consumption, or from human operators wishing to diagnose an observed problem.

**State transitions.** We wish to identify issues that emerge from a new software release, an unexpected side effect of a configuration change, a network cut and other issues that result in a significant state transition. Thus, we wish for our TSDB to support fine-grained aggregations over short-time windows. The ability to display state transitions within tens of seconds is particularly prized as it allows automation to quickly remediate problems before they become wide spread.

**High availability.** Even if a network partition or other failure leads to disconnection between different datacenters, systems operating within any given datacenter ought to be able to write data to local TSDB machines and be able to retrieve this data on demand.

**Fault tolerance.** We wish to replicate all writes to multiple regions so we can survive the loss of any given datacenter or geographic region due to a disaster.

**Lack of ACID.** These systems do not store any user data so traditional ACID guarantees are not a core requirement for TSDBs. However, a high percentage of writes must succeed at all times, even in the face of disasters that might render entire datacenters unreachable. Additionally, recent data points are of higher value than older points given the intuition that knowing if a particular system or service is broken right now is more valuable to an operations engineer than knowing if it was broken an hour ago. 

## Implementations

* Facebook Gorilla
* [OpenTSDB](https://opentsdb.net/)
* [Whisper (Graphite)](https://github.com/graphite-project/whisper): a file-based time-series database format for Graphite. ([Docs](http://graphite.readthedocs.org/)) | [Graphite website](https://graphiteapp.org/)
* [InfluxDB](../influxdb/)
* [TimescaleDB](../timescaledb)
* [Cassandra](../cassandra)
* [Amazon Timestream]()