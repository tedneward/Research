title=Parboiled
tags=langdev, parser, jvm
summary=
~~~~~~

[Website](http://parboiled.org/) | [Source](https://github.com/sirthias/parboiled)

Calculator example:

```
package org.parboiled.examples.calculators;

import org.parboiled.BaseParser;
import org.parboiled.Parboiled;
import org.parboiled.parserunners.RecoveringParseRunner;
import org.parboiled.Rule;
import org.parboiled.common.StringUtils;
import org.parboiled.support.ParsingResult;
import org.parboiled.support.ToStringFormatter;
import org.parboiled.trees.GraphNode;

import java.util.Scanner;

import static org.parboiled.errors.ErrorUtils.printParseErrors;
import static org.parboiled.support.ParseTreeUtils.printNodeTree;
import static org.parboiled.trees.GraphUtils.printTree;

/**
 * Base class of all calculator parsers in the org.parboiled.examples.calculators package.
 * Simply adds the public static main entry point.
 *
 * @param <V> the type of the main value object created by the parser
 */
public abstract class CalculatorParser<V> extends BaseParser<V> {

    public abstract Rule InputLine();

    @SuppressWarnings({"unchecked"})
    public static <V, P extends CalculatorParser<V>> void main(Class<P> parserClass) {
        CalculatorParser<V> parser = Parboiled.createParser(parserClass);

        while (true) {
            System.out.print("Enter a calculators expression (single RETURN to exit)!\n");
            String input = new Scanner(System.in).nextLine();
            if (StringUtils.isEmpty(input)) break;

            ParsingResult<?> result = new RecoveringParseRunner(parser.InputLine()).run(input);

            if (result.hasErrors()) {
                System.out.println("\nParse Errors:\n" + printParseErrors(result));
            }

            Object value = result.parseTreeRoot.getValue();
            if (value != null) {
                String str = value.toString();
                int ix = str.indexOf('|');
                if (ix >= 0) str = str.substring(ix + 2); // extract value part of AST node toString()
                System.out.println(input + " = " + str + '\n');
            }
            if (value instanceof GraphNode) {
                System.out.println("\nAbstract Syntax Tree:\n" +
                        printTree((GraphNode) value, new ToStringFormatter(null)) + '\n');
            } else {
                System.out.println("\nParse Tree:\n" + printNodeTree(result) + '\n');
            }
        }
    }

}
```

```
package org.parboiled.examples.calculators;

import org.parboiled.Rule;
import org.parboiled.annotations.BuildParseTree;
import org.parboiled.examples.calculators.CalculatorParser3.CalcNode;
import org.parboiled.support.Var;

/**
 * A calculator parser building an AST representing the expression structure before performing the actual calculation.
 * The value field of the parse tree nodes is used for AST nodes. Uses a rule building helper methods
 * to Factor out common constructs. This parser supports floating point operations, negative numbers, a "power"
 * and a "SQRT" operation as well as optional whitespace between the various expressions components.
 */
@BuildParseTree
public class CalculatorParser4 extends CalculatorParser<CalcNode> {

    /**
     * The AST node for the calculators. The type of the node is carried as a Character that can either contain
     * an operator char or be null. In the latter case the AST node is a leaf directly containing a value.
     */
    public static class CalcNode extends ImmutableBinaryTreeNode<CalcNode> {
        private double value;
        private Character operator;

        public CalcNode(double value) {
            super(null, null);
            this.value = value;
        }

        public CalcNode(Character operator, CalcNode left, CalcNode right) {
            super(left, right);
            this.operator = operator;
        }

        public double getValue() {
            if (operator == null) return value;
            switch (operator) {
                case '+':
                    return left().getValue() + right().getValue();
                case '-':
                    return left().getValue() - right().getValue();
                case '*':
                    return left().getValue() * right().getValue();
                case '/':
                    return left().getValue() / right().getValue();
                case '^':
                    return Math.pow(left().getValue(), right().getValue());
                case 'R':
                    return Math.sqrt(left().getValue());
                default:
                    throw new IllegalStateException();
            }
        }

        @Override
        public String toString() {
            return (operator == null ? "Value " + value : "Operator '" + operator + '\'') + " | " + getValue();
        }
    }
    
    @Override
    public Rule InputLine() {
        return Sequence(Expression(), EOI);
    }

    public Rule Expression() {
        return OperatorRule(Term(), FirstOf("+ ", "- "));
    }

    public Rule Term() {
        return OperatorRule(Factor(), FirstOf("* ", "/ "));
    }

    public Rule Factor() {
        // by using toRule("^ ") instead of Ch('^') we make use of the fromCharLiteral(...) transformation below
        return OperatorRule(Atom(), toRule("^ "));
    }

    public Rule OperatorRule(Rule subRule, Rule operatorRule) {
        Var<Character> op = new Var<Character>();
        return Sequence(
                subRule,
                ZeroOrMore(
                        operatorRule, op.set(matchedChar()),
                        subRule,
                        push(new CalcNode(op.get(), pop(1), pop()))
                )
        );
    }

    public Rule Atom() {
        return FirstOf(Number(), SquareRoot(), Parens());
    }

    public Rule SquareRoot() {
        return Sequence("SQRT", Parens(), push(new CalcNode('R', pop(), null)));
    }

    public Rule Parens() {
        return Sequence("( ", Expression(), ") ");
    }

    public Rule Number() {
        return Sequence(
                Sequence(
                        Optional(Ch('-')),
                        OneOrMore(Digit()),
                        Optional(Ch('.'), OneOrMore(Digit()))
                ),
                // the action uses a default string in case it is run during error recovery (resynchronization)
                push(new CalcNode(Double.parseDouble(matchOrDefault("0")))),
                WhiteSpace()
        );
    }

    public Rule Digit() {
        return CharRange('0', '9');
    }

    public Rule WhiteSpace() {
        return ZeroOrMore(AnyOf(" \t\f"));
    }

    // we redefine the rule creation for string literals to automatically match trailing whitespace if the string
    // literal ends with a space character, this way we don't have to insert extra whitespace() rules after each
    // character or string literal
    @Override
    protected Rule fromStringLiteral(String string) {
        return string.endsWith(" ") ?
                Sequence(String(string.substring(0, string.length() - 1)), WhiteSpace()) :
                String(string);
    }

    //**************** MAIN ****************

    public static void main(String[] args) {
        main(CalculatorParser4.class);
    }
}
```