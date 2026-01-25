title=HyperText Markup Language (HTML)
tags=presentation, format, browser
summary=The OG.
~~~~~~

[Standard](https://html.spec.whatwg.org/multipage/) ([PDF](https://html.spec.whatwg.org/print.pdf))

## Reading

### Books

* [A beginner's guide to HTML&CSS](http://learn.shayhowe.com/html-css/)
* [A free guide to learn HTML and CSS](http://marksheet.io)
* [Adaptive Web Design](http://adaptivewebdesign.info/1st-edition/) - Aaron Gustafson
* [An advanced guide to HTML&CSS](http://learn.shayhowe.com/advanced-html-css/)
* [Atomic Design](https://atomicdesign.bradfrost.com) - Brad Frost
* [Canvassing](https://web.archive.org/web/20160505010319/http://learnjs.io/canvassing/read/)
* [Code Guide: Standards for developing flexible, durable, and sustainable HTML and CSS](http://mdo.github.io/code-guide/) - Mark Otto
* [Dive Into HTML5](http://diveinto.html5doctor.com) - Mark Pilgrim ([PDF](http://mislav.net/2011/10/dive-into-html5/))
* [DOM Enlightenment](http://domenlightenment.com) - Cody Lindley (HTML)
* [GA Dash](https://dash.generalassemb.ly)
* [Google's HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html)
* [How To Build a Website with HTML](https://www.digitalocean.com/community/books/how-to-build-a-website-with-html-ebook) - Erin Glass (PDF, EPUB)
* [How to Code in HTML5 and CSS3](https://web.archive.org/web/20180816174417/http://howtocodeinhtml.com/HowToCodeInHTML5AndCSS3.pdf) - Damian Wielgosik (PDF)
* [HTML Canvas Deep Dive](http://joshondesign.com/p/books/canvasdeepdive/toc.html) - Josh Marinacci
* [HTML Dog Tutorials](http://www.htmldog.com)
* [HTML5 Canvas](https://www.oreilly.com/library/view/html5-canvas/9781449308032/ch01.html) - Steve Fulton & Jeff Fulton
* [HTML5 Canvas Notes for Professionals](https://goalkicker.com/HTML5CanvasBook/) - Compiled from StackOverflow documentation (PDF)
* [HTML5 for Publishers](https://www.oreilly.com/library/view/html5-for-publishers/9781449320065/pr02.html) - Sanders Kleinfeld
* [HTML5 For Web Designers](http://html5forwebdesigners.com) - Jeremy Keith
* [HTML5 Notes for Professionals](https://goalkicker.com/HTML5Book/) - Compiled from StackOverflow documentation (PDF)
* [HTML5 Quick Learning Guide](https://www.ossblog.org/wp-content/uploads/2017/06/html5-quick-learning-quide.pdf) - HTML5Templates (PDF)
* [HTML5 Shoot 'em Up in an Afternoon](https://leanpub.com/html5shootemupinanafternoon/read) - Bryan Bibat (HTML)
* [Interneting is Hard (But it Doesn't Have to Be)](https://www.internetingishard.com) - Oliver James
* [Learn to Code HTML & CSS](https://learn.shayhowe.com) - Shay Howe
* [Pocket Guide to Writing SVG](https://svgpocketguide.com) - Joni Trythall
* [Pro HTML5 Programming](https://web.archive.org/web/20181215200026/http://apress.jensimmons.com/v5/pro-html5-programming/ch0.html) - Jen Simmons, Chris O'Connor, Dylan Wooters, Peter Lubbers
* [Resilient Web Design](https://resilientwebdesign.com/#Resilientweb%20design) - Jeremy Keith
* [RTL Styling 101](https://rtlstyling.com) - Ahmad Shadeed
* [The HTML Handbook](https://flaviocopes.com/page/html-handbook/) - Flavio Copes (PDF, EPUB, Kindle) *(email address requested)*
* [Web Audio API](http://chimera.labs.oreilly.com/books/1234000001552) - Boris Smus
* [Web Visual Effects with CSS3](https://leanpub.com/web-visual-effects-with-css3/read) - Thomas Mak

### Articles

* ["HTML5 Elements You Didn't Know You Need"](https://dev.to/maxprilutskiy/html5-elements-you-didnt-know-you-need-gan)
* [Replacing JS with just HTML](https://www.htmhell.dev/adventcalendar/2025/27/) (Accordions / Expanding Content Panels; Input with Autofilter Suggestions Dropdown; Modals / Popovers; Offscreen Nav / Content)
* [Masonry: Things You Won’t Need A Library For Anymore](https://www.smashingmagazine.com/2025/12/masonry-things-you-wont-need-library-anymore/):

    * **Popovers And Dialogs**: The [Popover API](https://developer.mozilla.org/docs/Web/API/Popover_API), the [`<dialog>` HTML element](https://developer.mozilla.org/docs/Web/HTML/Reference/Elements/dialog), and the [`::backdrop` pseudo-element](https://developer.mozilla.org/docs/Web/CSS/Reference/Selectors/::backdrop) can help you get rid of dependencies on popup, tooltip, and dialog libraries. They handle accessibility and focus management for you, out of the box, are highly customizable by using CSS, and can easily be animated.
    * **Accordions**: The [`<details>` element](https://developer.mozilla.org/docs/Web/HTML/Reference/Elements/details), its [`name` attribute](https://developer.mozilla.org/docs/Web/HTML/Reference/Elements/details#name) for mutually exclusive elements, and the [`::details-content` pseudo-element](https://developer.mozilla.org/docs/Web/CSS/Reference/Selectors/::details-content) remove the need for accordion components.
    * **CSS Syntax**: Cascade layers, for a more organized CSS codebase, CSS nesting, for more compact CSS, new color functions, relative colors, and color-mix, new Maths functions like abs(), sign(), pow() and others help reduce dependencies on CSS pre-processors, utility libraries like Bootstrap and Tailwind, or even runtime CSS-in-JS libraries. The game changer :has(), one of the most requested features for a long time, removes the need for more complicated JS-based solutions.
    * **JS Utilities**: Modern Array methods like `findLast()`, or `at()`, as well as Set methods like `difference()`, `intersection()`, `union()` and others can reduce dependencies on libraries like Lodash.
    * **Container Queries**: [Container queries](https://developer.mozilla.org/docs/Web/CSS/CSS_containment/Container_queries) make UI components respond to things other than the viewport size, and therefore make them more reusable across different contexts. No need to use a JS-heavy UI library for this anymore, and no need to use a polyfill either.
    * **Layout**: [Grid](https://developer.mozilla.org/docs/Web/CSS/CSS_grid_layout), [subgrid](https://developer.mozilla.org/docs/Web/CSS/CSS_grid_layout/Subgrid), [flexbox](https://developer.mozilla.org/docs/Learn_web_development/Core/CSS_layout/Flexbox), or [multi-column](https://developer.mozilla.org/docs/Web/CSS/Reference/Properties/columns) have been around for a long time now, but looking at the results of the State of CSS surveys, it’s clear that developers tend to be very cautious with adopting new things, and wait for a very long time before they do.

    Things you might not need anymore in the near future:

    * **Anchor Positioning**: CSS anchor positioning handles the positioning of popovers and tooltips relative to other elements, and takes care of keeping them in view, even when moving, scrolling, or resizing the page. This is a great complement to the Popover API mentioned before, which will make it even easier to migrate away from more performance-intensive JS solutions.
    * **Navigation API**: The Navigation API can be used to handle navigation in single-page apps and might be a great complement, or even a replacement, to React Router, Next.js routing, or Angular routing tasks.
    * **View Transitions API**: The View Transitions API can animate between the different states of a page. On a single-page application, this makes smooth transitions between states very easy, and can help you get rid of animation libraries such as Anime.js, GSAP, or Motion.dev. Even better, the API can also be used with multiple-page applications.
    * **Scroll-driven Animations**: Scroll-driven animations run on the user’s scroll position, rather than over time, making them a great solution for storytelling and product tours.
    * **Customizable Selects**: A customizable select is a normal `<select>` element that lets you fully customize its appearance and content, while ensuring accessibility and performance benefits.
    * **CSS Masonry**: [CSS Masonry](https://developer.chrome.com/blog/masonry-update) is another upcoming web platform feature that I want to spend more time on. With CSS Masonry, you can achieve layouts that are very hard, or even impossible, with flex, grid, or other built-in CSS layout primitives. Developers often resort to using third-party libraries to achieve Masonry layouts, such as the Masonry JS library. "Masonry is a type of layout that was made popular by Pinterest years ago. It creates independent tracks of content within which items pack themselves up as close to the start of the track as they can."

