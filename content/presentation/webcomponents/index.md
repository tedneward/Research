title=Web Components
tags=presentation, browser
summary=A set of web platform APIs that allow you to create new custom, reusable, encapsulated HTML tags to use in web pages and web apps. Custom components and widgets build on the Web Component standards, will work across modern browsers, and can be used with any JavaScript library or framework that works with HTML.
~~~~~~

[Website](https://www.webcomponents.org/)

* [Introduction](https://www.webcomponents.org/introduction)
* [Specifications](https://www.webcomponents.org/specs): Four main specifications

    * [Custom Elements](https://w3c.github.io/webcomponents/spec/custom/): lays the foundation for designing and using new types of DOM elements.
    * [Shadow DOM](https://w3c.github.io/webcomponents/spec/shadow/): defines how to use encapsulated style and markup in web components.
    * [ES Modules](https://html.spec.whatwg.org/multipage/webappapis.html#integration-with-the-javascript-module-system): defines the inclusion and reuse of JS documents in a standards based, modular, performant way.
    * [HTML Template](https://html.spec.whatwg.org/multipage/scripting.html#the-template-element/): defines how to declare fragments of markup that go unused at page load, but can be instantiated later on at runtime.
  
* [Libraries](https://www.webcomponents.org/libraries)

    * [Hybrids](https://github.com/hybridsjs/hybrids) is a UI library for creating Web Components with simple and functional API.
    * [LitElement](https://github.com/Polymer/lit-element) uses lit-html to render into the element's Shadow DOM and adds API to help manage element properties and attributes.
    * [Polymer](https://www.polymer-project.org/) provides a set of features for creating custom elements.
    * [Slim.js](http://slimjs.com/) is an opensource lightweight web component library that provides data-binding and extended capabilities for components, using es6 native class inheritance.
    * [Stencil](https://stenciljs.com/) is an opensource compiler that generates standards-compliant web components.

* [Examples](https://github.com/mdn/web-components-examples): The following examples are available:

    -   [composed-composed-path](https://github.com/mdn/web-components-examples/blob/main/composed-composed-path). A very simple example that shows the behavior of the `Event` object `composed` and `composedPath` properties. [See composed-composed-path live](https://mdn.github.io/web-components-examples/composed-composed-path/).
    -   [defined-pseudo-class](https://github.com/mdn/web-components-examples/blob/main/defined-pseudo-class). A very simple example that shows how the `[:defined pseudo-class](https://developer.mozilla.org/en-US/docs/Web/CSS/:defined)` works. [See defined-pseudo-class live](https://mdn.github.io/web-components-examples/defined-pseudo-class/).
    -   [editable-list](https://github.com/mdn/web-components-examples/blob/main/editable-list) – `<editable-list>`. A simple example showing how elements can be consolidated to create a list with addable/removable items. Items are added by using a `list-item` attribute or by entering text and clicking the plus sign. [See editable-list live](https://mdn.github.io/web-components-examples/editable-list/).
    -   [edit-word](https://github.com/mdn/web-components-examples/blob/main/edit-word) — `<edit-word>`. Wrapping one or more words in this element means that you can then click/focus the element to reveal a text input that can then be used to edit the word(s). [See edit-word live](https://mdn.github.io/web-components-examples/edit-word/).
    -   [element-details](https://github.com/mdn/web-components-examples/blob/main/element-details) — `<element-details>`. Displays a box containing an HTML element name and description. Provides an example of an autonomous custom element that gets its structure from a `<template>` element (that also has its own styling defined), and also contains `<slot>` elements populated at runtime. [See element-details live](https://mdn.github.io/web-components-examples/element-details/).
    -   [expanding-list-web-component](https://github.com/mdn/web-components-examples/blob/main/expanding-list-web-component) — `<ul is="expanding-list">`. Creates an unordered list with expandable/collapsible children. Provides an example of a customized built-in element (the class inherits from `HTMLUListElement` rather than `HTMLElement`). [See expanding-list live](https://mdn.github.io/web-components-examples/expanding-list-web-component/).
    -   [life-cycle-callbacks](https://github.com/mdn/web-components-examples/blob/main/life-cycle-callbacks) — `<custom-square l="" c="">`. A trivial example web component that creates a square colored box on the page. The demo also includes buttons to create, destroy, and change attributes on the element, to demonstrate how the [web components life cycle callbacks](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_custom_elements#Using_the_lifecycle_callbacks) work [See life-cycle-callbacks live](https://mdn.github.io/web-components-examples/life-cycle-callbacks/).
    -   [popup-info-box-web-component](https://github.com/mdn/web-components-examples/blob/main/popup-info-box-web-component) — `<popup-info img="" text="">`. Creates an info icon that when focused displays a popup info box. Provides an example of an autonomous custom element that takes information from its attributes, and defines structure and basic style in an attached shadow DOM. [See popup-info-box live](https://mdn.github.io/web-components-examples/popup-info-box-web-component/).
    -   [simple-template](https://github.com/mdn/web-components-examples/blob/main/simple-template) — A very simple trivial example that quickly demonstrates usage of the `<template>` and `<slot>` elements. [See simple-template live](https://mdn.github.io/web-components-examples/simple-template/).
    -   [slotchange example](https://github.com/mdn/web-components-examples/blob/main/slotchange) — `<summary-display>`. An example that takes as its two slot values a list of possible choices, and a description for the selected choice. Multiple paragraphs are included inside the element containing all the possible descriptions; when a choice is clicked, its corresponding description paragraph is given an appropriate slot attribute so that it appears in the second slot. This example is written to demonstrate usage of the slotchange attribute, and features of the HTMLSlotElement interface [See the slotchange example live](https://mdn.github.io/web-components-examples/slotchange).
    -   [slotted-pseudo-element](https://github.com/mdn/web-components-examples/blob/main/slotted-pseudo-element). A very simple example that shows how the `::slotted` pseudo-element works. [See slotted-pseudo-element live](https://mdn.github.io/web-components-examples/slotted-pseudo-element/).
    -   [word-count-web-component](https://github.com/mdn/web-components-examples/blob/main/word-count-web-component) — `<word-count>`. When added to an element, counts all the words inside that element and displays them inside an attached shadow DOM. It also contains an interval that periodically updates the word count as it changes. Provides an example of a customized built-in element (the class inherits from `HTMLParagraphElement` rather than `HTMLElement`). [See word-count live](https://mdn.github.io/web-components-examples/word-count-web-component/).

* [My HTML Web Component boilerplate](https://gomakethings.com/my-html-web-component-boilerplate-for-2026/): the [boilerplate](https://gomakethings.com/snippets/boilerplates/web-component/) 

* Components ("Standalones")

    * ["Generic"](https://genericcomponents.netlify.app/):

        -   [showcase app](https://genericcomponents.netlify.app/demo/demo-app)
        -   [generic-accordion](https://genericcomponents.netlify.app/generic-accordion/demo/)
        -   [generic-alert](https://genericcomponents.netlify.app/generic-alert/demo/)
        -   [generic-dialog](https://genericcomponents.netlify.app/generic-dialog/demo/)
        -   [generic-disclosure](https://genericcomponents.netlify.app/generic-disclosure/demo/)
        -   [generic-listbox](https://genericcomponents.netlify.app/generic-listbox/demo/)
        -   [generic-radio](https://genericcomponents.netlify.app/generic-radio/demo/)
        -   [generic-skiplink](https://genericcomponents.netlify.app/generic-skiplink/demo/)
        -   [generic-spinner](https://genericcomponents.netlify.app/generic-spinner/demo/)
        -   [generic-switch](https://genericcomponents.netlify.app/generic-switch/demo/)
        -   [generic-tabs](https://genericcomponents.netlify.app/generic-tabs/demo/)
        -   [generic-visually-hidden](https://genericcomponents.netlify.app/generic-visually-hidden/demo/)

    * Extensions: Web Components that extend or add to an existing semantic element.

        - [`<accordion-container>`](https://codepen.io/levimcg/pen/ZEYapRY)
        - [`<autosize-textarea>`](https://github.com/andrico1234/autosize-textarea)
        - [`<details-dialog>`](https://github.com/github/details-dialog-element)
        - [`<details-menu>`](https://github.com/github/details-menu-element)
        - [`<details-utils>`](https://github.com/zachleat/details-utils)
        - [`<heading-anchors>`](https://darn.es/heading-anchors-web-component)
        - [`<image-compare>`](https://image-compare-component.netlify.app)
        - [`<link-peek>`](https://darn.es/link-peek-web-component)
        - [`<link-preview>`](https://github.com/rg-wood/link-preview)
        - [`<local-time>`](https://github.com/github/time-elements)
        - [`<play-button>`](https://darn.es/play-button-web-component)
        - [`<random-source>`](https://darn.es/random-source-web-component)
        - [`<relative-time>`](https://github.com/github/time-elements)
        - [`<share-button>`](https://darn.es/share-button-web-component)
        - [`<slide-show>`](https://stephen.band/slide-show/)
        - [`<tab-container>`](https://github.com/github/tab-container-element)
        - [`<task-lists>`](https://github.com/github/task-lists-element)
        - [`<time-ago>`](https://github.com/github/time-elements)

    * Form: Web Components that are, or can be used with, form submissions.

        - [`<aeon-datepicker>`](https://github.com/lamplightdev/aeon)
        - [`<feedback-component>`](https://github.com/RamseyInHouse/feedback-component)
        - [`<file-drop>`](https://github.com/GoogleChromeLabs/file-drop)
        - [`<input-knob>`](https://github.com/GoogleChromeLabs/input-knob)
        - [`<range-slider>`](https://github.com/andreruffert/range-slider-element)
        - [`<show-password-toggle>`](https://github.com/sunnywalker/show-password-toggle)
        - [`<toggle-categories>`](https://codepen.io/nonsalant/pen/OPJLJoL)
        - [`<typesense-minibar>`](https://jquery.github.io/typesense-minibar/demo/)

    * Utility: Useful little Web Components.

        - [`<browser-support>`](https://oddbird.github.io/browser-support/)
        - [`<clipboard-copy>`](https://github.com/github/clipboard-copy-element)
        - [`<duration-property>`](https://darn.es/duration-property-web-component)
        - [`<filter->`](https://github.com/sakamies/filter-element)
        - [`<is-playing>`](https://darn.es/is-playing-web-component)
        - [`<live-filter>`](https://darn.es/live-filter-web-component)
        - [`<log-form>`](https://github.com/knowler/log-form-element)
        - [`<print-button>`](https://codepen.io/nonsalant/pen/yyBmeBp)
        - [`<sample-input>`](https://darn.es/sample-input-web-component)
        - [`<slide-deck>`](https://slide-deck.netlify.app/)
        - [`<storage-form>`](https://darn.es/storage-form-web-component)
        - [`<visual-viewport>`](https://jamesbasoo.com/visual-viewport/)

    * Media: Web Components that are, or can be used with, media of any kind.

        - [`<bluesky-post>`](https://darn.es/bluesky-post-web-component)
        - [`<bluesky-replies>`](https://darn.es/bluesky-replies-web-component)
        - [`<code-pen>`](https://darn.es/code-pen-web-component)
        - [`<lite-youtube>`](https://github.com/paulirish/lite-youtube-embed)
        - [`<mastodon-post>`](https://darn.es/mastodon-post-web-component)
        - [`<model-viewer>`](https://github.com/GoogleWebComponents/model-viewer)
        - [`<pinch-zoom>`](https://github.com/GoogleChromeLabs/pinch-zoom)
        - [`<track-list>`](https://mirisuzanne.github.io/track-list/demo.html)
        - [`<two-up>`](https://github.com/GoogleChromeLabs/two-up)
        - [`<youtube-player>`](https://youtube-player.alanwsmith.com/)

    * Design: Web Components that help with visual presentation.

        - [`<dark-mode-toggle>`](https://github.com/GoogleChromeLabs/dark-mode-toggle)
        - [`<easy-row>`](https://github.com/compmeist/easy-row)
        - [`<flex-grid>`](https://github.com/lekoala/flex-grid)
        - [`<if-/or-/else->`](https://github.com/sakamies/conditional-elements)
        - [`<l-i>`](https://github.com/lekoala/last-icon)
        - [`<scroll-shadow>`](https://github.com/ingmarh/scroll-shadow-element)

    * Custom: Frequently-solved problems in web component form.

        - [`<bt-device>`](https://github.com/mattdsteele/bt-device)
        - [`<html-include>`](https://www.npmjs.com/package//html-include-element)
        - [`<katex-display>`](https://github.com/justinfagnani/katex-elements)
        - [`<no-spoilers>`](https://github.com/andrico1234/no-spoilers)
        - [`<place-holder>`](https://github.com/Noleli/place-holder)
        - [`<pwa-install>`](https://github.com/pwa-builder/pwa-install)

    * Novelty

        - [`<admin-bar>`](https://wbrowar.com/web-components/admin-bar-component)
        - [`<chess-board>`](https://justinfagnani.github.io/chessboard-element/)
        - [`<contrast-details>`](https://darn.es/contrast-details-web-component)
        - [`<plucky-underline>`](https://noahliebman.net/projects/plucky-underline/)
        - [`<spacer-gif>`](https://github.com/erikkroes/spacer-gif)
        - [`<vellum-dice>`](https://github.com/grislyeye/vellum-dice)

    * Accessible: (from https://scottaohara.github.io/accessible_components/) I've *[sic]* built a good handful of accessible markup patterns and widgets at this point. Most of which were bespoke and incorporated into websites/products.  But, there are a baseline patterns I was able to use over and over again, and the following represent the most common widgets that I was able to distill into basic examples (i.e., vanicall html/css/js). Each was based on testing with users, UX and design needs from those past projects, and from following normative specifications & informative notes. 

        * [Accordions (v3)](https://github.com/scottaohara/accessible_accordions)  
        * [ARIA Links (v2)](https://github.com/scottaohara/aria-links)   
        * [ARIA Buttons (v2)](https://github.com/scottaohara/a11y_button)   
        * [Breadcrumb Navigation (v1.1)](https://github.com/scottaohara/a11y_breadcrumbs)  
        * [Clear text field buttons (v1)](https://github.com/scottaohara/clear-text-field-button)
        * [Disclosure Widgets (v2.0.1)](https://github.com/scottaohara/aria_disclosure_widget)  
        * [Landmarks Demonstration](https://github.com/scottaohara/landmarks_demo)
        * [Modal Dialogs (v3 - archived)](https://github.com/scottaohara/accessible_modal_window)
        * [Switch Toggle Web Component (v0)](https://github.com/scottaohara/a11y_switch_web_component)
        * [Switch Toggles (v2.0.1)](https://github.com/scottaohara/aria-switch-button)  
        * [Tab Widgets (v2)](https://github.com/scottaohara/a11y_tab_widget)
        * [Tooltips (v1)](https://github.com/scottaohara/a11y_tooltips) 
        * [Various Styled Form Controls](https://github.com/scottaohara/a11y_styled_form_controls) 

## Reading

### Articles/Blog Posts

* ["WebComponents are not the future"](https://dev.to/ryansolid/web-components-are-not-the-future-48bh)
* ["The Hidden Power of WebComponents"](https://dev.to/besworks/the-hidden-power-of-web-components-1jei)
* ["The Problem with WebComponents"](https://dev.to/besworks/the-problem-with-web-components-4f8)
* ["A Complete Introduction to WebComponents"](https://kinsta.com/blog/web-components/)
* ["Web Components are the Comback Nobody Saw Coming"](https://thenewstack.io/web-components-are-the-comeback-nobody-saw-coming/)

