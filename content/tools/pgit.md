title=pgit
tags=tool, presentation, static site generator
summary=Static site generator for git repos.
~~~~~~

[Website](https://git.erock.io/) | [Source](https://github.com/picosh/pgit)

This golang binary will generate a commit log, files, and references based on a git repository and the provided revisions.

It will only generate a commit log and files for the provided revisions.

## Getting Started

```
git clone git@github.com:picosh/pgit.git
cd pgit
make build
```

```
make build
./pgit --revs main --label pico --out ./public
```

To learn more about the options run:

```
./pgit --help
```

Multiple Repos
```
pgit \
  --out ./public/pico \
  --home-url "https://git.erock.io" \
  --revs main \
  --repo ~/pico \
  --root-relative "/pico/"

pgit \
  --out ./public/starfx \
  --home-url "https://git.erock.io" \
  --revs main \
  --repo ~/starfx \
  --root-relative "/starfx/"

echo '<html><body><a href="/pico">pico</a><a href="/starfx">starfx</a></body></html>' > ./public/index.html

rsync -rv ./public/ pgs.sh:/git
```

## Reading

### Articles

- https://www.howtogeek.com/this-easy-tool-gives-me-the-best-of-github-on-my-local-machine/
