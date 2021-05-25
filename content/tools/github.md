title=Github
tags=tool, cloud
summary=Popular open-source cloud repository built around Git.
~~~~~~

[Website](https://github.com)

### Actions


### Tools

[git-hub](https://github.com/ingydotnet/git-hub): Do GitHub operations from the `git` command. The hub subcommand for git, allows you to perform many of the operations made available by GitHub's v3 REST API, from the git commandline command. You can fork, create, delete and modify repositories. You can get information about users, repositories and issues. You can star, watch and follow things, and find out who else is doing the same. The API is quite extensive. With this command you can do many of your day to day GitHub actions without needing a web browser. You can also chain commands together using the output of one as the input of another. For example you could use this technique to clone all the repos of a GitHub user or organization, with one command.

Installation:
* Clone repo
* Then, either:
  * `source /path/to/repo/.rc` or
  * `export PATH=/path/to/repo/lib:$PATH` and `export MANPATH=/path/to/repo/man:$MANPATH` or
  * `DESTDIR=`/path/of/choice/for/git-hub make install` (which may require admin privileges)

### Notes

#### Create a Github Repo in One Command
Create the following bash script (`git-new`):

```
#!/bin/bash

# create a new repo on github
# usage: git-new <repo name>

set -e

name=$1

if [ "$1" ]; then
  mkdir "$name"
  cd "$name"
  echo "# $name" > readme.md
  git init
  git add readme.md
  git commit -m 'first commit'
  git hub repo-new "$name"
  remote=$(git hub repo "$name" | grep URL | awk '{print $3}')
  git remote add origin "$remote"
  git push origin master
else
  echo provide a repo name
fi
```

Note this script uses the "git hub" subcommand mentioned above in Tools.

