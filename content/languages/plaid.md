title=Plaid
tags=language
summary=A radical new programming language designed for the nascent age of concurrent, component-based computing incorporating typestate-oriented programming, concurrency by default, object model, linear type system with access permissions and integrated structural and nominal typing, and gradual typing.
~~~~~~

[Website](http://www.cs.cmu.edu/~aldrich/plaid/) | [Source](https://github.com/plaidgroup/plaid-lang) | [Specification](https://github.com/plaidgroup/plaid-lang/blob/master/docs/spec/spec.pdf)

Not currently under development; moved on to [Wyvern](../wyvern).

Publications:
* [First-Class State Change in Plaid](http://www.cs.cmu.edu/~aldrich/papers/plaid-oopsla11.pdf)
* [Gradual Typestate](http://www.cs.cmu.edu/~aldrich/papers/aldrich-gradual-ecoop11.pdf)
* [Permission-Based Programming Languages](http://www.cs.cmu.edu/~aldrich/papers/plaid-NIER2010.pdf)
* [Typestate-Oriented Programming](http://www.cs.cmu.edu/~aldrich/papers/onward2009-state.pdf)
* [Concurrency by Default: Using Permissions to Express Dataflow in Stateful Programs](http://www.cs.cmu.edu/~aldrich/papers/onward2009-concurrency.pdf)

Typestate:
```
state File {
  public final String filename;
}
state OpenFile extends File {
  private CFilePtr filePtr;
  public int read() { ... }
  public void close() [OpenFile>>ClosedFile]
  { ... }
}
state ClosedFile extends File {
  public void open() [ClosedFile>>OpenFile]
  { ... }
}

```

