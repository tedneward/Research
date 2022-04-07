title=Janino
tags=language, jvm
summary=A super-small, super-fast Java compiler. It can not only compile a set of source files to a set of class files like JAVAC, but also compile a Java expression, a block, a class body, one .java file or a set of .java files in memory, load the bytecode and execute it directly in the same JVM.
~~~~~~

[Website](http://janino-compiler.github.io/janino/) | [Source](https://github.com/janino-compiler/janino)

Janino as a script evaluator:
~~~
package foo;
 
import java.lang.reflect.InvocationTargetException;
 
import org.codehaus.commons.compiler.CompileException;
import org.codehaus.janino.ScriptEvaluator;
 
public class Main {
 
    public static void
    main(String[] args) throws CompileException, NumberFormatException, InvocationTargetException {
 
        ScriptEvaluator se = new ScriptEvaluator();
 
        se.cook(
            ""
            + "static void method1() {\n"
            + "    System.out.println(1);\n"
            + "}\n"
            + "\n"
            + "method1();\n"
            + "method2();\n"
            + "\n"
            + "static void method2() {\n"
            + "    System.out.println(2);\n"
            + "}\n"
        );
 
        se.evaluate(new Object[0]);
    }
}
~~~
