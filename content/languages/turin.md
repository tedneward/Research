title=Turin
tags=language, jvm
summary=A language built "for fun".
~~~~~~

[Source](https://github.com/ftomassetti/turin-programming-language)

```
namespace manga

// now print is an alias for call to all the overload variants of println on System.out
import java.lang.System.out.println as print

// we define this property in generale: a name is a String
property String : name

// this is our new datatype
type MangaCharacter {
    // we refer to the property defined above
    has name
    // we define a new property, UInt is an unsigned int
    has UInt : age
    
    // we overload toString. For short methods it can make sense to use 
    // this shorthand. And we have string interpolation
    String toString() = "#{name}, #{age}"
}

// this define a class with a main method
program MangaExample(String[] args) {
    // type inference at work: we are instantiating the class defined above
    // note that the constructor is generated for us
    val ranma = MangaCharacter("Ranma", 16)
    // let's call a java method ( System.out.println(String) ) and use more
    // string interpolation
    print("The protagonist is #{ranma}")
}
```
