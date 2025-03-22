title=Resource Description Framework (RDF)
tags=format, specification, distribution
summary=A data format for Semantic Web involving triplets of data.
~~~~~~

Specifications: [RDF Primer](http://www.w3.org/TR/2014/NOTE-rdf11-primer-20140624/) || [RDF 1.1 Concepts and Abstract Syntax](http://www.w3.org/TR/2014/REC-rdf11-concepts-20140225/) || [RDF 1.1 XML Syntax](http://www.w3.org/TR/rdf-syntax-grammar/) || [RDF 1.1 Semantics](http://www.w3.org/TR/2014/REC-rdf11-mt-20140225/) || [RDF Schema 1.1](http://www.w3.org/TR/rdf-schema/) || [RDF 1.1 Test Cases](http://www.w3.org/TR/2014/NOTE-rdf11-testcases-20140225/)

Serialization formats:

* [Turtle](http://www.w3.org/TR/turtle/): compact, human-friendly
* [N-Triples](http://www.w3.org/TR/n-triples/): easy-to-parse, line-based format that is not as compact as Turtle
* [N-Quads](http://www.w3.org/TR/n-quads/): superset of N-Triples for serializing multiple RDF graphs (see https://web.archive.org/web/20130426135418/http://sw.deri.org/2008/07/n-quads/)
* [JSON-LD](http://www.w3.org/TR/json-ld/): JSON serialization
* N3, or Notation3
* [RDF/XML](http://www.w3.org/TR/rdf-syntax-grammar/): XML-based syntax
* [RDF/JSON](https://www.w3.org/TR/rdf-json/): alternative JSON notation

RDF has a special nomenclature for naming nodes and edges in a graph. Consider this figure:

An edge is called a *triple*, the source node is called a *subject*, the edge name is called a *predicate*, and the target node is called an *object*. Note that in a graph a node can be in the subject position in one triple and in the object position in another triple. Based on this terminology an RDF graph is defined as a set of RDF triples. This definition is not much different than the informal definition given above with one slight change: you cannot have an RDF node without any edges. In other words, the nodes of an RDF graph are not declared separately, rather, they are determined by the edges in that graph.

---

Example of a Beatles album in Turtle from the [Stardog RDF Graph Data tutorial](https://docs.stardog.com/tutorials/rdf-graph-data-model):
```
PREFIX : <http://stardog.com/tutorial/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>

:The_Beatles      rdf:type  :Band .
:The_Beatles      :name     "The Beatles" .
:The_Beatles      :member   :John_Lennon .
:The_Beatles      :member   :Paul_McCartney .
:The_Beatles      :member   :Ringo_Starr .
:The_Beatles      :member   :George_Harrison .
:John_Lennon      rdf:type  :SoloArtist .
:Paul_McCartney   rdf:type  :SoloArtist .
:Ringo_Starr      rdf:type  :SoloArtist .
:George_Harrison  rdf:type  :SoloArtist .
:Please_Please_Me rdf:type  :Album .
:Please_Please_Me :name     "Please Please Me" .
:Please_Please_Me :date     "1963-03-22"^^xsd:date .
:Please_Please_Me :artist   :The_Beatles .
:Please_Please_Me :track    :Love_Me_Do .
:Love_Me_Do       rdf:type  :Song .
:Love_Me_Do       :name     "Love Me Do" .
:Love_Me_Do       :length   125 .
:Love_Me_Do       :writer   :John_Lennon .
:Love_Me_Do       :writer   :Paul_McCartney .
```

Shortcutted example of the above:
```
:The_Beatles      a :Band ;
                  :name "The Beatles" ;
                  :member :John_Lennon , :Paul_McCartney , :George_Harrison , :Ringo_Starr .
:John_Lennon      a :SoloArtist .
:Paul_McCartney   a :SoloArtist .
:Ringo_Starr      a :SoloArtist .
:George_Harrison  a :SoloArtist .
:Please_Please_Me a :Album ;
                  :name "Please Please Me" ;
                  :date "1963-03-22"^^xsd:date ;
                  :artist :The_Beatles ;
                  :track :Love_Me_Do .
:Love_Me_Do       a :Song ;
                  :name "Love Me Do" ;
                  :length 125 ;
                  :writer :John_Lennon , :Paul_McCartney .
```

