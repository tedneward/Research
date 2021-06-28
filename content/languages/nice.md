title=Nice
tags=language, jvm, object
summary=A new programming language that extends the ideas behind object-orientation in order to better support modular programming and static type safety and incorporates features from functional programming.
~~~~~~

Wiki hasn't been updated for a while, it seems. Feels like this hasn't been really touched much in the last decade or so.

[Website](http://nice.sourceforge.net/) | [Binary installation](http://nice.sourceforge.net/install.html) | [Source download](http://nice.sourceforge.net/Nice-source.tar.gz)

Classes and methods can be declared as in Java:

```
class Person 
{ 
  String name; 
  int age; 
  
  String display(); 
} 

class Worker extends Person 
{ 
  int salary; 
} 
```

Note that String display(); declares a method, that is informs that this method exists. Now we have to implement it, that is tell what code is to be executed, depending on the runtime type of the person (in this short example either Person or Worker).

Method implementations can be placed outside of classes. Their order does not matter. The implementations of a single method may even occur in several files (this is an important feature that allows modularity).

So after the two above class definitions, we write two implementations for method display:

```
display(Person p) 
{ 
  return p.name + " (age=" + p.age + ")"; 
} 

display(Worker p) 
{ 
  return p.name + " (age+" + p.age + ", salary=" + p.salary + ")"; 
} 
```

In Nice, the choice of the method implementation is made at run-time, based on all parameters (in java, only the implicit parameter this is used to choose the alternative). Such methods are thus called multi-methods.

Let's take the example of the equals method, that tests if any two objects are equal.

```
class Person
{
  String name;
  int age;
}

equals(Person p1, Person p2) =
  p1.name.equals(p2.name) &&
  p1.age==p2.age;
```

