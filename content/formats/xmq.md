title=XMQ
tags=format, presentation, distribution, storage, tool
summary=A configuration language, data-storage language, logging language compatible with xml/html and json.
~~~~~~

[Website](https://libxmq.org/) | [Source](https://github.com/libxmq/xmq)

*(Essentially another hierarchical data representation.)*

## Example
```
shiporder {
    id   = 889923
    type = container
    shipto(sailing)
    {
        address = 'The Vasa Museum
                   Galärvarvsvägen 14
                   115 21 Stockholm
                   Sweden'
        // Remember to verify coord.
        coord = '''59°19'41.0"N 18°05'29.0"E'''
    }
    rules
}
```
against
```
<shiporder>
  <id>889923</id>
  <type>container</type>
  <shipto sailing="">
    <address>The Vasa Museum
Galärvarvsvägen 14
115 21 Stockholm
Sweden</address>
    <!-- Remember to verify coord. -->
    <coord>59°19'41.0"N 18°05'29.0"E</coord>
  </shipto>
  <rules/>
</shiporder>
```

The XMQ format is easier for a human to read and write than XML/HTML yet it captures exactly the XML/HTML content. It can always be safely pretty printed without introducing significant whitespace. The file-suffix HTMQ is used when working with HTML in the XMQ format. XMQ also maps to JSON.

The hierarchical style should look familiar, but note:

* XMQ files are always UTF8 encoded.
* Safe values after = can be stored as plain text (see 889923 container), no quoting needed!
* Unsafe values (after =) with newlines, whitespace or ( ) { } ' " or leading = & // /* must be quoted.
* Two single quotes always mean the empty string (see sailing).
* In multiline quotes, the incidental indentation is removed (see address).
* Quotes containing quotes are quoted using n+1 single quotes (see coord). Note that two quotes are reserved for the empty string. You will therefore see a single quote ' or three quotes ''' or more quotes.
* Single line comments use // and multi line comments use /* */.
* Comments containing comments are commented using n+1 slashes (eg ///* *///).

This means that you can quote any block of text (except invisible spaces near newlines) with enough single quotes and you can comment any block of text with enough slashes.

The incidental indentation removal and n+1 quotes ideas originated in the expert group for JEP 378 Java Text blocks and was a collaborative effort led by Jim Laskey and Brian Goetz. The seed to the idea to separate desired whitespace from incidental(accidental) whitespace was planted by Kevin Bourrillion and the idea for n+1 quotes came from John Rose. Earlier languages supporting indentation removal are: YAML and HJSON.
