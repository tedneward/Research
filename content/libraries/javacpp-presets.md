title=JavaCpp-Presets
tags=library, jvm, native, android, ios, linux, macos, windows
summary=The missing Java distribution of native C++ libraries.
~~~~~~

[Source](https://github.com/bytedeco/javacpp-presets)

The JavaCPP Presets modules contain Java configuration and interface classes for widely used C/C++ libraries. The configuration files in the org.bytedeco.<moduleName>.presets packages are used by the Parser to create from C/C++ header files the Java interface files targeting the org.bytedeco.<moduleName> packages, which in turn are used by the Generator and the native C++ compiler to produce the required JNI libraries. Moreover, helper classes make their functionality easier to use on the Java platform, including Android.

For orientation purposes, the documentation of this repository can be thought of as being split into 2 levels:

1. The directory where this parent README.md document is located belongs to the upper level, the javacpp-presets module itself, and
2. The subdirectories in it are the actual child modules, with their README.md files, presets, and packages, as the lower level.

This parent README.md file contains general information applicable to all modules to solve issues concerning downloads, common requirements, installation procedures, and build instructions. The respective README.md files in each subdirectory contain extra information, links, and notes concerning API documentation, specific requirements, dependencies for pom.xml files, and sample usage code, for the presets and packages of each module. Please be aware that not all of the presets have the same level of maturity, and the style and layout may also differ from one to another since they are based on the APIs of third-party libraries.
