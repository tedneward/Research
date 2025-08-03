title=JParsec
tags=langdev, parser, jvm
summary=A recursive-descent parser combinator framework written for Java; it's an implementation of Haskell Parsec on the Java platform.
~~~~~~

[Source](https://github.com/jparsec/jparsec)

Calculator example:
```
import static org.jparsec.Scanners.isChar;

import java.util.function.BinaryOperator;
import java.util.function.UnaryOperator;

import org.jparsec.OperatorTable;
import org.jparsec.Parser;
import org.jparsec.Scanners;

/**
 * The main calculator parser.
 * 
 * @author Ben Yu
 */
public final class Calculator {
  
  /** Parses {@code source} and evaluates to an {@link Integer}. */
  public static int evaluate(String source) {
    return parser().parse(source);
  }
  
  static final Parser<Integer> NUMBER = Scanners.INTEGER.map(Integer::valueOf);
  
  static final BinaryOperator<Integer> PLUS = (a, b) -> a + b;
  
  static final BinaryOperator<Integer> MINUS = (a, b) -> a - b;
  
  static final BinaryOperator<Integer> MUL = (a, b) -> a * b;
  
  static final BinaryOperator<Integer> DIV = (a, b) -> a / b;
  
  static final BinaryOperator<Integer> MOD = (a, b) -> a % b;
  
  static final UnaryOperator<Integer> NEG = a -> -a;
  
  private static <T> Parser<T> op(char ch, T value) {
    return isChar(ch).retn(value);
  }
  
  static Parser<Integer> parser() {
    Parser.Reference<Integer> ref = Parser.newReference();
    Parser<Integer> term = ref.lazy().between(isChar('('), isChar(')')).or(NUMBER);
    Parser<Integer> parser = new OperatorTable<Integer>()
        .prefix(op('-', NEG), 100)
        .infixl(op('+', PLUS), 10)
        .infixl(op('-', MINUS), 10)
        .infixl(op('*', MUL), 20)
        .infixl(op('/', DIV), 20)
        .infixl(op('%', MOD), 20)
        .build(term);
    ref.set(parser);
    return parser;
  }
}
```

