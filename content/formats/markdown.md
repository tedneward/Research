title=Markdown
tags=format, text, presentation
summary=Text-based markup language originally intended for easy HTML creation.
~~~~~~

[The Markdown Guide](https://www.markdownguide.org/)

[Daring Fireball](https://daringfireball.net/projects/markdown/): Original description

[CommonMark](https://commonmark.org/): A strongly defined, highly compatible specification of Markdown; [Source](https://github.com/commonmark) and [List of CommonMark implementations](https://github.com/commonmark/commonmark-spec/wiki/List-of-CommonMark-Implementations)

[Hyperdeck](https://docs.hyperdeck.io/): Beautiful Markdown Slides for iPad and Mac; [Presentation Markdown](https://docs.hyperdeck.io/markdown/general.html)

[Awesome-Markdown](https://project-awesome.org/BubuAnabelas/awesome-markdown)

## [Cheat sheet](https://github.com/Randy8080/reference/blob/main/markdown.md)

### Headers (atx style)

```markdown
# h1
## h2
### h3
#### h4
##### h5
###### h6
```

### Headers (setext style)

```markdown
Header 1
========
```

```markdown
Header 2
--------
```


### Blockquotes

```markdown
> This is
> a blockquote
>
> > Nested
> > Blockquote
```


### Unordered List

```markdown
* Item 1
* Item 2
    * item 3a
    * item 3b
```

or
```markdown
- Item 1
- Item 2
```

or

```markdown
+ Item 1
+ Item 2
```
or

```markdown
- [ ] Checkbox off
- [x] Checkbox on
```

### Ordered List

```markdown
1. Item 1
2. Item 2
    a. item 3a
    b. item 3b
```



### Links

```markdown
[link](http://google.com)
```

```markdown
[link][google]
[google]: http://google.com
```

```markdown
<http://google.com>
```






### Emphasis

```markdown
*italic*
_italic_
```

```markdown
**bold**
__bold__
```

```markdown
`inline code`
~~struck out~~
```




### Horizontal line

Hyphens
```markdown
---
```

Asterisks
```markdown
***
```

Underscores
```markdown
___
```





### Code
~~~markdown
```javascript
console.log("This is a block code")
```
~~~

```markdown
~~~css
.button { border: none; }
~~~
```


```markdown
    4 space indent makes a code block
```


#### inline code
```markdown
`Inline code` has back-ticks around it
```



### Tables

```markdown
| Left column | Center column | Right column |
|:------------|:-------------:|-------------:|
| Cell 1      | Centered      | $1600        |
| Cell 2      | Cell 3        | $12          |
```

Simple style
```markdown
Left column | Center column | Right column 
:---:|:---:|:---:
Cell 1 | Centered | $1600 
Cell 2 | Cell 3 | $12 
```
A markdown table generator: [tableconvert.com](https://tableconvert.com/)



### Images

```markdown
![GitHub Logo](/images/logo.png)

![Alt Text](url)
```

#### Image with link
```markdown
[![GitHub Logo](/images/logo.png)](https://github.com/)

[![Alt Text](image_url)](link_url)
```

#### Reference style
```markdown
![alt text][/images/logo.png]

[logo]: /images/logo.png "Logo Title"
```


### Backslash escapes

| Characters | Escape | Description           |
|------------|--------|-----------------------|
| \\         | \\\\   | backslash             |
| \`         | \\\`   | backtick              |
| \*         | \\\*   | asterisk              |
| \_         | \\\_   | underscore            |
| \{\}       | \\\{\} | curly braces          |
| \[\]       | \\\[\] | square brackets       |
| \(\)       | \\\(\) | parentheses           |
| \#         | \\\#   | hash mark             |
| \+         | \\\+   | plus sign             |
| \-         | \\\-   | minus sign \(hyphen\) |
| \.         | \\\.   | dot                   |
| \!         | \\\!   | exclamation mark      |
