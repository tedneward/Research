title=Effective Java (1st Ed)
tags=reading, books, jvm
summary=A collection of items describing how to best design/write Java code.
~~~~~~
*(by Joshua Bloch, (publisher info))*

1. Consider providing static factory methods instead of constructors

2. Enforce the singleton property with a private constructor

3. Enforce noninstantiability with a private constructor

4. Avoid creating duplicate objects

5. Eliminate obsolete object references

6. Avoid finalizers

7. Obey the general contract when overriding equals()

8. Always override `hashCode()` when you override equals()

9. Always override `toString()`

10. Override `clone()` judiciously

11. Consider implementing Comparable

12. Minimize the accessibility of classes & members

13. Favor immutability

14. Favor composition over inheritance

15. Design and document for inheritance or else prohibit it

16. Prefer interfaces to abstract classes

17. use interfaces only to define types

18. Favor static member classes over nonstatic

19. Replace structures with classes

20. Replace unions with class hierarchies

21. Replace enums with classes

22. Replace function pointers with classes and interfaces

23. Check parameters for validity

24. Make defensive copies when needed

25. Design method signatures carefully

26. Use overloading judiciously

27. Return 0-length arrays, not nulls

28. Write doc comments for all exposed API elements

29. Minimize the scope of local variables

30. Know and use the libraries

31. Avoid float and double if exact answers are required

32. Avoid strings where other types are more appropriate

33. Beware the performance of string concatenation

34. Refer to objects by their interfaces

35. Prefer interfaces to Reflection

36. Use native methods judiciously

37. Optimize judiciously

38. Adhere to generally accepted naming conventions

39. Use exceptions only for exceptional conditions

40. Use checked exceptions for recoverable conditions and runtime exceptions for programming errors

41. Avoid unnecessary use of checked exceptions

42. Favor the use of standard exceptions

43. Throw exceptions appropriate to the abstraction

44. Document all exceptions thrown by each method

45. Include failure-capture information in detail messages

46. Strive for failable atomicity

47. Don't ignore exceptions

48. Sync access to shared mutable data

49. Avoid excessive synchronization

50. Never invoke wait outside a loop

51. Don't depend on the thread scheduler

52. Document thread safety

53. Avoid ThreadGroups

54. Implement Serializable judiciously

55. Consider using a customized Serializable form

56. Write `readObject()` methods defensively

57. Provide a `readResolve()` method when necessary
