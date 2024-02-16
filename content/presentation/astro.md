title=Astro
tags=presentation, browser, cms
summary=The web framework for content-driven websites.
~~~~~~

[Website](https://astro.build/) | [Source](https://github.com/withastro/astro)

Claims a "new" frontend architecture called [Islands](https://docs.astro.build/en/concepts/islands/):

"The term “component island” was first coined by Etsy’s frontend architect Katie Sylor-Miller in 2019. This idea was then expanded on and documented in this post by Preact creator Jason Miller on August 11, 2020.

> The general idea of an “Islands” architecture is deceptively simple: render HTML pages on the server, and inject placeholders or slots around highly dynamic regions […] that can then be “hydrated” on the client into small self-contained widgets, reusing their server-rendered initial HTML.
— Jason Miller, Creator of Preact

"The technique that this architectural pattern builds on is also known as partial or selective hydration.

"In contrast, most JavaScript-based web frameworks hydrate & render an entire website as one large JavaScript application (also known as a single-page application, or SPA). SPAs provide simplicity and power but suffer from page-load performance problems due to heavy client-side JavaScript usage.

"SPAs have their place, even embedded inside an Astro page. But, SPAs lack the native ability to selectively and strategically hydrate, making them a heavy-handed choice for most projects on the web today.

"Astro became popular as the first mainstream JavaScript web framework with selective hydration built-in, using that component islands pattern first coined by Sylor-Miller."

