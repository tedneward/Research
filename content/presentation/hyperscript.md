title=Hyperscript
tags=presentation, browser, language
summary=A scripting language designed for modern front-end web development, inspired by Hypercard, and Hypertalk.
~~~~~~

[Website](https://hyperscript.org/) | [Source](https://github.com/bigskysoftware/_hyperscript)

Influenced by [HyperTalk](../languages/hypertalk.html), the language of [HyperCard](hypercard.html).

### Examples
```html
<script src="https://unpkg.com/hyperscript.org@0.8.0"></script>

<button _="on click toggle .big-text">
  Toggle the "big-text" class on me on click
</button>

<div _="on mouseenter toggle .visible on #help until mouseleave">
  Mouse Over Me!
</div>
<div id="help"> I'm a helpful message!</div>

<button _="on click log me then call alert('yep, it\’s an alert')">
    Show An Alert
</button>
```

### Cookbook
Below is a collection of hyperscript snippets for achieving various patterns in web development.

**Hello World - concat two strings**
```html
<p id="first">Hello</p>
<p id="second">World</p>
<button class="btn primary" _="on click set my.innerText to #first.innerText + ' ' + #second.innerText">
  Concat
</button>
```

This example illustrates how to use an event handler to fetch state from other elements, perform a simple operation, and then store that state in another location.

**Set a checkbox to indeterminate state on load/reset**

```html
<form>
<input class="indeterminate" type="checkbox" _="on load set my.indeterminate to true">
<input type="reset" _="on click set .indeterminate.indeterminate to true">
</form>
```

HTML checkboxes technically have three states - checked, unchecked and indeterminate. Oddly, the indeterminate state can only be set via the JavaScript runtime - there is no way to set the state via HTML or CSS alone.

In this example, the checkbox sets the indeterminate state when the page is loaded. In addition, the "indeterminate" class is also set, allowing the handler on the reset button to use a CSS query to reset all matching elements back to the indeterminate state.

**Fade & Remove**

If you wish to fade an element out and remove it from the DOM, you can use something like this:

```html
<button _="on click transition opacity to 0 then remove me">
  Fade & Remove
</button>
```

**Disable a Button During an htmx Request**

If you wish to disable a button during an htmx request, you can use this snippet:

```html
<button
      class="button is-primary"
      hx-get="/example"
      _="on click toggle [disabled='true'] until htmx:afterOnLoad">
      Do It
</button>
```

**Disable all Buttons During an htmx Request**

If you wish to disable every button during an htmx request, you can use this snippet:

```html
<body _="on every htmx:beforeSend in <button:not(.no-disable)/> 
           tell it 
               toggle [disabled='true'] until htmx:afterOnLoad">
      
</body>
```
Here we use the every keyword to avoid queuing events, and then the in modifier to filter only clicks that occur within buttons that do not have the .no-disable class on them. When the body gets an event that matches this requirement, it will toggle the disabled property to true on the button, until it receives an htmx:afterLoad event from the button.

We use the with command to make it (the button) the default target (me) for the toggle command
