title=Quantum Programming Languages
tags=language, concept, quantum
summary=Notes and links on quantum programming and quantum programming languages.
~~~~~~

The majority of the conversations about quantum computing focus on hardware and the software side gets less attention, but it is where most people who work with quantum computers actually spend their time.

Quantum programming is the practice of writing algorithms and applications for quantum computers or quantum simulators. It draws on quantum mechanical phenomena such as superposition, entanglement, and interference – to encode and process information in ways that classical computing cannot. A quantum program specifies a sequence of gate operations applied to qubits, measurement operations, and classical post-processing logic.

The ecosystem has matured significantly and the field has settled on Python as its common language, with a range of frameworks sitting on top of it targeting different hardware platforms and use cases. Understanding what those frameworks do – and why they differ – matters for anyone building with quantum computers today.

Classical programming is deterministic – input goes in, output comes out. Quantum programming, by contrast, is probabilistic – algorithms must be designed to amplify correct answers through quantum interference while suppressing incorrect ones. 

The constraint that shapes everything else is measurement. Classical code can inspect any variable at any point. Quantum code can only extract information by measuring qubits – and measurement collapses the quantum state, destroying it. Quantum programmers cannot use print statements or step-through debuggers on quantum variables. Algorithms need to be mathematically verified before testing, with validation relying on statistical error rates rather than deterministic checks.

Resource constraints are also more severe. Classical programs run on billions of transistors. Current quantum programs must fit within 50 to a few hundred qubits on production hardware, with strict limits on circuit depth before errors accumulate. This makes quantum programming closer in spirit to embedded systems or Field-programmable gate array (FPGA) design than to standard software engineering.

The ecosystem divides into three layers.

**1\. Instruction-set languages** (OpenQASM, Quil) sit close to the hardware, providing low-level gate sequences that quantum processors can execute directly. Powerful, but requiring deep knowledge of quantum gate design.

**2\. High-level SDKs** (Qiskit, Cirq, Q#, PennyLane) provides Python-based frameworks with abstractions for circuit construction, noise modeling, and optimization. These are what most developers use.

**3\. Domain-specific languages** (Bloqade for neutral atoms) target specific hardware platforms or problem types, trading generality for specialization.

## Reading

* [Top Quantum Programming Languages and Frameworks in 2026](https://thequantuminsider.com/2026/06/19/state-of-quantum-computing-programming-languages/)

### Articles, Blogs, Essays

---

## **Quantum Programming Frameworks**

The following is a non-exhaustive selection. The landscape is broad and evolving rapidly, and the inclusion or omission of any entry should not be interpreted as a ranking or endorsement.

### **CUDA-Q ([NVIDIA](https://app.thequantuminsider.com/investor/2c6d1edb-94d8-4081-993b-6675137e3738/profile))**

[CUDA-Q](https://developer.nvidia.com/cuda-q) is [NVIDIA](https://app.thequantuminsider.com/investor/2c6d1edb-94d8-4081-993b-6675137e3738/profile)‘s QPU-agnostic platform for accelerated quantum-classical computing, [released as open-source in 2023](https://developer.nvidia.com/blog/introducing-cuda-quantum-the-platform-for-hybrid-quantum-classical-computing/). It supports both Python and C++ and integrates with [75% of publicly available QPUs](https://developer.nvidia.com/cuda-q), including IonQ, Quantinuum, and Pasqal – using MLIR/LLVM/QIR compilation with GPU-accelerated simulators.

In 2026, [Classiq integrated CUDA-Q for accelerated hybrid workflows](https://thequantuminsider.com/2026/03/18/classiq-dramatically-accelerates-hybrid-quantum-application-development-nvidia-cuda-q/), reducing circuit synthesis and execution of a 31-qubit circuit from 67 minutes to 2.5 minutes on a single [NVIDIA](https://app.thequantuminsider.com/investor/2c6d1edb-94d8-4081-993b-6675137e3738/profile) A100 GPU. [Similarly, QCentroid also combined its QuantumOps platform with CUDA-Q](https://nvidia.github.io/cuda-quantum/blogs/blog/2026/03/16/cudaq-GTC-26/), giving enterprise users access through an AI copilot layer.

### **Bloqade ([QuEra](https://app.thequantuminsider.com/company/abf6ba1e-c207-4c4e-b155-84566e251c9b/profile))**

[Bloqade is QuEra’s](https://www.quera.com/bloqade) specialized SDK for neutral-atom quantum computing, supporting both digital and analog quantum computing paradigms. Bloqade-analog handles analog/Hamiltonian simulation on neutral atoms; Bloqade handles gate-based digital circuit execution. Version 0.26+ provides fine-grained control over atom positioning, mid-circuit measurements, and real-time feedback. 

### **Stim ([Google](https://app.thequantuminsider.com/enterprise-user/ea289fa0-8ef4-4938-899a-336f0147b609/profile))**

[Stim](https://github.com/quantumlib/Stim) is [Google](https://app.thequantuminsider.com/enterprise-user/ea289fa0-8ef4-4938-899a-336f0147b609/profile)‘s specialized library for quantum error correction simulation and stabilizer codes. It can [analyze a distance 100 surface code circuit in 15 seconds](https://quantum-journal.org/papers/q-2021-07-06-497/) and then sample shots at kilohertz rates, making it the primary tool for researchers designing fault-tolerant quantum computers. Not a general programming framework – purpose-built for error correction work. 

### **PyQuil ([Rigetti](https://app.thequantuminsider.com/company/e5852c16-2e61-471d-ba80-263682d76b9b/profile))**

[PyQuil](https://pyquil-docs.rigetti.com/en/stable/) is [Rigetti](https://app.thequantuminsider.com/company/e5852c16-2e61-471d-ba80-263682d76b9b/profile)‘s Python framework for superconducting quantum processors, built around the Quil language and quantum-classical virtual machines. [Rigetti’s](https://thequantuminsider.com/2024/12/23/rigetti-computing-reports-84-qubit-ankaa-3-system-achieves-99-5-median-two-qubit-gate-fidelity-milestone/) focus on hybrid algorithms makes PyQuil relevant for applications requiring tight integration between classical and quantum processing.

### **PyTKET ([Quantinuum](https://app.thequantuminsider.com/company/e6aaa781-dd00-4313-a8d6-0003c5fd5330/profile))**

[PyTKET](https://docs.quantinuum.com/tket/api-docs/index.html) is [Quantinuum’s](https://thequantuminsider.com/2025/09/26/quantinuum-achieves-record-quantum-volume/) compiler framework for quantum circuit optimization and hardware compilation across IBM, [Google](https://app.thequantuminsider.com/enterprise-user/ea289fa0-8ef4-4938-899a-336f0147b609/profile), IonQ, and other backends. it works as a post-compilation optimization layer that improves fidelity on noisy hardware.

### **QURI SDK ([QunaSys](https://app.thequantuminsider.com/company/17c76f24-2b29-4f16-bb63-4690e5e79560/profile))**

[QURI SDK](https://quri-sdk.qunasys.com/) is an open-source quantum software development kit from [QunaSys](https://thequantuminsider.com/2024/11/02/qunasys-expands-quantum-reach-with-partnership-sdk-release-and-11-1m-series-b2-funding-round/), a Japanese quantum software company focused on algorithm development for chemistry and materials science. The SDK consists of three components: QURI Parts, a hardware-agnostic building block library for constructing quantum algorithms; QURI VM, a tool for evaluating and simulating algorithm performance across early fault-tolerant quantum computing (EFTQC) architectures including circuit transpilation and resource estimation; and QURI Algo, a library for platform-independent algorithm development prepackaged with early FTQC algorithms.

The SDK is designed for use by HPC centers and research institutions, and sits at a different point in the stack from general-purpose frameworks – it supports NISQ, early FTQC, and full FTQC development, with particular emphasis on teams working toward fault-tolerant quantum computing.

