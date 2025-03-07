title=Quint
tags=language, logic, specification
summary=A modern specification language that is a particularly good fit for distributed systems.
~~~~~~

[Website](https://quint-lang.org/) | [Source](https://github.com/informalsystems/quint)

Example: A bank (with a bug):
```
/// A state variable to store the balance of each account
var balances: str -> int
 
pure val ADDRESSES = Set("alice", "bob", "charlie")
 
action withdraw(account, amount) = {
  // Decrement balance of account by amount
  // Whoops, we forgot to check for enough balance
  balances' = balances.setBy(account, curr => curr - amount)
}
 
// ...
 
/// Invariant: Account balances should never be negative
val no_negatives = ADDRESSES.forall(addr =>
  balances.get(addr) >= 0
)
```

