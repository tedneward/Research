title=Event-Driven/Event-Sourcing Architecture
tags=architecture, events
summary=An approach to building systems via events.
~~~~~~

## Tools

- [Miro Event Modeling Toolkit](https://www.eventmodelers.de/): Build event-driven systems with visual Event Modeling directly in Miro. Design, collaborate, and generate code from your event models.

## Reading

### Articles/Blogs/Essays

- [Compilers Aren't Just for Programming Languages](https://www.architecture-weekly.com/p/compilation-isnt-just-for-programming)
- [Exploring CQRS and Event Sourcing](https://docs.microsoft.com/en-us/previous-versions/msp-n-p/jj554200(v=pandp.10)) - Dominic Betts, Julián Domínguez, Grigori Melnik, Mani Subramanian, Fernando Simonazzi ([EPUB, PDF](http://www.microsoft.com/en-us/download/details.aspx?id=34774) - [code samples](http://go.microsoft.com/fwlink/p/?linkid=258571))
- Six Event-Driven Archicture Patterns: [Part 1](https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-1-93758b253f47) | [Part 2](https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-2-455cc73b22e1)
- ["The Case for Event-Driven Architecture with Mediator Topology"](https://www.infoq.com/articles/eda-mediator/)
- [The What, Why, and How of Event-Driven Programming](https://quix.io/blog/what-why-how-of-event-driven-programming)
- [What do commands do in Event Sourcing](https://ismaelcelis.com/posts/what-do-commands-do-in-event-sourcing/)
- [Handling events coming in an unknown order](https://event-driven.io/en/strict_ordering_in_event_handling/)

"The Laws of Event Sourcing" - [Real World Event Sourcing](https://pragprog.com/titles/khpes/real-world-event-sourcing/)

- All Events are Immutable and Past Tense
- Applying a Failure Event Must Always Return the Previous State
- All Data Required for a Project Must Be on the Events
- Work Is a Side Effect
- All Projects must Stem from Events
- Never Manage More than One Flow per Process Manager
- Process Managers Must Not Read from Projections
- Event Schemas Are Immutable
- Different Projectors Cannot Share Projections
- Never Test Internal State

Rahul Krishnan's blog:

* [Overview](https://solutionsarchitecture.medium.com/event-driven-architecture-an-overview-00f5967385e6)
* [Deep Dive into Event Sourcing and CEP](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-deep-dive-into-event-sourcing-and-cep-bae090b4f19b)
* [Balancing Throughput, Latency, and Reliability](https://solutionsarchitecture.medium.com/event-driven-performance-optimization-balancing-throughput-latency-and-reliability-22e33e372243)
* [Schema Evolution, Deduplication, Ordering and Scalability](https://solutionsarchitecture.medium.com/mastering-event-driven-architectures-schema-evolution-deduplication-ordering-and-scalability-ed8d3596928e
* [Strategies for Error Management and Data Reliability](https://solutionsarchitecture.medium.com/event-driven-architecture-strategies-for-error-management-and-data-reliability-c76a5be2c0b6)
* [Observability: Tools and Techniques](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-observability-tools-and-techniques-2ba6e45ac82f)
* [Security Considerations](https://solutionsarchitecture.medium.com/mastering-event-driven-architectures-security-considerations-in-event-driven-architectures-7b2023a9b2e4)
* [Implementation in Modern Cloud Environments](https://solutionsarchitecture.medium.com/mastering-event-driven-architectures-implementation-in-modern-cloud-environments-e8c194e6dba7)
* [Common Anti-Patterns](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-common-anti-patterns-in-eda-63b3ac91c3a3)
* [Comparing and Contrasting Choreography, Orchestration, and Event Processing](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-10-comparing-and-contrasting-choreography-20b5ae6607df)
* [EDA vs Serverless](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-12-event-driven-architecture-vs-eda60dd7e361)
* [Theoretical Design--Event-Driven Architecture for a Financial Trading Platform](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-13-v-theoretical-design-event-driven-architecture-6902bd364fd2)
* [Introducing the Saga Pattern](https://solutionsarchitecture.medium.com/mastering-event-driven-architecture-part-14-introducing-the-saga-pattern-ef68a8712088)

Oskar Dudycz's blog:

- [How Postgres sequences issues can impact your messaging guarantees](https://event-driven.io/en/ordering_in_postgres_outbox/): Since Postgres BIGSERIAL column types can't ensure they're always bumped in exact transactional order (one transaction may run slower than others), it creates problems in event-driven models, where order is key.
- [On rebuilding read models, Dead-Letter Queues and Why Letting Go is Sometimes the Answer](https://event-driven.io/en/rebuilding_read_models_skipping_events/)
- [Rebuilding Event-Driven Read Models in a safe and resilient way](https://event-driven.io/en/rebuilding_event_driven_read_models/)
- [Multi-tenancy and dynamic messaging workload distribution](https://event-driven.io/en/multitenant_and_dynamic_message_handling/)
- [Checkpointing the message processing](https://event-driven.io/en/checkpointing_message_processing/)
- [Consumers, projectors, reactors and all that messaging jazz in Emmett](https://event-driven.io/en/consumers_processors_in_emmett/)
- [Requeuing Roulette in Event-Driven Architecture and Messaging](https://event-driven.io/en/requeuing_roulette_in_messaging/)
- [Handling Events Coming in an Unknown Order](https://event-driven.io/en/strict_ordering_in_event_handling/)
- [Dealing with Race Conditions in Event-Driven Architecture with Read Models](https://event-driven.io/en/dealing_with_race_conditions_in_eda_using_read_models/)
- [How to build MongoDB Event Store](https://event-driven.io/en/mongodb_event_store/)
- [Idempotent Command Handling](https://event-driven.io/en/idempotent_command_handling/)
- [Using event metadata in event-driven projections](https://event-driven.io/en/projections_and_event_metadata/)
- [Writing and testing event-driven projections with Emmett, Pongo and PostgreSQL](https://event-driven.io/en/emmett_projections_testing/)
- [Combining the To-Do List and the Passage Of Time patterns for resilient business workflows](https://event-driven.io/en/to_do_list_and_passage_of_time_patterns_combined/)
- [How to build an in-memory Message Bus in TypeScript](https://event-driven.io/en/inmemory_message_bus_in_typescript/)
- [Event modelling anti-patterns explained](https://event-driven.io/en/anti-patterns/)
- [I'm no longer Marten maintainer](https://event-driven.io/en/i_am_no_longer_marten_maintainer/)
- [Testing Event Sourcing, Emmett edition](https://event-driven.io/en/testing_event_sourcing_emmett_edition/)
- [Join my Event Sourcing workshops at Techorama and DDD Europe and speed up your journey!](https://event-driven.io/en/speed_up_your_event_sourcing_journey_with_workshops/)
- [Should you always keep streams short in Event Sourcing?](https://event-driven.io/en/should_you_always_keep_streams_short/)
- [Implementing Closing the Books pattern](https://event-driven.io/en/closing_the_books_in_practice/)
- [Announcing Emmett! Take your event-driven applications back to the future!](https://event-driven.io/en/introducing_emmett/)
- [Production-Grade Event Sourcing Workshop - Modelling, DevOps, Process](https://event-driven.io/en/production_grade_event_sourcing/)
- [How TypeScript can help in modelling business workflows](https://event-driven.io/en/how_to_have_fun_with_typescript_and_workflow/)
- [Stream ids, event types prefixes and other event data you might not want to slice off](https://event-driven.io/en/on_putting_stream_id_in_event_data/)
- [Should you record multiple events from business logic?](https://event-driven.io/en/one_or_more_event_that_is_the_question/)
- [Hitchhiker's Guide To Moving From Relational Data To Events](https://event-driven.io/en/the_end_is_near_for_crud_data/)
- [Anti-patterns in event modelling - Clickbait event](https://event-driven.io/en/clickbait_event/)
- [Oops I did it again, or how to update past data in Event Sourcing](https://event-driven.io/en/how_to_update_past_data_in_event_sourcing/)
- [My journey from Aggregates to Functional Composition](https://event-driven.io/en/my_journey_from_aggregates/)
- [Event transformations, a tool to keep our processes loosely coupled](https://event-driven.io/en/event_transformations_and_loosely_coupling/)
- [Prototyping, an underestimated design skill](https://event-driven.io/en/prototype_underestimated_design_skill/)
- [Could you help me by filling a short survey about an online course?](https://event-driven.io/en/online_course_survey/)
- [Recap of Event Sourcing Live 2023](https://event-driven.io/en/event_sourcing_live_2023/)
- [The Holy Grail syndrome](https://event-driven.io/en/holy_graal_syndrome/)
- [Anti-patterns in event modelling - I'll just add one more field](https://event-driven.io/en/i_will_just_add_one_more_field/)
- [Is the audit log a proper architecture driver for Event Sourcing?](https://event-driven.io/en/audit_log_event_sourcing/)
- [General strategy for migrating relational data to document-based](https://event-driven.io/en/strategy_on_migrating_relational_data_to_document_based/)
- [How to test event-driven projections](https://event-driven.io/en/testing_event_driven_projections/)
- [Publishing read model changes from Marten](https://event-driven.io/en/publishing_read_model_changes_from_marten/)
- [Event stores are key-value databases, and why that matters](https://event-driven.io/en/event_stores_are_key_value_stores/)
- [Ensuring uniqueness in Marten event store](https://event-driven.io/en/unique_constraint_in_marten_event_store/)
- [Projecting Marten events to Elasticsearch](https://event-driven.io/en/projecting_from_marten_to_elasticsearch/)
- [How to handle multiple commands in the same transaction](https://event-driven.io/en/simple_transactional_command_orchestration/)
- [Set up OpenTelemetry with Event Sourcing and Marten](https://event-driven.io/en/set_up_opentelemetry_wtih_event_sourcing_and_marten/)
- [Event-driven projections in Marten explained](https://event-driven.io/en/projections_in_marten_explained/)
- [Guide to Projections and Read Models in Event-Driven Architecture](https://event-driven.io/en/projections_and_read_models_in_event_driven_architecture/)
- [How to validate business logic](https://event-driven.io/en/how_to_validate_business_logic/)
- [Let's build event store in one hour!](https://event-driven.io/en/lets_build_event_store_in_one_hour/)
- [Explicit events serialisation in Event Sourcing](https://event-driven.io/en/explicit_events_serialisation_in_event_sourcing/)
- [The magic is that there is no magic. Or how to understand design patterns.](https://event-driven.io/en/the_magic_is_that_there_is_no_magic/)
- [Share your story on Event Sourcing Live 2023](https://event-driven.io/en/share_your_story_on_event_sourcing_live/)
- [Mapping event type by convention](https://event-driven.io/en/how_to_map_event_type_by_convention/)
- [Never Lose Data Again - Event Sourcing to the Rescue!](https://event-driven.io/en/never_lose_data_with_event_sourcing/)
- [Testing business logic in Event Sourcing, and beyond!](https://event-driven.io/en/testing_event_sourcing/)
- [Event Versioning with Marten](https://event-driven.io/en/event_versioning_with_marten/)
- [Slim your aggregates with Event Sourcing!](https://event-driven.io/en/slim_your_entities_with_event_sourcing/)
- [Straightforward Event Sourcing with TypeScript and NodeJS](https://event-driven.io/en/type_script_node_Js_event_sourcing/)
- [Union types in C#](https://event-driven.io/en/union_types_in_csharp/)
- [How to effectively compose your business logic](https://event-driven.io/en/how_to_effectively_compose_your_business_logic/)
- [Event-driven distributed processes by example](https://event-driven.io/en/event_driven_distributed_processes_by_example/)
- [Should you throw an exception when rebuilding the state from events?](https://event-driven.io/en/should_you_throw_exception_when_rebuilding_state_from_events/)
- [Persistent vs catch-up, EventStoreDB subscriptions in action](https://event-driven.io/en/persistent_vs_catch_up_eventstoredb_subscriptions_in_action/)
- [How to build a simple event pipeline](https://event-driven.io/en/how_to_build_simple_event_pipeline/)
- [Are Temporal Tables an alternative to Event Sourcing?](https://event-driven.io/en/temporal_tables_and_event_sourcing/)
- [Introduction to Event Sourcing - Self Paced Kit](https://event-driven.io/en/introduction_to_event_sourcing/)
- [How to ensure uniqueness in Event Sourcing](https://event-driven.io/en/uniqueness-in-event-sourcing/)
- [A simple trick for idempotency handling in the Elastic Search read model](https://event-driven.io/en/simple_trick_for_idempotency_handling_in_elastic_search_readm_model/)
- [Using strongly-typed identifiers with Marten](https://event-driven.io/en/using_strongly_typed_ids_with_marten/)
- [Integrating Marten with other systems](https://event-driven.io/en/integrating_Marten/)
- [How to do snapshots in Marten?](https://event-driven.io/en/how_to_do_snapshots_in_Marten/)
- [Simple patterns for events schema versioning](https://event-driven.io/en/simple_events_versioning_patterns/)
- [Let's talk about positions in event stores](https://event-driven.io/en/lets_talk_about_positions_in_event_stores/)
- [How to build event-driven projections with Entity Framework](https://event-driven.io/en/how_to_do_events_projections_with_entity_framework/)
- [Anti-patterns in event modelling - State Obsession](https://event-driven.io/en/state-obsession/)
- [Anti-patterns in event modelling - Property Sourcing](https://event-driven.io/en/property-sourcing/)
- [How to get the current entity state from events?](https://event-driven.io/en/how_to_get_the_current_entity_state_in_event_sourcing/)
- [When not to use Event Sourcing?](https://event-driven.io/en/when_not_to_use_event_sourcing/)
- [How to scale projections in the event-driven systems?](https://event-driven.io/en/how_to_scale_projections_in_the_event_driven_systems/)
- [How using events helps in a teams' autonomy](https://event-driven.io/en/how_using_events_help_in_teams_autonomy/)
- [Events should be as small as possible, right?](https://event-driven.io/en/events_should_be_as_small_as_possible/)
- [How to create projections of events for nested object structures?](https://event-driven.io/en/how_to_create_projections_of_events_for_nested_object_structures/)
- [What's the difference between a command and an event?](https://event-driven.io/en/whats_the_difference_between_event_and_command/)
- [What if I told you that Relational Databases are in fact Event Stores?](https://event-driven.io/en/relational_databases_are_event_stores/)
- [What texting your Ex has to do with Event-Driven Design?](https://event-driven.io/en/what_texting_ex_has_to_do_with_event_driven_design/)
- [How to (not) do the events versioning?](https://event-driven.io/en/how_to_do_event_versioning/)
- [Why a bank account is not the best example of Event Sourcing?](https://event-driven.io/en/bank_account_event_sourcing/)
- [Revolution now!](https://event-driven.io/en/revolution_now/)

---

Complex Event Processing (CEP)

