title=Sleep
tags=language, jvm, scripting
summary=A Java-based scripting language heavily inspired by Perl.
~~~~~~

[Website](http://sleep.dashnine.org/) | [Source](https://github.com/rsmudge/sleep) | [Manual](http://sleep.dashnine.org/manual/index.html)

Examples:

```
# hello.sl
println("Hello world");
```

```
# cp.sl [original file] [new file]

$in = openf(@ARGV[0]);
$data = readb($in, -1);

$out = openf(">" . @ARGV[1]);          
writeb($out, $data);

closef($in);
closef($out);
```
Run:
```
$ java -jar sleep.jar cp.sl hello.sl hello.bak
$ cat hello.bak
println("Hello World");
```

