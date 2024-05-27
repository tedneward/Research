title=GYS
tags=language, language development
summary=the scripting engine which helps to create the embedded interpreter of your own language.
~~~~~~

[Source](https://gys.sourceforge.net/)

Built-in lexical and expression analyzer, but during interpretation it calls different user code for executing commands, operators, conversions and value getting.

The interpreter is fully runtime - it reads code and interprets it at once. GYS doesn't generate any intermediate code. User doesn't have to use stack to implement his GYS-derived script language. The "abstract" GYS interpreter can be called within application to execute the script according to the designed language definition and functionality. The library provides an easy and clear way to define a scipt language interpreter step-by-step.
