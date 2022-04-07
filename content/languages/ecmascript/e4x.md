title=E4X (ECMAScript for XML)
tags=language, dynamic, nodejs
summary=An early attempt to embed hierarchical data/XML syntax functionality within the ECMAScript language. Since deprecated.
~~~~~~

[ECMA-357 Specification](https://www.ecma-international.org/publications-and-standards/standards/ecma-357/) ([PDF](https://www.ecma-international.org/wp-content/uploads/ECMA-357_2nd_edition_december_2005.pdf)) | [Rhino Javascript implementation](https://github.com/mozilla/rhino)


## Reading

* [XML.com "Exploring E4X"](https://www.xml.com/pub/a/2007/11/28/introducing-e4x.html)

## Examples

```
var phoneBook = <phoneBook>
    <phoneEntry>         
        <name>Joe Schwartz</name>         
        <phoneNumber>342-2351</phoneNumber>    
    </phoneEntry>    
</phoneBook>

var phoneBook = new XML(phoneBookStr);
```

```
var a = "bar";    
var data = <foo id={a+(3+4)}>{a+" "+"bat"}</foo>;
print(data); // => <foo id="bar7">bar bat</foo>
```

```
var phoneBook = <phoneBook>    
    <phoneEntry>         
       <name>Joe Schwartz</name>         
       <phoneNumber>342-2351</phoneNumber>    
    </phoneEntry>    
</phoneBook>;

var phoneBookStr = phoneBook.toXMLString();
/*
=> "<phoneBook>    
   <phoneEntry>         
      <name>Joe Schwartz</name>         
      <phoneNumber>342-2351</phoneNumber>    
   </phoneEntry>    
</phoneBook>"
*/
```

```
var phoneBook = <phoneBook>    
    <phoneEntry>         
        <name>Joe Schwartz</name>         
        <phoneNumber>342-2351</phoneNumber>    
    </phoneEntry>    
    <phoneEntry>         
        <name>Aleria Delamare</name>         
        <phoneNumber>342-7721</phoneNumber>    
    </phoneEntry>    
    <phoneEntry>         
        <name>Susan Sto Helit</name>         
        <phoneNumber>315-2987</phoneNumber>    
    </phoneEntry>    
    <phoneEntry>         
        <name>Kyle Martin</name>
         <phoneNumber>342-7219</phoneNumber>    
    </phoneEntry> 
</phoneBook>

print(phoneBook.phoneEntry.length()); // =>4
print(phoneBook.phoneEntry[0]);

/*
=>    
<phoneEntry>         
   <name>Joe Schwartz</name>         
   <phoneNumber>342-2351</phoneNumber>    
</phoneEntry>
*/

var entry0 = phoneBook["phoneEntry"][0];
print(entry0.name);     // => "Joe Schwartz"
print(entry0["name"]);  // => "Joe Schwartz"
```



