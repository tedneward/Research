title=Homebrew (Linuxbrew)
tags=tool, macos, linux
summary=Package management tool for macOS, Linux.
~~~~~~

[Website](https://brew.sh/) | [Source](https://github.com/Homebrew/brew)

Install script: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Notes
Generate a Brewfile (all the Homebrew-installed packages) by running:

```
brew bundle dump --force
```

`brew bundle dump` also includes installed VS Code extensions!

Install everything in the Brewfile by running:

```
brew bundle install --file=./Brewfile
```

