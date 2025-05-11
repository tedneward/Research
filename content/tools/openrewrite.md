title=OpenRewrite
tags=tool, library, language
summary=An open-source automated refactoring ecosystem for source code, enabling developers to effectively eliminate technical debt within their repositories.
~~~~~~

[Website](https://docs.openrewrite.org/) | [Source](https://github.com/openrewrite/rewrite) | [Recipe Catalog](https://docs.openrewrite.org/recipes) | [Authoring Recipes](https://docs.openrewrite.org/authoring-recipes)

Moderne is a cloud-hosted commercial implementation of OpenRewrite. 

## Articles

* Baeldung: ["A Guide to OpenRewrite"](https://www.baeldung.com/java-openrewrite)

## Notes

***automatically refactor source code by applying recipes to the project*** Each recipe can perform specific refactoring tasks. These recipes are written in Java code and included in the build process using the OpenRewrite Maven or Gradle plugin. Comes with a variety of built-in recipes for common transformations. Community contributes recipes for others.

Uses ["Lossless Semantic Trees"](https://docs.openrewrite.org/concepts-and-explanations/lossless-semantic-trees) (basically boosted ASTs) to enable more fine-grained input as source to a collection of rules (recipes) that are run over source:

Unlike the traditional Abstract Syntax Tree (AST), OpenRewrite's LST offers a unique set of characteristics that make it possible to perform accurate transformations and searches across a repository:

Type-attributed. Each LST is imbued with type information. For example, when referencing a field, the source code may just refer to it as myField. The OpenRewrite LST for myField, on the other hand, would contain additional information about what the type of myField is, even if it isn't defined in the same source file or even the same project.
Format-preserving. Whitespace before and after LSTs are preserved in the tree so the tree can be printed out to reconstitute the original source code without clobbering formatting. Additionally, refactoring operations that insert code are sensitive to the local style of the code around them and match the local style.
Type attribution is necessary for the accurate matching of patterns. For example, if we are looking for SLF4J log statements and we see a statement like the following, without type attribution how do we know if logger is an SLF4J or a Logback logger?

```
logger.info("Hi");
```

Format preservation is necessary if formatting isn't 100% consistent throughout the whole repository.

When you run an OpenRewrite recipe locally:

1. The OpenRewrite process creates an LST which is stored in memory. This reflects the current state of the repository on disk.
2. The process continues by making transformations on the LST. This could be adding a search marker (~~>) if the recipe is a search recipe -- or it could be more significant code changes.
3. Once the recipe finishes running, the LST is converted back to text which then is used to overwrite any existing files that have changed.
4. After all of the files have been overwritten, the process ends. Nothing is stored between recipe runs.
5. If you go to run another recipe after the first one is done, a new LST will be generated at that time.
6. If the previous recipe made changes and those changes exist locally, then the newly generated LST will have all of those changes. If the previous recipe made no changes, then the LST will effectively be the same one as before (but regenerated as the previous one no longer exists).

[Java Examples of LSTs](https://docs.openrewrite.org/concepts-and-explanations/lst-examples)

