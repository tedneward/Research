title=Cascading StyleSheets (CSS)
tags=presentation, browser
summary=Collections of reading and links on the second triad of the HTML/CSS/JS browser layer.
~~~~~~

## Useful locations
Cheat sheets/references: [Interactive cheat sheet](https://htmlcheatsheet.com/css/) | [Another](https://adam-marsden.co.uk/css-cheat-sheet)

## Most useful debugging trick for CSS ever

`selector { outline: 1px solid red; }`

## CSS Levels
From [the CSS Snapshot doc](https://www.w3.org/TR/CSS/):

* **CSS Level 1**: The CSS Working Group considers the CSS1 specification to be obsolete. CSS Level 1 is defined as all the features defined in the CSS1 specification (properties, values, at-rules, etc), but using the syntax and definitions in the CSS2.1 specification. CSS Style Attributes defines its inclusion in element-specific style attributes.

* **CSS Level 2**: Although the CSS2 specification is technically a W3C Recommendation, it passed into the Recommendation stage before the W3C had defined the Candidate Recommendation stage. Over time implementation experience and further review has brought to light many problems in the CSS2 specification, so instead of expanding an already unwieldy errata list, the CSS Working Group chose to define CSS Level 2 Revision 1 (CSS2.1). In case of any conflict between the two specs CSS2.1 contains the definitive definition. Once CSS2.1 became Candidate Recommendation--effectively though not officially the same level of stability as CSS2--obsoleted the CSS2 Recommendation. Features in CSS2 that were dropped from CSS2.1 should be considered to be at the Candidate Recommendation stage, but note that many of these have been or will be pulled into a CSS Level 3 working draft, in which case that specification will, once it reaches CR, obsolete the definitions in CSS2. The CSS2.1 specification defines CSS Level 2 and the CSS Style Attributes specification defines its inclusion in element-specific style attributes.

* **CSS Level 3**: builds on CSS Level 2 module by module, using the CSS2.1 specification as its core. Each module adds functionality and/or replaces part of the CSS2.1 specification. The CSS Working Group intends that the new CSS modules will not contradict the CSS2.1 specification: only that they will add functionality and refine definitions. As each module is completed, it will be plugged in to the existing system of CSS2.1 plus previously-completed modules. From this level on modules are levelled independently: for example Selectors Level 4 may well be completed before CSS Line Module Level 3. Modules with no CSS Level 2 equivalent start at Level 1; modules that update features that existed in CSS Level 2 start at Level 3.

* **CSS Level 4 and beyond**: There is no CSS Level 4. Independent modules can reach level 4 or beyond, but CSS the language no longer has levels. ("CSS Level 3" as a term is used only to differentiate it from the previous monolithic versions.)

## Tips, Tricks, etc
["Understanding layout algorithms"](https://www.joshwcomeau.com/css/understanding-layout-algorithms): "The key realization I had is that CSS is so much more than a collection of properties. It's a constellation of inter-connected layout algorithms. Each algorithm is a complex system with its own rules and secret mechanisms. It's not enough to learn what specific properties do. We need to learn how the layout algorithms work, and how they use the properties we provide to them."

[Flexbox Froggy](https://flexboxfroggy.com/): A cute Frogger-themed series of exercises practicing with CSS Flexbox styling.

[CSS Tips](https://markodenic.com/css-tips/):

* Typing Effect:
    HTML:
    ```
    <div class="wrapper">
      <div class="typing-demo">
        This is a typing demo.
      </div>
    </div>
    ```
    CSS:
    ```
    .wrapper {
      height: 100vh;
      /*This part is important for centering*/
      display: grid;
      place-items: center;
    }

    .typing-demo {
      width: 22ch;
      animation: typing 2s steps(22), blink .5s step-end infinite alternate;
      white-space: nowrap;
      overflow: hidden;
      border-right: 3px solid;
      font-family: monospace;
      font-size: 2em;
    }

    @keyframes typing {
      from {
        width: 0
      }
    }
        
    @keyframes blink {
      50% {
        border-color: transparent
      }
    }
    ```

* Drop shadow: When you work with transparent images you can use `drop-shadow()` filter function to create a shadow on the image’s content, instead of `box-shadow` property which creates a rectangular shadow behind an element’s entire box: filter: `drop-shadow(2px 4px 8px #585858)`
    HTML
    ```
    <div class="wrapper">
      <div class="mr-2">
        <div class="mb-1 text-center">
          box-shadow
        </div>
        
        <img class="box-shadow" src="https://markodenic.com/man_working.png" alt="Image with box-shadow">
      </div>
        
      <div>
        <div class="mb-1 text-center">
          drop-shadow
        </div>
        
        <img class="drop-shadow" src="https://markodenic.com/man_working.png" alt="Image with drop-shadow">
      </div>
    </div>
    ```
    CSS:
    ```
    .wrapper {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .mr-2 {
      margin-right: 2em;
    }

    .mb-1 {
      margin-bottom: 1em;
    }

    .text-center {
      text-align: center;
    }

    .box-shadow {
      box-shadow: 2px 4px 8px #585858;
    }

    .drop-shadow {
      filter: drop-shadow(2px 4px 8px #585858);
    }
    ```
    
* Smooth scrolling
* Center
* Cursors (as in, mouse cursor)
* Truncate text
* Truncate the text to a specific number of lines
* `::selection` CSS pseudo-element
* Anything resizable
* CSS modals
* `calc()`
* Style empty elements
* Create custom scrollbar
* position sticky
* CSS Scroll Snap
* Dynamic Tooltips
* caret-color
* `::in-range` and `::out-of-range` pseudo-classes
* Fancy text
* Flex gap
* grayscale() function
* Rounded, gradiant borders

