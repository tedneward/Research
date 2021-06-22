title=Scalable Vector Graphics (SVG)
tags=format, language
summary=An XML-based vector image format for two-dimensional graphics with support for interactivity and animation.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) | [Standard](https://www.w3.org/TR/SVG/)

```
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg width="391" height="391" viewBox="-70.5 -70.5 391 391" xmlns="http://www.w3.org/2000/svg">
<rect fill="#fff" stroke="#000" x="-70" y="-70" width="390" height="390"/>
<g opacity="0.8">
	<rect x="25" y="25" width="200" height="200" fill="green" stroke-width="4" stroke="pink" />
	<circle cx="125" cy="125" r="75" fill="orange" />
	<polyline points="50,150 50,200 200,200 200,100" stroke="red" stroke-width="4" fill="none" />
	<line x1="50" y1="50" x2="200" y2="200" stroke="blue" stroke-width="4" />
</g>
</svg>
```
... produces the following: ![alt text](https://upload.wikimedia.org/wikipedia/commons/1/1a/SVG_example_markup_grid.svg)

