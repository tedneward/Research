title=GitQL
tags=language, native
summary=A query-only language for exercising SQL-like read-only interrogation of Git repositories.
~~~~~~

Example commands:
* select hash, author, message from commits limit 3
* select hash, message from commits where 'hell' in full_message or 'Fuck' in full_message
* select hash, message, author_email from commits where author = 'cloudson'
* select date, message from commits where date < '2014-04-10'
* select message from commits where 'hell' in message order by date asc

[Github](https://github.com/cloudson/gitql)
