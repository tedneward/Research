title=ELSA
tags=library, clr, workflow
summary=An open source .NET Standard workflows library.
~~~~~~

[Website](https://elsa-workflows.github.io/elsa-core/) | [Source](https://github.com/elsa-workflows/elsa-core)

### Quickstart

`dotnet new console -n "ElsaQuickstarts.ConsoleApp.HelloWorld"`

`cd ElsaQuickstarts.ConsoleApp.HelloWorld`

Add the following packages:

```bash
dotnet add package Elsa
dotnet add package Elsa.Activities.Console
```

HelloWorld.cs:
```cs
using Elsa.Activities.Console;
using Elsa.Builders;

namespace ElsaQuickstarts.ConsoleApp.HelloWorld
{
    /// <summary>
    /// A basic workflow with just one WriteLine activity.
    /// </summary>
    public class HelloWorld : IWorkflow
    {
        public void Build(IWorkflowBuilder builder) => builder.WriteLine("Hello World!");
    }
}
```
The above workflow has only one step (activity): the WriteLine activity.

Program.cs:
```cs
using System.Threading.Tasks;
using Elsa.Services;
using Microsoft.Extensions.DependencyInjection;

namespace ElsaQuickstarts.ConsoleApp.HelloWorld
{
    class Program
    {
        private static async Task Main()
        {
            // Create a service container with Elsa services.
            var services = new ServiceCollection()
                .AddElsa(options => options
                    .AddConsoleActivities()
                    .AddWorkflow<HelloWorld>())
                .BuildServiceProvider();
            
            // Get a workflow runner.
            var workflowRunner = services.GetRequiredService<IBuildsAndStartsWorkflow>();

            // Run the workflow.
            await workflowRunner.BuildAndStartWorkflowAsync<HelloWorld>();
        }
    }
}
```

## Concepts

### Workflow
A workflow consists of a series of steps called activities that are connected to one another. A workflow maintains all sorts of information, such as the following:

* Which activity is currently executing.
* What variables are set.
* What activities are blocking further execution.

Once an activity is done executing, the workflow checks its outcome and if there's another activity connected to it. If so, that activity is scheduled for execution.

This goes on until there are either no more activities to execute, or an activity is encountered that instructs the workflow runner to suspend the workflow.

### Activity
An activity is an atomic building block that represents a single executable step on the workflow. At a bare minimum, an activity implements the OnExecute method, which contains the code to execute.

### Starting Activity
An activity which is the starting point of the workflow and does not have any inbound connections. They are the entry points to the workflow.

### Blocking Activity
When an activity executes, it returns an activity execution result, which is somewhat analogous to an MVC/API ActionResult. There are various possible results that can be returned, but the most commonly used ones are `Done`, `Outcomes` and `Suspend`.

When Suspend is returned (as is typically the case with blocking activities), the workflow will enter the Suspended state and the activity will be registered as a blocking activity.

### Suspended Workflow
Suspended workflows are blocked by one or more blocking activities. The only way to resume such a workflow is to trigger it with the name of one of the blocking activities.

### Connection
A connection represents a connection between two activities. This is how the workflow runner knows what activities to execute next. A connection between two activities holds 3 pieces of information:

* The source activity ID.
* The source outcome name (e.g. Done).
* The target activity ID.

For each possible outcome of a given activity, a connection can be established from that outcome to another activity.

For example, let's say we have a workflow with three activities called Activity A, Activity B and Activity C. Activity A has 2 outcomes called Done and Failed, and we wish to connect the Done outcome to Activity B and Failed to Activity C.

This means we need the following two connections:

Connection 1

* Source: Activity A
* Outcome: Done
* Destination: Activity B

Connection 2

* Source: Activity A
* Outcome: Failed
* Destination: Activity C

![](https://elsa-workflows.github.io/elsa-core/docs/assets/concepts/concepts-workflows-figure-1.png)


### Long Running Workflows
A long-running workflow is a workflow that doesn't run from start to end in one go. Instead, it might have one or more blocking activities that will instruct the workflow engine to suspend the workflow until it receives the appropriate stimulus to resume execution.

### Short Running Workflows
A short-running workflow is a workflow that, in contrast to long-running workflows, does run from start to end in one go.

### Burst of Execution
A burst of execution refers to the execution of a sequence of activities one after another until either one of the following occurs:

* No more activities were scheduled (the end of the workflow was reached), or
* A blocking activity was encountered.

