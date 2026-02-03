title=Crap4j
tags=tool, architecture, jvm, metrics, static analysis
summary=A Java implementation of the CRAP (Change Risk Anti-Patterns) software metric.
~~~~~~

[Website](http://www.crap4j.org/) | [Source](https://code.google.com/archive/p/crap4j/)

**Q:** What Are Change Risk Anti Patterns?

**A:** They are code patterns that are associated with an increased risk of breaking an existing piece of code when it’s being modified.

**Q:** What are some examples of Change Risk Anti-Patterns?

**A:** A good example of a Java change risk anti-pattern, and one used in CRAP, is a method with high cyclomatic complexity (i.e. a lot of branches). Several studies show a definite correlation between excessive code complexity and an increased probability of introducing defects during maintenance. Another change risk anti-pattern used in CRAP is lack of automated tests. Modifying existing code without having some tests you can run to ensure that the changes have not introduced regressions is, not surprisingly, quite risky – especially if the person modifying the code is not the original developer.


**Q:** How is CRAP calculated?

**A:** The current version of CRAP combines the two change risk anti-patterns we just discussed: excessive method complexity and lack of automated tests for those methods.

Given a Java method m, CRAP for m is calculated as follows:

    CRAP(m) = comp(m)^2 * (1 – cov(m)/100)^3 + comp(m)

Where comp(m) is the cyclomatic complexity of method m, and cov(m) is the test code coverage provided by automated tests (e.g. JUnit tests, not manual QA). Cyclomatic complexity is a well-known and widely used metric and it’s calculated as one plus the number of unique decisions in the method. For code coverage we use basis path coverage. Low CRAP numbers indicate code with relatively low change and maintenance risk – because it’s not too complex and/or it’s well-protected by automated and repeatable tests. High CRAP numbers indicate code that’s risky to change because of a hazardous combination of high complexity and low, or no, automated test coverage.

Generally speaking, you can lower your CRAP score either by adding automated tests or by refactoring to reduce complexity. Preferably both; and it’s a good idea to write the tests firsts so you can refactor more safely.

**Q:** You said “current version of CRAP”, does that mean that CRAP might change?

**A:** Yes, we believe that the current version of CRAP is a very good start and it has proven useful and rather accurate in detecting risky code. But we also believe that metrics should be open to change and evolve as we gain experience using them and to keep up with changes in programming practices.

**Q:** I understand how CRAP is calculated for a given method, but how do I interpret the CRAP number I get?

**A:** Bob Evans and I have looked at a lot of examples (using our code and many open source projects) and listened to a LOT of opinions. After much debate, we decided to initially use a CRAP score of 30 as the threshold for crappiness. Below is a table that shows the amount of test coverage required to stay below the CRAP threshold based on the complexity of a method:


Complexity vs Coverage
Method's Cyclomatic Complexity | % of coverage required to be below CRAPpy threshold
------------------------------ | ---------------------------------------------------
0–5 | 0%
6-10 | 42%
11-15 | 57%
16-20 | 71%
21-25 | 80%
26-30 | 100%
31+ | Time to refactor

**Q:** What Are Change Risk Anti Patterns?

**A:** They are code patterns that are associated with an increased risk of breaking an existing piece of code when it’s being modified.

**Q:** What are some examples of Change Risk Anti-Patterns?

**A:** A good example of a Java change risk anti-pattern, and one used in CRAP, is a method with high cyclomatic complexity (i.e. a lot of branches). Several studies show a definite correlation between excessive code complexity and an increased probability of introducing defects during maintenance. Another change risk anti-pattern used in CRAP is lack of automated tests. Modifying existing code without having some tests you can run to ensure that the changes have not introduced regressions is, not surprisingly, quite risky – especially if the person modifying the code is not the original developer.


**Q:** How is CRAP calculated?

**A:** The current version of CRAP combines the two change risk anti-patterns we just discussed: excessive method complexity and lack of automated tests for those methods.

Given a Java method m, CRAP for m is calculated as follows:

```
CRAP(m) = comp(m)^2 * (1 – cov(m)/100)^3 + comp(m)
```

Where comp(m) is the cyclomatic complexity of method m, and cov(m) is the test code coverage provided by automated tests (e.g. JUnit tests, not manual QA). Cyclomatic complexity is a well-known and widely used metric and it’s calculated as one plus the number of unique decisions in the method. For code coverage we use basis path coverage. Low CRAP numbers indicate code with relatively low change and maintenance risk – because it’s not too complex and/or it’s well-protected by automated and repeatable tests. High CRAP numbers indicate code that’s risky to change because of a hazardous combination of high complexity and low, or no, automated test coverage.

Generally speaking, you can lower your CRAP score either by adding automated tests or by refactoring to reduce complexity. Preferably both; and it’s a good idea to write the tests firsts so you can refactor more safely.

**Q:** You said “current version of CRAP”, does that mean that CRAP might change?

**A:** Yes, we believe that the current version of CRAP is a very good start and it has proven useful and rather accurate in detecting risky code. But we also believe that metrics should be open to change and evolve as we gain experience using them and to keep up with changes in programming practices.

**Q:** I understand how CRAP is calculated for a given method, but how do I interpret the CRAP number I get?

**A:** Bob Evans and I have looked at a lot of examples (using our code and many open source projects) and listened to a LOT of opinions. After much debate, we decided to initially use a CRAP score of 30 as the threshold for crappiness. Below is a table that shows the amount of test coverage required to stay below the CRAP threshold based on the complexity of a method:

In other words, you can have high-complexity methods BUT you better have a lot of tests for them. Please note that we don’t recommend having zero tests – even for simple methods of complexity 5 and below. Every piece of code that does something non-trivial should have some tests but – after many discussions – we believe that the CRAP metric will be more useful if it highlights the truly crappy and risky code, not just the code that could be made better by refactoring or adding some tests

**Q:** OK. Crap4J has labeled one of my methods as crappy, what do I do now?

**A:** First of all, take a look at the CRAP details page in the report (the link is at the bottom of the report). The CRAP page shows all methods sorted by CRAP (from highest to lowest) and displays both complexity and test coverage information.

If a method is crappy because it has acceptable complexity (e.g. 8) but inadequate tests (e.g. 0%), the obvious thing is to write some tests for it to increase coverage.

If the method is well tested by high-complexity, it’s a good idea to refactor. Method extraction is a very safe refactoring and can really improve code legibility if you give the extracted method a name that describes what it does (e.g. validateCardNumber(String num) is a good method extraction name, check(String num) is not.)

**Q:** What is the CRAPload number?

**A:** Crap load represents the "minimum" amount of work that could be done to get below the crap threshold of 30 for a method. The summary Crapload number is for the whole project and is just the sum of crap load for all methods. The idea is that this gives you a floor value for the amount of work to get rid of crap. Usually, the amount of work will be greater.

Examining this in more detail, to lower the Crap score, there are two options: reduce cyclomatic complexity in a method, or write tests that cover more of the paths in the method. In the case of the Crapload number, we take the simplest possible restructuring of code, which is to refactor it into methods that are half the size of the previous method, say using the Extract Method refactoring. For example, I have a method of complexity 60. if I refactor by extracting half the method into a new method, then I would have two methods of complexity 30.

Obviously, this blind refactoring is a pretty poor way to "fix" a system, and in reality, some other, more appropriate, restructuring of the system would be the action to take. In lieu of being able to determine that programmatically, we can at least compute the minimum amount of work that could possibly be done to remove Crap from the system.

Crap load for a method is calculated as follows:

```
  public int getCrapLoad(float crapThreshold) {
    int crapLoad = 0;
    if (getCrap() >= crapThreshold) {
      int complexity = getComplexity();
      float coverage = getCoverage();
      crapLoad += complexity * (1.0 - coverage);
      crapLoad += complexity / crapThreshold;
    }
    return crapLoad;
  }
```

So, interpreting that, if the CRAP score for a method is above the threshold, 30, then for every point of uncovered complexity, add 1 for a test to cover that path. Then for every bit of complexity over the threshold, figure out the number of extract methods dividing in half that need to be done to get below the threshold.
