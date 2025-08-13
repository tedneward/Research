title=HMPL
tags=presentation, browser
summary=Server-oriented customizable templating for JavaScript.
~~~~~~

[Website](https://hmpl-lang.dev/) | [Source](https://github.com/hmpl-language/hmpl)


Alternative to HTMX and Alpine.js.

#### Example

```
<div>
  {{#request src="/api/my-component.html"}}
    {{#indicator trigger="pending"}}
      <p>Loading...</p>
    {{/indicator}}
  {{/request}}
</div>
```

Basic usage:
```
import hmpl from "hmpl-js";

const templateFn = hmpl.compile(
  `<div>
      <button data-action="increment" id="btn">Click!</button>
      <div>Clicks: {{#request src="/api/clicks" after="click:#btn"}}{{/request}}</div>
  </div>`
);

const clicker = templateFn(({ request: { event } }) => ({
  body: JSON.stringify({ action: event.target.getAttribute("data-action") })
})).response;

document.querySelector("#app").append(clicker);
```

