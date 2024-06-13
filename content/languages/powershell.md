title=PowerShell
tags=language, object, clr, windows
summary=Cross-platform strongly dynamic typed object-based with functional features automation and configuration language.
~~~~~~

[Source](https://github.com/PowerShell/PowerShell)

[Powershell AST](https://adamtheautomator.com/powershell-ast/):

- "To get started, you’ll need to get familiar with the System.Management.Automation.Language.Parser class. This is a class that contains a few applicable static methods that we can use to read scripts and code. This class has two methods that you’ll routinely use called ParseInput() and ParseFile(), which essentially do the same thing. ParseInput() reads code as a big string while ParseFile() assists you in converting a text file containing PowerShell code and converts it into a string for parsing. Both end up with the same result. From within the script itself, I’d like to determine all the references to each cmdlet I have and each variable. To do this, I’ll first need to figure out a way to get the entire script contents as one, big string. I can do that by using the PowerShell AST object’s $MyInvocation.MyCommand.ScriptContents property. I’ll just add this as the last line in the script and execute it. Once I have the script contents, I can then pass this to the ParseInput() method as mentioned above to build a “tree” from my script. I’ll replace that $MyInvocation.MyCommand.ScriptContents reference with: `[System.Management.Automation.Language.Parser]::ParseInput($MyInvocation.MyCommand.ScriptContents, [ref]$null, [ref]$null)`
