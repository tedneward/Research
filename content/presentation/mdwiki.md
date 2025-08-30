title=MDWiki
tags=presentation, wiki, markdown, browser, ecmascript
summary=A CMS/Wiki completely built in HTML5/Javascript and runs 100% on the client.
~~~~~~

[Website](https://dynalon.github.io/mdwiki/#!index.md) | [Source](https://github.com/Dynalon/mdwiki)

Not really a "wiki", per se (doesn't automatically create links to other pages, doesn't create a new page on request, etc). More like a JS browser-hosted Markdown renderer.

Does support client-side "gimmicks" to do various Bootstrappy things, a la alerts, specially-rendered links, and so on.

## Configuration
You can create a `config.json` file in the same folder as the `mdwiki.html` file which is then used for configuration. The file has to be valid JSON. Currently these options are available:

  * `"useSideMenu": false` - disable the side navigation
  * `"lineBreaks": "original"` - Instead of using the [GFM] line breaks, use the original line breaking as [introduced by John Gruber][DaringFireball]:
    * line breaks in the markdown files are ignored, except if a line ends with two spaces
    * Default is `lineBreaks: "gfm"` (line breaks in markdown will create a new paragraph)
  * `"additionalFooterText": ""`
    * Can be used to add text to the copyright footer at the bottom, like custom copyright notices.
    * Example: `additionalFooterText: "All content and images &copy; by John Doe"`
    * Default: `""` (empty string)
  * `"anchorCharacter": "&para;"`
    * The character/text displayed and used as a hyperlink when hovering over headings.
    * Unicode characters can be used in HTML notation. Example: `&#x2693;` will render as &#x2693;
    * Default: The pilcrow (paragraph) sign: &para;
  * `"title": "ACME Industries Wiki"`
	* Changes the title of the webpage.
	* Default: `"MDWiki"`
	* Note - this parameter does not change the title of your wiki in Google search results. Edit `mdwiki.html` directly to correct this. ([Issue #58](https://github.com/Dynalon/mdwiki/issues/58)) 

A sample `config.json` might thus look like this:

```javascript
{
    "useSideMenu": true,
    "lineBreaks": "gfm",
    "additionalFooterText": "All content and images &copy; by John Doe",
    "anchorCharacter": "#"
}
```

Note: More configuration options will be available in future versions of MDwiki.

Hint: It is adviced that you create an empty config.json in each cases, to avoid 404 errors which will not get cached by your browser. Having an `config.json` file present thus will speed up page loading (even if its empty).

  [GFM]: https://help.github.com/articles/github-flavored-markdown
  [DaringFireball]: http://daringfireball.net/projects/markdown/

## Example
Website-as-Markdown-source: https://github.com/Dynalon/mdwiki/tree/gh-pages



#### Gimmicks: https://dynalon.github.io/mdwiki/#!./gimmicks.md
Gimmicks are little helper that bring plenty of dynamic features into your page. For example, you can use them to inline youtube videos, image slideshows or facebook like buttons.

To use Gimmicks, all you have to do is include some specially crafted link into your markdown file. For example, if you want to embed a Youtube video (instead of linking to it), you just have to insert a link to the video:

    [](http://www.youtube.com/watch?v=RMINSD7MmT4)

Gimmicks are realized via Javascript and work out of the box. Some gimmicks can be called with parameters on them, to customize their behaviour:

    [gimmick:ForkMeOnGitHub ({ color: 'red',  position: 'left' })](http://www.github.com/Dynalon/mdwiki)

The arguments are passed as a Javascript object. But for convienience reasons, you can omit the curly brackets `{ }`. The gimmick name after `gimmick:` is also case-insensitive:

    [gimmick:forkmeongithub(color: 'red', position: 'left')](http://www.github.com/Dynalon/mdwiki)

Gimmicks are designed to always chose sane default values when no parameters are given, therefore _most_ gimmicks do not require any parameters to work.

Note: Gimmicks will usually load code or stylesheets from the internet, therefore they won't work in offline mode

---

##### Alerts

Alerts are automatically placed whenever you start a paragraph with a special _trigger_ word, that _has_ to be followed by a colon `:` or exclamation mark `!`.

Trigger words are case insensitive, and must be one of the following:

| Type    | Trigger                                                                           |
| ------- | --------------------------------------------------------------------------------- |
| Warning | warning, achtung, attention, warnung, atención, guarda, advertimiento, attenzione |
| Note    | note, beachte, nota                                                               |
| Hint    | hint, tip, tipp, hinweis, suggerimento                                            |

Preview:

Attention: This text is important.

Note! This is a note.

Hint: This is a hint.

---

##### GitHub Gists

Gists on github can be embedded by passing their numeric id:

    [gimmick:gist](5641564)

Preview:

[gimmick:gist](5641564)

---

##### UML Diagrams via yUML.me

Embeds diagrams from the excellent [yUML.me](http://yuml.me) service (see their website for documentation).

Examples:

[gimmick:yuml]( [HttpContext]uses -.->[Response] )

    [gimmick:yuml]( [HttpContext]uses -.->[Response] )

---

[gimmick:yuml (type: 'class')]([User|+Forename;+Surname;+HashedPassword;-Salt])

    [gimmick:yuml]([User|+Forename+;Surname;+HashedPassword;-Salt|+Login();+Logout()])

---

[gimmick:yuml (type: 'activity', style: 'plain') ]( `Make Coffee´->`want more coffee´ )

    [gimmick:yuml (type: 'activity', style: 'plain') ]( `Make Coffee´->`want more coffee´ )

---

[gimmick:yuml (type: 'usecase', scale: 150) ]( [Customer]-`Sign In´, [Customer]-`Buy Products´ )

    [gimmick:yuml (diag: 'usecase', scale: 150) ]( [Customer]-`Sign In´, [Customer]-`Buy Products´ )

Arguments

- **direction**
  - is one of [ 'TB', 'LR' ]
  - direction of the diagram: top-to-bottom or left-to-right
- **scale**
  - is an integer percentage value, i.e. 150 or 200
  - defines the scaling applied to the diagram in percent, 100% = no scaling
- **type**
  - is one of [ 'class', 'activity', 'usecase' ]
  - type of the UML diagram
- **style**
  - is one of [ 'plain', 'scruffy' ]
  - defines the applied theme, _plain_ for clean and _scruffy_ for comic-style look

##### Math

[gimmick: math]()
Math formulas are realized through the [MathJax](http://www.mathjax.org) library. To enable math formulas on a page, the `math` gimmick must be loaded by adding this link anywhere in the file:

    [gimmick: math]()

To enable math for all sites, put the above link into the `navigation.md` file. Putting this link onto the site will load MathJax dynamically from a CDN provider.

Note: The MathJax script is very large and loads some more dependencies like fonts. Using the math gimmick might result in slow page loads.

###### Math inserted to new paragraph

You can add math formulas by putting them between to `$$` signs and use LateX syntax:

    $$ x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a} $$

$$ x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a} $$

####### Inline equations

Inline equations can be inserted by surrounding them with the delimiters `\\(` and `\\)`:

    Diameter \\( d \\) of a circle given area \\( A \\) can by obtained via \\(d=\sqrt{\frac{4A}{\pi}}\\)

Will show as: Diameter \\( d \\) of a circle given area \\( A \\) can by obtained via \\(d=\sqrt{\frac{4A}{\pi}}\\)

####### Some examples

$$ \frac{\partial \phi}{\partial x} \vert_b = \frac{1}{\Delta x/2}(\phi_0-\phi_b) $$

$$
\int u \frac{dv}{dx}\,dx=uv-\int
\frac{du}{dx}v\,dx\lim_{n\rightarrow \infty }
\left (  1 +\frac{1}{n} \right )^n
$$

##### Youtube

Whenever you insert a regular link with an empty caption that points to a video on `youtube.com` or `youtu.be`, the link is automatically turned into an embedded iframe, which will display a preview thumbnail of the video on your website.

Example:

    This will show the video preview on your website:
    [](https://www.youtube.com/watch?v=aqz-KE-bpKQ)

[](https://www.youtube.com/watch?v=aqz-KE-bpKQ)

To omit the preview and just get a regular link, add a caption:

    [Click to see an awesome video](https://www.youtube.com/watch?v=aqz-KE-bpKQ)

[Click to see an awesome video](https://www.youtube.com/watch?v=aqz-KE-bpKQ)

##### Chart

Adds a chart to the screen using data from your Markdown table.

###### Options

- labelColumn: This is a string that indicates which column will be used to label the data points. This String must be a direct match to your table header fro the column.
- dataColumns: This is an array of strings that indicated the column to be plotted. This String must be a direct match to your table header fro the column.
- canvasId: This is an ID for the generated chart. Defaults to a random number between 1-1000.
- chartOptions: This is an object that is passed to chartjs to configure its options. Refer to chartjs for documentation on available options.
- chartType: This string is the type of chart render. Bar, Line, or Radar. Defaults to Line.

Note: Currently only support a single table on a page. You CAN have multiple charts from the same table.

    | #  | Sprint          | Points | Sum | Avg  | Note |
    | -  | --------        |------- | --- | ---- | ---- |
    | 1  | Sprint 1        | 6      | 6   | 6.0  | |
    | 2  | Sprint 2        | 6      | 12  | 6.0  | |
    | 3  | Sprint 3        | 15     | 27  | 9.0  | |
    | 4  | Sprint 4        | 9      | 36  | 9.0  | |
    | 5  | Sprint 5        | 6      | 42  | 8.4  | |
    | 6  | Sprint 6        | 9      | 51  | 8.5  | |

    [gimmick:chart ({dataColumns: ['Avg'], labelColumn: "Sprint", chartType: 'Line', width: '660px', height: '300px'})]()

    [gimmick:chart ({dataColumns: ['Avg'], labelColumn: "Sprint", chartType: 'Bar', width: '660px', height: '300px'})]()

Example:

| #   | Sprint   | Points | Sum | Avg | Note |
| --- | -------- | ------ | --- | --- | ---- |
| 1   | Sprint 1 | 6      | 6   | 6.0 |      |
| 2   | Sprint 2 | 6      | 12  | 6.0 |      |
| 3   | Sprint 3 | 15     | 27  | 9.0 |      |
| 4   | Sprint 4 | 9      | 36  | 9.0 |      |
| 5   | Sprint 5 | 6      | 42  | 8.4 |      |
| 6   | Sprint 6 | 9      | 51  | 8.5 |      |

[gimmick:chart ({dataColumns: ['Avg'], labelColumn: "Sprint", chartType: 'Line', width: '660px', height: '300px'})]()

[gimmick:chart ({dataColumns: ['Avg'], labelColumn: "Sprint", chartType: 'Bar', width: '660px', height: '300px'})]()

