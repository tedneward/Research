title=gitmal
tags=tool, git, static stite generator
summary=A static page generator for Git repositories that generates static HTML pages with files, commits, code highlighting, and markdown rendering.
~~~~~~

[Source](https://github.com/antonmedv/gitmal)

Docker: `docker run --rm -v $(pwd):/repo antonmedv/gitmal /repo`

- `gitmal` generates pages in `./output` based on repo in the cwd
- `gitmal help` to get list of available options

Here are a few examples of repos:

-   [git.medv.io/zx/](https://git.medv.io/zx/) — github.com/google/zx
-   [git.medv.io/zig/](https://git.medv.io/zig/) — codeberg.org/ziglang/zig (light theme)
-   [git.medv.io/my-badges/](https://git.medv.io/my-badges/) — github.com/my-badges/my-badges

## Reading

- [How to Self-Host a Git Repository?](https://github.com/antonmedv/gitmal/blob/master/docs/how-to-self-host-a-git-repository.md)

