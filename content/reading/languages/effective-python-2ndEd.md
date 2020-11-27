title=Effective Python, 2nd Edition
tags=reading, books, python
summary=90 Specific Ways to Write Better Python
~~~~~~
*(by Brett Slatkin, Addison-Wesley)*

# Pythonic Thinking
**Item 1. Know Which Version of Python You’re Using**

**Item 2. Follow the PEP 8 Style Guide**   

**Item 3. Know the Differences Between `bytes` and `str`**

**Item 4. Prefer Interpolated F-Strings Over C-style Format Strings and `str.format`** 

**Item 5. Write Helper Functions Instead of Complex Expressions** 

**Item 6. Prefer Multiple Assignment Unpacking Over Indexing** 

**Item 7. Prefer `enumerate` Over `range`** 

**Item 8. Use `zip` to Process Iterators in Parallel**   

**Item 9. Avoid `else` Blocks After `for` and `while`` Loops** 

**Item 10. Prevent Repetition with Assignment Expressions**

# Lists and Dictionaries
**Item 11: Know How to Slice Sequences**

**Item 12: Avoid Striding and Slicing in a Single Expression**

**Item 13: Prefer Catch-All Unpacking Over Slicing**

**Item 14: Sort by Complex Criteria Using the `key` Parameter**

**Item 15: Be Cautious When Relying on `dict` Insertion Ordering**

**Item 16: Prefer `get` Over `in` and `KeyError` to Handle Missing Dictionary Keys**

**Item 17: Prefer `defaultdict` Over `setdefault` to Handle Missing Items in Internal State**

**Item 18: Know How to Construct Key-Dependent Default Values with `__missing__`**

# Functions
**Item 19: Never Unpack More Than Three Variables When Functions Return Multiple Values**

**Item 20: Prefer Raising Exceptions to Returning `None`**

**Item 21: Know How Closures Interact with Variable Scope**

**Item 22: Reduce Visual Noise with Variable Positional Arguments**

**Item 23: Provide Optional Behavior with Keyword Arguments**

**Item 24: Use `None` and Docstrings to Specify Dynamic Default Arguments**

**Item 25: Enforce Clarity with Keyword-Only and Positional-Only Arguments**

**Item 26: Define Function Decorators with `functools.wraps`** 

# Comprehensions and Generators 
**Item 27: Use Comprehensions Instead of map and filter** 

**Item 28: Avoid More Than Two Control Subexpressions in Comprehensions** 

**Item 29: Avoid Repeated Work in Comprehensions by Using Assignment Expressions** 

**Item 30: Consider Generators Instead of Returning Lists** 

**Item 31: Be Defensive When Iterating Over Arguments** 

**Item 32: Consider Generator Expressions for Large List Comprehensions** 

**Item 33: Compose Multiple Generators with `yield from`**

**Item 34: Avoid Injecting Data into Generators with `send`**

**Item 35: Avoid Causing State Transitions in Generators with `throw`**

**Item 36: Consider `itertools` for Working with Iterators and Generators** 

# Classes and Interfaces
**Item 37: Compose Classes Instead of Nesting Many Levels of Built-in Types**

**Item 38: Accept Functions Instead of Classes for Simple Interfaces**

**Item 39: Use `@classmethod` Polymorphism to Construct Objects Generically**

**Item 40: Initialize Parent Classes with `super`**

**Item 41: Consider Composing Functionality with Mix-in Classes**

**Item 42: Prefer Public Attributes Over Private Ones**

**Item 43: Inherit from `collections.abc` for Custom Container Types** 

# Metaclasses and Attributes
**Item 44: Use Plain Attributes Instead of Setter and Getter Methods**

**Item 45: Consider `@property` Instead of Refactoring Attributes**

**Item 46: Use Descriptors for Reusable `@property` Methods**

**Item 47: Use `__getattr__`, `__getattribute__`, and `__setattr__` for Lazy Attributes**

**Item 48: Validate Subclasses with `__init_subclass__`**

**Item 49: Register Class Existence with `__init_subclass__`**

**Item 50: Annotate Class Attributes with `__set_name__`**

**Item 51: Prefer Class Decorators Over Metaclasses for Composable Class Extensions** 

# Concurrency and Parallelism
**Item 52: Use `subprocess` to Manage Child Processes**

**Item 53: Use Threads for Blocking I/O, Avoid for Parallelism**

**Item 54: Use `Lock` to Prevent Data Races in Threads**

**Item 55: Use `Queue` to Coordinate Work Between Threads**

**Item 56: Know How to Recognize When Concurrency Is Necessary**

**Item 57: Avoid Creating New Thread Instances for On-demand Fan-out**

**Item 58: Understand How Using `Queue` for Concurrency Requires Refactoring** 

**Item 59: Consider `ThreadPoolExecutor` When Threads Are Necessary for Concurrency** 

**Item 60: Achieve Highly Concurrent I/O with Coroutines** 

**Item 61: Know How to Port Threaded I/O to `asyncio`** 

**Item 62: Mix Threads and Coroutines to Ease the Transition to `asyncio`** 

**Item 63: Avoid Blocking the `asyncio` Event Loop to Maximize Responsiveness** 

**Item 64: Consider `concurrent.futures` for True Parallelism** 

# Robustness and Performance 
**Item 65: Take Advantage of Each Block in `try`/`except`/`else`/`finally`** 

**Item 66: Consider `contextlib` and `with` Statements for Reusable `try`/`finally` Behavior** 

**Item 67: Use `datetime` Instead of `time` for Local Clocks** 

**Item 68: Make `pickle` Reliable with `copyreg`** 

**Item 69: Use `decimal` When Precision Is Paramount**

**Item 70: Profile Before Optimizing** 

**Item 71: Prefer `deque` for Producer–Consumer Queues** 

**Item 72: Consider Searching Sorted Sequences with `bisect`** 

**Item 73: Know How to Use `heapq` for Priority Queues** 

**Item 74: Consider `memoryview` and `bytearray` for Zero-Copy Interactions with `bytes`** 

# Testing and Debugging 
**Item 75: Use `repr` Strings for Debugging Output** 

**Item 76: Verify Related Behaviors in TestCase Subclasses** 

**Item 77: Isolate Tests from Each Other with `setUp`, `tearDown`, `setUpModule`, and `tearDownModule`** 

**Item 78: Use Mocks to Test Code with Complex Dependencies** 

**Item 79: Encapsulate Dependencies to Facilitate Mocking and Testing** 

**Item 80: Consider Interactive Debugging with `pdb`** 

**Item 81: Use tracemalloc to Understand Memory Usage and Leaks** 

# Collaboration
**Item 82: Know Where to Find Community-Built Modules** 

**Item 83: Use Virtual Environments for Isolated and Reproducible Dependencies** 

**Item 84: Write Docstrings for Every Function, Class, and Module** 

**Item 85: Use Packages to Organize Modules and Provide Stable APIs** 

**Item 86: Consider Module-Scoped Code to Configure Deployment Environments** 

**Item 87: Define a Root Exception to Insulate Callers from APIs**

**Item 88: Know How to Break Circular Dependencies** 

**Item 89: Consider warnings to Refactor and Migrate Usage**

**Item 90: Consider Static Analysis via typing to Obviate Bugs**
