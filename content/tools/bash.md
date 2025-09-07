title=bash (command-line shell)
tags=tool, language, linux, macos, windows
summary=Command-line shell and associated shell-scripting language.
~~~~~~

[GNU bash Website](https://www.gnu.org/software/bash/) | [Source](https://savannah.gnu.org/projects/bash/) | [GNU Bash manual](https://www.gnu.org/software/bash/manual/bash.pdf)


## Reading, Places

* [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/)
* [Bash Guide](http://mywiki.wooledge.org/BashGuide) - Maarten Billemont [(PDF)](http://s.ntnu.no/bashguide.pdf)
* [Bash Guide for Beginners (2008)](http://www.tldp.org/LDP/Bash-Beginners-Guide/html/)
* [Bash-hackers wiki](http://wiki.bash-hackers.org/)
* [Bash Notes for Professionals](http://goalkicker.com/BashBook/)
* [BASH Programming (2000)](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html)
* [Bash Reference Manual](http://www.gnu.org/software/bash/manual/bashref.html)
* [Bash tutorial](https://web.archive.org/web/20180328183806/http://gdrcorelec.ups-tlse.fr/files/bash.pdf)
* [Conquer the Command Line](https://magpi.raspberrypi.org/books/command-line-second-edition/pdf/download)
* [Conquering the Command Line](https://www.softcover.io/read/fc6c09de/unix_commands)
* [Devhints](https://devhints.io/bash)
* [Getting Started with BASH](http://www.hypexr.org/bash_tutorial.php)
* [Google Shell Style Guide](https://google.github.io/styleguide/shell.xml)
* [Introduction to Bash Scripting](https://github.com/bobbyiliev/introduction-to-bash-scripting)
* [Introduction to the Command Line](https://launchschool.com/books/command_line)
* [Learn bash in y minutes](https://learnxinyminutes.com/docs/bash/)
* [Linux Shell Scripting Tutorial - A Beginner's Handbook (2002)](http://www.freeos.com/guides/lsst/)
* [Linux Shell Scripting Tutorial (LSST) v2.0](https://bash.cyberciti.biz/guide/Main_Page)
* ["Make Your Linux Terminal Enjoyable to Use"](https://dev.to/dhupee/make-your-linux-terminal-enjoyable-to-use-3j47)
* [Shell vars](http://wiki.bash-hackers.org/syntax/shellvars)
* [ShellCheck](https://www.shellcheck.net/)
* [shell - Standard Shell](https://devmanual.gentoo.org/tools-reference/bash/index.html)
* [Slackbook (2005)](http://slackbook.org)
* [The Bash Academy](http://guide.bash.academy)
* [The Linux Command Line](http://linuxcommand.org/tlcl.php)
* [Writing Shell Scripts](http://linuxcommand.org/lc3_writing_shell_scripts.php)

## Supporting tools/projects

* [direnv](https://direnv.net/) ([Source](https://github.com/direnv/direnv)): unclutter your .profile
* [parallel](https://www.gnu.org/software/parallel/parallel.html): build and execute shell command lines from standard input in parallel

## "Dotfiles"

* Seems like `.bash_profile` gets loaded first if present, and if found, doesn't look for `.bashrc` any further; `.bash_profile` thus would need to directly source `.bashrc`

`.bashrc`:
```
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

LS_COLORS=$LS_COLORS:'di=0;35:ln=36' ; export LS_COLORS
```

`.dircolors`: I think we can generate this, but here's the color scheme I've found best (personally) for WSL and native-Linux bash.
```
# Configuration file for dircolors, a utility to help you set the
# LS_COLORS environment variable used by GNU ls with the --color option.
# Copyright (C) 1996-2023 Free Software Foundation, Inc.
# Copying and distribution of this file, with or without modification,
# are permitted provided the copyright notice and this notice are preserved.
#
# The keywords COLOR, OPTIONS, and EIGHTBIT (honored by the
# slackware version of dircolors) are recognized but ignored.
# Global config options can be specified before TERM or COLORTERM entries
# ===================================================================
# Terminal filters
# ===================================================================
# Below are TERM or COLORTERM entries, which can be glob patterns, which
# restrict following config to systems with matching environment variables.
COLORTERM ?*
TERM Eterm
TERM ansi
TERM *color*
TERM con[0-9]*x[0-9]*
TERM cons25
TERM console
TERM cygwin
TERM *direct*
TERM dtterm
TERM gnome
TERM hurd
TERM jfbterm
TERM konsole
TERM kterm
TERM linux
TERM linux-c
TERM mlterm
TERM putty
TERM rxvt*
TERM screen*
TERM st
TERM terminator
TERM tmux*
TERM vt100
TERM xterm*
# ===================================================================
# Basic file attributes
# ===================================================================
# Below are the color init strings for the basic file types.
# One can use codes for 256 or more colors supported by modern terminals.
# The default color codes use the capabilities of an 8 color terminal
# with some additional attributes as per the following codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#NORMAL 00 # no color code at all
#FILE 00 # regular file: use no color at all
RESET 0 # reset to "normal" color
DIR 01;34 # directory
LINK 01;36 # symbolic link. (If you set this to 'target' instead of a
 # numerical value, the color is as for the file pointed to.)
MULTIHARDLINK 00 # regular file with more than one link
FIFO 40;33 # pipe
SOCK 01;35 # socket
DOOR 01;35 # door
BLK 40;33;01 # block device driver
CHR 40;33;01 # character device driver
ORPHAN 40;31;01 # symlink to nonexistent file, or non-stat'able file ...
MISSING 00 # ... and the files they point to
SETUID 37;41 # file that is setuid (u+s)
SETGID 30;43 # file that is setgid (g+s)
CAPABILITY 00 # file with capability (very expensive to lookup)
STICKY_OTHER_WRITABLE 30;42 # dir that is sticky and other-writable (+t,o+w)
OTHER_WRITABLE 34;107 # dir that is other-writable (o+w) and not sticky
STICKY 37;44 # dir with the sticky bit set (+t) and not other-writable
# This is for files with execute permission:
EXEC 01;32
# ===================================================================
# File extension attributes
# ===================================================================
# List any file extensions like '.gz' or '.tar' that you would like ls
# to color below. Put the suffix, a space, and the color init string.
# (and any comments you want to add after a '#').
# Suffixes are matched case insensitively, but if you define different
# init strings for separate cases, those will be honored.
#
# If you use DOS-style suffixes, you may want to uncomment the following:
#.cmd 01;32 # executables (bright green)
#.exe 01;32
#.com 01;32
#.btm 01;32
#.bat 01;32
# Or if you want to color scripts even if they do not have the
# executable bit actually set.
#.sh 01;32
#.csh 01;32
# archives or compressed (bright red)
.tar 01;31
.tgz 01;31
.arc 01;31
.arj 01;31
.taz 01;31
.lha 01;31
.lz4 01;31
.lzh 01;31
.lzma 01;31
.tlz 01;31
.txz 01;31
.tzo 01;31
.t7z 01;31
.zip 01;31
.z 01;31
.dz 01;31
.gz 01;31
.lrz 01;31
.lz 01;31
.lzo 01;31
.xz 01;31
.zst 01;31
.tzst 01;31
.bz2 01;31
.bz 01;31
.tbz 01;31
.tbz2 01;31
.tz 01;31
.deb 01;31
.rpm 01;31
.jar 01;31
.war 01;31
.ear 01;31
.sar 01;31
.rar 01;31
.alz 01;31
.ace 01;31
.zoo 01;31
.cpio 01;31
.7z 01;31
.rz 01;31
.cab 01;31
.wim 01;31
.swm 01;31
.dwm 01;31
.esd 01;31
# image formats
.avif 01;35
.jpg 01;35
.jpeg 01;35
.mjpg 01;35
.mjpeg 01;35
.gif 01;35
.bmp 01;35
.pbm 01;35
.pgm 01;35
.ppm 01;35
.tga 01;35
.xbm 01;35
.xpm 01;35
.tif 01;35
.tiff 01;35
.png 01;35
.svg 01;35
.svgz 01;35
.mng 01;35
.pcx 01;35
.mov 01;35
.mpg 01;35
.mpeg 01;35
.m2v 01;35
.mkv 01;35
.webm 01;35
.webp 01;35
.ogm 01;35
.mp4 01;35
.m4v 01;35
.mp4v 01;35
.vob 01;35
.qt 01;35
.nuv 01;35
.wmv 01;35
.asf 01;35
.rm 01;35
.rmvb 01;35
.flc 01;35
.avi 01;35
.fli 01;35
.flv 01;35
.gl 01;35
.dl 01;35
.xcf 01;35
.xwd 01;35
.yuv 01;35
.cgm 01;35
.emf 01;35
# https://wiki.xiph.org/MIME_Types_and_File_Extensions
.ogv 01;35
.ogx 01;35
# audio formats
.aac 00;36
.au 00;36
.flac 00;36
.m4a 00;36
.mid 00;36
.midi 00;36
.mka 00;36
.mp3 00;36
.mpc 00;36
.ogg 00;36
.ra 00;36
.wav 00;36
# https://wiki.xiph.org/MIME_Types_and_File_Extensions
.oga 00;36
.opus 00;36
.spx 00;36
.xspf 00;36
# backup files
*~ 00;90
*# 00;90
.bak 00;90
.crdownload 00;90
.dpkg-dist 00;90
.dpkg-new 00;90
.dpkg-old 00;90
.dpkg-tmp 00;90
.old 00;90
.orig 00;90
.part 00;90
.rej 00;90
.rpmnew 00;90
.rpmorig 00;90
.rpmsave 00;90
.swp 00;90
.tmp 00;90
.ucf-dist 00;90
.ucf-new 00;90
.ucf-old 00;90
#
# Subsequent TERM or COLORTERM entries, can be used to add / override
# config specific to those matching environment variables.
```

## [Cheat sheet](https://github.com/Randy8080/reference/blob/main/bash.md)

### Getting started

### hello.sh

```bash
#!/bin/bash

VAR="world"
echo "Hello $VAR!" # => Hello world!
```

Execute the script
```shell script
$ bash hello.sh
```


### Variables

```bash
NAME="John"

echo ${NAME}    # => John
echo $NAME      # => John
echo "$NAME"    # => John
echo '$NAME'    # => $NAME
echo "${NAME}!" # => John!

NAME = "John" # => Error (about space)
```



### Comments

```bash
# This is an inline Bash comment.
```

```bash
: '
This is a
very neat comment
in bash
'
```
Multi-line comments use `:'` to open and `'` to close




### Arguments

| Expression | Description                            |
| ---        | ---                                    |
| `$1` … `$9`| Parameter 1 ... 9                      |
| `$0`       | Name of the script itself              |
| `$1`       | First argument                         |
| `${10}`	 | Positional parameter 10                |
| `$#`       | Number of arguments                    |
| `$$`       | Process id of the shell                |
| `$*`       | All arguments                          |
| `$@`       | All arguments, starting from first     |
| `$-`       | Current options                        |
| `$_`       | Last argument of the previous command  |

See: [Special parameters](http://wiki.bash-hackers.org/syntax/shellvars#special_parameters_and_shell_variables).



### Functions

```bash
get_name() {
    echo "John"
}

echo "You are $(get_name)"
```

See: [Functions](#functions-2)

### Conditionals {#conditionals-example}

```bash
if [[ -z "$string" ]]; then
    echo "String is empty"
elif [[ -n "$string" ]]; then
    echo "String is not empty"
fi
```

See: [Conditionals](#conditionals-2)

### Brace expansion

```bash
echo {A,B}.js
```
---

| Expression | Description         |
| ---------- | ------------------- |
| `{A,B}`    | Same as `A B`       |
| `{A,B}.js` | Same as `A.js B.js` |
| `{1..5}`   | Same as `1 2 3 4 5` |

See: [Brace expansion](http://wiki.bash-hackers.org/syntax/expansion/brace)

### Shell execution

```bash
echo "I'm in $(PWD)"
# Same
echo "I'm in `pwd`"
```

See: [Command substitution](http://wiki.bash-hackers.org/syntax/expansion/cmdsubst)



Parameter expansions {.cols-3}
--------------------



### Syntax {.row-span-2}

| Code              | Description         |
| ----------------- | ------------------- |
| `${FOO%suffix}`   | Remove suffix       |
| `${FOO#prefix}`   | Remove prefix       |
| `${FOO%%suffix}`  | Remove long suffix  |
| `${FOO##prefix}`  | Remove long prefix  |
| `${FOO/from/to}`  | Replace first match |
| `${FOO//from/to}` | Replace all         |
| `${FOO/%from/to}` | Replace suffix      |
| `${FOO/#from/to}` | Replace prefix      |
#### Substrings
| Expression      | Description                    |
| --------------- | ------------------------------ |
| `${FOO:0:3}`    | Substring _(position, length)_ |
| `${FOO:(-3):3}` | Substring from the right       |
#### Length
| Expression | Description      |
| ---------- | ---------------- |
| `${#FOO}`  | Length of `$FOO` |
#### Default values
| Expression        | Description                                              |
| ----------------- | -------------------------------------------------------- |
| `${FOO:-val}`     | `$FOO`, or `val` if unset                                |
| `${FOO:=val}`     | Set `$FOO` to `val` if unset                             |
| `${FOO:+val}`     | `val` if `$FOO` is set                                   |
| `${FOO:?message}` | Show message and exit if `$FOO` is unset           |



### Substitution

```bash
echo ${food:-Cake}  #=> $food or "Cake"
```


```bash
STR="/path/to/foo.cpp"
echo ${STR%.cpp}    # /path/to/foo
echo ${STR%.cpp}.o  # /path/to/foo.o
echo ${STR%/*}      # /path/to

echo ${STR##*.}     # cpp (extension)
echo ${STR##*/}     # foo.cpp (basepath)

echo ${STR#*/}      # path/to/foo.cpp
echo ${STR##*/}     # foo.cpp

echo ${STR/foo/bar} # /path/to/bar.cpp
```


### Slicing

```bash
name="John"
echo ${name}           # => John
echo ${name:0:2}       # => Jo
echo ${name::2}        # => Jo
echo ${name::-1}       # => Joh
echo ${name:(-1)}      # => n
echo ${name:(-2)}      # => hn
echo ${name:(-2):2}    # => hn

length=2
echo ${name:0:length}  # => Jo
```
See: [Parameter expansion](http://wiki.bash-hackers.org/syntax/pe)



### basepath & dirpath
```bash
SRC="/path/to/foo.cpp"
```

```bash
BASEPATH=${SRC##*/}   
echo $BASEPATH  # => "foo.cpp"


DIRPATH=${SRC%$BASEPATH}
echo $DIRPATH   # => "/path/to/"
```






### Transform 

```bash
STR="HELLO WORLD!"
echo ${STR,}   # => hELLO WORLD!
echo ${STR,,}  # => hello world!

STR="hello world!"
echo ${STR^}   # => Hello world!
echo ${STR^^}  # => HELLO WORLD!

ARR=(hello World)
echo "${ARR[@],}" # => hello world
echo "${ARR[@]^}" # => Hello World
```




Arrays  {.cols-3}
------

### Defining arrays

```bash
Fruits=('Apple' 'Banana' 'Orange')

Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"

ARRAY2=(foo{1..2}) # => foo1 foo2
ARRAY3=({A..D})    # => A B C D

# declare construct
declare -a Numbers=(1 2 3 4 5 6)
```



### Indexing

|         -          |         -             |
|--------------------|-----------------------|
| `${Fruits[0]}`     | First element         |
| `${Fruits[-1]}`    | Last element          |
| `${Fruits[*]}`     | All elements          |
| `${Fruits[@]}`     | All elements          |
| `${#Fruits[@]}`    | Number of all         |
| `${#Fruits}`       | Length of 1st         |
| `${#Fruits[3]}`    | Length of nth         |
| `${Fruits[@]:3:2}` | Range                 |
| `${!Fruits[@]}`    | Keys of all           |



### Iteration

```bash
Fruits=('Apple' 'Banana' 'Orange')

for e in "${Fruits[@]}"; do
    echo $e
done
```
#### With index
```bash
for i in "${!Fruits[@]}"; do
  printf "%s\t%s\n" "$i" "${Fruits[$i]}"
done

```


### Operations {.col-span-2}

```bash
Fruits=("${Fruits[@]}" "Watermelon")     # Push
Fruits+=('Watermelon')                   # Also Push
Fruits=( ${Fruits[@]/Ap*/} )             # Remove by regex match
unset Fruits[2]                          # Remove one item
Fruits=("${Fruits[@]}")                  # Duplicate
Fruits=("${Fruits[@]}" "${Veggies[@]}")  # Concatenate
lines=(`cat "logfile"`)                  # Read from file
```

### Arrays as arguments
```bash
function extract()
{
    local -n myarray=$1
    local idx=$2
    echo "${myarray[$idx]}"
}
Fruits=('Apple' 'Banana' 'Orange')
extract Fruits 2     # => Orangle
```





Dictionaries {.cols-3}
------------

### Defining

```bash
declare -A sounds
```

```bash
sounds[dog]="bark"
sounds[cow]="moo"
sounds[bird]="tweet"
sounds[wolf]="howl"
```


### Working with dictionaries

```bash
echo ${sounds[dog]} # Dog's sound
echo ${sounds[@]}   # All values
echo ${!sounds[@]}  # All keys
echo ${#sounds[@]}  # Number of elements
unset sounds[dog]   # Delete dog
```

### Iteration

```bash
for val in "${sounds[@]}"; do
    echo $val
done
```
---
```bash
for key in "${!sounds[@]}"; do
    echo $key
done
```





Conditionals {.cols-3}
------------

### Integer conditions

| Condition                | Description           |
| ---                      | ---                   |
| `[[ NUM -eq NUM ]]`      | <yel>Eq</yel>ual                 |
| `[[ NUM -ne NUM ]]`      | <yel>N</yel>ot <yel>e</yel>qual             |
| `[[ NUM -lt NUM ]]`      | <yel>L</yel>ess <yel>t</yel>han             |
| `[[ NUM -le NUM ]]`      | <yel>L</yel>ess than or <yel>e</yel>qual    |
| `[[ NUM -gt NUM ]]`      | <yel>G</yel>reater <yel>t</yel>han          |
| `[[ NUM -ge NUM ]]`      | <yel>G</yel>reater than or <yel>e</yel>qual |
| `(( NUM < NUM ))`        | Less than             |
| `(( NUM <= NUM ))`       | Less than or equal    |
| `(( NUM > NUM ))`        | Greater than          |
| `(( NUM >= NUM ))`       | Greater than or equal |


### String conditions

| Condition                | Description           |
| ---                      | ---                   |
| `[[ -z STR ]]`        | Empty string          |
| `[[ -n STR ]]`        | <yel>N</yel>ot empty string      |
| `[[ STR == STR ]]` | Equal                 |
| `[[ STR = STR ]]` | Equal (Same above)                 |
| `[[ STR < STR ]]` | Less than _(ASCII)_                 |
| `[[ STR > STR ]]` | Greater than _(ASCII)_                 |
| `[[ STR != STR ]]` | Not Equal             |
| `[[ STR =~ STR ]]` | Regexp                |






### Example {.row-span-3}

#### String
```bash
if [[ -z "$string" ]]; then
    echo "String is empty"
elif [[ -n "$string" ]]; then
    echo "String is not empty"
else
    echo "This never happens"
fi
```

#### Combinations
```bash
if [[ X && Y ]]; then
    ...
fi
```

#### Equal
```bash
if [[ "$A" == "$B" ]]; then
    ...
fi
```

#### Regex
```bash
if [[ '1. abc' =~ ([a-z]+) ]]; then
    echo ${BASH_REMATCH[1]}
fi
```

#### Smaller
```bash
if (( $a < $b )); then
   echo "$a is smaller than $b"
fi
```

#### Exists
```bash
if [[ -e "file.txt" ]]; then
    echo "file exists"
fi
```





### File conditions {.row-span-2}

| Condition               | Description             |
| ---                     | ---                     |
| `[[ -e FILE ]]`         | <yel>E</yel>xists                  |
| `[[ -d FILE ]]`         | <yel>D</yel>irectory               |
| `[[ -f FILE ]]`         | <yel>F</yel>ile                    |
| `[[ -h FILE ]]`         | Symlink                 |
| `[[ -s FILE ]]`         | Size is > 0 bytes       |
| `[[ -r FILE ]]`         | <yel>R</yel>eadable                |
| `[[ -w FILE ]]`         | <yel>W</yel>ritable                |
| `[[ -x FILE ]]`         | Executable              |
| `[[ f1 -nt f2 ]]` | f1 <yel>n</yel>ewer <yel>t</yel>han f2         |
| `[[ f1 -ot f2 ]]` | f2 <yel>o</yel>lder <yel>t</yel>han f1         |
| `[[ f1 -ef f2 ]]` | Same files              |


### More conditions

| Condition            | Description              |
| -------------------- | ------------------------ |
| `[[ -o noclobber ]]` | If OPTION is enabled |
| `[[ ! EXPR ]]`       | Not |
| `[[ X && Y ]]`       | And |
| `[[ X || Y ]]`       | Or  |


### logical and, or
```bash
if [ "$1" = 'y' -a $2 -gt 0 ]; then
    echo "yes"
fi

if [ "$1" = 'n' -o $2 -lt 0 ]; then
    echo "no"
fi
```



Loops {.cols-3}
-----

### Basic for loop

```bash
for i in /etc/rc.*; do
    echo $i
done
```

### C-like for loop

```bash
for ((i = 0 ; i < 100 ; i++)); do
    echo $i
done
```

### Ranges {.row-span-2}

```bash
for i in {1..5}; do
    echo "Welcome $i"
done
```


#### With step size

```bash
for i in {5..50..5}; do
    echo "Welcome $i"
done
```



### Auto increment

```bash
i=1
while [[ $i -lt 4 ]]; do
    echo "Number: $i"
    ((i++))
done
```

### Auto decrement

```bash
i=3
while [[ $i -gt 0 ]]; do
    echo "Number: $i"
    ((i--))
done
```


### Continue

```bash {data=3,5}
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        continue;
    fi
    echo "$number"
done
```


### Break

```bash
for number in $(seq 1 3); do
    if [[ $number == 2 ]]; then
        # Skip entire rest of loop.
        break;
    fi
    # This will only print 1
    echo "$number"
done
```

### Until
```bash
count=0
until [ $count -gt 10 ]; do
    echo "$count"
    ((count++))
done
```


### Forever 

```bash
while true; do
    # here is some code.
done
```

### Forever (shorthand)
```bash
while :; do
    # here is some code.
done
```


### Reading lines

```bash
cat file.txt | while read line; do
    echo $line
done
```





Functions {.cols-3}
---------

### Defining functions

```bash
myfunc() {
    echo "hello $1"
}
```

```bash
# Same as above (alternate syntax)
function myfunc() {
    echo "hello $1"
}
```

```bash
myfunc "John"
```

### Returning values

```bash
myfunc() {
    local myresult='some value'
    echo $myresult
}
```

```bash
result="$(myfunc)"
```

### Raising errors

```bash
myfunc() {
    return 1
}
```

```bash
if myfunc; then
    echo "success"
else
    echo "failure"
fi
```



Options  {.cols-2}
-------

### Options

```bash
# Avoid overlay files
# (echo "hi" > foo)
set -o noclobber

# Used to exit upon error
# avoiding cascading errors
set -o errexit   

# Unveils hidden failures
set -o pipefail  

# Exposes unset variables
set -o nounset
```

### Glob options

```bash
# Non-matching globs are removed  
# ('*.foo' => '')
shopt -s nullglob   

# Non-matching globs throw errors
shopt -s failglob  

# Case insensitive globs
shopt -s nocaseglob 

# Wildcards match dotfiles 
# ("*.sh" => ".foo.sh")
shopt -s dotglob    

# Allow ** for recursive matches 
# ('lib/**/*.rb' => 'lib/a/b/c.rb')
shopt -s globstar   
```


History {.cols-2}
-------

### Commands

| Command               | Description                               |
| --------------------- | ----------------------------------------- |
| `history`             | Show history                              |
| `shopt -s histverify` | Don't execute expanded result immediately |

### Expansions

| Expression   | Description                                          |
| ------------ | ---------------------------------------------------- |
| `!$`         | Expand last parameter of most recent command         |
| `!*`         | Expand all parameters of most recent command         |
| `!-n`        | Expand `n`th most recent command                     |
| `!n`         | Expand `n`th command in history                      |
| `!<command>` | Expand most recent invocation of command `<command>` |

### Operations

| Code                 | Description                                                           |
| -------------------- | --------------------------------------------------------------------- |
| `!!`                 | Execute last command again                                            |
| `!!:s/<FROM>/<TO>/`  | Replace first occurrence of `<FROM>` to `<TO>` in most recent command |
| `!!:gs/<FROM>/<TO>/` | Replace all occurrences of `<FROM>` to `<TO>` in most recent command  |
| `!$:t`               | Expand only basename from last parameter of most recent command       |
| `!$:h`               | Expand only directory from last parameter of most recent command      |

`!!` and `!$` can be replaced with any valid expansion.

### Slices

| Code     | Description                                                                              |
| -------- | ---------------------------------------------------------------------------------------- |
| `!!:n`   | Expand only `n`th token from most recent command (command is `0`; first argument is `1`) |
| `!^`     | Expand first argument from most recent command                                           |
| `!$`     | Expand last token from most recent command                                               |
| `!!:n-m` | Expand range of tokens from most recent command                                          |
| `!!:n-$` | Expand `n`th token to last from most recent command                                      |

`!!` can be replaced with any valid expansion i.e. `!cat`, `!-2`, `!42`, etc.


Miscellaneous  {.cols-3}
-------------

### Numeric calculations

```bash
$((a + 200))      # Add 200 to $a
```

```bash
$(($RANDOM%200))  # Random number 0..199
```

### Subshells

```bash
(cd somedir; echo "I'm now in $PWD")
pwd # still in first directory
```


### Inspecting commands

```bash
command -V cd
#=> "cd is a function/alias/whatever"
```


### Redirection {.row-span-2 .col-span-2}

```bash
python hello.py > output.txt   # stdout to (file)
python hello.py >> output.txt  # stdout to (file), append
python hello.py 2> error.log   # stderr to (file)
python hello.py 2>&1           # stderr to stdout
python hello.py 2>/dev/null    # stderr to (null)
python hello.py &>/dev/null    # stdout and stderr to (null)
```

```bash
python hello.py < foo.txt      # feed foo.txt to stdin for python
```


### Source relative

```bash
source "${0%/*}/../share/foo.sh"
```

### Directory of script

```bash
DIR="${0%/*}"
```

### Case/switch

```bash
case "$1" in
    start | up)
    vagrant up
    ;;

    *)
    echo "Usage: $0 {start|stop|ssh}"
    ;;
esac
```


### Trap errors {.col-span-2}

```bash
trap 'echo Error at about $LINENO' ERR
```

or

```bash
traperr() {
    echo "ERROR: ${BASH_SOURCE[1]} at about ${BASH_LINENO[0]}"
}

set -o errtrace
trap traperr ERR
```


### printf

```bash
printf "Hello %s, I'm %s" Sven Olga
#=> "Hello Sven, I'm Olga

printf "1 + 1 = %d" 2
#=> "1 + 1 = 2"

printf "Print a float: %f" 2
#=> "Print a float: 2.000000"
```

### Getting options {.col-span-2}

```bash
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
    -V | --version )
    echo $version
    exit
    ;;
    -s | --string )
    shift; string=$1
    ;;
    -f | --flag )
    flag=1
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi
```

### Check for command's result  {.col-span-2}

```bash
if ping -c 1 google.com; then
    echo "It appears you have a working internet connection"
fi
```


### Special variables  {.row-span-2}

| Expression | Description                  |
| ---------- | ---------------------------- |
| `$?`       | Exit status of last task     |
| `$!`       | PID of last background task  |
| `$$`       | PID of shell                 |
| `$0`       | Filename of the shell script |

See [Special parameters](http://wiki.bash-hackers.org/syntax/shellvars#special_parameters_and_shell_variables).


### Grep check  {.col-span-2}

```bash
if grep -q 'foo' ~/.bash_history; then
    echo "You appear to have typed 'foo' in the past"
fi
```


### Backslash escapes {.row-span-2}

- &nbsp; 
- \!
- \"
- \#
- \&
- \'
- \(
- \)
- \,
- \;
- \<
- \>
- \[
- \|
- \\
- \]
- \^
- \{
- \}
- \`
- \$
- \*
- \?
{.cols-4 .style-none}


Escape these special characters with `\`




### Heredoc

```sh
cat <<END
hello world
END
```


### Go to previous directory

```bash
pwd # /home/user/foo
cd bar/
pwd # /home/user/foo/bar
cd -
pwd # /home/user/foo
```


### Reading input

```bash
echo -n "Proceed? [y/n]: "
read ans
echo $ans
```

```bash
read -n 1 ans    # Just one character
```


### Conditional execution

```bash
git commit && git push
git commit || echo "Commit failed"
```


### Strict mode

```bash
set -euo pipefail
IFS=$'\n\t'
```

See: [Unofficial bash strict mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)

