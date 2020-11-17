title=SOA Design Patterns
tags=reading, books, patterns, distribution, architecture
summary=A collection of patterns specific to service-orientation.
~~~~~~
(by Thomas Erl (Prentice-Hall, 2009, ISBN-13 978-0-13-613516-6) )


### Foundational Inventory Patterns - Inventory Boundary
-- Enterprise Inventory (116): How can services be delivered to maximize recomposition?
-- Domain Inventory (123): How can services be delivered to maximize recomposition when enterprise-wide standardization is not possible?


### Foundational Inventory Patterns - Inventory Structure
-- Service Normalization (131): How can a service inventory avoid redundant service logic?
-- Logic Centralization (136): How can the misuse of redundant service logic be avoided?
-- Service Layers (143): How can the services in an inventory be organized based on functional commonality?


### Foundational Inventory Patterns - Inventory Standardization
-- Canonical Protocol (150): How can service be designed to avoid protocol bridging?
-- Canonical Schema (158): How can services be designed to avoid data model transformation?


### Logical Inventory Layer
-- Utility Abstraction (168): How can common non-business centric logic be separated, reused, and independently governed?
-- Entity Abstraction (175): How can agnostic business logic be separated, reused, and governed independently?
-- Process Abstraction (182): How can non-agnostic process logic be separated and governed independently?


### Inventory Centralization
-- Process Centralization (193): How can abstracted business process logic be centrally governed?
-- Schema Centralization (200): How can service contracts be designed to avoid redundant data representation?
-- Policy Centralization (207): How can policies be normalized and consistently enforced across multiple services?
-- Rules Centralization (216): How can business rules be abstracted and centrally governed?


### Inventory Implementation
-- Dual Protocols (227): How can a service inventory overcome the limitations of its canonical protocol while still remaining standardized?
-- Canonical Resources (237): How can unnecessary infrastructure resource disparity be avoided?
-- State Repository (242): How can service state data be persisted for extended periods without consuming service runtime resources?
-- Stateful Services (248): How can service state data be persisted and managed without consuming service runtime resources?
-- Service Grid (254): How can deferred service state data be scaled and kept fault-tolerant?
-- Inventory Endpoint (260): How can a service inventory be shielded from external access while still offering service capabilities to external consumers?
-- Cross-Domain Utility Layer (264): How can redundant utility logic be avoided across domain service inventories?


### Inventory Governance
-- Canonical Expression (275): How can service contracts be consistently understood and interpreted?
-- Metadata Centralization (280): How can service metadata be centrally published and governed?
-- Canonical Versioning (286): How can service contracts within the same service inventory be versioned with minimal impact?


### Foundational Service Patterns -- Service Identification
-- Functional Decomposition (300): How can a large business problem be solved without having to build a standalone body of solution logic?
-- Service Encapsulation (305): How can solution logic be made available as a resource of the enterprise?


### Foundational Service Patterns -- Service Definition
-- Agnostic Context (312): How can multi-purpose service logic be positioned as an effective enterprise resource?
-- Non-Agnostic Context (319): How can single-purpose service logic be positioned as an effective enterprise resource?
-- Agnostic Capability (324): How can multi-purpose service logic be made effectively consumable and composable?


### Service Implementation Patterns
-- Service Façade (333): How can a service accommodate changes to its contract or implementation while allowing the core service logic to evolve independently?
-- Redundant Implementation (345): How can the reliability and availability of a service be increased?
-- Service Data Replication (350): How can service autonomy be preserved when services require access to shared data sources?
-- Partial State Deferral (356): How can services be designed to optimize resource consumption while still remaining stateful?
-- Partial Validation (362): How can unnecessary data validation be avoided?
-- UI Mediator (366)


### Service Security Patterns
-- Exception Shielding (376): How can a service prevent the disclosure of information about its internal implementation when an exception occurs?
-- Message Screening (381): How can a service be protected from malformed or malicious input?
-- Trusted Subsystem (387): How can a consumer be prevented from circumventing a service and directly accessing its resources?
-- Service Perimeter Guard (394): How can services that run in a private network be made available to external consumers without exposing internal resources?


### Service Contract Design Patterns
-- Decoupled Contract (401): How can a service express its capabilities independently of its implementation?
-- Contract Centralization (409): How can direct consumer-to-implementation coupling be avoided?
-- Contract Denormalization (414): How can a service contract facilitate consumer programs with differing data exchange requirements?
-- Concurrent Contracts (421): How can a service facilitate multi-consumer coupling requirements and abstraction concerns at the same time?
-- Validation Abstraction (429): How can service contracts be designed to more easily adapt to validation logic changes?


### Legacy Encapsulation Patterns
-- Legacy Wrapper (441): How can wrapper services with non-standard contracts be prevented from spreading indirect consumer-to-implementation coupling?
-- Multi-Channel Endpoint (451): How can legacy logic fragmented and duplicated for different delivery channels be centrally consolidated?
-- File Gateway (457): How can service logic interact with legacy systems that can only share information by exchanging files?


### Service Governance Patterns
-- Compatible Change (465): How can a service contract be modified without impacting consumers?
-- Version Identification (472): How can consumers be made aware of service contract version information?
-- Termination Notification (478): How can the scheduled expiry of a service contract be communicated to consumer programs?
-- Service Refactoring (484): How can a service be evolved without impacting existing consumers?
-- Service Decomposition (489): How can the granularity of a service be increased subsequent to its implementation?
-- Proxy Capability (497): How can a service subject to decomposition continue to support consumers affected by the decomposition?
-- Decomposed Capability (504): How can a service be designed to minimize the chances of capability logic deconstruction?
-- Distributed Capability (510): How can a service preserve its functional context while also fulfilling special capability processing requirements?


### Capability Composition Patterns
-- Capability Composition (521): How can a service capability solve a problem that requires logic outside of the service boundary?
-- Capability Recomposition (526): How can the same capability be used to help solve multiple problems?


### Service Messaging Patterns
-- Service Messaging (533): How can services interoperate without forming persistent, tightly coupled connections?
-- Messaging Metadata (538): How can services be designed to process activity-specific data at runtime?
-- Service Agent (543): How can event-driven logic be separated and governed independently?
-- Intermediate Routing (549): How can dynamic runtime factors affect the path of a message?
-- State Messaging (557): How can a service remain stateless while participating in stateful interactions? 
-- Service Callback (566): How can a service communicate asynchronously with its consumers?
-- Service Instance Routing (574): How can consumers contact and interact with service instances without the need for proprietary processing logic?
-- Async Queuing (582): How can a service and its consumers accommodate isolated failures and avoid unnecessarily locking resources?
-- Reliable Messaging (592): How can services communicate reliably when implemented in an unreliable environment?
-- Event-Driven Messaging (599): How can service consumers be automatically notified of runtime service events?


### Composition Implementation Patterns
-- Agnostic Sub-Controller (607): How can agnostic, cross-entity composition logic be separated, reused and governed independently?
-- Composition Autonomy (616): How can compositions be implemented to minimize loss of autonomy?
-- Atomic Service Transaction (623): How can a transaction with rollback capability be propagated across messaging-based services?
-- Compensating Service Transaction (631): How can composition runtime exceptions be consistently accommodated without requiring services to lock resources?


### Service Interaction Security Patterns
-- Data Confidentiality (641): How can data within a message be protected so that it is not disclosed to unintended recipients while in transit?
-- Data Origin Authentication (649): How can a service verify that a message originates from a known sender and that the message has not been tampered with in transit?
-- Direct Authentication (656): How can a service verify the credentials provided by a consumer?
-- Brokered Authentication (661): How can a service efficiently verify consumer credentials if the consumer and service do not trust each other or if the consumer requires access to multiple services?


### Transformation Patterns
-- Data Model Transformation (671): How can service interoperate when using different data models for the same type of data?
-- Data Format Transformation (681): How can services interact with programs that communicate with different data formats?
-- Protocol Bridging (687): How can a service exchange data with consumers that use different communication protocols?

