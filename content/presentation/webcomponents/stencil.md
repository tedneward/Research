title=Stencil
tags=presentation, language, webcomponents
summary=A compiler that generates Web Components (more specifically, Custom Elements). Stencil combines the best concepts of the most popular frameworks into a simple build-time tool.
~~~~~~

[Website](https://stenciljs.com/docs/introduction) | [Source](https://github.com/ionic-team/stencil)

Stencil uses TypeScript, JSX, and CSS to create standards-based Web Components that can be used to craft high quality component libraries, design systems, and applications.

Stencil generates standards-compliant Web Components that can work with popular frameworks right out of the box. In addition, Stencil can be used to generate framework native components that can be used just like any other components in your framework of choice. Stencil accomplishes this by wrapping your Web Components via Stencil's Output Target feature.

Example:
```
import { Component, Prop, h } from '@stencil/core';

@Component({
  tag: 'my-first-component',
})
export class MyComponent {

  // Indicate that name should be a public property on the component
  @Prop() name: string;

  render() {
    return (
      <p>
        My name is {this.name}
      </p>
    );
  }
}
```
Once compiled, this component can be used in HTML just like any other tag.
```
<my-first-component name="Max"></my-first-component>
```
