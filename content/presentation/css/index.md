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

## Reading

### Books

* [A beginner's guide to HTML&CSS](http://learn.shayhowe.com/html-css/)
* [A free guide to learn HTML and CSS](http://marksheet.io)
* [Adaptive Web Design](http://adaptivewebdesign.info/1st-edition/) - Aaron Gustafson
* [Airbnb CSS / Sass Styleguide](https://github.com/airbnb/css) - Airbnb
* [Airbnb CSS-in-JavaScript Style Guide](https://airbnb.io/javascript/css-in-javascript/) - Airbnb
* [An advanced guide to HTML&CSS](http://learn.shayhowe.com/advanced-html-css/)
* [Atomic Design](https://atomicdesign.bradfrost.com) - Brad Frost
* [Canvassing](https://web.archive.org/web/20160505010319/http://learnjs.io/canvassing/read/)
* [Code Guide: Standards for developing flexible, durable, and sustainable HTML and CSS](http://mdo.github.io/code-guide/) - Mark Otto
* [CSS Animation 101](https://github.com/cssanimation/css-animation-101)
* [CSS Notes for Professionals](http://goalkicker.com/CSSBook) - Compiled from StackOverflow Documentation (PDF)
* [DOM Enlightenment](http://domenlightenment.com) - Cody Lindley (HTML)
* [GA Dash](https://dash.generalassemb.ly)
* [Google's HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html)
* [How To Build a Website with HTML](https://www.digitalocean.com/community/books/how-to-build-a-website-with-html-ebook) - Erin Glass (PDF, EPUB)
* [How to Code in HTML5 and CSS3](https://web.archive.org/web/20180816174417/http://howtocodeinhtml.com/HowToCodeInHTML5AndCSS3.pdf) - Damian Wielgosik (PDF)
* [Interneting is Hard (But it Doesn't Have to Be)](https://www.internetingishard.com) - Oliver James
* [Learn CSS Layout](http://learnlayout.com)
* [Learn CSS Layout the pedantic way](http://book.mixu.net/css/)
* [Learn to Code HTML & CSS](https://learn.shayhowe.com) - Shay Howe
* [Magic of CSS](https://adamschwartz.co/magic-of-css/) - Adam Schwartz (HTML) (:construction: *in process*)
* [MaintainableCSS](http://maintainablecss.com)
* [Pocket Guide to Writing SVG](https://svgpocketguide.com) - Joni Trythall
* [Resilient Web Design](https://resilientwebdesign.com/#Resilientweb%20design) - Jeremy Keith
* [RTL Styling 101](https://rtlstyling.com) - Ahmad Shadeed
* [Scalable and Modular Architecture for CSS](https://web.archive.org/web/20191116073929/http://smacss.com/) - Jonathan Snook
* [The CSS Handbook](https://flaviocopes.com/page/css-handbook/) - Flavio Copes (PDF, EPUB, Kindle) *(email address requested)*
* [Understanding Flexbox: Everything you need to know](https://ohansemmanuel.github.io/uf_download.html) - Ohans Emmanuel
* [W3.CSS Succinctly](https://www.syncfusion.com/ebooks/w3_css_succinctly) - Joseph D. Booth
* [Web Audio API](http://chimera.labs.oreilly.com/books/1234000001552) - Boris Smus
* [Web Visual Effects with CSS3](https://leanpub.com/web-visual-effects-with-css3/read) - Thomas Mak

### Articles

* https://www.howtogeek.com/add-a-smooth-typewriter-animation-to-your-website-without-any-javascript/
