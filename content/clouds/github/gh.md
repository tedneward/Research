title=gh (Github CLI)
tags=cloud, github, tool
summary=The official GitHub CLI tool.
~~~~~~

[Website](https://cli.github.com/) | [Source](https://github.com/cli/cli) | [gh reference](../ghreference)

## Core

### `auth` (Authenticate gh and git with GitHub)

### `browse` (Open the repository in the browser)

### `codespace` (Connect to and manage your codespaces)

### `gist` (Manage gists)

### `issue` (Manage issues)

### `pr` (Manage pull requests)

### `release` (Manage releases)

### `repo` (Manage repositories)

## Actions

### `run` (View details about workflow runs)

### `workflow` (View details about GitHub Actions workflows)

## Additional

### `alias`
Create command shortcuts

### `api`
Make an authenticated GitHub API request

### `completion`
Generate shell completion scripts

### `config`
Manage configuration for gh

### `extension`
Manage gh extensions

[Creating extensions](https://docs.github.com/en/github-cli/github-cli/creating-github-cli-extensions)

`gh create extension create`: Prompts for name and language: Script (bash, Ruby, Python), Go, or "Other precompiled" (C++, Rust, etc).

> The repository name must start with `gh-`. The rest of the repository name is the name of the extension. The repository must have an executable file at its root with the same name as the repository or a set of precompiled binary executables attached to a release.

#### Example: `gh-whoami`

* Create a local directory called `gh-whoami`.

* In `gh-whoami`, create an executable file (such as a bash script) with the same name as the directory. Note: Make sure that your file is executable. On Unix, you can execute `chmod +x file_name` in the command line to make file_name executable. On Windows, you can run `git init -b main`, `git add file_name`, then `git update-index --chmod=+x file_name`.

* Write your script:

        #!/usr/bin/env bash
        set -e
        exec gh api user --jq '"You are @\(.login) (\(.name))."'

* From your directory, install the extension as a local extension.

        gh extension install .

* Verify that your extension works. 

        gh whoami

* From your directory, create a repository to publish your extension.

        git init -b main
        git add . && git commit -m "initial commit"
        gh repo create gh-whoami --source=. --public --push



### `gpg-key`
Manage GPG keys

### `label`
Manage labels

### `search`
Search for repositories, issues, pull requests and users

### `secret`
Manage GitHub secrets

### `ssh-key`
Manage SSH keys

### `status` 
Print information about relevant issues, pull requests, and notifications across repositories
