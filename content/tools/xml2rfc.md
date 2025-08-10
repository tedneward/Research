title=XML2RFC
tags=tool, format
summary=IETF Author tools.
~~~~~~

[Website](https://author-tools.ietf.org/)

This service allows you to convert an Internet-Draft from one format into another, including rendered outputs. In the background this service uses id2xml, kramdown-rfc, mmark, rst2rfcxml and xml2rfc, chaining them together as needed to deliver the requested conversion.

The input must be a valid Internet-Draft in one of the following formats:

* XML as .xml (automatically recognises v3 as defined in RFC 7991 and v2 as defined in RFC 7749)
* Markdown as .md or .mkd (kramdown-rfc and mmark dialects are supported)
* reStructuredText (RST) as .rst (Author tools uses rst2rfcxml.)
* Plain text as .txt

