title=ShapeCrawler
tags=library, clr, msoffice
summary=A .NET library for manipulating PowerPoint presentations.
~~~~~~

[Source](https://github.com/ShapeCrawler/ShapeCrawler)

Read presentation
```c#
// open existing presentation
using var pres = SCPresentation.Open("some.pptx");

var shapeCollection = pres.Slides[0].Shapes;

// get number of shapes on slide
var slidesCount = shapeCollection.Count;

// get text
var autoShape = shapeCollection.GetByName<IAutoShape>("TextBox 1");
var text = autoShape.TextFrame!.Text;
```

Create presentation
```c#
// create a new presentation
var pres = SCPresentation.Create();

var shapeCollection = pres.Slides[0].Shapes;

// add new shape
var addedShape = shapeCollection.AddAutoShape(SCAutoShapeType.TextBox, x: 50, y: 60, width: 100, height: 70);

addedShape.TextFrame!.Text = "Hello World!";

pres.SaveAs("my_pres.pptx");
```

