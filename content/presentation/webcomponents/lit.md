title=Lit
tags=presentation, browser
summary=Elements on top of WebComponents.
~~~~~~

[Website](https://lit.dev/) | [Source](https://github.com/lit/lit/) | [Tutorial](https://lit.dev/tutorial/)

Builds on top of Web Components.

```ts
import {html, css, LitElement} from 'lit';
import {customElement, property} from 'lit/decorators.js';

@customElement('simple-greeting')  // (1)
export class SimpleGreeting extends LitElement {
  static styles = css`p { color: blue }`;  // (2)

  @property()       // (3)
  name = 'Somebody';

  render() {
    return html`<p>Hello, ${this.name}!</p>`;  // (4)
  }
}
```

1. **Custom Elements** Lit components are standard custom elements, so the browser treats them exactly like built-in elements. Use them in hand-written HTML or framework code, output them from your CMS or static site builder, even create instances in JavaScript — they just work!

2. **Scoped styles** Lit scopes your styles by default, using Shadow DOM. This keeps your CSS selectors simple and ensures that your component’s styles don't affect — and aren't affected by — any other styles on the page.

3. **Reactive properties** Declare reactive properties to model your component’s API and internal state. A Lit component efficiently re-renders whenever a reactive property (or corresponding HTML attribute) changes.

4. **Declarative templates** Lit templates, based on tagged template literals, are simple, expressive and fast, featuring HTML markup with native JavaScript expressions inline. No custom syntax to learn, no compilation required.

```
<simple-greeting name="World"></simple-greeting>
```

