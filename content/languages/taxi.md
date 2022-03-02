title=Taxi
tags=language, storage, format
summary=A language for describing API's and their models.
~~~~~~

[Website](https://taxilang.org/) | [Source](https://gitlab.com/taxi-lang/taxi-lang)

## Overview
Taxi allows you to be really expressive about what the meaning is of data returned from an API. By describing the meaning of our data, we can start to make data interchangable.

For example:

```
model Customer {
   id : CustomerId inherits String
   firstName : FirstName inherits String
   lastName : LastName inherits String
}

model Invoice {
   invoiceId : InvoiceId inherits Int
   customerId : CustomerId
}
```

Those Strings now have a little more meaning. And look - we now know that Invoice.customerId and Customer.id describe the same piece of information - a CustomerId.

By building out this set of terms - we create a Taxonomy of interchangable types. This allows us to better document how data is intended to be used. Tooling such as [Vyne](https://vyne.co) can leverage this to link and discover data automatically, and automate API integration.

```
@HttpOperation(method = "GET", url = "http://myApp/customers/{id}")
operation getPerson(id: CustomerId):Customer
```

