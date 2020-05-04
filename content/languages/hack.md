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
