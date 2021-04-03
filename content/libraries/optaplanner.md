title=OptaPlanner
tags=library, jvm, logic
summary=A JVM-based constraint logic problem solver.
~~~~~~

[Website](https://www.optaplanner.org/) | [Source](https://github.com/kiegroup/optaplanner)

OptaPlanner is a lightweight, embeddable planning engine. It enables everyday Java programmers to solve optimization problems efficiently. It is also compatible with other JVM languages (such as Kotlin and Scala). Constraints apply on plain domain objects and can call existing code. There’s no need to input constraints as mathematical equations. Under the hood, OptaPlanner combines sophisticated Artificial Intelligence optimization algorithms (such as Tabu Search, Simulated Annealing, Late Acceptance and other metaheuristics) with very efficient score calculation and other state-of-the-art constraint solving techniques.

(Sample problems mentioned: the Vehicle Routing Problem, Employee Rostering, Maintenance Scheduling, Task Assignment, School Timetabling, Cloud Optimization, Conference Scheduling, Job Shop Scheduling, Bin Packing.)

Example:
```
// My domain specific class as input
MyRoster problem = ...;

SolverFactory<MyRoster> factory = SolverFactory.createFromXmlResource(".../mySolverConfig.xml");
Solver<MyRoster> solver = factory.buildSolver();

// My domain specific class as output
MyRoster solution = solver.solve(problem);

for (MyShift shift : solution.getShifts()) {
  // Each shift is now assigned to an employee
  assertNotNull(shift.getEmployee());
}
```

