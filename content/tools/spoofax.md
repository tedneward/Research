title=Spoofax Language Workbench
tags=tool, language, platform
summary=A platform for developing textual (domain-specific) programming languages.
~~~~~~

The platform provides the following ingredients:

* Meta-languages for high-level declarative language definition
* An interactive environment for developing languages using these meta-languages
* Code generators that produces parsers, type checkers, compilers, interpreters, and other tools from language definitions
* Generation of full-featured Eclipse editor plugins from language definitions
* Generation of full-featured IntelliJ editor plugins from language definitions (experimental)
* An API for programmatically combining the components of a language implementation

With Spoofax you can focus on the essence of language definition and ignore irrelevant implementation details.

[Website](http://www.metaborg.org/en/latest) | [Source](https://github.com/metaborg)

Spoofax is the integration of many different tools, compilers, (meta-)languages, (meta-)libraries, and runtime components. This integration is made concrete in the spoofax-releng Git repository on GitHub. This repository contains all components via Git submodules, which are updated by our build farm that builds Spoofax whenever one of its components in a submodule changes.

Spoofax currently contains the following subcomponents as submodules:

* releng - release engineering scripts for managing and building the spoofax-releng repostory.
* Java libraries and runtimes
    * mb-rep - libraries for program representation such as abstract terms
    * mb-exec - Stratego interpreter and utilities
    * jsglr - JSGLR parser
    * spoofax - Spoofax Core, a cross platform API to Spoofax languages
    * spoofax-maven - Maven integration for Spoofax Core
    * spoofax-sunshine - Command-line integration for Spoofax Core
    * spoofax-eclipse - Eclipse plugin for Spoofax Core
    * spoofax-intellij - IntelliJ plugin for Spoofax Core
* Meta-languages and libraries
    * esv - Editor service language
    * sdf - Syntax Definition Formalisms, containing the SDF2 and SDF 3 languages
    * stratego and strategoxt - Stratego compiler, runtime, and editor
    * nabl - Name binding languages, containing the NaBL and NaBL2 languages, and support libraries for NaBL2
    * ts - Type system language
    * dynsem - Dynamic semantics language
    * metaborg-coq - Coq signatures and syntax definition
    * spt - Spoofax testing language
    * runtime-libraries - NaBL support libraries, incremental task engine for incremental name and type analysis

