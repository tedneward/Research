title=Git
tags=tool
summary=Distributed version-control system.
~~~~~~

(Just the tool itself; considered separate from [Github](github.html) since it is used by a variety of other source-control providers like [Bitbucket](bitbucket.html).)

[Website](https://www.git-scm.com) | [Docs](http://git-scm.com/docs)

### Graphical cheat sheet

![](https://media.licdn.com/dms/image/D5622AQF8ksdiwWBvyw/feedshare-shrink_800/0/1684905537126?e=1689811200&v=beta&t=P5Pt5DenPxOmgJ_kUJ1-9fq8LykPNB6hrtbJO1_7AW4)

### Cheat sheet

`git init`: Create repository in directory

`git clone {url}`: copy git repo at {url} to local machine

`git status`: show modified files in repo

`git log`: show commit history

`git add -A`: add (stage) changed files for commit

`git commit -m 'message'`: commit changes using 'message' as the commit message

`git pull origin main`: get up to date changes from branch "main"

`git push origin main`: push local changes to remote "origin" on branch "main"

`git branch`: list all local branches

`git branch {branchname}`: create a new branch

`git checkout {branchname}`: switch from current branch to named branch

`git branch -m {newbranchname}`: rename current branch

`git branch -d {branchname}`: delete named branch

`git merge develop`: merge branch "develop" into current branch

`git rm {filename}`: delete (and stage) file

`git stash`: save modified files and staged changes

`git diff {branch1} {branch2}`: diff between named branches

`git rebase {branch}`: put commits of current branch ahead of named branch

* [SalesForce Cheat Sheet](http://res.cloudinary.com/hy4kyit2a/image/upload/SF_git_cheatsheet.pdf)

### Reading

* [Atlassian Git - Tutorials & Workflows](https://www.atlassian.com/git/)
* [A git Primer](https://danielmiessler.com/study/git/) - Daniel Miessler
* [A Visual Git Reference](http://marklodato.github.io/visual-git-guide/index-en.html) - Mark Lodato
* [Conversational Git](http://blog.anvard.org/conversational-git/)
* [git - the simple guide](http://rogerdudler.github.io/git-guide/)
* [Git for Computer Scientists](http://eagain.net/articles/git-for-computer-scientists/)
* [Git For Designers](http://hoth.entp.com/output/git_for_designers.html)
* [Git From The Bottom Up](https://jwiegley.github.io/git-from-the-bottom-up/) - J. Wiegley
* [Git Immersion](http://gitimmersion.com)
* [Git In The Trenches](http://cbx33.github.io/gitt/index.html)
* [Git internals](https://github.com/pluralsight/git-internals-pdf/raw/master/drafts/peepcode-git.pdf) - Scott Chacon (PDF)
* [Git Magic](http://www-cs-students.stanford.edu/~blynn/gitmagic/)
* [Git Notes for Professionals](http://goalkicker.com/GitBook) - Compiled from StackOverflow Documentation (PDF)
* [Git Pocket Guide](https://www.oreilly.com/library/view/git-pocket-guide/9781449327507) - Richard E. Silverman
* [Git Reference](https://web.archive.org/web/20170602211147/http://gitref.org/)
* [Git Succinctly, Syncfusion](https://www.syncfusion.com/resources/techportal/ebooks/git) (PDF, Kindle) (email address *requested*, not required)
* [Git Tutorial](https://www.tutorialspoint.com/git/) - Tutorials Point Ltd. (HTML)
* [Git-Tutorial For-Beginners](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners) - HubSpot Product Team
* [Git Workflows](https://web.archive.org/web/20210910133251/http://documentup.com/skwp/git-workflows-book) - Yan Pritzker *(:card_file_box: archived)*
* [Happy Git and GitHub for the useR](https://happygitwithr.com) - Jenny Bryan
* [How to Collaborate on Github](https://github.com/eonist/How-to-collaborate-on-github) - André J
* [How to Write Better Git Commit Messages](https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages/)
* [Introduction to Git and Github](https://launchschool.com/books/git) - Launch School
* [Introduction to Git and Github - Tutorial](http://cse.unl.edu/~cbourke/gitTutorial.pdf) - Dr. Chris Bourke (PDF)
* [Introduction to Git and GitHub eBook](https://github.com/bobbyiliev/introduction-to-git-and-github-ebook) - Bobby Iliev (Markdown, PDF)
* [Learn Git - Learn Version Control with Git](http://www.git-tower.com/learn/git/ebook/command-line/introduction) - Tobias Günther
* [Oh My Git!](https://ohmygit.org/) ([Docs](https://blinry.itch.io/oh-my-git), [Source](https://github.com/git-learning-game/oh-my-git)): an open source Git learning game
* [Pro Git](http://git-scm.com/book/en/v2) - Scott Chacon
* [Pro Git Reedited](https://leanpub.com/progitreedited/read) - Jon Forrest
* [Ry's Git Tutorial](https://web.archive.org/web/20161121145226/http://rypress.com:80/tutorials/git/index) - Ryan Hodson
* [Think Like (a) Git: A Guide for the Perplexed](http://think-like-a-git.net)

### Websites

* [GitGuys](http://www.gitguys.com/)
* [Learn Git Branching - the most visual and interactive way to learn Git on the web](http://learngitbranching.js.org/)
* [tryGit - A fun interactive way to learn Git.](http://try.github.io/levels/1/challenges/1)

### Videos

* [git-scm - Video Tutorials](http://git-scm.com/videos)
* [The New Boston tutorial to Git covering basic commands and workflow](https://www.youtube.com/playlist?list=PL6gx4Cwl9DGAKWClAD_iKpNC0bGHxGhcx)

# [Learn X in Y Minutes](https://learnxinyminutes.com/docs/git/)
Git is a distributed version control and source code management system.

It does this through a series of snapshots of your project, and it works with those snapshots to provide you with functionality to version and manage your source code.

## Git Architecture

### Repository

A set of files, directories, historical records, commits, and heads. Imagine it as a source code data structure, with the attribute that each source code "element" gives you access to its revision history, among other things.

A git repository is comprised of the .git directory & working tree.

#### .git Directory (component of repository)

The .git directory contains all the configurations, logs, branches, HEAD, and more. [Detailed List.](http://gitready.com/advanced/2009/03/23/whats-inside-your-git-directory.html)

#### Working Tree (component of repository)

This is basically the directories and files in your repository. It is often referred to as your working directory.

### Index (component of .git dir)

The Index is the staging area in git. It's basically a layer that separates your working tree from the Git repository. This gives developers more power over what gets sent to the Git repository.

### Commit

A git commit is a snapshot of a set of changes, or manipulations to your Working Tree. For example, if you added 5 files, and removed 2 others, these changes will be contained in a commit (or snapshot). This commit can then be pushed to other repositories, or not!

### Branch

A branch is essentially a pointer to the last commit you made. As you go on committing, this pointer will automatically update to point to the latest commit.

### Tag

A tag is a mark on specific point in history. Typically people use this functionality to mark release points (v1.0, and so on).

### HEAD and head (component of .git dir)

HEAD is a pointer that points to the current branch. A repository only has 1 *active* HEAD. head is a pointer that points to any commit. A repository can have any number of heads.

### Stages of Git
* Modified - Changes have been made to a file but file has not been committed to Git Database yet
* Staged - Marks a modified file to go into your next commit snapshot
* Committed - Files have been committed to the Git Database

## Commands

### init

Create an empty Git repository. The Git repository's settings, stored
information, and more is stored in a directory (a folder) named ".git".

```bash
$ git init
```

### config

To configure settings. Whether it be for the repository, the system itself,
or global configurations ( global config file is `~/.gitconfig` ).

```bash
# Print & Set Some Basic Config Variables (Global)
$ git config --global user.email "MyEmail@Zoho.com"
$ git config --global user.name "My Name"
```

[Learn More About git config.](http://git-scm.com/docs/git-config)

### help

To give you quick access to an extremely detailed guide of each command. Or to
just give you a quick reminder of some semantics.

```bash
# Quickly check available commands
$ git help

# Check all available commands
$ git help -a

# Command specific help - user manual
# git help <command_here>
$ git help add
$ git help commit
$ git help init
# or git <command_here> --help
$ git add --help
$ git commit --help
$ git init --help
```

### ignore files

To intentionally untrack file(s) & folder(s) from git. Typically meant for
private & temp files which would otherwise be shared in the repository.

```bash
$ echo "temp/" >> .gitignore
$ echo "private_key" >> .gitignore
```

### status

To show differences between the index file (basically your working copy/repo)
and the current HEAD commit.

```bash
# Will display the branch, untracked files, changes and other differences
$ git status

# To learn other "tid bits" about git status
$ git help status
```

### add

To add files to the staging area/index. If you do not `git add` new files to
the staging area/index, they will not be included in commits!

```bash
# add a file in your current working directory
$ git add HelloWorld.java

# add a file in a nested dir
$ git add /path/to/file/HelloWorld.c

# Regular Expression support!
$ git add ./*.java

# You can also add everything in your working directory to the staging area.
$ git add -A
```

This only adds a file to the staging area/index, it doesn't commit it to the
working directory/repo.

### branch

Manage your branches. You can view, edit, create, delete branches using this
command.

```bash
# list existing branches & remotes
$ git branch -a

# create a new branch
$ git branch myNewBranch

# delete a branch
$ git branch -d myBranch

# rename a branch
# git branch -m <oldname> <newname>
$ git branch -m myBranchName myNewBranchName

# edit a branch's description
$ git branch myBranchName --edit-description
```

### tag

Manage your tags

```bash
# List tags
$ git tag

# Create a annotated tag
# The -m specifies a tagging message, which is stored with the tag.
# If you don’t specify a message for an annotated tag,
# Git launches your editor so you can type it in.
$ git tag -a v2.0 -m 'my version 2.0'

# Show info about tag
# That shows the tagger information, the date the commit was tagged,
# and the annotation message before showing the commit information.
$ git show v2.0

# Push a single tag to remote
$ git push origin v2.0

# Push a lot of tags to remote
$ git push origin --tags
```

### checkout

Updates all files in the working tree to match the version in the index, or
specified tree.

```bash
# Checkout a repo - defaults to master branch
$ git checkout

# Checkout a specified branch
$ git checkout branchName

# Create a new branch & switch to it
# equivalent to "git branch <name>; git checkout <name>"

$ git checkout -b newBranch
```

### clone

Clones, or copies, an existing repository into a new directory. It also adds
remote-tracking branches for each branch in the cloned repo, which allows you
to push to a remote branch.

```bash
# Clone learnxinyminutes-docs
$ git clone https://github.com/adambard/learnxinyminutes-docs.git

# shallow clone - faster cloning that pulls only latest snapshot
$ git clone --depth 1 https://github.com/adambard/learnxinyminutes-docs.git

# clone only a specific branch
$ git clone -b master-cn https://github.com/adambard/learnxinyminutes-docs.git --single-branch
```

### commit

Stores the current contents of the index in a new "commit." This commit
contains the changes made and a message created by the user.

```bash
# commit with a message
$ git commit -m "Added multiplyNumbers() function to HelloWorld.c"

# signed commit with a message (user.signingkey must have been set
# with your GPG key e.g. git config --global user.signingkey 5173AAD5)
$ git commit -S -m "signed commit message"

# automatically stage modified or deleted files, except new files, and then commit
$ git commit -a -m "Modified foo.php and removed bar.php"

# change last commit (this deletes previous commit with a fresh commit)
$ git commit --amend -m "Correct message"
```

### diff

Shows differences between a file in the working directory, index and commits.

```bash
# Show difference between your working dir and the index
$ git diff

# Show differences between the index and the most recent commit.
$ git diff --cached

# Show differences between your working dir and the most recent commit
$ git diff HEAD
```

### grep

Allows you to quickly search a repository.

Optional Configurations:

```bash
# Thanks to Travis Jeffery for these
# Set line numbers to be shown in grep search results
$ git config --global grep.lineNumber true

# Make search results more readable, including grouping
$ git config --global alias.g "grep --break --heading --line-number"
```

```bash
# Search for "variableName" in all java files
$ git grep 'variableName' -- '*.java'

# Search for a line that contains "arrayListName" and, "add" or "remove"
$ git grep -e 'arrayListName' --and \( -e add -e remove \)
```

Google is your friend; for more examples
[Git Grep Ninja](http://travisjeffery.com/b/2012/02/search-a-git-repo-like-a-ninja)

### log

Display commits to the repository.

```bash
# Show all commits
$ git log

# Show only commit message & ref
$ git log --oneline

# Show merge commits only
$ git log --merges

# Show all commits represented by an ASCII graph
$ git log --graph
```

### merge

"Merge" in changes from external commits into the current branch.

```bash
# Merge the specified branch into the current.
$ git merge branchName

# Always generate a merge commit when merging
$ git merge --no-ff branchName
```

### mv

Rename or move a file

```bash
# Renaming a file
$ git mv HelloWorld.c HelloNewWorld.c

# Moving a file
$ git mv HelloWorld.c ./new/path/HelloWorld.c

# Force rename or move
# "existingFile" already exists in the directory, will be overwritten
$ git mv -f myFile existingFile
```

### pull

Pulls from a repository and merges it with another branch.

```bash
# Update your local repo, by merging in new changes
# from the remote "origin" and "master" branch.
# git pull <remote> <branch>
$ git pull origin master

# By default, git pull will update your current branch
# by merging in new changes from its remote-tracking branch
$ git pull

# Merge in changes from remote branch and rebase
# branch commits onto your local repo, like: "git fetch <remote> <branch>, git
# rebase <remote>/<branch>"
$ git pull origin master --rebase
```

### push

Push and merge changes from a branch to a remote & branch.

```bash
# Push and merge changes from a local repo to a
# remote named "origin" and "master" branch.
# git push <remote> <branch>
$ git push origin master

# By default, git push will push and merge changes from
# the current branch to its remote-tracking branch
$ git push

# To link up current local branch with a remote branch, add -u flag:
$ git push -u origin master
# Now, anytime you want to push from that same local branch, use shortcut:
$ git push
```

### stash

Stashing takes the dirty state of your working directory and saves it on a
stack of unfinished changes that you can reapply at any time.

Let's say you've been doing some work in your git repo, but you want to pull
from the remote. Since you have dirty (uncommitted) changes to some files, you
are not able to run `git pull`. Instead, you can run `git stash` to save your
changes onto a stack!

```bash
$ git stash
Saved working directory and index state \
  "WIP on master: 049d078 added the index file"
  HEAD is now at 049d078 added the index file
  (To restore them type "git stash apply")
```

Now you can pull!

```bash
git pull
```
`...changes apply...`

Now check that everything is OK

```bash
$ git status
# On branch master
nothing to commit, working directory clean
```

You can see what "hunks" you've stashed so far using `git stash list`. Since the "hunks" are stored in a Last-In-First-Out stack, our most recent change will be at top.

```bash
$ git stash list
stash@{0}: WIP on master: 049d078 added the index file
stash@{1}: WIP on master: c264051 Revert "added file_size"
stash@{2}: WIP on master: 21d80a5 added number to log
```

Now let's apply our dirty changes back by popping them off the stack.

```bash
$ git stash pop
# On branch master
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#
#      modified:   index.html
#      modified:   lib/simplegit.rb
#
```

`git stash apply` does the same thing. Now you're ready to get back to work on your stuff! [Additional Reading.](http://git-scm.com/book/en/v2/Git-Tools-Stashing)

### rebase (caution)

Take all changes that were committed on one branch, and replay them onto another branch. *Do not rebase commits that you have pushed to a public repo*.

```bash
# Rebase experimentBranch onto master
# git rebase <basebranch> <topicbranch>
$ git rebase master experimentBranch
```

[Additional Reading.](http://git-scm.com/book/en/Git-Branching-Rebasing)

### reset (caution)

Reset the current HEAD to the specified state. This allows you to undo merges, pulls, commits, adds, and more. It's a great command but also dangerous if you don't know what you are doing.

```bash
# Reset the staging area, to match the latest commit (leaves dir unchanged)
$ git reset

# Reset the staging area, to match the latest commit, and overwrite working dir
$ git reset --hard

# Moves the current branch tip to the specified commit (leaves dir unchanged)
# all changes still exist in the directory.
$ git reset 31f2bb1

# Moves the current branch tip backward to the specified commit
# and makes the working dir match (deletes uncommitted changes and all commits
# after the specified commit).
$ git reset --hard 31f2bb1
```

### reflog (caution)

Reflog will list most of the git commands you have done for a given time period, default 90 days.

This give you the chance to reverse any git commands that have gone wrong (for instance, if a rebase has broken your application).

You can do this:

1. `git reflog` to list all of the git commands for the rebase

```
38b323f HEAD@{0}: rebase -i (finish): returning to refs/heads/feature/add_git_reflog
38b323f HEAD@{1}: rebase -i (pick): Clarify inc/dec operators
4fff859 HEAD@{2}: rebase -i (pick): Update java.html.markdown
34ed963 HEAD@{3}: rebase -i (pick): [yaml/en] Add more resources (#1666)
ed8ddf2 HEAD@{4}: rebase -i (pick): pythonstatcomp spanish translation (#1748)
2e6c386 HEAD@{5}: rebase -i (start): checkout 02fb96d
```
2. Select where to reset to, in our case its `2e6c386`, or `HEAD@{5}`
3. 'git reset --hard HEAD@{5}' this will reset your repo to that head
4. You can start the rebase again or leave it alone.

[Additional Reading.](https://git-scm.com/docs/git-reflog)

### revert

Revert can be used to undo a commit. It should not be confused with reset which restores the state of a project to a previous point. Revert will add a new commit which is the inverse of the specified commit, thus reverting it.

```bash
# Revert a specified commit
$ git revert <commit>
```

### rm

The opposite of git add, git rm removes files from the current working tree.

```bash
# remove HelloWorld.c
$ git rm HelloWorld.c

# Remove a file from a nested dir
$ git rm /pather/to/the/file/HelloWorld.c
```

### Useful tidbits
["Changing your default branch name from master in Git is easy. Do it now"](https://twitter.com/cecilphillip/status/1493958954434584580): `git config --global init.defaultBranch main`

# Notes from the Git website

## Branching and Merging
"The Git feature that really makes it stand apart from nearly every other SCM out there is its branching model. Git allows and encourages you to have multiple local branches that can be entirely independent of each other. The creation, merging, and deletion of those lines of development takes seconds.

This means that you can do things like:

* Frictionless Context Switching. Create a branch to try out an idea, commit a few times, switch back to where you branched from, apply a patch, switch back to where you are experimenting, and merge it in.

* Role-Based Codelines. Have a branch that always contains only what goes to production, another that you merge work into for testing, and several smaller ones for day to day work.

* Feature Based Workflow. Create new branches for each new feature you're working on so you can seamlessly switch back and forth between them, then delete each branch when that feature gets merged into your main line.

* Disposable Experimentation. Create a branch to experiment in, realize it's not going to work, and just delete it - abandoning the work—with nobody else ever seeing it (even if you've pushed other branches in the meantime).
Branches

Notably, when you push to a remote repository, you do not have to push all of your branches. You can choose to share just one of your branches, a few of them, or all of them. This tends to free people to try new ideas without worrying about having to plan how and when they are going to merge it in or share it with others.

There are ways to accomplish some of this with other systems, but the work involved is much more difficult and error-prone. Git makes this process incredibly easy and it changes the way most developers work when they learn it.

## Distributed
One of the nicest features of any Distributed SCM, Git included, is that it's distributed. This means that instead of doing a "checkout" of the current tip of the source code, you do a "clone" of the entire repository.

* *Multiple Backups*: This means that even if you're using a centralized workflow, every user essentially has a full backup of the main server. Each of these copies could be pushed up to replace the main server in the event of a crash or corruption. In effect, there is no single point of failure with Git unless there is only a single copy of the repository.

* *Any Workflow*: Because of Git's distributed nature and superb branching system, an almost endless number of workflows can be implemented with relative ease.

  * *Subversion-Style Workflow*: A centralized workflow is very common, especially from people transitioning from a centralized system. Git will not allow you to push if someone has pushed since the last time you fetched, so a centralized model where all developers push to the same server works just fine.

  * *Integration Manager Workflow*: Another common Git workflow involves an integration manager — a single person who commits to the 'blessed' repository. A number of developers then clone from that repository, push to their own independent repositories, and ask the integrator to pull in their changes. This is the type of development model often seen with open source or GitHub repositories.

  * *Dictator and Lieutenants Workflow*: For more massive projects, a development workflow like that of the Linux kernel is often effective. In this model, some people ('lieutenants') are in charge of a specific subsystem of the project and they merge in all changes related to that subsystem. Another integrator (the 'dictator') can pull changes from only his/her lieutenants and then push to the 'blessed' repository that everyone then clones from again.

## Staging Area
Unlike the other systems, Git has something called the "staging area" or "index". This is an intermediate area where commits can be formatted and reviewed before completing the commit.

One thing that sets Git apart from other tools is that it's possible to quickly stage some of your files and commit them without committing all of the other modified files in your working directory or having to list them on the command line during the commit.

This allows you to stage only portions of a modified file. Gone are the days of making two logically unrelated modifications to a file before you realized that you forgot to commit one of them. Now you can just stage the change you need for the current commit and stage the other change for the next commit. This feature scales up to as many different changes to your file as needed.

Of course, Git also makes it easy to ignore this feature if you don't want that kind of control — just add a '-a' to your commit command in order to add all changes to all files to the staging area.

---

### Using Git to do keyword-expansion within source files

In general, this appears to be best handled with [Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks). [Official githook doc page](https://www.git-scm.com/docs/githooks).

[StackOverflow: Add author, date, create/modified to a file](https://stackoverflow.com/questions/44948352/git-add-author-date-create-modified-to-a-file?noredirect=1&lq=1) answer directed to [keyword expansion](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_keyword_expansion):

> It turns out that you can write your own filters for doing substitutions in files on commit/checkout. These are called “clean” and “smudge” filters. In the .gitattributes file, you can set a filter for particular paths and then set up scripts that will process files just before they’re checked out (“smudge”, see [The “smudge” filter is run on checkout](https://git-scm.com/book/en/v2/ch00/filters_a).) and just before they’re staged (“clean”, see [The “clean” filter is run when files are staged](https://git-scm.com/book/en/v2/ch00/filters_b).). These filters can be set to do all sorts of fun things.

> The original commit message for this feature gives a simple example of running all your C source code through the indent program before committing. You can set it up by setting the filter attribute in your .gitattributes file to filter *.c files with the “indent” filter:
  ```
  *.c filter=indent
  ```
> Then, tell Git what the “indent” filter does on smudge and clean:
  ```
  $ git config --global filter.indent.clean indent
  $ git config --global filter.indent.smudge cat
  ```

> In this case, when you commit files that match *.c, Git will run them through the indent program before it stages them and then run them through the cat program before it checks them back out onto disk. The cat program does essentially nothing: it spits out the same data that it comes in. This combination effectively filters all C source code files through indent before committing.

> Another interesting example gets $Date$ keyword expansion, RCS style. To do this properly, you need a small script that takes a filename, figures out the last commit date for this project, and inserts the date into the file. Here is a small Ruby script that does that:
```
#! /usr/bin/env ruby
data = STDIN.read
last_date = `git log --pretty=format:"%ad" -1`
puts data.gsub('$Date$', '$Date: ' + last_date.to_s + '$')
```

> All the script does is get the latest commit date from the git log command, stick that into any $Date$ strings it sees in stdin, and print the results – it should be simple to do in whatever language you’re most comfortable in. You can name this file expand_date and put it in your path. Now, you need to set up a filter in Git (call it dater) and tell it to use your expand_date filter to smudge the files on checkout. You’ll use a Perl expression to clean that up on commit:

```
$ git config filter.dater.smudge expand_date
$ git config filter.dater.clean 'perl -pe "s/\\\$Date[^\\\$]*\\\$/\\\$Date\\\$/"'
```

> This Perl snippet strips out anything it sees in a $Date$ string, to get back to where you started. Now that your filter is ready, you can test it by setting up a Git attribute for that file that engages the new filter and creating a file with your $Date$ keyword:

```
date*.txt filter=dater
$ echo '# $Date$' > date_test.txt
```

> If you commit those changes and check out the file again, you see the keyword properly substituted:

```
$ git add date_test.txt .gitattributes
$ git commit -m "Test date expansion in Git"
$ rm date_test.txt
$ git checkout date_test.txt
$ cat date_test.txt
# $Date: Tue Apr 21 07:26:52 2009 -0700$
```
> You can see how powerful this technique can be for customized applications. You have to be careful, though, because the .gitattributes file is committed and passed around with the project, but the driver (in this case, dater) isn’t, so it won’t work everywhere. When you design these filters, they should be able to fail gracefully and have the project still work properly.

