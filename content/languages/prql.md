title=PRQL (Pipelined Relational Query Language)
tags=language, storage, tool
summary=A modern language for transforming data — a simple, powerful, pipelined SQL replacement.
~~~~~~

[Website](https://prql-lang.org/) | [Source](https://github.com/PRQL/prql)

Like SQL, it's readable, explicit and declarative. Unlike SQL, it forms a logical pipeline of transformations, and supports abstractions such as variables and functions. It can be used with any database that uses SQL, since it compiles to SQL.

PRQL can be as simple as:

```
from employees
filter country == "USA"                       # Each line transforms the previous result
aggregate [                                   # `aggregate` reduces each column to a value
  max salary,
  min salary,
  count,                                      # Trailing commas are allowed
]
```

Here's a fuller example of the language;

```
from employees
filter start_date > @2021-01-01               # Clear date syntax
derive [                                      # `derive` adds columns / variables
  gross_salary = salary + (tax ?? 0),         # Terse coalesce
  gross_cost = gross_salary + benefits_cost,  # Variables can use other variables
]
filter gross_cost > 0
group [title, country] (                      # `group` runs a pipeline over each group
  aggregate [                                 # `aggregate` reduces each group to a value
    average gross_salary,
    sum_gross_cost = sum gross_cost,          # `=` sets a column name
  ]
)
filter sum_gross_cost > 100000                # `filter` replaces both of SQL's `WHERE` & `HAVING`
derive id = f"{title}_{country}"              # F-strings like python
derive country_code = s"LEFT(country, 2)"     # S-strings allow using SQL as an escape hatch
sort [sum_gross_cost, -country]               # `-country` means descending order
take 1..20                                    # Range expressions (also valid here as `take 20`)
```

