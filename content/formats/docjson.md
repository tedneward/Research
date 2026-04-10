title=DocJSON
tags=format, document
summary=A simple document format for building Hypermedia Web APIs.
~~~~~~

[Source](https://github.com/rszrama/docjson)

A DocJSON document consists of standard JSON, with the addition of a set of hypermedia controls that are used to express the actions that may be taken.  DocJSON is a flexible document format and does not impose any structural restrictions either on the data representation style, or on the layout of hypermedia controls used within the document.

## Specification

**Warning:** *The DocJSON specification is currently in draft, and is subject to change at any time.*

A document may be any valid JSON, with the single restriction that the object key `"_type"` is reserved. An JSON object which contains a key named `"_type"` is considered a control object.

Any URLs within a document may be either relative or absolute.  Relative URLs should be resolved with respect to the original document URL.

The following control objects are currently supported:

### Link

A DocJSON link is a control element that represents a hyperlink that may be followed by the client.

* A link is any JSON object containing the `"_type"` key with a value of `"link"`.
* A link must have a key named `href`, which must contain a URL.

#### Example

    {
        "_type": "link",
        "href": "http://todo.example.com/?completed=True"
    }

### Form

A DocJSON form is a control element that enables arbitrary actions to be taken by the client.  Forms specify the URL and HTTP method that should be used for the action, as well as the details of any parameters that should be included in the request.

* A link is any JSON object containing the `"_type"` key with a value of `"form"`.
* A form must have a key named `href`, which must contain a URL.
* A form must have a key named `method`, which must contain a valid HTTP method name.
* A form may have a key named `fields`.  If present, it must contain a list of objects.
* Any fields in the list must contain a key named `name`, which must contain a string.
* Any fields in the list may contain a key named `required`, which must contain a boolean.  If not present, the field should be treated as `"required": false`.
 
#### Example

    {
        "_type": "form",
        "href": "http://todo.example.com/create_todo/",
        "method": "POST",
        "fields": [
            {"name": "text", "required": true},
            {"name": "completed"}
        ]
    }

### List

A DocJSON list is a paginated list of data.  The contents of the list may be any type of object, but the server does not have to populate the entire list, and can use pagination to serve further objects to the client on request.

* A link is any JSON object containing the `"_type"` key with a value of `"list"`.
* A list must have a key named `items`, which must contain a list.
* A list should have a key named `next`, which must contain URL, or `null`.
* The target of the `next` link should be a URL that returns a DocJSON List document.

#### Example

    {
        "_type": "list",
        "items": [
            ...
        ]
        "next": "http://todo.example.com/items/?page=2"
    }

---

## Why another Hypermedia format?

None of the existing hypermedia formats meet the particular design goals of DocJSON.

* Collection+JSON presents a full range of hypermedia controls, but is specfic to representing list-like data structures.
* HAL presents link controls, but lacks other hypermedia controls.
* JSON API is specfic to data syncing between client and server, and does not present general purpose hypermedia controls.
* HTML is sometimes used or proposed for Hypermedia APIs, and offers hypermedia controls, but is a poor fit for data representations.

DocJSON is designed with the aim of making developers lives easier, by introducing a flexible data format with a sufficienty complete set of hypermedia controls.  By doing so we enable generic client libraries to be used to interact with DocJSON APIs, rather than rebuilding client libraries from scratch with each new API service.

---

## Example

The following is an example of a DocJSON document representing a simple ToDo API.

    {
        "tabs": {
            "all": {"_type": "link", "href": "/"},
            "active": {"_type": "link", "href": "/?completed=False"},
            "complete": {"_type": "link", "href": "/?completed=True"}
        }
        "search": {
            "_type": "form",
            "method": "GET",
            "href": "/",
            "fields": [
                {"name": "term", "required": true},
            ]
        }
        "add_todo": {
            "_type": "form",
            "method": "POST",
            "href": "/",
            "fields": [
                {"name": "text", "required": true},
                {"name": "completed"}
            ]
        }
        "items": {
            "_type": "list",
            "items": [
                {
                    "delete": {
                        "_type": "form",
                        "method": "DELETE",
                        "href": "/467/"
                    },
                    "edit": {
                        "_type": "form",
                        "method": "PUT",
                        "href": "/467/",
                        "fields": [{"name": "text"}, {"name": "completed"}]
                    },
                    "text": "Call mum",
                    "completed": false,
                },
                {
                    "delete": {
                        "_type": "form",
                        "method": "DELETE",
                        "href": "/466/"
                    },
                    "edit": {
                        "_type": "form",
                        "method": "PUT",
                        "href": "/466/",
                        "fields": [{"name": "text"}, {"name": "completed"}]
                    },
                    "text": "Fix the garage lock",
                    "completed": true,
                },
                ...
            ]
            "next": "/?page=2"
        }

The document presents the API client with the following controls:

* A set of tabs for switching between all notes, and complete or incomplete notes only.
* A search control for displaying notes that match a search string.
* A control for creating new todo notes.
* A paginated list of notes.
* Edit and delete controls for each note.

---

## Using a DocJSON client

Let's take a look at using a client library for DocJSON, to see what it can do.  There's currently a Python implementation.  Other languages are planned.

Create and activate a new virtual environment, run `pip install docjson`, and start python. 

    bash: virtualenv env
    bash: source env/bin/activate
    bash: pip install docjson
    bash: python
    >>> doc = docjson.get('http://docjson.herokuapp.com')
    >>> doc.notes
    [
        {
            'text': 'Call mum',
            'completed': False,
            'delete': form(),
            'edit': form([text], [completed])
        },
        {
            'text': 'Fix the garage lock',
            'completed': False,
            'delete': form(),
            'edit': form([text], [completed])
        },
        ...
    ]

#### Pagination


The first thing to notice here is the ellipsis at the end of our notes list.  That indicates that there are more items in the paginated list that havn't yet been fetched.

If we iterate over the list or fetch an index that we don't yet have then the required pages will automatically be fetched for us.

    >>> doc.notes[6]
    {
        'text': 'File tax return',
        'completed': True,
        'delete': form(),
        'edit': form([text], [completed])
    }

#### Using forms

We can also add new notes...

    >>> for idx in range(3):
    >>>     doc = doc.add_note(text='New note %d' % idx)

Edit an existing note...

    >>> doc = doc.notes[2].edit(completed=True)

Or delete an existing note...

    >>> doc = doc.notes[0].delete()

If we attempt to use a form with incorrect parameters, the client library will alert us.

    >>> doc = doc.add_note()
    ValueError: Missing required parameter 'text'
    
    >>> doc = doc.add_note(foobar='New note')
    ValueError: Unknown parameter 'foobar'

#### Searching

As well as the forms for creating, editing and deleting notes, our document also contains a form for searching the existing notes:

    >>> doc = doc.search(term='garage')
    >>> doc.notes
    [
        {
            'text': 'Fix the garage lock',
            'completed': False,
            'delete': form(),
            'edit': form([text], [completed])
        }
    ]

#### Following links

Finally, let's take a look at using links within the document.  There are a set of links nested under the `'tabs'` object, that we can follow.


    >>> doc.tabs
    {
        all: link(),
        complete: link(),
        incomplete: link()
    }

First let's retrieve a document containing all the completed notes.

    >>> doc = doc.tabs.complete()
    >>> doc.notes
    {
        'text': 'File tax return',
        'completed': True,
        'delete': form(),
        'edit': form([text], [completed])
    }

We can also switch to the `'incomplete'` tab to get document just containing notes that have not been completed.

    >>> doc = doc.tabs.incomplete()
    >>> doc.notes
    [
        {
            'text': 'Call mum',
            'completed': False,
            'delete': form(),
            'edit': form([text], [completed])
        },
        {
            text: 'Fix the garage lock',
            completed: False,
            delete: form()
            edit: form([text], [completed]),
        }
    ]

---

## Writing DocJSON services

DocJSON is of course a language independant format, and you should be able to develop DocJSON services in any decent server-side framework, such as Rails, Django or Node.

The example service used above is developed using Django REST framework.  The source code for the example API [is available on GitHub][server-example].

## Why you should be excited

The `docjson` client we've demonstrated doesn't have an prior knowledge about the server it's communicating with, and yet it's able to present the developer with a complete, ready-to-go library for interacting with the service.

It's simple, discoverable, and the client will always be instantly up to date with any server-side API changes.

DocJSON is appropriate for a very wide range of APIs, as it allows for flexible data representation, and supports a full range of hypermedia controls rather than just hyperlinks, or just CRUD-style interactions.
