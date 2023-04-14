title=Hypertext Application Language (HAL)
tags=format, distribution, hypertext
summary=An open specification describing a generic structure for RESTful resources. 
~~~~~~

[Specification](https://stateless.group/hal_specification.html) | [Source](https://github.com/mikekelly/hal_specification) | [Primer](https://apigility.org/documentation/api-primer/halprimer)

## Examples

* [ParkWhiz](http://developer.parkwhiz.com/v4/)
* [Amazon AppStream](http://docs.aws.amazon.com/appstream/latest/developerguide/rest-api.html#rest-api-hal)
* [FoxyCart](http://wiki.foxycart.com/)
* [haltalk](http://haltalk.herokuapp.com/explorer/browser.html)
* [Audrey](http://audreydemo.aws.af.cm/hal-browser/)
* [University of Oxford / Mobile Oxford](http://api.m.ox.ac.uk/)
* [Clarify API](https://developer.clarify.io/docs/)
* [Artsy API](https://developers.artsy.net)
* [Go About trip planning API](https://apidocs.goabout.com)
* [viagogo API](http://developer.viagogo.net/)
* [SlimPay](https://api-sandbox.slimpay.net/)
* [DXC Developer Central](https://developer.dxc.com/api)

Open Source Projects

* [MultiBit Merchant](https://github.com/gary-rowe/MultiBitMerchant)
* [RESTHeart](http://restheart.org) - The WebApi for MongoDB
* [Open Supporter Data Interface](http://opensupporter.org/)

[Adidas Gitbook](https://adidas.gitbook.io/api-guidelines/rest-api-guidelines/message/hal)

```
{
  "message": "Hello World!",
  "_links": {
    "self": {
      "href": "/greeting"
    }
  }
}
```

The field `_links` has a special meaning in HAL. It denotes a list of link relations - a pair of a relation identifier and a link (URI). These link relations are used to express the relation of a resource with other resources. In our case the "Greeting" resource isn't related to other resources but itself, hence the self relation pointing to the Greeting resource.

NOTE: It is customary for every resource representation to include the `self` link relation.

NOTE: The href MUST always be relative path to the API root (e.g. without the host and scheme).

A more complex document example could be an "Order" resource that has a related resource "Author" (a person who created the order. It might look like:

```
{
  "_links": {
    "self": {
      "href": "/orders/1234"
    },
    "author": {
      "href": "/users/john"
    }
  },
  "orderNumber": 1234,
  "itemCount": 42,
  "status": "pending"
}
```

Let's assume there is an "Orders" resource which is a collection of all orders from different authors. There is the relation between the Orders resource and possibly many Order resources.

We could express this in the `_links` object using the order relation, but sometimes it is practical to "embed" (entirely or partially) related resources representations in the originating resource representation. For a scenario like this HAL offers the `_embedded` field.

The `_embedded` field's object just contains the related resources HAL representations:

```
{
  "_links": {
    "self": { "href": "/orders" }
  },
  "_embedded": {
    "order": [
      {
        "_links": {
          "self": { "href": "/orders/1" }
        },
        "orderNumber": "1",
        "status": "pending"
      },
      {
        "_links": {
          "self": { "href": "/orders/2" }
        },
        "orderNumber": "2",
        "status": "cancelled"
      }      
    ]
  }
}
```

It is important to understand that embedded resource representation might be only partial and might also contain their own embedded resources. The embedded resource representation should be used as a convenience function (e.g. to reduce the initial number of calls needed at application launch). Where a full and up-to-date representation of a resource is needed the link relation should exercise the affordance (e.g. GET /orders/2).

