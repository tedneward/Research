title=Git
tags=tool
summary=Distributed version-control system.
~~~~~~

(Just the tool itself; considered separate from [Github](github.html) since it is used by a variety of other source-control providers like [Bitbucket](bitbucket.html).)

[Website](https://www.git-scm.com) || [Pro Git (book)](https://www.git-scm.com/book)

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

