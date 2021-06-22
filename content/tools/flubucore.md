title=FlubuCore
tags=tool, clr, build
summary=A cross platform build and deployment automation system. You can define your build and deployment scripts in C# using an intuitive fluent interface.
~~~~~~

[Website](https://flubucore.dotnetcore.xyz/) | [Source](https://github.com/dotnetcore/FlubuCore/)

Examples:
```
[FromArg("nugetKey", "Nuget api key for publishing Flubu nuget packages.")]
public string NugetApiKey { get; set; }

protected override void ConfigureTargets(ITaskContext context)
{
    var pack = context.CreateTarget("Pack")
        .SetDescription("Prepare's nuget package.")
        .AddCoreTask(x => x.Pack()
            .NoBuild()
            .OutputDirectory(OutputDirectory)
            .WithArguments("--force"); //you can add your own custom arguments on each task

    var branch = context.BuildSystems().Travis().Branch;

    //// Examine travis.yaml to see how to pass api key from travis to FlubuCore build script.
    var nugetPush = context.CreateTarget("Nuget.publish")
        .SetDescription("Publishes nuget package.")
        .DependsOn(pack)
        .AddCoreTask(x => x.NugetPush($"{OutputDirectory}/NetCoreOpenSource.nupkg")
            .ServerUrl("https://www.nuget.org/api/v2/package")
             .ApiKey(NugetApiKey)
        )
        .When((c) => c.BuildSystems().RunningOn == BuildSystemType.TravisCI
                     && !string.IsNullOrEmpty(branch)
                     && branch.EndsWith("stable", StringComparison.OrdinalIgnoreCase));
}
```

```
context.CreateTarget("build")
   .AddTask(x => x.GitVersionTask())
   .AddTask(x => x.CompileSolutionTask("MySolution.sln").BuildConfiguration("Release");

context.CreateTarget("run.tests")
   .AddTask(x => x.XunitTaskByProjectName("MyProject").StopOnFail())
   .AddTask(x => x.NUnitTask(NunitCmdOptions.V3, "MyProject2").ExcludeCategory("Linux"))
   .AddCoreTask(x => x.CoverletTask("MyProject.dll"));
```

```
[NugetPackage("Newtonsoft.json", "11.0.2")]
[Assembly(".\Lib\EntityFramework.dll")]
public class BuildScript : DefaultBuildScript
{
   public void NuGetPackageReferencingExample(ITaskContext context)
    {
        JsonConvert.SerializeObject("Example");
    }
}
```

```
public class SimpleScript : DefaultBuildScript
{
    protected override void ConfigureTargets(ITaskContext context)
    {
        context.CreateTarget("Run.Libz")
        .AddTask(x => x.RunProgramTask(@"packages\LibZ.Tool\1.2.0\tools\libz.exe")
            .WorkingFolder(@".\src")
            .WithArguments("add")
            .WithArguments("--libz", "Assemblies.libz"));
    }
}
```

```
public class SimpleScript : DefaultBuildScript
{
    [FromArg("c", "The configuration to use for building the project.")]
    public string Configuration { get; set; } = "Release"

    [FromArg("sn", "If true app is deployed on second node. Otherwise not.")]
    public bool deployOnSecondNode { get; set; }

    protected override void ConfigureTargets(ITaskContext context)
    {
         context.CreateTarget("build")
            .AddCoreTask(x => x.Build()
                .Configuration(Configuration)
                .ForMember(x =>  x.Framework("net462"), "f", "The target framework to build for.")); 
    }
}
```

```
dotnet tool install --global FlubuCore.GlobalTool
flubu compile
```

```
context.WaitForDebugger();
```

