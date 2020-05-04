title=Umple
tags=language, jvm
summary=A modeling tool and programming language family for Model-Oriented Programming.
~~~~~~

[Website](https://cruise.eecs.uottawa.ca/umple/) or [Website](http://www.umple.org) | [Github](https://github.com/umple/umple)

The following example shows how to declare attributes and associations in the first steps when modeling a system using Umple. (from the Website)
```
class Student {}  
  
class CourseSection {}  
  
class Registration   
{  
  String grade;  
  * -- 1 Student;  
  * -- 1 CourseSection;  
}
```

