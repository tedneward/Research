title=Reflow
tags=language, distribution, storage
summary=A language and runtime for distributed, incremental data processing in the cloud.
~~~~~~

[Source](https://github.com/grailbio/reflow)

> Reflow is a system for incremental data processing in the cloud. Reflow enables scientists and engineers to compose existing tools (packaged in Docker images) using ordinary programming constructs. Reflow then evaluates these programs in a cloud environment, transparently parallelizing work and memoizing results. Reflow was created at GRAIL to manage our NGS (next generation sequencing) bioinformatics workloads on AWS, but has also been used for many other applications, including model training and ad-hoc data analyses.

> Reflow comprises: a functional, lazy, type-safe domain specific language for writing workflow programs; a runtime for evaluating Reflow programs incrementally, coordinating cluster execution, and transparent memoization; a cluster scheduler to dynamically provision and tear down resources from a cloud provider (AWS currently supported).

> Reflow thus allows scientists and engineers to write straightforward programs and then have them transparently executed in a cloud environment. Programs are automatically parallelized and distributed across multiple machines, and redundant computations (even across runs and users) are eliminated by its memoization cache. Reflow evaluates its programs incrementally: whenever the input data or program changes, only those outputs that depend on the changed data or code are recomputed.

