title=Presentation
type=categorypage
category=presentation
summary=Different ways to present information to users of a program.
tags=presentation
~~~~~~

[Graphical User Interface Programming](https://www.cs.cmu.edu/~bam/pub/uimsCRCrevised.pdf), by Brad Meyers, CMU (circa 2003 but still an interesting overview--not sure much has changed in two decades on this subject)

[Project LightSpeed](https://engineering.fb.com/2020/03/02/data-infrastructure/messenger/): "... using the native OS wherever possible, reusing the UI with dynamic templates powered by SQLite, using SQLite as a universal system, and building a server broker to operate as a universal gateway between Messenger and its server features." In many respects, sounds like part of what they did was adopt a partial [Naked Objects](../nakedobjects.html)-like approach to their UI, storing the UI description in data and building that UI at runtime.

"Build a Dev Portfolio as a 2D Game" - [Video](https://www.youtube.com/watch?v=wy_fSStEgMs) and [Source](https://github.com/JSLegendDev/2d-portfolio-kaboom). Cute idea.

["The Balance has Shifted Away from SPAs"](https://nolanlawson.com/2022/05/21/the-balance-has-shifted-away-from-spas/)

["A Whole Website in a Single JavaScript File"](https://deno.com/blog/a-whole-website-in-a-single-js-file)

Repositories for graphics:

* [The Noun Project](https://thenounproject.com/): icons and photos for everything.
* [Unsplash](https://unsplash.com/): The Internet's source for visuals.
* [Happy Little Tileset](https://momen-games.itch.io/happy-la-v2-ts): Some tiles for 2D/retro games/graphics.
* [Axialis](https://www.axialis.com/): Icons for applications

### Articles

* ["Programmatic and Direct Manipulation, Together at Last"](http://arxiv.org/pdf/1507.02988): "Direct manipulation interfaces and programmatic systems have distinct and complementary strengths. The former provide intuitive, immediate visual feedback and enable rapid prototyping, whereas the latter enable complex, reusable abstractions. Unfortunately, existing systems typically force users into just one of these two interaction modes. We present a system called SKETCH-N-SKETCH that integrates programmatic and direct manipulation for the particular domain of Scalable Vector Graphics (SVG). In SKETCH-N-SKETCH, the user writes a program to generate an output SVG canvas. Then the user may directly manipulate the canvas while the system immediately infers a program update in order to match the changes to the output, a workflow we call live synchronization. To achieve this, we propose (i) a technique called trace-based program synthesis that takes program execution history into account in order to constrain the search space and (ii) heuristics for dealing with ambiguities. Based on our experience with examples spanning 2,000 lines of code and from the results of a preliminary user study, we believe that SKETCH-N-SKETCH provides a novel workflow that can augment traditional programming systems. Our approach may serve as the basis for live synchronization in other application domains, as well as a starting point for yet more ambitious ways of combining programmatic and direct manipulation."

* ["The Market for Lemons"](https://infrequently.org/2023/02/the-market-for-lemons/): "Not only are new services being built to a self-defeatingly low UX and performance standard, existing experiences are pervasively re-developed on unspeakably slow, JS-taxed stacks. At a business level, this is a disaster, raising the question: "why are new teams buying into stacks that have failed so often before?" In other words, "why is this market so inefficient?"" A rather scathing takedown of the evolution of the web interface. Can't say I disagree too much.

* ["Beyond Page Objects: Testing Web Applications with State Objects"](https://queue.acm.org/detail.cfm?id=2793039)

* ["How I accidentally came up with a reactive JS UI library"](https://dev.to/abtahitajwar/how-i-accidentally-came-up-with-a-reactive-js-ui-library-33ma)

### User Interface

[Guidebook Gallery](https://guidebookgallery.org/): Graphical user interface gallery *(up until 2006, right before the mobile/smartphone revolution!)*

[ECMA Report on User Interface Taxonomy](https://www.ecma-international.org/wp-content/uploads/ECMA_TR-61_1st_edition_june_1992.pdf) (June 1992): Interesting high-level overview of different ideas around user interface and a taxonomy of that space:

* UI structure
    * Metaphor
        * Desktop: represents objects and actions traditionally associated with a desk and the surrounding office environment.
        * Workbench: represents an environment which contains the tools and other work items organised to do work in a particular task area.
        * Control panel: represents a physical panel containing an array of instruments for controlling a machine. Typical objects include dials and gauges (both analogue and digital), sliders, buttons and knobs.
    * Dialogue technique
        * Menus: A set of options presented by the dialogue system to the user.
        * Language:
            * Natural language
            * Command language: A specified set of user inputs which, when processed by the dialogue system, result in associate actions. Users enter (rather than select) complete or abbreviated command(s) and the dialogue system performs the activities specified by the command(s). Command languages include both natural-like languages and specialised languages.
            * Q&A: A dialogue technique by which the user responds to questions asked by the dialogue system (e.g. system-initiated dialogue). Questions are typically asked one at a time and may vary depending on the previous answer. In most applications of this dialogue technique, answers can be qualitative (yes/no) or quantitative (a number). *(Hello, chatbots!)*
        * Direct manipulation
            * Object based: A form of dialogue in which the user directly acts upon the objects to be manipulated by pointing at them, moving and/or changing their physical characteristics (or values) via the use of an input device. In its purest form, a direct manipulation dialogue allows users to perform all available interaction operation by acting on displayed objects in ways analogous to manipulating physical entities. Such objects are typically concrete, often graphical, representations of abstract software structures or capabilities, displayed within a simulated two or three-dimensional environment.
            * Control panel based: This dialogue technique is defined by the closed loop consisting of machines and human operators controlling the machines using control actuators, which are represented by objects that are used to perform an action. The specifics of this dialogue technique are:
                - variety of types of control actuators;
                - input in digital or analogue form in normally fixed sequences;
                - strong time constraints (real time);
                - complexity of system control.
        * Form filling
            A dialogue technique that requires the user to fill in, complete or modify fields (typically labelled) on a form displayed by the system. This dialogue technique allows multiple user inputs in a single transaction and provides contextual information concerning the nature of the required inputs.
    * Guidance function: Guidance functions can be divided into:
            - guidance in non-error situations and error prevention;
            - guidance in error situations and error management.
      The guidance function is intended to promote efficient use of the dialogue system (quick and accurate use of full capabilities), minimise the memory load on the user, decrease the time required to learn how to use the dialogue system, provide support for users of different skill levels and help the user to escape from error situations.
        * Guidance in non-error situations and error prevention
        * Guidance in error situations and error management
    * Dialogue control function
        * System environment: The environment within which the dialogue system operates often provides general control functions. These include:
            - Windowing: The division of a display area to provide one or more graphical contexts. The windowing system will normally support concepts such as input focus and provide mechanisms to allow the user to arrange the windows as desired.
            - I/O equivalence: To support the different requirements and preferences of users, the dialogue system may support different user interactions as equivalent. Such equivalences are used to provide accelerators or to support disabled users, for example keyboard equivalents for mouse actions, flashing versus beeping.
            - Global storage facilities: To support the interchange of data between applications or to act as a temporary repository, the dialogue system will often provide one or more globally accessible storage facilities, often referred to as clipboards.
        * Dialogue flow: Dialogue flow functions allow control of the temporal progress of the dialogue. These include:
            - start;
            - suspend;
            - resume;
            - end;
            - changes in the direction of the flow, e.g. to recover from errors by reverting to a previous dialogue state.
        * Object management: Object management functions allow control of the existence, state and position of objects used in the dialogue. These include:
            - create;
            - delete;
            - select;
            - deselect;
            - copy;
            - move.
        * Filtering: Filtering functions are used to reduce the volume of information exchanged during the dialogue. The purpose of these functions include:
            - implementation of security and privacy restrictions (e.g. by means of passwords);
            - implementation of user's capabilities and preferences (e.g. by means of user profiles);
            - removal or modification of options inappropriate in the current mode (e.g. by greying menu items or removing them completely).
    * Presentation of information
        *  Visual presentation: The use of visual appearance to categorize or identify objects and concepts.
            * Enhancement: The altering of the visual appearance of selected parts of information on the display to attract attention and provide feedback. The ways in which the visual appearance can be altered include:
                - size;
                - shape;
                - texture;
                - colour;
                - contrast;
                - brightness.
            * Alphanumeric: The use of letters or symbols with rules for their association. Used for reasons of brevity and security.
            * Arbitrary: use of unique entities formed by letters or numbers that have little or no significance to the user and which bear no direct relationship to what they represent.
            * Mnemonic: use of entities formed by letters or numbers that convey information that is meaningful to the user and have some association with the words they represent (e.g. abbreviations, acronyms).
            * Graphical: The use of graphical information that can be interpreted by the user as concepts or objects.
            * Abstract symbols: those which attempt to visualise a concept somehow apart from the concrete image.
            * Representational symbols: those which attempt to visualise a concept related to a concrete image.
        * Auditory presentation: The use of sound ranging from simple tones to sequences of tones to full speech capabilities.
        * Tactile presentation: The use of touch to convey information (e.g. touch screen, mouse clicking).
        * Temporal presentation: The use of variations in time to convey information (e.g. blinking, double clicking).
        * Spatial presentation: The use of positions in space to convey information.
    * I/O devices: Input/output devices can be divided into input devices, output devices and input/output devices. The last category is not treated separately, but is included in both the input and output devices taxonomy. Compound devices are considered to be combinations of I/O devices and hence do not require separate definitions here.
        * Input device taxonomy: The following list shows the fundamental types of interaction tasks and which input devices are suitable to be used for each type.
            - Selection
                * Definition: Choosing from a set of alternatives
                * Suitable devices: Mouse, tablet, light pen, pen, touch panel, touch screen, joystick, trackball, keyboard, microphone, glove, gesture suit.
            - Position
                * Definition: Indicating a location
                * Suitable devices: Mouse, tablet, light pen, pen, touch panel, touch screen, joystick, trackball, keyboard, eye tracker, wheel, glove, gesture suit.
            - Orientation
                * Definition: The orientation of an entity in a two-dimensional or three-dimensional space
                * Suitable devices: Joystick, keyboard, glove, gesture suit.
            - Path
                * Definition: Generating a series of positions or orientations over time
                * Suitable devices: Mouse, tablet, light pen, touch panel, touch screen, joystick, trackball, keyboard, eye tracker, wheel, glove, gesture suit.
            - Quantify
                * Definition: Specifying a value to quantify a measure.
                * Suitable devices: Switches, keyboard, mouse, wheel, microphone.
            - Text capture
                * Definition: Entering text directly, e.g. for annotating a drawing.
                * Suitable devices: Keyboard, microphone.
            - Image capture
                * Definition: Entering an image directly.
                * Suitable devices: Video, scanner.                
        * Output device taxonomy: At the highest level, output devices can be divided into those that provide output of a static and permanent nature and those that provide dynamic, temporary output.
            - Static output
                * Definition: providing an image on a permanent directly readable medium (e.g. paper).
                * Suitable devices: Printers, plotters
            - Dynamic output
                * Definition: providing variable information on a non-permanent medium.
                * Suitable devices: Screen, head mounted displays, loudspeakers, light.
* Engineering/ergonomic principles
    * Action/object order: Some systems are based upon actions being invoked on objects. Whether the action or the object is selected first varies from system to system.
    * Complexity of function set: Some systems provide a rich set of complex functions while others provide a small set of elementary functions which can achieve the same effect by being used in combination.
    * Complexity of objects: Some systems have a simple set of objects with limited possibilities for combining them to form more complex ones. Other systems allow objects to be combined in various ways such as nesting, embedding, grouping, linking etc.
    * WYSIWYG: A user interface methodology where the representation on the screen is judged by the user to have a close relationship to that which would be produced on a static output device (e.g. paper). (The "close" relationship may range from similar to identical, e.g. because of software or hardware limitations.)
    * Physical principles: Certain aspects of the user interface should be modelled closely on human perception and behaviour. For example:
        - font styles and sizes and the use of colour should be appropriate to human vision capability;
        - keyboard layout and required key combinations should be appropriate to human manual dexterity;
        - use of sound should be appropriate to human auditory characteristics.
    * Dialogue principles
        - Suitability for the task: A dialogue is suitable for a task to the extent that it supports the user in the effective and efficient completion of the task.
        - Self-descriptiveness: A dialogue is self-descriptive to the extent that each dialogue step is immediately comprehensible through feedback from the system or is explained to the user on his or her requesting the relevant
        information.
        - Controllability: A dialogue is controllable to the extent, that the user is able to maintain direction over the whole course of the interaction until the point at which the goal has been met.
        - Conformity with user expectations: A dialogue conforms with user expectations to the extent, that it corresponds to the user's task knowledge, education, experience, and to commonly held conventions.
        - Error tolerance: A dialogue is error tolerant to the extent, if despite evident errors in input, the intended result may be achieved with either no or minimal corrective action having to be taken.
        - Suitability for individualisation: A dialogue is suitable for individualisation to the extent, that the dialogue system is constructed to allow for modification to the user's individual needs and skills for a given task.
        - Suitability for learning: A dialogue is suitable for learning to the extent, that it provides means, guidance, and stimulation to the user during the learning phases.
    * Drivability: The extent to which user interfaces permit users to easily transfer from one application to another with minimal interference, error, confusion, re-learning and re-training.
    * Look and Feel: The extent to which a user interface complies with a particular style guide.
    * Internationalisation: Systems vary in the extent to which they support the needs of different cultural and language groups. These include translation of messages, formats, sorting/collating sequences, paper sizes, alphabets, text direction.
* Applicability domain
    * User domain
        - individual characteristics (e.g. skill level, preferences);
        - work group characteristics (e.g. open plan vs closed office, CSCW);
        - organisational characteristics (e.g. company policies).
    * Application domain
        - office;
        - public information systems;
        - education;
        - home;
        - control rooms;
        - factory floor.
* Environmental constraints
        - implementation dependencies (e.g. portability);
        - system environment constraints (e.g. technology, non-graphic screens);
        - economic constraints (e.g. cost of use, training)

---

## Miscellaneous reading

["How to Draw S-Curved Arrows"](https://dragonman225.js.org/curved-arrows.html)

["Have SPAs ruined the Web?"](https://htmx.org/essays/a-response-to-rich-harris/)

[Event-Driven GTK by Example — 2021 Edition](https://mmstick.github.io/gtkrs-tutorials/) - Michael Murphy

[Practical Typography](https://practicaltypography.com/):

1. The four most important typographic considerations for body text are point size, line spacing, line length, and font (see font recommendations), because those choices determine how the body text looks.
2. point size should be 10–12 points in printed documents, 15-25 pixels on the web.
3. line spacing should be 120–145% of the point size.
4. The average line length should be 45–90 characters (including spaces).
5. The easiest and most visible improvement you can make to your typography is to use a professional font, like those found in font recommendations.
6. Avoid goofy fonts, monospaced fonts, most free fonts, and system fonts—especially times new roman and arial.
7. Use curly quotation marks, not straight ones (see straight and curly quotes).
8. Use bold or italic as little as possible, and not together.
9. Never underline, except perhaps for web links.
10. all caps are fine for less than one line of text.
11. Use centered text sparingly.
12. Put only one space between sentences.
13. Don’t use multiple word spaces or other white-space characters in a row.
14. If you don’t have real small caps, don’t use them at all.
15. Use 5–12% extra letterspacing with all caps and small caps.
16. kerning should always be turned on.
17. Use first-line indents that are one to four times the point size of the text, or use 4–10 points of space between paragraphs. Don’t use both.
18. Always use hyphenation with justified text.
19. Don’t confuse hyphens and dashes, and don’t use multiple hyphens as a dash.
20. Use ampersands sparingly, unless included in a proper name.
21. Use proper trademark and copyright symbols—not alphabetic approximations.
22. In a document longer than three pages, one exclamation point is plenty (see question marks and exclamation points).
23. Put a nonbreaking space after paragraph and section marks.
24. Make ellipses using the proper character, not periods and spaces.
25. apostrophes point downward.
26. Make sure foot and inch marks are straight, not curly.

[Programming with gtkmm 4](https://developer.gnome.org/gtkmm-tutorial/stable/)

[Search User Interfaces](http://searchuserinterfaces.com/book/) - Marti A. Hearst

[The GLib/GTK+ Development Platform](https://people.gnome.org/~swilmet/glib-gtk-dev-platform.pdf) - Sébastien Wilmet (PDF)

[Web Design Primer](https://pressbooks.library.ryerson.ca/webdesign/) - Richard Adams, Ahmed Sagarwala

[Web Style Guide Online](https://www.webstyleguide.com/wsg3/index.html) - Patrick J. Lynch and Sarah Horton

[Visual design rules you can safely follow every time](https://anthonyhobday.com/sideprojects/saferules/)

---

## Implementation notes

- [The internet computer](https://www.youtube.com/watch?v=v0160IirdL4&ab_channel=TheBrowserCompany)
- [Servo: Designing and Implementing a Parallel Browser](https://www.youtube.com/watch?v=67QP8t-89VM)
- [Servo: A Web View From Somewhere Else](https://www.youtube.com/watch?v=tNWQkNvg3_U&ab_channel=Igalia)
- [Intro to Rust-lang (Building the Dom and an HTML Parser)](https://www.youtube.com/watch?v=brhuVn91EdY&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=22&ab_channel=TensorProgramming)
- [Intro to Rust-lang (Adding a Style Tree to our Browser)](https://www.youtube.com/watch?v=8e37RsyiGSE&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=25&ab_channel=TensorProgramming)
- [Intro to Rust-lang (Adding a CSS engine and CSS parsing to our Browser)](https://www.youtube.com/watch?v=dnrEto7adg0&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=24&ab_channel=TensorProgramming)
- [Intro to Rust (Building a Browser Engine: Commands and Rendering in OpenGL)](https://www.youtube.com/watch?v=rszgtm7i0n8&list=PLJbE2Yu2zumDF6BX6_RdPisRVHgzV02NW&index=27&ab_channel=TensorProgramming)
- [In The Loop - setTimeout, micro tasks, requestAnimationFrame, requestIdleCallback](https://www.youtube.com/watch?v=cCOL7MC4Pl0&ab_channel=JSConf)
- [Critical rendering path - Crash course on web performance](https://www.youtube.com/watch?v=PkOBnYxqj3k&ab_channel=IlyaGrigorik)
- [Chrome University 2018: Life of a Script](https://www.youtube.com/watch?v=voDhHPNMEzg&ab_channel=BlinkOn)
- [Browser From Scratch Live Streams](https://www.youtube.com/playlist?list=PLgOaDFg2Sml4CG1tYeYhQ6eKqyh0hmyg1)
- [Web Browser Engineering](https://browser.engineering)
- [Browser from scratch](https://zerox-dg.github.io/blog/tags/browser-from-scratch)
- [Browser from Scratch](https://zerox-dg.github.io/blog/tags/browser-from-scratch)
- [Browser Performance](https://www.kuniga.me/blog/2020/03/28/browser-performance.html)
- [Building a Rust Web Browser](https://joshondesign.com/tags/browser)
- [Concurrent JavaScript: It can work!](https://webkit.org/blog/7846/concurrent-javascript-it-can-work)
- [David Baron's blog: Blink engineer](https://dbaron.org/log)
- [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork)
- [How browsers work](https://web.dev/howbrowserswork)
- [Key data structures and their roles in RenderingNG](https://developer.chrome.com/articles/renderingng-data-structures)
- [Let's build a browser engine!](https://limpet.net/mbrubeck/2014/08/08/toy-layout-engine-1.html)
- [Notes on how browsers work](https://www.kuniga.me/blog/2015/10/09/notes-on-how-browsers-work.html)
- [Notes on JavaScript Interpreters](https://www.kuniga.me/blog/2017/06/01/notes-on-javascript-interpreters.html)
- [Notes on Javascript Memory Profiling in Google Chrome](https://www.kuniga.me/blog/2015/06/07/notes-on-javascript-memory-profiling-in-google-chrome.html)
- [Overview of the RenderingNG architecture](https://developer.chrome.com/articles/renderingng-architecture)
- [reflows & repaints: css performance making your javascript slow?](http://www.stubbornella.org/content/2009/03/27/reflows-repaints-css-performance-making-your-javascript-slow)
- [Rendering: repaint, reflow/relayout, restyle](https://www.phpied.com/rendering-repaint-reflowrelayout-restyle)
- [RenderingNG deep-dive: LayoutNG](https://developer.chrome.com/articles/layoutng)
- [RenderingNG: an architecture that makes and keeps Chrome fast for the long term](https://blog.chromium.org/2021/10/renderingng.html)
- [Round-up of web browser internals resources](https://developer.chrome.com/blog/round-up-of-web-browser-internals-resources)
- [Understanding Reflow and Repaint in the browser](https://dev.to/gopal1996/understanding-reflow-and-repaint-in-the-browser-1jbg)
- [Web Browser Engineering](https://browser.engineering)
- [What forces layout / reflow](https://gist.github.com/paulirish/5d52fb081b3570c81e3a)

### Web UI

- [Algebraic effects, Fibers, Coroutines](https://www.youtube.com/watch?v=vzzOdWj4YyM&ab_channel=YouGottaLoveFrontend)
- [Algebraic Effects for React Developers](https://blog.reesew.io/algebraic-effects-for-react-developers)
- [Algebraic Effects for the Rest of Us](https://overreacted.io/algebraic-effects-for-the-rest-of-us)
- [PL web frameworks](https://twitter.com/sliminality/status/1516175554550018048)
- [React - Basic Theoretical Concepts](https://github.com/reactjs/react-basic)
- [React Concurrent mode](https://twitter.com/dan_abramov/status/1120971795425832961)
- [TypeScript + fp-ts: ReaderTaskEither and React](https://andywhite.xyz/posts/2021-01-28-rte-react)
