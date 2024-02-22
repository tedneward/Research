title=DoIt
tags=storage, distribution, relational
summary=It's Git for Data.
~~~~~~

[Source](https://github.com/dolthub/dolt) | [Docs](https://docs.dolthub.com/introduction/what-is-dolt)

Dolt is a SQL database that you can fork, clone, branch, merge, push and pull just like a git repository. Connect to Dolt just like any MySQL database to run queries or update the data using SQL commands. Use the command line interface to import CSV files, commit your changes, push them to a remote, or merge your teammate's changes.

All the commands you know for Git work exactly the same for Dolt. Git versions files, Dolt versions tables. It's like Git and MySQL had a baby!

We also built [DoltHub](https://www.dolthub.com/), a place to share Dolt databases. We host public data for free!

We built Dolt using the following axioms:

* Git versions files. Dolt versions table schema and table data.
* Dolt will copy the Git command line exactly.
* Dolt will be MySQL compatible.
* Git features in SQL will extend MySQL SQL. Write operations will be procedures. Read operations will be system tables.

