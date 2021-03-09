title=Extensible-Storage-Engine (ESE, aka "Jet")
tags=storage, relational
summary=An embedded/ISAM-based database engine, that provides rudimentary table and indexed access.
~~~~~~

[Source](https://github.com/microsoft/Extensible-Storage-Engine)

From the source README:

> ESE enables applications to store data to, and retrieve data from tables using indexed or sequential cursor navigation. It supports denormalized schemas including wide tables with numerous sparse columns, multi-valued columns, and sparse and rich indexes. ESE enables applications to enjoy a consistent data state using transacted data update and retrieval. A crash recovery mechanism is provided so that data consistency is maintained even in the event of a system crash. ESE provides ACID (Atomic Consistent Isolated Durable) transactions over data and schema by way of a write-ahead log and a snapshot isolation model.

> * A summary of features and the JET API documentation are up on [Microsoft's official documentation site](https://docs.microsoft.com/en-us/windows/win32/extensible-storage-engine/extensible-storage-engine)
> * A more extensive list of ESE database features [are documented in our Wikipedia entry](https://en.wikipedia.org/wiki/Extensible_Storage_Engine)

> The library provides many other strongly layered and, thus, reusable sub-facilities as well:

> * A synchronization and locking library
> * An STL-like data structures library
> * An OS abstraction layer
> * A Block / Cache Manager

All this is in addition to the full-blown database engine itself.

> Most people do not know that JET was an acronym for an API set, not a specific database format or engine. Just as there is no such thing as "the SQL engine", as there are many implementations of the protocol, there is no "JET engine" or "JET database". It is in the acronym, "Joint Engine Technology". And as such, there are two separate implementations of the JET API. This is the JET Blue engine implementation, see [Notes in here](https://docs.microsoft.com/en-us/windows/win32/extensible-storage-engine/extensible-storage-engine). The origin of the [colors have an an amusing source](https://en.wikipedia.org/wiki/Extensible_Storage_Engine#History) by the way. Most people think of the "JET engine" as JET Red, that shipped under Microsoft Access. This is not that "JET engine". We renamed to ESE to try to avoid this confusion, but it seems that the confusion continues to this day.

