title=CBOR (Concise Binary Object Representation)
tags=format, binary
summary=A data format whose design goals include the possibility of extremely small code size, fairly small message size, and extensibility without the need for version negotiation.
~~~~~~

[Website](https://cbor.io/) | [RFC/Specification](https://www.rfc-editor.org/rfc/rfc8949.html)

Additional adjacent specs:

* [RFC 8152: COSE (CBOR Object Signing and Encryption)](https://tools.ietf.org/html/rfc8152)
* [RFC 8392: CBOR Web Token](https://tools.ietf.org/html/rfc8392)
* [RFC 8610: CDDL (Concise Data Definition Language)](https://tools.ietf.org/html/rfc8610)
* [RFC 8742: CBOR sequences](https://www.rfc-editor.org/rfc/rfc8742.html)
* [RFC 8746: Tags for typed arrays](https://www.rfc-editor.org/rfc/rfc8746.html)

[Implementations](https://cbor.io/impls.html): all the big players

Example CDDL:
```
reputation-object = {
  application: tstr
  reputons: [* reputon]
}

reputon = {
  rater: tstr
  assertion: tstr
  rated: tstr
  rating: float16
  ? confidence: float16
  ? normal-rating: float16
  ? sample-size: uint
  ? generated: uint
  ? expires: uint
  * tstr: any
}
```
