title=FJ (Functional Java)
tags=library, jvm, language, functional
summary=
~~~~~~

[Website](http://www.functionaljava.org/) | [Source](https://github.com/functionaljava/functionaljava)

Example: map over a list and apply a function
```java
import static fj.data.List.list;
import fj.data.List;
import static fj.Show.intShow;
import static fj.Show.listShow;

public final class ListMapExample {
    public static void main(final String[] args) {
        final List<Integer> a = list(1, 2, 3).map(i -> i + 42);
        listShow(intShow).println(a); // [43,44,45]

        // combined into a single line
        listShow(intShow).println(list(1, 2, 3).map(i -> i + 42)); // [43,44,45]
    }
}
```


