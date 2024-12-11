title=Raku
tags=language, object, functional
summary=A multi-paradigmatic, high-level, general-purpose, gradually typed language that supports Procedural, Object Oriented, and Functional programming.
~~~~~~

[Website](https://raku.org/) | [Guide](https://raku.guide/)

[Rakudo](https://rakudo.org/) ([Source](https://github.com/rakudo/rakudo)) is the compiler for the Raku language

Raku documentation lists the following topics:

* Concurrency
* Inter-process communication
* Classes, objects, modules
* Operator overloading/creation
* Containers
* C-level FFI
* Compile-time traits
* Statement prefixes
* Phasers: Program execution phases and corresponding phaser blocks
* Metaobject protocol (MOP)

### Installation
https://rakubrew.org is a platform independent environment manager (think pyenv for Raku)

#### Linux
To install Rakudo Star, run the following commands from your terminal:

```
mkdir ~/rakudo && cd $_
curl -LJO https://rakudo.org/latest/star/src
tar -xzf rakudo-star-*.tar.gz
mv rakudo-star-*/* .
rm -fr rakudo-star-*

./bin/rstar install

echo "export PATH=$(pwd)/bin/:$(pwd)/share/perl6/site/bin:$(pwd)/share/perl6/vendor/bin:$(pwd)/share/perl6/core/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```

For other Unix options, go to https://rakudo.org/star/source

#### macOS
Four options are available:

* Follow the same steps listed for installing on Linux

* Install with homebrew: `brew install rakudo-star`

* Install with MacPorts: `sudo port install rakudo`

* Get the latest installer (file with .dmg extension) from https://rakudo.org/latest/star/macos

#### Windows
For 64-bit architectures: Get the latest installer (file with .msi extension) from https://rakudo.org/latest/star/win

After installation, make sure C:\rakudo\bin is in the PATH

#### Docker
Get the official Docker image: `docker pull rakudo-star`

Then run a container with the image: `docker run -it rakudo-star`
