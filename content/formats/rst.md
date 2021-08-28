title=rst (ReStructured Text)
tags=format, python
summary=A file format created by the Python community to write documentation. A markdown language like HTML but is much more lightweight and easier to read.
~~~~~~

[Website](http://docutils.sourceforge.net/docs/user/rst/quickref.html)

## [Learn X in Y minutes Quick Intro]()

It is part of [Docutils](https://docutils.sourceforge.io/rst.html).


### Installation

To use Restructured Text, you will have to install [Python](http://www.python.org) and the `docutils` package.

`docutils` can be installed using the commandline:

```bash
$ easy_install docutils
```

If your system has `pip`, you can use it too:

```bash
$ pip install docutils
```


### File syntax

A simple example of the file syntax:

```
.. Lines starting with two dots are special commands. But if no command can be found, the line is considered as a comment

=========================================================
Main titles are written using equals signs over and under
=========================================================

Note that each character, including spaces, needs an equals sign above and below.

Titles also use equals signs but are only underneath
====================================================

Subtitles with dashes
---------------------

You can put text in *italic* or in **bold**, you can "mark" text as code with double backquote ``print()``.

Special characters can be escaped using a backslash, e.g. \\ or \*.

Lists are similar to Markdown, but a little more involved.

Remember to line up list symbols (like - or \*) with the left edge of the previous text block, and remember to use blank lines to separate new lists from parent lists:    

- First item
- Second item

  - Sub item
    
- Third item

or

* First item
* Second item
    
  * Sub item

* Third item

Tables are really easy to write:

=========== ========
Country     Capital
=========== ========
France      Paris
Japan       Tokyo
=========== ========

More complex tables can be done easily (merged columns and/or rows) but I suggest you to read the complete doc for this :)

There are multiple ways to make links:

- By adding an underscore after a word : Github_ and by adding the target URL after the text (this way has the advantage of not inserting unnecessary URLs in the visible text).
- By typing a full comprehensible URL : https://github.com/ (will be automatically converted to a link)
- By making a more Markdown-like link: `Github <https://github.com/>`_ .

.. _Github: https://github.com/

```


### How to Use It

RST comes with docutils where you have `rst2html`, for example:

```bash
$ rst2html myfile.rst output.html
```

Applications that use the RST format:

- [Pelican](http://blog.getpelican.com/), a static site generator
- [Sphinx](http://sphinx-doc.org/), a documentation generator

