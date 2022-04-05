title=Cascading StyleSheets (CSS)
tags=presentation, browser
summary=Collections of reading and links on the second triad of the HTML/CSS/JS browser layer.
~~~~~~

["Understanding layout algorithms"](https://www.joshwcomeau.com/css/understanding-layout-algorithms): "The key realization I had is that CSS is so much more than a collection of properties. It's a constellation of inter-connected layout algorithms. Each algorithm is a complex system with its own rules and secret mechanisms. It's not enough to learn what specific properties do. We need to learn how the layout algorithms work, and how they use the properties we provide to them."

From [the CSS Snapshot doc](https://www.w3.org/TR/CSS/):
* **CSS Level 1**: The CSS Working Group considers the CSS1 specification to be obsolete. CSS Level 1 is defined as all the features defined in the CSS1 specification (properties, values, at-rules, etc), but using the syntax and definitions in the CSS2.1 specification. CSS Style Attributes defines its inclusion in element-specific style attributes.

* **CSS Level 2**: Although the CSS2 specification is technically a W3C Recommendation, it passed into the Recommendation stage before the W3C had defined the Candidate Recommendation stage. Over time implementation experience and further review has brought to light many problems in the CSS2 specification, so instead of expanding an already unwieldy errata list, the CSS Working Group chose to define CSS Level 2 Revision 1 (CSS2.1). In case of any conflict between the two specs CSS2.1 contains the definitive definition. Once CSS2.1 became Candidate Recommendation--effectively though not officially the same level of stability as CSS2--obsoleted the CSS2 Recommendation. Features in CSS2 that were dropped from CSS2.1 should be considered to be at the Candidate Recommendation stage, but note that many of these have been or will be pulled into a CSS Level 3 working draft, in which case that specification will, once it reaches CR, obsolete the definitions in CSS2. The CSS2.1 specification defines CSS Level 2 and the CSS Style Attributes specification defines its inclusion in element-specific style attributes.

* **CSS Level 3**: builds on CSS Level 2 module by module, using the CSS2.1 specification as its core. Each module adds functionality and/or replaces part of the CSS2.1 specification. The CSS Working Group intends that the new CSS modules will not contradict the CSS2.1 specification: only that they will add functionality and refine definitions. As each module is completed, it will be plugged in to the existing system of CSS2.1 plus previously-completed modules. From this level on modules are levelled independently: for example Selectors Level 4 may well be completed before CSS Line Module Level 3. Modules with no CSS Level 2 equivalent start at Level 1; modules that update features that existed in CSS Level 2 start at Level 3.

* **CSS Level 4 and beyond**: There is no CSS Level 4. Independent modules can reach level 4 or beyond, but CSS the language no longer has levels. ("CSS Level 3" as a term is used only to differentiate it from the previous monolithic versions.)

## Specs
[CSS Snapshot](https://www.w3.org/TR/CSS/) (list of links to all current specs) | [Index to all terms/Glossary](https://www.w3.org/TR/CSS/#terms)

As of 2021, Cascading Style Sheets (CSS) is defined by the following specifications.

[CSS Level 2](https://www.w3.org/TR/CSS2/), latest revision (including errata) **[CSS2]**: This defines the core of CSS, parts of which are overridden by later specifications. We recommend in particular reading Chapter 2, which introduces some of the basic concepts of CSS and its design principles.

[CSS Syntax Level 3](https://www.w3.org/TR/css-syntax-3/) **[CSS-SYNTAX-3]**: Replaces CSS2§4.1, CSS2§4.2, CSS2§4.4, and CSS2§G, redefining how CSS is parsed.

[CSS Style Attributes](https://www.w3.org/TR/css-style-attr/) **[CSS-STYLE-ATTR]**: Defines how CSS declarations can be embedded in markup attributes.

[Media Queries Level 3](https://www.w3.org/TR/css3-mediaqueries/) **[CSS3-MEDIAQUERIES]**: Replaces CSS2§7.3 and expands on the syntax for media-specific styles.

[CSS Conditional Rules Level 3](https://www.w3.org/TR/css-conditional-3/) **[CSS-CONDITIONAL-3]**: Extends and supersedes CSS2§7.2, updating the definition of @media rules to allow nesting and introducing the @supports rule for feature-support queries.

[Selectors Level 3](https://www.w3.org/TR/selectors-3/) **[SELECTORS-3]**: Replaces CSS2§5 and CSS2§6.4.3, defining an extended range of selectors.

[CSS Namespaces](https://www.w3.org/TR/css-namespaces/) **[CSS3-NAMESPACE]**: Introduces an @namespace rule to allow namespace-prefixed selectors.

[CSS Cascading and Inheritance Level 4](https://www.w3.org/TR/css-cascade-4/) **[CSS-CASCADE-4]**: Extends and supersedes CSS2§1.4.3 and CSS2§6, as well as [CSS-CASCADE-3]. Describes how to collate style rules and assign values to all properties on all elements. By way of cascading and inheritance, values are propagated for all properties on all elements.

[CSS Values and Units Level 3](https://www.w3.org/TR/css-values-3/) **[CSS-VALUES-3]**: Extends and supersedes CSS2§1.4.2.1, CSS2§4.3, and CSS2§A.2.1–3, defining CSS’s property definition syntax and expanding its set of units.

[CSS Custom Properties for Cascading Variables Module Level 1](https://www.w3.org/TR/css-variables-1/) **[CSS-VARIABLES-1]**: Introduces cascading variables as a new primitive value type that is accepted by all CSS properties, and custom properties for defining them.

[CSS Box Model Level 3](https://www.w3.org/TR/css-box-3/) **[CSS-BOX-3]**: Replaces CSS2§8.1, §8.2, §8.3 (but not §8.3.1), and §8.4.

[CSS Color Level 3](https://www.w3.org/TR/css-color-3/) **[CSS-COLOR-3]**: Extends and supersedes CSS2§4.3.6, CSS2§14.1, and CSS2§18.2, introducing an extended range of color values. Also introduces the opacity property.

[CSS Backgrounds and Borders Level 3](https://www.w3.org/TR/css-backgrounds-3/) **[CSS-BACKGROUNDS-3]**: Extends and supersedes CSS2§8.5 and CSS2§14.2, providing more control of backgrounds and borders, including layered background images, image borders, and drop shadows.

[CSS Images Level 3](https://www.w3.org/TR/css-images-3/) **[CSS-IMAGES-3]**: Redefines and incorporates the external 2D image value type, introduces native 2D gradients, and adds additional controls for replaced element sizing and rendering.

[CSS Fonts Level 3](https://www.w3.org/TR/css-fonts-3/) **[CSS-FONTS-3]**: Extends and supersedes CSS2§15 and provides more control over font choice and feature selection.

[CSS Writing Modes Level 3](https://www.w3.org/TR/css-writing-modes-3/) **[CSS-WRITING-MODES-3]**: Defines CSS support for various international writing modes, such as left-to-right (e.g. Latin or Indic), right-to-left (e.g. Hebrew or Arabic), bidirectional (e.g. mixed Latin and Arabic) and vertical (e.g. Asian scripts). Replaces and extends CSS2§8.6 and §9.10.

[CSS Multi-column Layout Level 1](https://www.w3.org/TR/css-multicol-1/) **[CSS-MULTICOL-1]**: Introduces multi-column flows to CSS layout.

[CSS Flexible Box Module Level 1](https://www.w3.org/TR/css-flexbox-1/) **[CSS-FLEXBOX-1]**: Introduces a flexible linear layout model for CSS.

[CSS User Interface Module Level 3](https://www.w3.org/TR/css-ui-3/) **[CSS-UI-3]**: Extends and supersedes CSS2§18.1 and CSS2§18.4, defining cursor, outline, and several new CSS features that also enhance the user interface.

[CSS Containment Module Level 1](https://www.w3.org/TR/css-contain-1/) **[CSS-CONTAIN-1]**: Introduces the contain property, which enforces the independent CSS processing of an element’s subtree in order to enable heavy optimizations by user agents when used well.

[CSS Transforms Level 1](https://www.w3.org/TR/css-transforms-1/) **[CSS-TRANSFORMS-1]**: Introduces coordinate-based graphical transformations to CSS.

[CSS Compositing and Blending Level 1](https://www.w3.org/TR/compositing-1/) **[COMPOSITING]**: Defines the compositing and blending of overlaid content and introduces features to control their modes.

[CSS Easing Functions Level 1](https://www.w3.org/TR/css-easing-1/) **[CSS-EASING-1]**: Describes a way for authors to define a transformation that controls the rate of change of some value. Applied to animations, such transformations can be used to produce animations that mimic physical phenomena such as momentum or to cause the animation to move in discrete steps producing robot-like movement.

[CSS Counter Styles Level 3](https://www.w3.org/TR/css-counter-styles-3/) **[CSS-COUNTER-STYLES-3]**: Introduces the @counter-style rule, which allows authors to define their own custom counter styles for use with CSS list-marker and generated-content counters [CSS-LISTS-3]. It also predefines a set of common counter styles, including the ones present in CSS2 and CSS2.1.


[List of all current-work CSS specifications](https://www.w3.org/Style/CSS/specs.en.html)

#### Older specs
[CSS Level 1](https://www.w3.org/TR/CSS1/) (1996, revised 2008; superseded in 2016)

## Flexbox
[Flexbox Froggy](https://flexboxfroggy.com/): A cute Frogger-themed series of exercises practicing with CSS Flexbox styling.
