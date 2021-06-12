title=Apeji PX
tags=language, jvm, concurrency, dataflow, parallelism
summary=An object-oriented programming language extension for Java, intended to facilliate parallel computing on multi-core processors, GPU, Grid and Cloud.
~~~~~~

Appears to have disappeared/gone defunct; included for historical reasons.

[Wikipedia](https://en.wikipedia.org/wiki/Ateji_PX) | WebArchive links: [Whitepaper](https://web.archive.org/web/20101223161629/http://www.ateji.com/px/whitepapers/Ateji%20PX%20for%20Java%20v1.0.pdf), [Language Manual](https://web.archive.org/web/20101029162649/http://www.ateji.com/px/1.0/manual/)

## Examples
Hello world:
```
public class HelloWorld {
  public static void main(String[] args) {
    [
      || System.out.println("Hello");
      || System.out.println("World");
    ]
  }
}
```

Each `||` represents a parallel branch/thread.

Data Parallelism:
```
[
  || (int i : array.length) array[i]++;
]
```
This creates a parallel branch for each "iteration" of `i`. Essentially a parallel increment of the entire array.

This can be done for multiple "loops":
```
[
|| (int i:N, int j:N, if i+j<N) matrix[i][j]++;
]
```

Task Parallelism:
```
int fib(int n) {
  if (n <= 1) return 1;
  int fib1, fib2;
  // recursively create parallel branches
  [
    || fib1 = fib(n-1);
    || fib2 = fib(n-2);
  ]
  return fib1 + fib2;
}
```
Essentially a fork/join-style framework.

[Message-Passing](/reading/message-passing.html):
```
Chan<String> chan = new Chan<String>();
[
  // branch 1 sends a value over the channel
  || chan ! "Hello";

  // branch 2 receives a value from the channel and prints it
  || chan ? s; System.out.println(s);
]
```
Parallel branches have two ways of communicating; either by concurrently reading and writing shared variables, or by sending explicit messages. The operators ! and ? respectively send and receive a message on a channel.

Data-flow:
A program is said to be data-flow when computation is initiated and synchronized by the availability of data in a flow. A typical example is an adder: it has two inputs, one output, and whenever the two inputs are ready, it sends their sum on the output.

```
void adder(Chan<Integer> in1, Chan<Integer> in2, Chan<Integer> out) {
  for(;;) {
    int value1, value2;
    [ in1 ? value1; || in2 ? value2; ];
    out ! value1 + value2;
  }
}
```
Note the parallel read [ in1 ? value1; || in2 ? value2; ]. It means that the two input values can come in any order. Without it, the code may deadlock if values were coming in the wrong order. This shows that parallel primitives in a programming language are not only about performance, but also about the behavior of programs.

The adder by itself doesn't do anything, since it reacts on input data. It needs to be put in a context where other parts feed input values and read output values. The way to express this is to compose all pieces in a large parallel block:
```
[
  || source(c1); // generates values on c1
  || source(c2); // generates values on c2
  || adder(c1, c2, c3);
  || sink(c3); // read values from c3
]
```

Anything that can be thought of as a combination of logical gates or electrical circuits can readily be expressed in this way as a data-flow program.

