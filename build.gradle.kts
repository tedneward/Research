import java.io.File

plugins {
  id("org.jbake.site") version "5.1.0"
}

jbake {
    srcDirName  = "."
}

// Task to generate searchindex.json after bake
tasks.register<Copy>("generateSearchIndex") {
    dependsOn("bake")
    
    val bakeOutputDir = file("${layout.buildDirectory.get().asFile}/jbake")
    val searchIndexInput = file("${bakeOutputDir}/searchindex")
    
    doLast {
        if (searchIndexInput.exists()) {
            // Copy and rename to .json
            copy {
                from(searchIndexInput)
                into(bakeOutputDir)
                rename { "searchindex.json" }
            }
            println("Generated: searchindex.json")
        } else {
            println("Warning: searchindex not found at ${searchIndexInput}. Check template configuration.")
        }
    }
}

// Create a combined task that runs bake then generates the search index
tasks.register("bakeWithSearchIndex") {
    dependsOn("bake")
    dependsOn("generateSearchIndex")
}
