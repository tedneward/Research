title=CFML (Cold Fusion Markup Language)
tags=language, jvm, clr
summary=A scripting language for web development.
~~~~~~

Originally a standalone tool from the early days of Web development. Originally developed by Allaire, later bought by a succession of companies (Macromedia and then Adobe). "Official" version appears to reside with [Adobe](http://www.adobe.com/products/coldfusion) but numerous additional commercial and open-source implementations are out there for JVM and CLR:
* [JVM and CLR: Adobe](https://www.adobe.com/products/coldfusion-family.html)
* [JVM: Lucee](/languages/lucee.html)
* [JVM: Railo](https://github.com/getrailo/railo): Railo runs on the JVM as a servlet, and will work with any servlet container (e.g. Apache Tomcat, Eclipse Jetty) or application server (e.g. JBoss AS, GlassFish). It is possible to connect a web server (e.g. Apache, IIS, nginx, Cherokee) in front, using connectors such as mod jk, mod proxy, or equivalent, but this is not required by Railo. Discontinued, when founders chose instead to work on [Lucee](/languages/lucee.html).
* [JVM and CLR: Blue Dragon](http://www.newatlanta.com/products/bluedragon/) which is now open-source (but I can't find the link to the actual source).
* [JVM: OpenBD](http://openbd.org/)

"Tag" language, in that all development is done using HTML/XML-like tags:
```
<cfset value = "Hello">
<cfset value = "Hello" />
<cfoutput>
   #value# Bob!
</cfoutput>
```

Tags out of the box include:
* Application framework
* Communications
* Control
* Flow-control
* Database manipulation
* Exception handling
* Data output
* Debugging
* Display management
* Extensibility
* File management
* form
* Internet protocol
* Page processing
* Security
* Variable manipulation
* Other tags (cfimage, cfregistry etc.)

Custom tags can be built using host-language facilities (Java or C++).
