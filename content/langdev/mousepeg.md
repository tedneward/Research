title=Mouse (or MousePEG)
tags=langdev, parser, jvm
summary=A tool to transcribe PEG into an executable parser.
~~~~~~

[Website](https://mousepeg.sourceforge.net/) | [Downloads](http://sourceforge.net/projects/mousepeg) | [Manual](https://mousepeg.sourceforge.net/Documents/Manual.pdf)

This is an example of PEG:

```
Sum     = Space Sign Number (AddOp Number)* !_ {} ;
Number  = Digits? "." Digits Space {}
        / Digits Space {} ;
Sign    = ("-" Space)? ;
AddOp   = [-+] Space ;
Digits  = [0-9]+ ;
Space   = " "* ;
```

Mouse transcribes it into an executable parser written in Java. Each rule of PEG becomes a Java method named after the rule. For example, the first rule is transcribed into this method;

```
//=====================================================================
//  Sum = Space Sign Number (AddOp Number)* !_ {} ;
//=====================================================================
private boolean Sum()
  {
    begin("Sum");
    Space();
    Sign();
    if (!Number()) return reject();
    while (Sum_0());
    if (!aheadNot()) return reject();
    sem.Sum();
    return accept();
  }
``

A pair of brackets {} at the end of a PEG rule indicates that you provide a semantic action for the rule. It is a method in a separate Java class and may look like this:

```
//-------------------------------------------------------------------
//  Sum = Space Sign Number AddOp Number ... AddOp Number
//          0     1    2      3     4         n-2   n-1
//-------------------------------------------------------------------
void Sum()
  {
    int n = rhsSize();
    int s = (Double)rhs(2).get();
    if (!rhs(1).isEmpty()) s = -s;
    for (int i=4;i<n;i+=2)
    {
      if (rhs(i-1).charAt(0)=='+')
        s += (Double)rhs(i).get();
      else
        s -= (Double)rhs(i).get();
    }
    System.out.println(s);
  }
```

Special functions like "rhsSize()" and "rhs(i)" provide access to parts of the parsed text.
 