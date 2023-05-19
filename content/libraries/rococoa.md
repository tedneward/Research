title=Rococoa
tags=library, ios, macos, jvm
summary=Allows you to call Objective-C code through Java classes and interfaces that you define.
~~~~~~

[Source](https://github.com/iterate-ch/rococoa)

---

# Rococoa Whistlestop Tour #

First download and unzip the latest release. Add `dist/rococoa-n.n.n.jar` and the jars in `lib` to your classpath. Add `bin/librococoa.dylib` to your `java.library.path` (the easiest way to do this is to drop it into the directory from which you run code).

Now choose a Cocoa class you'd like to represent in Java. Let's say NSMutableArray. Create a Java interface called NSMutableArray, extending `org.rococoa.NSObject`.

```
public interface NSMutableArray extends NSObject {
}
``

To create an NSMutableArray in Objective-C we would call the class (static) method `+ (id)arrayWithCapacity:(NSUInteger) numItems`. We don't have any way to add static methods to a Java interface, so add a nested class and add the desired method to that.

```
public interface NSMutableArray extends NSObject {
    public interface _Class extends NSClass {
        NSMutableArray arrayWithCapacity(int numItems);
    }
}
```

The nested class name `_Class` is just a convention. The method name should be the same as the Objective-C name, and primitive arguments just map to their obvious Java equivalents. The `id` returned we know represents an instance of NSMutableArray, so we may as well say so.

Now we need an instance of this inner class to call our method. Rococoa will create this for us, if we tell it the name of the Objective-C class that we are wrapping, and the type of the wrapper. I call these statics `CLASS`.

```
public interface NSMutableArray extends NSObject {
    public static final _Class CLASS = Rococoa.createClass("NSMutableArray", _Class.class);*

    public interface _Class extends NSClass {
        NSMutableArray arrayWithCapacity(int numItems);
    }
}
```

Now everything is in place to create an instance, let's do that and call the NSObject method `- (NSString *)description`, mapped in NSObject.java as `String description()`.

```
public class NSMutableArrayTest extends RococoaTestCase {
    public void test() {
        NSMutableArray array = NSMutableArray.CLASS.arrayWithCapacity(3);
        assertEquals("(\n)", array.description());
    }
}
```

OK, so it's not much of a description, but if it works, you've created an Objective-C object and called a method on it. Let's add some more interesting operations.

Provided that it is implemented in Objective-C, adding an operation is simply a question of adding to our Java interface. So in the parent of NSMutableArray, NSArray, we find `- (NSUInteger)count`. We can add that to our interface and then call it.

```
public interface NSMutableArray extends NSObject {

    public static final _Class CLASS = Rococoa.createClass("NSMutableArray", Class.class);
    public interface _Class extends NSClass {
        NSMutableArray arrayWithCapacity(int numItems);
    }

    int count();
}

public class NSMutableArrayTest extends RococoaTestCase {

    public void test() {
        NSMutableArray array = NSMutableArray.CLASS.arrayWithCapacity(3);
        assertEquals("(\n)", array.description());
        assertEquals(0, array.count());
    }
}
```

Hmmm, pretty boring, but necessary if we're going to test `- (void)addObject:(id)anObject`.

That `(id)` parameter is Objective-C's way of saying any NSObject, so the corresponding Java code is:

```
public interface NSMutableArray extends NSObject {

public static final _Class CLASS = Rococoa.createClass("NSMutableArray", _Class.class);
public interface _Class extends NSClass {
NSMutableArray arrayWithCapacity(int numItems);
}

int count();
*
void addObject(NSObject anObject);*
}.
```

The only NSObject subclass that we've seen so far is our NSMutableArray (OK,
_Class is as well, smarty-pants), and adding an array to an array is too
hardcore, so for our test be glad that Rococoa has already implemented some of
NSString, and a factory method `NSString stringWithString(java.lang.String
string)`._

```

public class NSMutableArrayTest extends RococoaTestCase {

public void test() {
NSMutableArray array = NSMutableArray.CLASS.arrayWithCapacity(3);
assertEquals(0, array.count());
*
NSString aString = NSString.stringWithString("Hello"));
array.addObject(aString);
assertEquals(1, array.count());
assertEquals("(\n    Hello\n)", array.description());*
}
}
```

As passing strings around is pretty fundamental, Rococoa marsalls them
specially. If you declare a parameter as java.lang.String, Rococoa will create
the NSString for you.

```

public interface NSMutableArray extends NSObject {

public static final _Class CLASS = Rococoa.createClass("NSMutableArray", _Class.class);
public interface _Class extends NSClass {
NSMutableArray arrayWithCapacity(int numItems);
}

int count();
void addObject(NSObject anObject);

*void addObject(String string);*

}

public class NSMutableArrayTest extends RococoaTestCase {

public void test() {
NSMutableArray array = NSMutableArray.CLASS.arrayWithCapacity(3);
assertEquals(0, array.count());
array.addObject(NSString.stringWithString("Hello"));

*array.addObject("Goodbye");
assertEquals(2, array.count());
assertEquals("(\n    Hello,\n    Goodbye\n)", array.description());*
}
}
```

The same is true for returning strings.

```

public interface NSMutableArray extends NSObject {

public static final _Class CLASS = Rococoa.createClass("NSMutableArray", _Class.class);
public interface _Class extends NSClass {
NSMutableArray arrayWithCapacity(int numItems);
}

int count();
void addObject(NSObject anObject);
void addObject(String string);

*String objectAtIndex(int index);*

}

public class NSMutableArrayTest extends RococoaTestCase {

public void test() {
NSMutableArray array = NSMutableArray.CLASS.arrayWithCapacity(3);
assertEquals(0, array.count());
array.addObject(NSString.stringWithString("Hello"));
array.addObject("Goodbye");
assertEquals(2, array.count());

*String first = array.objectAtIndex(0);
assertEquals("Hello", first);
assertEquals("Goodbye", array.objectAtIndex(1));*
}
}
```

Of course we can't overload `String objectAtIndex(int index)` and
add the more generic `NSObject objectAtIndex(int index)`. Let's go
back to returning NSObject.

```

public interface NSMutableArray extends NSObject {

public static final _Class CLASS = Rococoa.createClass("NSMutableArray", _Class.class);
public interface _Class extends NSClass {
NSMutableArray arrayWithCapacity(int numItems);
}

int count();
void addObject(NSObject anObject);
void addObject(String string);

NSObject objectAtIndex(int index);
}
```

Now we can compare with an NSString.

```

public class NSMutableArrayTest extends RococoaTestCase {

public void test() {
NSMutableArray array = NSMutableArray.CLASS.arrayWithCapacity(3);
assertEquals(0, array.count());
array.addObject(NSString.stringWithString("Hello"));
array.addObject("Goodbye");
assertEquals(2, array.count());

*NSObject first = array.objectAtIndex(0);
assertEquals(NSString.stringWithString("Hello"), first);*
}
}
```

Alternatively we can downcast to NSString using `Rococoa.cast(NSObject object, Class<T> desiredType)`.

```

public class NSMutableArrayTest extends RococoaTestCase {

public void test() {
NSMutableArray array = NSMutableArray.CLASS.arrayWithCapacity(3);
assertEquals(0, array.count());
array.addObject(NSString.stringWithString("Hello"));
array.addObject("Goodbye");
assertEquals(2, array.count());

NSObject first = array.objectAtIndex(0);
assertEquals(NSString.stringWithString("Hello"), first);

*NSString firstAsString = Rococoa.cast(first, NSString.class);
assertEquals("Hello", firstAsString.toString());
assertEquals("Goodbye", Rococoa.cast(array.objectAtIndex(1), NSString.class).toString());*

}
}
```

That's the end of our quick tour. I thought there were too many apostrophes,
but if that hasn't put you off, please see the HowTo for more information.
