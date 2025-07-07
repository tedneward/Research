title=Double-entry storage model
tags=storage, double-entry
subject=A viable storage model for running entries
~~~~~~

[Double-entry ledgers are a missing primitive in software](https://pgrs.net/2025/06/17/double-entry-ledgers-missing-primitive-in-modern-software/): "A double-entry ledger at its core is a few simple concepts put together:

* The current amount or balance of a thing
* A historical record of how the amount got to that amount (immutable, append only, etc)
* Where that amount came from at each step

"The fact that every transfer only moves amounts, never creates them from scratch, is a built-in error check.2 And the historical record serves as an audit log."

## Implementations

* [pgledger](https://github.com/pgr0ss/pgledger): pure PostgreSQL
* [ledger](/tools/ledger)
