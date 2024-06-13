title=Hack
tags=language
summary=An object-oriented application language influenced by PHP.
~~~~~~

[Website](https://hacklang.org/) | [Documentation](https://docs.hhvm.com/hack/)

A language developed by Facebook to replace(?) PHP.

Hello World in Hack:
```
namespace Hack\GettingStarted\MyFirstProgram;

<<__EntryPoint>>
function main(): void {
  echo "Welcome to Hack!\n\n";

  \printf("Table of Squares\n" .
          "----------------\n");
  for ($i = -5; $i <= 5; ++$i) {
    \printf("  %2d        %2d  \n", $i, $i * $i);
  }
  \printf("----------------\n");
  exit(0);
}
```

https://github.com/facebook/hhvm/tree/master/hphp/hack
Hack is built specifically for HHVM, a high performance runtime for your Hack applications, and reconciles the fast development cycle of a dynamically typed language with the discipline provided by static typing, while adding many features commonly found in other modern programming languages.
