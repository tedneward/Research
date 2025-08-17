title=HTMX
tags=presentation, browser
summary=Thin layer over HTML, seeking to apply consistency and simplify the browser programming model.
~~~~~~
htmx allows you to access AJAX, CSS Transitions, WebSockets and Server Sent Events directly in HTML, using attributes, so you can build modern user interfaces with the simplicity and power of hypertext.

htmx is the successor to [intercooler.js](http://intercoolerjs.org/).

[Website](https://htmx.org/) | [Source](https://github.com/bigskysoftware/htmx) | [Essays](https://htmx.org/essays/)

### AJAX
The core of htmx is a set of attributes that allow you to issue AJAX requests directly from HTML:

Attribute | Description
--------- | -----------
hx-get | Issues a GET request to the given URL
hx-post | Issues a POST request to the given URL
hx-put | Issues a PUT request to the given URL
hx-patch | Issues a PATCH request to the given URL
hx-delete | Issues a DELETE request to the given URL

Each of these attributes takes a URL to issue an AJAX request to. The element will issue a request of the specified type to the given URL when the element is triggered:

```html
  <div hx-put="/messages">
    Put To Messages
  </div>
```

This tells the browser:

> When a user clicks on this div, issue a PUT request to the URL /messages and load the response into the div

