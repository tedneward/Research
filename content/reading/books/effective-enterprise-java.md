title=Effective Enterprise Java
tags=reading, books, architecture, distribution, jvm
summary=A collection of topics for effective enterprise systems.
~~~~~~
*(by Ted Neward, Addison-Wesley)*

# Archiecture
1. Prefer components as the key element of development, deployment, and reuse

2. Prefer loose coupling across component boundaries

3. Differentiate layers from tiers

4. Keep data and processors close together

5. Remember that identity breeds contention

6. Use hook points to inject optimizations, customizations, or new functionality

7. Be robust in the face of failure

8. Deﬁne your performance and scalability goals

9. Restrict EJB to transactional processing

10. Never optimize without proﬁling ﬁrst

11. Recognize the cost of vendor neutrality

12. Build in monitoring support

13. Build in administration support

14. Make deployment as simple as possible

# Communication
15. Understand all your communications options

16. Consider your lookup carefully

17. Recognize the cost of network access

18. Prefer context-complete communication styles

19. Prefer data-driven communication over behavior-driven communication

20. Avoid waiting for remote service requests to respond

21. Consider partitioning components to avoid excessive load on any one machine

22. Consider using Web Services for open integration

# Data
23. Pass data in bulk

24. Consider rolling your own communication proxies

25. Keep it simple

26. Prefer rules engines for complex state evaluation and execution

27. Prefer transactional processing for implicitly nonatomic failure scenarios

28. Differentiate user transactions from system transactions

29. Minimize lock windows

30. Never cede control outside your component while holding locks

31. Understand EJB transactional afﬁnity

32. Prefer local transactions to distributed ones

# Distribution
33. Consider using optimistic concurrency for better scalability

34. Consider using pessimistic concurrency for explicit concurrency control

35. Consider lower isolation levels for better transactional throughput

36. Use savepoints to keep partial work in the face of rollback

37. Replicate resources when possible to avoid lock regions

38. Favor the immutable, for it needs no locks

39. Use HttpSession sparingly

# Persistence
40. Use objects-ﬁrst persistence to preserve your domain model

41. Use relational-ﬁrst persistence to expose the power of the relational model

42. Use procedural-ﬁrst persistence to create an encapsulation layer

43. Recognize the object-hierarchical impedance mismatch

44. Use in-process or local storage to avoid the network

45. Never assume you own the data or the database

46. Lazy-load infrequently used data

47. Eager-load frequently used data

48. Batch SQL work to avoid round-trips

49. Know your JDBC provider

50. Tune your SQL

# Presentation
51. Consider rich-client UI technologies

52. Keep HTML minimal

53. Separate presentation from processing

54. Keep style separate from content

55. Pregenerate content to minimize processing

56. Validate early, validate everything

# Security
57. Security is a process, not a product

58. Remember that security is not just prevention

59. Establish a threat model

60. Assume insecurity

61. Always validate user input

62. Turn on platform security

63. Use role-based authorization

64. Use SignedObject to provide integrity of Serialized objects

65. Use SealedObject to provide conﬁdentiality of Serializable objects

66. Use GuardedObject to provide access control on objects

# System
67. Aggressively release resources

68. Tune the JVM

69. Use independent JREs for side-by-side versioning

70. Recognize ClassLoader boundaries

71. Understand Java Object Serialization

72. Don’t ﬁght the garbage collector

73. Prefer container-managed resource management

74. Use reference objects to augment garbage collection behavior

75. Don’t be afraid of JNI code on the server
