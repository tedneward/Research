title=Compost.js
tags=library, presentation, browser, nodejs
summary=A data visualization library that lets you compose rich interactive data visualizations from a small number of basic primitives. The library is based on the functional programming idea of composable domain-specific languages.
~~~~~~

[Website](https://compostjs.github.io/compost/) | [Source](https://github.com/compostjs/compost)


The following example is a line chart showing the GBP/USD exchange rate around 23 June 2016. An interesting feature is that the chart highlights a part before the date using one color and the part after the date using another color.

In Compost, we create the chart by composing three chart elements using c.overlay. The three chart elements are two rectangles constructed using c.shape and one line constructed using c.line. Results of those functions are chart elements that can be further transformed using functions such as c.fillColor and c.strokeColor that change the color of the element.

```
// Exchange rate range for the background
let lo = 1.25, hi = 1.52;

// Overlay three shapes and add axes on three sides
let xchg = c.axes("left right bottom", c.overlay([
  // Fill area behind first 16 values in blue
  c.fillColor("#1F77B460",  c.shape(
    [ [0,lo], [16,lo], [16,hi], [0,hi] ])),
  // Fill area behind the remaining values in red
  c.fillColor("#D6272860",  c.shape(
    [ [gbpusd.length-1,lo], [16,lo], [16,hi], [gbpusd.length-1,hi] ])),
  // Draw a black line using 'gbpusd' array
  c.strokeColor("#202020", c.line(gbpusd.map((v, i) => [i, v])))
]));

// Render chart on <div id="demo" />
c.render("demo", xchg)
```

The example illustrates two key ideas of Compost:

* **Composability.** Charts are composed from a small number of basic primitives such as filled shapes, lines, bubbles and text elements. Those can be further transformed and composed using primitives such as overlay. You can build a wide range of standard and custom charts this way.
* **Domain units.** When you specify a shape, you specify coordinates in terms of domain values. For example, when creating the blue shape, we say that the x coordinates are from 0 to 16 and the y coordinates are from 1.25 to 1.52. The shapes are automatically aligned (when using overlay) and mapped onto the available screen space.
