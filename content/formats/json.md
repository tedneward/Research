title=JavaScript Object Notation (JSON)
tags=format, specification, ecmascript, browser, nodejs, storage
summary=Object literal syntax from ECMAScript that's since taken off as a data storage and wire transfer format.
~~~~~~

[Website](https://www.json.org/json-en.html) | [ECMA 404 Specification](http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf)

Libraries for JSON processing are too numerous to count; it's almost a rite of passage for any new language to have one.

---

# JSON Schema

JSON Schema is the vocabulary that enables JSON data consistency, validity, and interoperability at scale.

* **Streamline testing and validation.** Simplify your validation logic to reduce your code’s complexity and save time on development. Define constraints for your data structures to catch and prevent errors, inconsistencies, and invalid data.

* **Exchange data seamlessly.** Establish a common language for data exchange, no matter the scale or complexity of your project. Define precise validation rules for your data structures to create shared understanding and increase interoperability across different systems and platforms.

* **Document your data.** Create a clear, standardized representation of your data to improve understanding and collaboration among developers, stakeholders, and collaborators.

* **Vibrant tooling ecosystem.** Adopt JSON Schema with an expansive range of community-driven tools, libraries, and frameworks across many programming languages.

[Website](https://json-schema.org/) | Specification: [JSON Schema Core](https://json-schema.org/draft/2020-12/json-schema-core.html) defines the basic foundation of JSON Schema, [JSON Schema Validation](https://json-schema.org/draft/2020-12/json-schema-validation.html) defines the validation keywords of JSON Schema

---

# JSON-LinkedData (JSON-LD)

[Linked Data](https://en.wikipedia.org/wiki/Linked_data) empowers people that publish and use information on the Web. It is a way to create a network of standards-based, machine-readable data across Web sites. It allows an application to start at one piece of Linked Data, and follow embedded links to other pieces of Linked Data that are hosted on different sites across the Web.

JSON-LD is a lightweight Linked Data format. It is easy for humans to read and write. It is based on the already successful JSON format and provides a way to help JSON data interoperate at Web-scale. JSON-LD is an ideal data format for programming environments, REST Web services, and unstructured databases such as Apache CouchDB and MongoDB.

[Website](https://json-ld.org/) | [GitHub Org](https://github.com/json-ld) | Specifications: [JSON-LD 1.1](http://www.w3.org/TR/json-ld/), [JSON-LD Processing Algorithms and API](http://www.w3.org/TR/json-ld-api/), [JSON-LD 1.1 Framing](http://www.w3.org/TR/json-ld-framing/)

### Example
A simple example of a JSON object with added semantics:

```
{
  "@context": "https://json-ld.org/contexts/person.jsonld",
  "@id": "http://dbpedia.org/resource/John_Lennon",
  "name": "John Lennon",
  "born": "1940-10-09",
  "spouse": "http://dbpedia.org/resource/Cynthia_Lennon"
}
```

The example above describes a person whose name is John Lennon. The difference between regular JSON and JSON-LD is that the JSON-LD object above uniquely identifies itself on the Web and can be used, without introducing ambiguity, across every Web site, Web services and databases in operation today.


