title=Patterns of Enterprise Application Architecture
tags=reading, books, patterns, distribution
summary=Martin Fowler's enterprise systems text.
~~~~~~
(by Martin Fowler (Addison-Wesley, 2003, ISBN 0-321-12742-0) )


### Domain Logic
-- Transaction Script (110): Organizes business logic by procedures where each procedure handles a single request from the presentation
-- Domain Model (116): An object model of the domain that incorporates both behavior and data
-- Table Module (125): A single instance that handles the business logic for all rows in a database table or view
-- Service Layer (133): Defines an application's boundary with a layer of services that establishes a set of available operations and coordinates the application's response in each operation


### Data Source Architectural
-- Table Data Gateway (144): An object that acts as a Gateway (466) to a database table. One instance handles all the rows in that table
-- Row Data Gateway (152): An object that acts as a Gateway (466) to a single record in a data source. There is one instance per row
-- Active Record (160): An object that wraps a row in a database table or view, encapsulates the database access, and adds domain logic on that data
-- Data Mapper (165): A layer of Mappers (473) that moves data between objects and a database while keeping them independent of each other and the mapper itself


### Object-Relational Behavioral
-- Unit of Work (184): Maintains a list of objects affected by a business transaction and coordinates the writing out of changes and the resolution of concurrency problems
-- Identity Map (195): Ensures that each object gets loaded only once by keeping every loaded object in a map. Looks up objects using the map when referring to them
-- Lazy Load (200): An object that doesn't contain all of the data you need but knows how to get it


### Object-Relational Structural
-- Identity Field (216): Saves a database ID field in an object to maintain identity between an in-memory object and a database row
-- Foreign Key Mapping (236): Maps an association between objects to a foreign key reference between tables
-- Association Table Mapping (248): Saves an association as a table with foreign keys to the tables that are linked by the association
-- Dependent Mapping (262): Has one class perform the database mapping for a child class
-- Embedded Value (268): Maps an object into several fields of another object's table
-- Serialized LOB (272): Saves a graph of objects by serializing them into a single large object (LOB), which it stores in a database field
-- Single Table Inheritance (278): Represents an inheritance hierarchy of classes as a single table that has columns for all the fields of the various classes
-- Class Table Inheritance (285): Represents an inheritance hierarchy of classes with one table for each class
-- Concrete Table Inheritance (293): Represents an inheritance hierarchy of classes with one table per concrete class in the hierarchy
-- Inheritance Mappers (302): A structure to organize database mappers that handle inheritance hierarchies


### Object-Relational Metadata Mapping
-- Metadata Mapping (306): Holds details of object-relational mapping in metadata
-- Query Object (316): An object that represents a database query
-- Repository (322): Mediates between the domain and data mapping layers using a collection-like interface for accessing domain objects


### Web Presentation
-- Model View Controller (330): Splits user interface interaction into three distinct roles
-- Page Controller (333): An object that handles a request for a specific page or action on a Web site
-- Front Controller (344): A controller that handles all requests for a Web site
-- Template View (350): Renders information into HTML by embedding markers in an HTML page
-- Transform View (361): A view that processes domain data element by element and transforms it into HTML
-- Two Step View (365): Turns domain data into HTML in two steps: first by forming some kind of logical page, then rendering the logical page into HTML
-- Application Controller (379): A centralized point for handling screen navigation and the flow of an application


### Distribution
-- Remote Facade (388): Provides a coarse-grained facade on fine-grained objects to improve efficiency over a network
-- Data Transfer Object


### Offline Concurrency
-- Optimistic Offline Lock (416): Prevents conflicts between concurrent business transactions by detecting a conflict and rolling back the transaction
-- Pessimistic Offline Lock (426): Prevents conflicts between concurrent business transactions by allowing only one business transaction at a time to access data
-- Coarse-Grained Lock (438): Locks a set of related objects with a single lock
-- Implicit Lock (449): Allows framework or layer super type code to acquire offline locks


### Session State
-- Client Session State (456): Stores session state on the client
-- Server Session State (458): Keeps session state on a server system in a serialized form
-- Database Session State (462): Stores session data as committed data in the database

### Base
-- Gateway (466): An object that encapsulates access to an external system or resource
-- Mapper (473): An object that sets up a communication between two interdependent objects
-- Layer Supertype (475): A type that acts as the super type for all types in its layer
-- Separated Interface (476): Defines an interface in a separate package from its implementation
-- Registry (480): A well-known object that other objects can use to find common objects and services
-- Value Object (486): A small simple object, like money or a date range, whose equality isn't based on identity
-- Money (488): Represents a monetary value
-- Special Case (496): A subclass that provides special behavior for particular cases
-- Plugin (499): Links classes during configuration rather than compilation
-- Service Stub (504): Removes dependence upon problematic services during testing
-- Record Set (508): An in-memory representation of tabular data
