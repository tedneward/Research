title=SuperDB
tags=storage, language
summary=The analytical SQL database that puts JSON and relational tables on equal footing.
~~~~~~

[Website](https://superdb.org/docs/) | [Source](https://github.com/brimdata/super)

---

Used to be the [Zed Project and language](https://zed.brimdata.io/) [Source](https://github.com/brimdata)

"Zed" is an umbrella term that describes a number of different elements of the system:

* The Zed data model is the abstract definition of the data types and semantics that underlie the Zed formats.
* The Zed formats are a family of sequential (ZNG), columnar (VNG), and human-readable (ZSON) formats that all adhere to the same abstract Zed data model.
* A Zed lake is a collection of Zed data stored across one or more data pools with ACID commit semantics and accessed via a Git-like API.
* The Zed language is the system's pipeline language for performing queries, searches, analytics, transformations, or any of the above combined together.
* A Zed query is a Zed script that performs search and/or analytics.
* A Zed shaper is a Zed script that performs data transformation to shape the input data into the desired set of organizing Zed data types called "shapes", which are traditionally called schemas in relational systems but are much more flexible in the Zed system.

--

Also related: The [Zui Desktop Application](https://zui.brimdata.io/docs), a graphical user interface for exploring data in Zed lakes.

