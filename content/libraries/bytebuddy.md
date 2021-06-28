title=Byte Buddy
tags=library, jvm, language
summary=A library for creating and modifying Java classes during the runtime of a Java application and without the help of a compiler.
~~~~~~

[Website](https://bytebuddy.net/) | [Source](https://github.com/raphw/byte-buddy)

### Hello World
Hello World
Saying Hello World with Byte Buddy is as easy as it can get. Any creation of a Java class starts with an instance of the ByteBuddy class which represents a configuration for creating new types:

```
Class<?> dynamicType = new ByteBuddy()
  .subclass(Object.class)
  .method(ElementMatchers.named("toString"))
  .intercept(FixedValue.value("Hello World!"))
  .make()
  .load(getClass().getClassLoader())
  .getLoaded();
assertThat(dynamicType.newInstance().toString(), is("Hello World!"));
```

The default ByteBuddy configuration which is used in the above example creates a Java class in the newest version of the class file format that is understood by the processing Java virtual machine. As hopefully obvious from the example code, the created type will extend the Object class and overrides its toString method which should return a fixed value of Hello World!. The method to be overridden is identified by a so-called ElementMatcher. In the above example, a predefined element matcher named(String) is used which identifies methods by their exact names. Byte Buddy comes with numerous predefined and well-tested matchers which are collected in the ElementMatchers class and which can be easily composed. The creation of custom matchers is however as simple as implementing the (functional) ElementMatcher interface.

For implementing the toString method, the FixedValue class defines a constant return value for the overridden method. Defining a constant value is only one example of many method interceptors that ship with Byte Buddy. By implementing the Implementation interface, a method could however even be defined by custom byte code.

Finally, the described Java class is created and then loaded into the Java virtual machine. For this purpose, a target class loader is required. Eventually, we can convince ourselves of the result by calling the toString method on an instance of the created class and finding the return value to represent the constant value we expected.
