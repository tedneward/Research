title=Event Processing Language (EPL)
tags=language, library, jvm, clr, platform, vm
summary=A language, compiler, and runtime for complex event processing (CEP) and streaming analytics.
~~~~~~

Complex event processing (CEP) delivers high-speed processing of many events across all the layers of an organization, identifying the most meaningful events within the event cloud, analyzing their impact, and taking subsequent action in real time (source:Wikipedia).

Esper offers a Domain Specific Language (DSL) for processing events. The Event Processing Language (EPL) is a declarative language for dealing with high frequency time-based event data. EPL is compliant to the SQL-92 standard and extended for analyzing series of events and in respect to time.

Some typical examples of applications are:

* Business process management and automation (process monitoring, BAM, reporting exceptions, operational intelligence)
* Finance (algorithmic trading, fraud detection, risk management)
* Network and application monitoring (intrusion detection, SLA monitoring)
* Sensor network applications (RFID reading, scheduling and control of fabrication lines, air traffic)

What these applications have in common is the requirement to process events (or messages) in real-time or near real-time. This is sometimes referred to as complex event processing (CEP) and event series analysis. Key considerations for these types of applications are throughput, latency and the complexity of the logic required.

* High throughput - applications that process large volumes of messages (between 1,000 to 100k messages per second)

* Low latency - applications that react in real-time to conditions that occur (from a few milliseconds to a few seconds)

* Complex computations - applications that detect patterns among events (event correlation), filter events, aggregate time or length windows of events, join event series, trigger based on absence of events etc.

The EPL compiler and runtime were designed to make it easier to build and extend CEP applications.

[Website](http://www.espertech.com/esper) | Github: [Esper](https://github.com/espertechinc/esper) (JVM), [NEsper](https://github.com/espertechinc/nesper) (CLR)



