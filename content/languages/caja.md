title=Caja
tags=language, object capability, browser
summary=A JavaScript implementation for "virtual iframes" based on the principles of object-capabilities.
~~~~~~

From [Wikipedia](https://en.wikipedia.org/wiki/Caja_project):
> Caja takes JavaScript (technically, ECMAScript 5 strict mode code), HTML, and CSS input and rewrites it into a safe subset of HTML and CSS, plus a single JavaScript function with no free variables. That means the only way such a function can modify an object is if it is given a reference to the object by the host page. Instead of giving direct references to DOM objects, the host page typically gives references to wrappers that sanitize HTML, proxy URLs, and prevent redirecting the page; this allows Caja to prevent certain phishing attacks, prevent cross-site scripting attacks, and prevent downloading malware. Also, since all rewritten programs run in the same frame, the host page can allow one program to export an object reference to another program; then inter-frame communication is simply method invocation.

[Website](http://developers.google.com/caja/) | [Source](https://github.com/google/caja)
