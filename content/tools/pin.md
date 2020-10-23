title=Pin
tags=tool, library
summary=A Dynamic Binary Instrumentation Tool.
~~~~~~

[Website](http://www.pintool.org/) | [Wikipedia](https://en.wikipedia.org/wiki/Pin_(computer_program))

### Readings

- Analyzing Parallel Programs With Pin
	- IEEE Computer 43(3) 2010
	- Moshe Bach, Mark Charney, Robert Cohn, Elena Demikhovsky, Tevi Devor, Kim Hazelwood, Aamer Jaleel, Chi-Keung Luk, Gail Lyons, Harish Patil, Ady Tal
	- https://doi.org/10.1109/mc.2010.60
- Pin: Building Customized Program Analysis Tools with Dynamic Instrumentation
	- PLDI 2005
	- Chi-Keung Luk, Robert Cohn, Robert Muth, Harish Patil, Artur Klauser, Geoff Lowney, Steven Wallace, Vijay Janapa Reddi, Kim Hazelwood
	- https://doi.org/10.1145/1065010.1065034
- Deterministic PinPoints: Representative and Repeatable Simulation Region Selection with PinPlay and Sniper
	- HPCA 2013 Tutorial
	- Harish Patil, Trevor E. Carlson
	- https://snipersim.org/w/Tutorial:HPCA_2013_PinPoints
- Dynamic Binary Analysis with Intel Pin
	- https://blog.netspi.com/dynamic-binary-analysis-intel-pin/
	- https://github.com/NetSPI/Pin
- Pinballs: Portable and Shareable User-level Checkpoints for Reproducible Analysis and Simulation
	- REPRODUCE 2014: Workshop on Reproducible Research Methodologies
	- Harish Patil, Trevor E. Carlson
	- 
https://www.researchgate.net/publication/280306016_Pinballs_Portable_and_Shareable_User-level_Checkpoints_for_Reproducible_Analysis_and_Simulation_Appeared_in_REPRODUCE_2014_Workshop_on_Reproducible_Research_Methodologies
- PinPlay: a framework for deterministic replay and reproducible analysis of parallel programs
	- Code Generation and Optimization (CGO) 2010
	- Harish Patil, Cristiano Pereira, Mack Stallcup, Gregory Lueck, James Cownie
	- https://doi.org/10.1145/1772954.1772958
- PinPlay: Using PinPlay for Reproducible Analysis and Replay Debugging
	- PLDI 2015 Tutorial
	- Harish Patil, Milind Chabbi
	- https://pldi15.sigplan.org/details/pldi2015-workshops/6/PINPLAY-Using-PinPlay-for-Reproducible-Analysis-and-Replay-Debugging
	- https://sites.google.com/site/pinplaypldi2015tutotial/
- PinPoints: Pinpointing Representative Portions of Large Intel® Itanium® Programs with Dynamic Instrumentation
	- MICRO 2004
	- H. Patil, R. Cohn, M. Charney, R. Kapoor, A. Sun, A. Karunanidhi
	- https://doi.org/10.1109/MICRO.2004.28
	- https://software.intel.com/en-us/articles/pin-a-binary-instrumentation-tool-pinpoints
- PinPoints: Simulation Region Selection with PinPlay and Sniper
	- ISCA 2014 Tutorial
	- Harish Patil, Mack Stallcup
	- https://sites.google.com/site/pinpointstutorialisca14/
- Some thoughts about code-coverage measurement with Pin
	- https://doar-e.github.io/blog/2013/08/31/some-thoughts-about-code-coverage-measurement-with-pin/

### Projects

- Ablation: Augmenting Static Analysis Using Pintool
	- https://github.com/paulmehta/Ablation
	- Black Hat 2016; Paul Mehta
	- https://www.youtube.com/watch?v=wHIlNRK_HiQ
- BasicBlocks: Pin tool for printing the address of each basic block executed in a program.
	- https://github.com/chokepoint/BasicBlocks
- Pin++: A C++ template meta-programmable framework for authoring Pintools
	- https://github.com/SEDS/PinPP
	- Pin++: A Object-oriented Framework for Writing Pintools
		- Generative Programming: Concepts and Experiences (GPCE) 2014
		- James H. Hill and Dennis C. Feiock
		- https://core.ac.uk/download/pdf/46962422.pdf
- PinCTF: use Intel's Pin Tool to instrument binaries and count instructions
	- https://github.com/ChrisTheCoolHut/PinCTF
