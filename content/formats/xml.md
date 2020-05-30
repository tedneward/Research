title=Extensible Markup Language (XML)
tags=format, distribution, presentation
summary=Data or presentation format inspired by HTML and SGML, used extensively in software development.
~~~~~~

[Website](https://www.w3.org/XML/)

## Specifications around XML
[XML 1.0](https://www.w3.org/TR/2008/REC-xml-20081126/): Fifth Edition, adopted 2008 || [XML 1.1](https://www.w3.org/TR/2006/REC-xml11-20060816/): Second Edition. Mostly about Unicode. Not really necessary unless you need the 1.1-specific features specifically.

[Infoset](https://www.w3.org/TR/2004/REC-xml-infoset-20040204/): The underlying data model of any XML document. Specifying this allows for the actual file representation to vary (permitting binary or other representation syntax).

[Namespaces 1.0](https://www.w3.org/TR/2006/REC-xml-names-20060816/): Lexical separation of different XML tag languages within the same document. Confusing at first for some, particularly considering many people don't bother using multiple XML tag languages within the same document. || [Namespaces 1.1](https://www.w3.org/TR/2006/REC-xml-names11-20060816/): Allows for IRIs as well as URIs, and allows for the "undeclaration" of a namespace.

[XInclude 1.0](http://www.w3.org/TR/2006/REC-xinclude-20061115/): Syntactically and semantically include a different file into the same document. Hugely useful to break large infosets into smaller (more manageable) files. || [XML Base](http://www.w3.org/TR/2009/REC-xmlbase-20090128/): Allows establishing a "base" from which relative links (such as with XInclude) can be resolved.

[XML Stylesheets](https://www.w3.org/TR/xml-stylesheet/): References to xml-stylesheets; not the same as specifying the actual stylesheet language (XSLT).

#### Extensible Stylesheets (XSLT and friends)
[XSL: Transformations](http://www.w3.org/TR/xslt): A language (written in XML) for doing functional-style transformations of an XML infoset into a different representation (XML or otherwise).

[XSL: Formatting Objects](http://www.w3.org/TR/xsl): A language (written in XML) for defining formatting and presentation, usually as the second step in an XSLT-to-presentation toolchain. [Apache Fop](http://xmlgraphics.apache.org/fop/) is the safest bet for doing XSL:FO here, although other implementations ([renderX](http://www.renderx.com/), [ecrion](http://www.ecrion.com/), [Ibex](http://www.xmlpdf.com/), [alt-soft](https://www.alt-soft.com/) and [Antenna House](http://www.antennahouse.com/) are referenced [here](https://stackoverflow.com/questions/1455443/what-are-the-leading-xsl-fo-implementations-how-do-i-decide-among-them)) are available but not necessarily free. Most of the time the target output format for XSL:FO is [PDF](pdf.html). [DocBook](/presentation/docbook.html) makes heavy use of XSLT and XSL:FO to do its processing and output.

[XPath](http://www.w3.org/TR/xpath): An expression language used to reference parts of an XML document. Highly leveraged from XSLT for identifying the patterns from which to base transformation rules.

#### XQuery
XQuery 3.1 and XPath 3.1 [DataModel (XDM)](https://www.w3.org/TR/query-datamodel-3): Data model underlying XQuery query language. Used with [Functions and Operators](https://www.w3.org/TR/xpath-functions-31/).

#### XML Schema (XSD)
