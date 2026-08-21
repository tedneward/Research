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

## Interesting formulae to follow up later

* baml: Programming language for agents
* droast: Opinionated Dockerfile linter
* fanficfare: Download fanfiction and original stories as e-books
* git-pkgs-brief: Tool that detects and reports a project's toolchain, configuration, and more
* git-pkgs-forge: Go library and CLI for working with git forges
* git-pkgs-proxy: Lightweight caching proxy for package registries
* gita: Manage multiple git repos with sanity
* mcpsnoop: Transparent proxy and TUI for debugging MCP traffic
* billy: Invoice manager
* luna-display: Use your iPad as a wireless second display
* luna-secondary: Turn a computer or tablet into a second display
* redot: Multi-platform 2D and 3D game engine



