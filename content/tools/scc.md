title=scc (Sloc, Cloc, and Code)
tags=tool, static
summary=A very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go
~~~~~~

[Source](https://github.com/boyter/scc)

A tool similar to cloc, sloccount and tokei. For counting the lines of code, blank lines, comment lines, and physical lines of source code in many programming languages.

Goal is to be the fastest code counter possible, but also perform COCOMO calculation like sloccount, estimate code complexity similar to cyclomatic complexity calculators and produce unique lines of code or DRYness metrics. In short one tool to rule them all.

Why use `scc`?

 - It is very fast and gets faster the more CPU you throw at it
 - Accurate
 - Works very well across multiple platforms without slowdown (Windows, Linux, macOS)
 - Large language support
 - Can ignore duplicate files
 - Has complexity estimations
 - You need to tell the difference between Coq and Verilog in the same directory
 - cloc yaml output support so potentially a drop in replacement for some users
 - Can identify or ignore minified files
 - Able to identify many #! files ADVANCED! https://github.com/boyter/scc/issues/115
 - Can ignore large files by lines or bytes
 - Can calculate the ULOC or unique lines of code by file, language or project
 - Supports multiple output formats for integration, CSV, SQL, JSON, HTML and more

Why not use `scc`?

 - You don't like Go for some reason
 - It cannot count D source with different nested multi-line comments correctly https://github.com/boyter/scc/issues/27

### Differences

There are some important differences between `scc` and other tools that are out there. Here are a few important ones for you to consider.

Blank lines inside comments are counted as comments. While the line is technically blank the decision was made that 
once in a comment everything there should be considered a comment until that comment is ended. As such the following,
 
```
/* blank lines follow


*/
```

Would be counted as 4 lines of comments. This is noticeable when comparing scc's output to other tools on large
repositories.

`scc` is able to count verbatim strings correctly. For example in C# the following,

```
private const string BasePath = @"a:\";
// The below is returned to the user as a version
private const string Version = "1.0.0";
```

Because of the prefixed @ this string ends at the trailing " by ignoring the escape character \ and as such should be 
counted as 2 code lines and 1 comment. Some tools are unable to
deal with this and instead count up to the "1.0.0" as a string which can cause the middle comment to be counted as
code rather than a comment.

`scc` will also tell you the number of bytes it has processed (for most output formats) allowing you to estimate the
cost of running some static analysis tools. 

### Usage

Command line usage of `scc` is designed to be as simple as possible.
Full details can be found in `scc --help` or `scc -h`. Note that the below reflects the state of master not a release, as such
features listed below may be missing from your installation.

```
Sloc, Cloc and Code. Count lines of code in a directory with complexity estimation.
Version 3.3.4
Ben Boyter <ben@boyter.org> + Contributors

Usage:
  scc [flags] [files or directories]

Flags:
      --avg-wage int                 average wage value used for basic COCOMO calculation (default 56286)
      --binary                       disable binary file detection
      --by-file                      display output for every file
  -m, --character                    calculate max and mean characters per line
      --ci                           enable CI output settings where stdout is ASCII
      --cocomo-project-type string   change COCOMO model type [organic, semi-detached, embedded, "custom,1,1,1,1"] (default "organic")
      --count-as string              count extension as language [e.g. jsp:htm,chead:"C Header" maps extension jsp to html and chead to C Header]
      --count-ignore                 set to allow .gitignore and .ignore files to be counted
      --currency-symbol string       set currency symbol (default "$")
      --debug                        enable debug output
  -a, --dryness                      calculate the DRYness of the project (implies --uloc)
      --eaf float                    the effort adjustment factor derived from the cost drivers (1.0 if rated nominal) (default 1)
      --exclude-dir strings          directories to exclude (default [.git,.hg,.svn])
  -x, --exclude-ext strings          ignore file extensions (overrides include-ext) [comma separated list: e.g. go,java,js]
  -n, --exclude-file strings         ignore files with matching names (default [package-lock.json,Cargo.lock,yarn.lock,pubspec.lock,Podfile.lock,pnpm-lock.yaml])
      --file-gc-count int            number of files to parse before turning the GC on (default 10000)
  -f, --format string                set output format [tabular, wide, json, json2, csv, csv-stream, cloc-yaml, html, html-table, sql, sql-insert, openmetrics] (default "tabular")
      --format-multi string          have multiple format output overriding --format [e.g. tabular:stdout,csv:file.csv,json:file.json]
      --gen                          identify generated files
      --generated-markers strings    string markers in head of generated files (default [do not edit,<auto-generated />])
  -h, --help                         help for scc
  -i, --include-ext strings          limit to file extensions [comma separated list: e.g. go,java,js]
      --include-symlinks             if set will count symlink files
  -l, --languages                    print supported languages and extensions
      --large-byte-count int         number of bytes a file can contain before being removed from output (default 1000000)
      --large-line-count int         number of lines a file can contain before being removed from output (default 40000)
      --min                          identify minified files
  -z, --min-gen                      identify minified or generated files
      --min-gen-line-length int      number of bytes per average line for file to be considered minified or generated (default 255)
      --no-cocomo                    remove COCOMO calculation output
  -c, --no-complexity                skip calculation of code complexity
  -d, --no-duplicates                remove duplicate files from stats and output
      --no-gen                       ignore generated files in output (implies --gen)
      --no-gitignore                 disables .gitignore file logic
      --no-ignore                    disables .ignore file logic
      --no-large                     ignore files over certain byte and line size set by max-line-count and max-byte-count
      --no-min                       ignore minified files in output (implies --min)
      --no-min-gen                   ignore minified or generated files in output (implies --min-gen)
      --no-size                      remove size calculation output
  -M, --not-match stringArray        ignore files and directories matching regular expression
  -o, --output string                output filename (default stdout)
      --overhead float               set the overhead multiplier for corporate overhead (facilities, equipment, accounting, etc.) (default 2.4)
  -p, --percent                      include percentage values in output
      --remap-all string             inspect every file and remap by checking for a string and remapping the language [e.g. "-*- C++ -*-":"C Header"]
      --remap-unknown string         inspect files of unknown type and remap by checking for a string and remapping the language [e.g. "-*- C++ -*-":"C Header"]
      --size-unit string             set size unit [si, binary, mixed, xkcd-kb, xkcd-kelly, xkcd-imaginary, xkcd-intel, xkcd-drive, xkcd-bakers] (default "si")
      --sloccount-format             print a more SLOCCount like COCOMO calculation
  -s, --sort string                  column to sort by [files, name, lines, blanks, code, comments, complexity] (default "files")
      --sql-project string           use supplied name as the project identifier for the current run. Only valid with the --format sql or sql-insert option
  -t, --trace                        enable trace output (not recommended when processing multiple files)
  -u, --uloc                         calculate the number of unique lines of code (ULOC) for the project
  -v, --verbose                      verbose output
      --version                      version for scc
  -w, --wide                         wider output with additional statistics (implies --complexity)
```

Output should look something like the below for the redis project

```
$ scc redis 
───────────────────────────────────────────────────────────────────────────────
Language                 Files     Lines   Blanks  Comments     Code Complexity
───────────────────────────────────────────────────────────────────────────────
C                          296    180267    20367     31679   128221      32548
C Header                   215     32362     3624      6968    21770       1636
TCL                        143     28959     3130      1784    24045       2340
Shell                       44      1658      222       326     1110        187
Autoconf                    22     10871     1038      1326     8507        953
Lua                         20       525       68        70      387         65
Markdown                    16      2595      683         0     1912          0
Makefile                    11      1363      262       125      976         59
Ruby                        10       795       78        78      639        116
gitignore                   10       162       16         0      146          0
YAML                         6       711       46         8      657          0
HTML                         5      9658     2928        12     6718          0
C++                          4       286       48        14      224         31
License                      4       100       20         0       80          0
Plain Text                   3       185       26         0      159          0
CMake                        2       214       43         3      168          4
CSS                          2       107       16         0       91          0
Python                       2       219       12         6      201         34
Systemd                      2        80        6         0       74          0
BASH                         1       118       14         5       99         31
Batch                        1        28        2         0       26          3
C++ Header                   1         9        1         3        5          0
Extensible Styleshe…         1        10        0         0       10          0
Smarty Template              1        44        1         0       43          5
m4                           1       562      116        53      393          0
───────────────────────────────────────────────────────────────────────────────
Total                      823    271888    32767     42460   196661      38012
───────────────────────────────────────────────────────────────────────────────
Estimated Cost to Develop (organic) $6,918,301
Estimated Schedule Effort (organic) 28.682292 months
Estimated People Required (organic) 21.428982
───────────────────────────────────────────────────────────────────────────────
Processed 9425137 bytes, 9.425 megabytes (SI)
───────────────────────────────────────────────────────────────────────────────
```

Note that you don't have to specify the directory you want to run against. Running `scc` will assume you want to run against the current directory.

You can also run against multiple files or directories `scc directory1 directory2 file1 file2` with the results aggregated in the output.

### Ignore Files

`scc` mostly supports .ignore files inside directories that it scans. This is similar to how ripgrep, ag and tokei work. .ignore files are 100% the same as .gitignore files with the same syntax, and as such `scc` will ignore files and directories listed in them. You can add .ignore files to ignore things like vendored dependency checked in files and such. The idea is allowing you to add a file or folder to git and have ignored in the count.

### Interesting Use Cases

Used inside Intel Nemu Hypervisor to track code changes between revisions https://github.com/intel/nemu/blob/topic/virt-x86/tools/cloc-change.sh#L9
Appears to also be used inside both http://codescoop.com/ https://pinpoint.com/ https://github.com/chaoss/grimoirelab-graal

It also is used to count code and guess language types in https://searchcode.com/ which makes it one of the most frequently run code counters in the world. 

You can also hook scc into your gitlab pipeline https://gitlab.com/guided-explorations/ci-cd-plugin-extensions/ci-cd-plugin-extension-scc

Also used by CodeQL https://github.com/boyter/scc/pull/317 and Scaleway https://twitter.com/Scaleway/status/1488087029476995074?s=20&t=N2-z6O-ISDdDzULg4o4uVQ

- https://docs.linuxfoundation.org/lfx/insights/v3-beta-version-current/getting-started/landing-page/cocomo-cost-estimation-simplified
- https://openems.io/

### Features

`scc` uses a small state machine in order to determine what state the code is when it reaches a newline `\n`. As such it is aware of and able to count

 - Single Line Comments
 - Multi Line Comments
 - Strings
 - Multi Line Strings
 - Blank lines

Because of this it is able to accurately determine if a comment is in a string or is actually a comment.

It also attempts to count the complexity of code. This is done by checking for branching operations in the code. For example, each of the following `for if switch while else || && != ==` if encountered in Java would increment that files complexity by one.

### Complexity Estimates

Let's take a minute to discuss the complexity estimate itself.

The complexity estimate is really just a number that is only comparable to files in the same language. It should not be used to compare languages directly without weighting them. The reason for this is that its calculated by looking for branch and loop statements in the code and incrementing a counter for that file.

Because some languages don't have loops and instead use recursion they can have a lower complexity count. Does this mean they are less complex? Probably not, but the tool cannot see this because it does not build an AST of the code as it only scans through it.

Generally though the complexity there is to help estimate between projects written in the same language, or for finding the most complex file in a project `scc --by-file -s complexity` which can be useful when you are estimating on how hard something is to maintain, or when looking for those files that should probably be refactored.