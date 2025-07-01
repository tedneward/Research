title=Gradle
tags=tool, jvm, android, build
summary=Build tool for JVM and Android environments using Groovy (later Kotlin) as build language.
~~~~~~

[Website](https://gradle.org/) | [Source](https://github.com/gradle/gradle) | [Plugin Portal](https://plugins.gradle.org/)

Docs: [User Guide](https://docs.gradle.org/current/userguide/userguide.html) | [DSL Reference](https://docs.gradle.org/current/dsl/) | [Forums](https://discuss.gradle.org/)

[Introduction into C++ Builds with Gradle](https://thoughts-on-cpp.com/2019/04/10/introduction-into-c-builds-with-gradle/)

[Shadow plugin](https://imperceptiblethoughts.com/shadow/introduction/): "Shadow is a Gradle plugin for combining a project's dependency classes and resources into a single output Jar. The combined Jar is often referred to a fat-jar or uber-jar. ... Shadowing a project output has 2 major use cases: (1) Creating an executable JAR distribution, [and] (2) Bundling and relocating common dependencies in libraries to avoid classpath conflicts."

### Reading

* [Building Java Projects with Gradle](http://spring.io/guides/gs/gradle/)
* [Gradle Succinctly](https://www.syncfusion.com/ebooks/gradle_succinctly) - José Roberto Olivas Mendoza
* [Gradle User Guide](https://docs.gradle.org/current/userguide/userguide.html) - Hans Dockter, Adam Murdoch ([PDF](https://docs.gradle.org/current/userguide/userguide.pdf))

### Notes

Gradle uses a 1:1 relationship of a build script to a Project instance. Most "magic" comes from the use of plugins (listed below). Thus, the world's simplest Gradle build:

```
// build.gradle.kts
println("Hello Gradle")
```

... when run with `gradle -b build.gradle.kts`:

```
~/Projects/Exploration.git/Gradle % gradle -b build.gradle.kts 

> Configure project :
Hello Gradle

> Task :help

Welcome to Gradle 8.10.

To run a build, run gradle <task> ...

To see a list of available tasks, run gradle tasks

To see more detail about a task, run gradle help --task <task>

To see a list of command-line options, run gradle --help

For more detail on using Gradle, see https://docs.gradle.org/8.10/userguide/command_line_interface.html

For troubleshooting, visit https://help.gradle.org

Deprecated Gradle features were used in this build, making it incompatible with Gradle 9.0.

You can use '--warning-mode all' to show the individual deprecation warnings and determine if they come from your own scripts or plugins.

For more on this, please refer to https://docs.gradle.org/8.10/userguide/command_line_interface.html#sec:command_line_warnings in the Gradle documentation.

BUILD SUCCESSFUL in 843ms
1 actionable task: 1 executed
```

## Common tasks

### Execute "run" with command-line arguments
`gradle run --args="one two three \"four is a collection of words\" five"` (must have all arguments in a single double-quoted string)

## Customizing

### Keyword Expansion
Found in Chapter 1 of *Gradle Beyond the Basics* (OReilly, Tim Berglund)

```
// I think this is Groovy syntax
versionId = '1.6'

task copyProductionConfig(type: Copy) {
  from 'source'
  include 'config.properties'
  into 'build/war/WEB-INF/config'
  expand([
    databaseHostname: 'db.company.com',
    version: versionId,
    buildNumber: (int)(Math.random() * 1000),
    date: new Date()
  ])
}
```
This will replace placeholders like the following:
```
#
# Application configuration file
#
hostname: ${databaseHostname}
appVersion: ${version}
locale: en_us
initialConnections: 10
transferThrottle: 5400
queueTimeout: 30000
buildNumber: ${buildNumber}
buildDate: ${date.format("yyyyMMdd'T'HHmmssZ")}
```

### Custom Task inside the build script
Wrote a custom task that invokes `javap` on compiled class files ([here](https://github.com/tedneward/Demo-JVM-Bytecode/blob/main/JavaExamples/app/build.gradle.kts)):

```
open class Javap: DefaultTask() {
    @Internal var workingDir = "./build/classes/java/main"
    @Internal var outputDir: String = ""
    @Internal lateinit var classFiles: List<String>
    @Internal lateinit var javapArguments: List<String>
    @Internal var projectDir = project.projectDir

    @TaskAction
    fun runCommand() {
        logger.warn("Running 'disasm' replaces the marked javap files with newly-generated content!")
        for (classFile in classFiles) {
            val commandLine = ("javap " + javapArguments.joinToString(" ") + " " + classFile)
            try {
                val workingDir = File(projectDir, workingDir)
                val outputDir = File(projectDir, outputDir)
                val parts = commandLine.split("\\s".toRegex())
                // Transform the classFile string/path to a dotted name
                val dottedClassFile = classFile.split("/").joinToString(".")
                val outputFile = File(outputDir, dottedClassFile + ".bytecode")
                val proc = ProcessBuilder(*parts.toTypedArray())
                        .directory(workingDir)
                        .redirectOutput(outputFile)
                        .redirectError(ProcessBuilder.Redirect.PIPE)
                        .start()

                proc.waitFor(60, TimeUnit.MINUTES)
                println("Success processing ${classFile}")
            } catch(e: Exception) {
                e.printStackTrace()
                println("Failure processing ${classFile}: ${e.message}")
            }
        }
    }
}

tasks.register<Javap>("disasm") {
    group = "build"
    description = "Produce disassembly listings of Java code"
    javapArguments = listOf("-v")
    outputDir = ""
    classFiles = listOf(
        "com/newardassociates/demo/App.class",
        "com/newardassociates/demo/Greeter.class",
        "com/newardassociates/demo/Math.class",
        "com/newardassociates/demo/Outer.class",
        "com/newardassociates/demo/Outer\$Inner.class",
        "com/newardassociates/demo/StringConcat.class",
        "com/newardassociates/demo/Varargs.class",
    )
    dependsOn("compileJava")
}
```

- @TaskAction definitely is the magic to make Gradle invoke the task
- @Internal is required on the properties inside the task--Gradle apparently really wants to know whether it's an input, output, or internal property. I still need to figure out input and output properties on a custom task.
- I think `group` and `description` are inherited from `DefaultTask`, so I should probably figure out how to pass those in a constructor or something
- There's probably a better way of dealing with multiple files, but this was sufficient for the Bytecode demos project.
- I should probably move those "println" statements over to use the logger instead

### Custom Task compiled as part of the build


### Custom Task in a standalone JAR



---

## Boilerplates

- [android-gradle-template](https://github.com/nenick/android-gradle-template) - Template project for developing Android app.
- [vertx-gradle-template](https://github.com/vert-x/vertx-gradle-template) - Template project for developing Vert.x module.
- [gradle-plugin-starter](https://github.com/int128/gradle-plugin-starter) - Template project for developing Gradle plugin.
- [gatling-with-gradle](https://github.com/RallySoftware/gatling-with-gradle) - Sample project that demonstrates how to automate load testing with [Gatling](http://gatling.io/).

## Resources

