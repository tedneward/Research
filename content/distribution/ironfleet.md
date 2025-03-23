title=Ironfleet
tags=distribution, verification
summary=Proving practical distributed systems correct.
~~~~~~

[Website](https://keikonakata.github.io/distr/2021-07-17-IronFleet.html) | [Source](https://github.com/microsoft/Ironclad/blob/main/ironfleet/)

IronFleet is a methodology for automated machine-checked verification in Dafny of the safety and liveness of distributed system implementations. It uses TLA-style state-machine refinement to reason about protocol-level concurrency, then use Floyd-Hoare style imperative verification to reason about implementation complexities.

IronFleet organizes a distributed system’s implementation and proof into 3 layers: the high-level spec layer, the distributed-protocol layer and the implementation layer.

To avoid complex reasoning about interleaved execution of low-level operations at multiple hosts, the proofs assume that every implementation step performs an atomic protocol step. Since the real implementation’s execution is not atomic, we use a reduction argument to show that a proof assuming atomicity is equally valid as a proof for the real system.

## Publications

* ["IronFleet: Proving Practical Distributed Systems Correct"](https://www.microsoft.com/en-us/research/publication/ironfleet-proving-practical-distributed-systems-correct/)
* ["IronFleet: Proving Safety and Liveness of Practical Distributed Systems"](https://www.microsoft.com/en-us/research/publication/ironfleet-proving-safety-liveness-practical-distributed-systems/)
* ["Ironclad Apps: End-to-End Security via Automated Full-System Verification"](http://research.microsoft.com/apps/pubs/default.aspx?id=230123)

