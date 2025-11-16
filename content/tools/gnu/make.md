title=GNU Make
tags=tool, native, build
summary=A build tool with some dependency-based tracking available.
~~~~~~

The original build tool for C/C++ source systems.

## [Learn X in Y Minutes: make](https://learnxinyminutes.com/docs/make/)

A Makefile defines a graph of rules for creating a target (or targets). Its purpose is to do the minimum amount of work needed to update a target to the most recent version of the source.

There are many varieties of make in existence, however this article assumes that we are using GNU make which is the standard on Linux.

```make

# Comments can be written like this.

# File should be named Makefile and then can be run as `make <target>`.
# Otherwise we use `make -f "filename" <target>`.

# Warning - only use TABS to indent in Makefiles, never spaces!

#-----------------------------------------------------------------------
# Basics
#-----------------------------------------------------------------------

# Rules are of the format
# target: <prerequisite>
# where prerequisites are optional.

# A rule - this rule will only run if file0.txt doesn't exist.
file0.txt:
	echo "foo" > file0.txt
		# Even comments in these 'recipe' sections get passed to the shell.
		# Try `make file0.txt` or simply `make` - first rule is the default.

# This rule will only run if file0.txt is newer than file1.txt.
file1.txt: file0.txt
	cat file0.txt > file1.txt
		# use the same quoting rules as in the shell.
	@cat file0.txt >> file1.txt
		# @ stops the command from being echoed to stdout.
	-@echo 'hello'
		# - means that make will keep going in the case of an error.
		# Try `make file1.txt` on the commandline.

# A rule can have multiple targets and multiple prerequisites
file2.txt file3.txt: file0.txt file1.txt
	touch file2.txt
	touch file3.txt

# Make will complain about multiple recipes for the same rule. Empty
# recipes don't count though and can be used to add new dependencies.

#-----------------------------------------------------------------------
# Phony Targets
#-----------------------------------------------------------------------

# A phony target. Any target that isn't a file.
# It will never be up to date so make will always try to run it.
all: maker process

# We can declare things out of order.
maker:
	touch ex0.txt ex1.txt

# Can avoid phony rules breaking when a real file has the same name by
.PHONY: all maker process
	# This is a special target. There are several others.

# A rule with a dependency on a phony target will always run
ex0.txt ex1.txt: maker

# Common phony targets are: all make clean install ...

#-----------------------------------------------------------------------
# Automatic Variables & Wildcards
#-----------------------------------------------------------------------

process: file*.txt	#using a wildcard to match filenames
	@echo $^	# $^ is a variable containing the list of prerequisites
	@echo $@	# prints the target name
	#(for multiple target rules, $@ is whichever caused the rule to run)
	@echo $<	# the first prerequisite listed
	@echo $?	# only the dependencies that are out of date
	@echo $+	# all dependencies including duplicates (unlike normal)
	#@echo $|	# all of the 'order only' prerequisites

# Even if we split up the rule dependency definitions, $^ will find them
process: ex1.txt file0.txt
	# ex1.txt will be found but file0.txt will be deduplicated.

#-----------------------------------------------------------------------
# Patterns
#-----------------------------------------------------------------------

# Can teach make how to convert certain files into other files.

%.png: %.svg
	inkscape --export-png $^

# Pattern rules will only do anything if make decides to create the
# target.

# Directory paths are normally ignored when matching pattern rules. But
# make will try to use the most appropriate rule available.
small/%.png: %.svg
	inkscape --export-png --export-dpi 30 $^

# make will use the last version for a pattern rule that it finds.
%.png: %.svg
	@echo this rule is chosen

# However make will use the first pattern rule that can make the target
%.png: %.ps
	@echo this rule is not chosen if *.svg and *.ps are both present

# make already has some pattern rules built-in. For instance, it knows
# how to turn *.c files into *.o files.

# Older makefiles might use suffix rules instead of pattern rules
.png.ps:
	@echo this rule is similar to a pattern rule.

# Tell make about the suffix rule
.SUFFIXES: .png

#-----------------------------------------------------------------------
# Variables
#-----------------------------------------------------------------------
# aka. macros

# Variables are basically all string types

name = Ted
name2="Sarah"

echo:
	@echo $(name)
	@echo ${name2}
	@echo $name    # This won't work, treated as $(n)ame.
	@echo $(name3) # Unknown variables are treated as empty strings.

# There are 4 places to set variables.
# In order of priority from highest to lowest:
# 1: commandline arguments
# 2: Makefile
# 3: shell environment variables - make imports these automatically.
# 4: make has some predefined variables

name4 ?= Jean
# Only set the variable if environment variable is not already defined.

override name5 = David
# Stops commandline arguments from changing this variable.

name4 +=grey
# Append values to variable (includes a space).

# Pattern-specific variable values (GNU extension).
echo: name2 = Sara # True within the matching rule
	# and also within its remade recursive dependencies
	# (except it can break when your graph gets too complicated!)

# Some variables defined automatically by make.
echo_inbuilt:
	echo $(CC)
	echo ${CXX}
	echo $(FC)
	echo ${CFLAGS}
	echo $(CPPFLAGS)
	echo ${CXXFLAGS}
	echo $(LDFLAGS)
	echo ${LDLIBS}

#-----------------------------------------------------------------------
# Variables 2
#-----------------------------------------------------------------------

# The first type of variables are evaluated each time they are used.
# This can be expensive, so a second type of variable exists which is
# only evaluated once. (This is a GNU make extension)

var := hello
var2 ::=  $(var) hello
#:= and ::= are equivalent.

# These variables are evaluated procedurally (in the order that they
# appear), thus breaking with the rest of the language !

# This doesn't work
var3 ::= $(var4) and good luck
var4 ::= good night

#-----------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------

# make has lots of functions available.

sourcefiles = $(wildcard *.c */*.c)
objectfiles = $(patsubst %.c,%.o,$(sourcefiles))

# Format is $(func arg0,arg1,arg2...)

# Some examples
ls:	* src/*
	@echo $(filter %.txt, $^)
	@echo $(notdir $^)
	@echo $(join $(dir $^),$(notdir $^))

#-----------------------------------------------------------------------
# Directives
#-----------------------------------------------------------------------

# Include other makefiles, useful for platform specific code
include foo.mk

sport = tennis
# Conditional compilation
report:
ifeq ($(sport),tennis)
	@echo 'game, set, match'
else
	@echo "They think it's all over; it is now"
endif

# There are also ifneq, ifdef, ifndef

foo = true

ifdef $(foo)
bar = 'hello'
endif
```

---


- [software carpentry tutorial](http://swcarpentry.github.io/make-novice/)
- A more helpful makefile
	- https://jakemccrary.com/blog/2018/12/27/a-more-helpful-makefile/
- A Super-Simple Makefile for Medium-Sized C/C++ Projects 
	- https://spin.atomicobject.com/2016/08/26/makefile-c-projects/
- A Tutorial on Portable Makefiles
	- http://nullprogram.com/blog/2017/08/20/
- Makefile Tutorial
	- https://gist.github.com/isaacs/62a2d1825d04437c6f08
- Notes for new Make users
	- http://gromnitsky.users.sourceforge.net/articles/notes-for-new-make-users/
- Propositions as Filenames, Builds as Proofs: The Essence of Make
	- https://bentnib.org/posts/2015-04-17-propositions-as-filenames-essence-of-make.html
- Well documented Makefiles (available via `make help`)
	- https://suva.sh/posts/well-documented-makefiles/

#### GNU Make

- GNU Make - http://www.gnu.org/software/make/
	- Manual - https://www.gnu.org/software/make/manual/
- An Empirical Analysis of GNU Make in Open Source Projects
	- 2017 PhD Thesis; [Douglas Martin](http://research.cs.queensu.ca/~doug/research.html)
	- https://qspace.library.queensu.ca/handle/1974/15767
	- Makefile Corpus - http://research.cs.queensu.ca/~doug/files/MakeEgs.tar.gz
	- Makefile Framework - http://research.cs.queensu.ca/~doug/files/MakeFramework.zip
- An Empirical Study of Unspecified Dependencies in Make-Based Build Systems
	- Empirical Software Engineering (2017)
	- Cor-Paul Bezemer, Shane McIntosh, Bram Adams, Daniel M. German, Ahmed E. Hassan
	- https://doi.org/10.1007/s10664-017-9510-8
	- http://rebels.ece.mcgill.ca/journalpaper/2017/03/07/an-empirical-study-of-unspecified-dependencies-in-make-based-build-systems.html
	- http://sail.cs.queensu.ca/Downloads/EMSE2017_AnEmpiricalStudyOfUnspecifiedDependenciesInMake-BasedBuildSystems.pdf
	- Slides: https://www.slideshare.net/corpaulbezemer/an-empirical-study-of-unspecified-dependencies-in-makebased-build-systems
- GNU make - Paul D. Smith - http://make.mad-scientist.net/
	- Paul Smith's Rules of Makefiles - http://make.mad-scientist.net/papers/rules-of-makefiles/
	- Deferred Simple Variable Expansion - http://make.mad-scientist.net/deferred-simple-variable-expansion/
- GNU Make articles - John Graham-Cumming
	- http://blog.jgc.org/2013/02/updated-list-of-my-gnu-make-articles.html
	- https://www.cmcrossroads.com/keyword/type/3037?type=article
	- https://www.cmcrossroads.com/keyword/type/3169?type=article
- GNU Make meets file names with spaces in them - https://www.cmcrossroads.com/article/gnu-make-meets-file-names-spaces-them
- GNU Make Standard Library - http://gmsl.sourceforge.net/
- HOWTO: Intro to GNU make variables - https://blog.melski.net/2015/01/07/howto-intro-to-gnu-make-variables/
- Make is (probably) fine 
	- https://blog.yossarian.net/2019/04/23/Make-is-probably-fine
- Make it simple: An empirical analysis of GNU Make feature use in open source projects
	- International Conference on Program Comprehension 2015
	- Douglas H Martin, James R Cordy, Bram Adams, Giulio Antoniol
	- http://maroon.cs.queensu.ca/home/cordy/Papers/MCAA_ICPC15_Makefiles.pdf
- Managing Projects with GNU Make
	- http://www.wanderinghorse.net/computing/make/
	- http://www.oreilly.com/openbook/make3/book/index.csp
	- https://notendur.hi.is/jonasson/software/make-book/
- Properly using GNU-Make - https://slashvar.github.io/2017/02/13/using-gnu-make.html
- Remake – GNU Make with comprehensible tracing and a debugger
	- http://bashdb.sourceforge.net/remake/
	- https://github.com/rocky/remake
- learn C the hard way [ex2](http://c.learncodethehardway.org/book/ex2.html) [ex28](http://c.learncodethehardway.org/book/ex28.html)

#### NMake
[The Microsoft Program Maintenance Utility (NMAKE.EXE)](https://docs.microsoft.com/en-us/cpp/build/nmake-reference)


