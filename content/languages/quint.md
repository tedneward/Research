title=Quint
tags=language, logic, specification, distribution
summary=A modern specification language that is a particularly good fit for distributed systems.
~~~~~~

[Website](https://quint-lang.org/) | [Source](https://github.com/informalsystems/quint)

Example: A bank (with a bug):
```
module bank {
  /// A state variable to store the balance of each account
  var balances: str -> int

  pure val ADDRESSES = Set("alice", "bob", "charlie")

  action deposit(account, amount) = {
    // Increment balance of account by amount
    balances' = balances.setBy(account, curr => curr + amount)
  }

  action withdraw(account, amount) = {
    // Decrement balance of account by amount
    balances' = balances.setBy(account, curr => curr - amount)
  }

  action init = {
    // At the initial state, all balances are zero
    balances' = ADDRESSES.mapBy(_ => 0)
  }

  action step = {
    // Non-deterministically pick an address and an amount
    nondet account = ADDRESSES.oneOf()
    nondet amount = 1.to(100).oneOf()
    // Non-deterministically choose to either deposit or withdraw
    any {
      deposit(account, amount),
      withdraw(account, amount),
    }
  }

  /// An invariant stating that all accounts should have a non-negative balance
  val no_negatives = ADDRESSES.forall(addr => balances.get(addr) >= 0)
}
```

This design lacks some important checks, and we can use the Quint CLI to find a violation to the no_negatives property, which ideally should hold:

    $ quint run bank.qnt --invariant=no_negatives

And the result is a violation where address "alice" has balance -79 in the second state.

    An example execution:

    [State 0] { balances: Map("alice" -> 0, "bob" -> 0, "charlie" -> 0) }

    [State 1] { balances: Map("alice" -> -79, "bob" -> 0, "charlie" -> 0) }

    [violation] Found an issue (45ms).
    Use --seed=0x1112de300ce425 to reproduce.
    Use --verbosity=3 to show executions.
    error: Invariant violated

Features

* A simple and familiar syntax to support engineers reading and writing specifications
* An expressive type system to ensure the domain model is coherent
* A novel effect system to ensure state updates are coherent
* IDE support via LSP giving real time feedback when writing specifications
* A REPL enabling interactive exploration of specifications
* A simulator enabling tests, trace generation, and exploration of your system
* A symbolic model checker to verify your specifications via Apalache

Motivation

Quint is inspired by TLA+ (the language) but provides an alternative surface syntax for specifying systems in TLA (the logic). The most important feature of our syntax is that it is minimal and regular, making Quint an easy target for advanced developer tooling and static analysis (see our design principles and previews of the tooling).

The syntax also aims to be familiar to engineers:

At the lexical level, it borrows many principles from C-like languages.
At the syntax level, it follows many principles found in functional languages.
At the semantic level, Quint extends the standard programming paradigm with non-determinism and temporal formulas, which allow concise specification of protocol environments such as networks, faults, and time.
Thanks to its foundation in TLA and its alignment with TLA+, Quint comes with formal semantics built-in.
