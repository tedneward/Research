title=LMAX Disruptor
tags=library, jvm, concurrency
summary=A framework which has "mechanical sympathy" for the hardware it's running on, and that's lock-free.
~~~~~~

"To understand the problem the Disruptor is trying to solve, and to get a feel for why this concurrency framework is so fast, read the [Technical Paper](http://lmax-exchange.github.com/disruptor/files/Disruptor-1.0.pdf). It also contains detailed performance results.

"[LMAX](http://www.lmax.com/) aims to be the fastest trading platform in the world. Clearly, in order to achieve this we needed to do something special to achieve very low-latency and high-throughput with our Java platform. Performance testing showed that using queues to pass data between stages of the system was introducing latency, so we focused on optimising this area.

"The Disruptor is the result of our research and testing. We found that cache misses at the CPU-level, and locks requiring kernel arbitration are both extremely costly, so we created a framework which has "mechanical sympathy" for the hardware it's running on, and that's lock-free.

"This is not a specialist solution, it's not designed to work only for a financial application. The Disruptor is a general-purpose mechanism for solving a difficult problem in concurrent programming."

[Website](http://lmax-exchange.github.io/disruptor/)