title=Logica
tags=language, storage, logic
summary=A logic programming language that compiles to StandardSQL and runs on Google BigQuery.
~~~~~~

[Website](https://logica.dev/) | [Source](https://github.com/EvgSkv/logica) | [Docs](https://logica-web.github.io/) | [Playground](https://logica.dev/sandbox.html) | [Tutorial](https://colab.research.google.com/github/EvgSkv/logica/blob/main/tutorial/Logica_DuckDB_tutorial.ipynb)

Logica is an open source declarative logic programming language for data manipulation.

Logica extends syntax of logic programming for intuitive and efficient data manipulation. It compiles to SQL thus providing you access to the power of SQL engines with the convenience of logic programming syntax.

Logica can compiles to SQL dialects of DuckDB, SQLite, Google BigQuery and Postgres. This makes it practical for a wide range of applications. Almost every computational device comes with SQLite and thus you can run Logica there. DuckDB is a powerful on-device computation engine with robust SQL semantics that is easy to install and can efficiently leverage parallelism of modern devices. Google BigQuery is a distributed datawarehouse capable of processing terabytes of data in seconds and PostgreSQL is the most popular open source SQL engine.

Thus Logica reaches widely into SQL ecosystem and can be employed by professionals willing to stay with the clarity of logic reasoning while performing data analysis.

One may say that for programming languages like Python and Java functions are the basic building blocks. For Logica and other logic programming languages those building blocks are predicates. Logic program is defined as a set of rules that define output predicates from pre-defied predicates. Those pre-defined predecates represent input data. For example here is a rule to identify names of expensive books, from an existing table of book prices.

        # Logica rule to get expensive books.
        ExpensiveBook(book_name) :-   # book_name is expensive if and only if
        Book(book_name, price),     # book_name costs price
        price > 100;                # and price is greater than 100.

If you are familiar with SQL, you may see that the rule above is equivalent to the flowing SQL statement. Not that familiarity with SQL is required to learn Logica, not at all.

        # SQL statement to get expensive books.
        SELECT book_name
        FROM book
        WHERE price > 100;

Predicate is a statement with variables. Any table can be treated as predicate, where column names are the variables, and each row is a set of values of the variables that satisfies the statement. While SQL is quite convenient for small queries like the one above it gets hard to read when complexity grows. Logica leverages power of mathematical syntax to scale nicely as complexity grows. Let's assume we have a table BabyNames that for each name, year, city and gender specifies number of babies of that name born. The following program finds a list of popular names, where a name is defined as popular if it was the most popular name on some year.

        # Count babies per year.
        NameCountByYear(name:, year:) += number :-
        BabyNames(name:, year:, number:);
        
        # For each year pick the most popular.
        TopNameByYear(year) ArgMax= name -> NameCountByYear(name:, year:);

        # Accumulate most popular name into a table, droppig the year.
        PopularName(name: TopNameByYear());

Sometimes data analysis requires solving algorithmic problems. Logica's syntax is suited for it naturally. Here is a program finding prime numbers that are less than 100.

        # Define numbers 1 to 30.
        Number(x + 1) :- x in Range(30);

        # Defining composite numbers.
        Composite(a * b) distinct :- Number(a), Number(b), a > 1, b > 1;

        # Defining primes as "not composite".
        Prime(n) distinct :- Number(n), n > 1, ~Composite(n);

Finally here is an example of program that runs over GDELT Project dataset, finding people mentioned in the context of "artificial general intelligence".

Observe that program is divided into a rule defining predicate NewsData and rule for AgiMentions. The first rule is essentially doing data cleaning, formatting the dataset in a shape that is convenient to use. Then second rule peforms the task at hand.

In Logica problems are naturally split into smaller components that end up reusable. So in the future if we have more analysis to do with GDELT dataset we may take advantage of the NewsData predicate that we just wrote.

        # Structuring the data conveniently.
        NewsData(year:, month:, day:, persons:, quotations:) :-
        gdelt-bq.gdeltv2.gkg(persons: persons_str, quotations:, date: date_num),
        # Column `data` in GDELT dataset is given as an integer.
        year == ToInt64(Substr(ToString(date_num), 1, 4)),
        month == ToInt64(Substr(ToString(date_num), 5, 2)),
        day == ToInt64(Substr(ToString(date_num), 7, 2)),
        persons List= (person :- person in Split(persons_str, ";"));

        # Performing the task at hand.
        @OrderBy(AgiMentions, "mentions desc");
        @Limit(AgiMentions, 10);
        AgiMentions(person:, mentions? += 1) distinct :-
        person in persons,
        Like(quotations, "%artificial general intelligence%"),
        NewsData(persons:, quotations:);

This program completes in interactive time when ran over the 4TB dataset via BigQuery.

## Installation
Install Logica with `pip`.

        # Install:
        $ python3 -m pip install logica
        # Run:
        $ python3 -m logica
        # (optional) Create alias for convenience:
        alias logica=python3 -m logica

Let's say this program is written in file hello.l.

        @Engine("sqlite");
        Greeting("Hello world!");

When exectued with

        $ logica hello.l run Greeting

it should produce the following table:

        +--------------+
        |     col0     |
        +--------------+
        | Hello world! |
        +--------------+

