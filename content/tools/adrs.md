title=adrs
tags=tool, architecture, reading, format
summary=A command line tool for creating and managing Architecture Decision Records (ADRs).
~~~~~~

[Website](https://joshrotenberg.com/adrs/index.html) | [Source](https://github.com/joshrotenberg/adrs/) | [Running as MCP server](https://joshrotenberg.com/adrs/mcp.html)

## Getting Started

### [Pre-built Binaries](https://joshrotenberg.com/adrs/installation.html#pre-built-binaries)

Pre-built binaries are available for Linux, macOS, and Windows.

#### [Shell Installer (Linux/macOS)](https://joshrotenberg.com/adrs/installation.html#shell-installer-linuxmacos)

```sh
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/joshrotenberg/adrs/releases/latest/download/adrs-installer.sh | sh
```

#### [PowerShell Installer (Windows)](https://joshrotenberg.com/adrs/installation.html#powershell-installer-windows)

```powershell
powershell -ExecutionPolicy Bypass -c "irm https://github.com/joshrotenberg/adrs/releases/latest/download/adrs-installer.ps1 | iex"
```

#### [Homebrew (macOS/Linux)](https://joshrotenberg.com/adrs/installation.html#homebrew-macoslinux)

```sh
brew install adrs
```

#### [Manual Download](https://joshrotenberg.com/adrs/installation.html#manual-download)

Download the appropriate binary from the [releases page](https://github.com/joshrotenberg/adrs/releases).

| Platform | Architecture | Download |
| --- | --- | --- |
| Linux | x86\\_64 | `adrs-x86_64-unknown-linux-gnu.tar.xz` |
| Linux | aarch64 | `adrs-aarch64-unknown-linux-gnu.tar.xz` |
| macOS | x86\\_64 (Intel) | `adrs-x86_64-apple-darwin.tar.xz` |
| macOS | aarch64 (Apple Silicon) | `adrs-aarch64-apple-darwin.tar.xz` |
| Windows | x86\\_64 | `adrs-x86_64-pc-windows-msvc.zip` |

### [From Source](https://joshrotenberg.com/adrs/installation.html#from-source)

#### [Using Cargo](https://joshrotenberg.com/adrs/installation.html#using-cargo)

```sh
cargo install adrs
```

#### [Building from Git](https://joshrotenberg.com/adrs/installation.html#building-from-git)

```sh
git clone https://github.com/joshrotenberg/adrs
cd adrs
cargo build --release
```

The binary will be at `target/release/adrs`.

### [Docker](https://joshrotenberg.com/adrs/installation.html#docker)

A Docker image is available for running `adrs` in containers:

```sh
docker pull ghcr.io/joshrotenberg/adrs:latest
```

Mount your project directory to use it:

```sh
docker run --rm -v $(pwd):/workspace -w /workspace ghcr.io/joshrotenberg/adrs list
```

### [Verify Installation](https://joshrotenberg.com/adrs/installation.html#verify-installation)

```sh
adrs --version
```

### [Shell Completions](https://joshrotenberg.com/adrs/installation.html#shell-completions)

Generate shell completions for your shell:

```sh
# Bash
adrs completions bash > ~/.local/share/bash-completion/completions/adrs

# Zsh
adrs completions zsh > ~/.zfunc/_adrs

# Fish
adrs completions fish > ~/.config/fish/completions/adrs.fish

# PowerShell
adrs completions powershell > $PROFILE.CurrentUserAllHosts
```

Note: Shell completions require rebuilding after updating `adrs`.
