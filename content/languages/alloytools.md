title=AlloyTools
tags=language
summary=Open source language and analyzer for software modeling. 
~~~~~~

[Website](http://alloytools.org/) | [Sources](https://github.com/AlloyTools/org.alloytools.alloy/releases)

From the book:

### 2.1 Statics: Exploring States

Noticing that given that latest version of Alloy tools, the graphical output looks different than what is printed in the book (2nd Ed).

We can declare "signatures" `sig` where each represents a set of objects:

```
sig Name, Addr {}
sig Book {
    addr: Name -> lone Addr
}
```

Book.addr maps Names to Addrs. "In fact, `addr` is a three-way mapping associating books, names, and addresses, containing the tuple `b -> n -> a` when, in book `b`, name `n` is mapped to address `a`." `lone` is a cardinality operator, expressing multiplicity, or in this case, the lack thereof--each name is mapped to as most one address. 

This model contains no commands, so there's no real analysis that can be done beyond simple static semantic and type checks.

To get some samples of the possible states:

```
pred show {}
run show for 3 but 1 Book
```

The command (`run`) specifies a scope that bounds the search for instances. (Remember, this is a model checker/prover!) In this case, at most 3 objects in each signature, but only one Book. This scope limit is just for analysis.

To see an instance with more than one link, we can add a constraint to the predicate:

```
pred show (b: Book) {
    #b.addr > 1
}
```

The `#` is cardinality, so `#b.addr` is the number of associations in this mapping.

The book talks about changing up `show` to test various scenarios (such as testing whether the model allow one name to map to two addresses), much like one does with R.

Since any operator that can be applied to a scalar can also be applied to a set, we can test to see if the model allows us to have more than one address in the address book:

```
pred show (b: Book) {
    #b.addr > 1
    #Name.(b.addr) > 1
}
```

### 2.2 Dynamics: Adding Operations

