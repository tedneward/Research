title=PlutoBook
tags=library, browser, printing, native
summary=Paged HTML Rendering Library.
~~~~~~

[Source](https://github.com/plutoprint/plutobook)

## Example

This example creates a PDF from inline HTML using plutobook. It sets up a book with A4 page size and narrow margins (36 points or 0.5 inches on all sides), then writes the output to `hello.pdf`.

```
#include <plutobook.hpp>

static const char kHTMLContent[] = R"HTML(
<!DOCTYPE html>
<html lang="la">
<head>
  <meta charset="UTF-8">
  <title>Magnum Scopulum Corallinum</title>
  <style>
    body { font-family: "Segoe UI", sans-serif; line-height: 1.6; margin: 40px auto; max-width: 800px; color: #222; }
    h1 { font-size: 2.5em; margin-bottom: 20px; }
    img { width: 100%; border-radius: 6px; margin-bottom: 20px; }
    p { font-size: 1.05em; text-align: justify; }
  </style>
</head>
<body>
  <h1>Magnum Scopulum Corallinum</h1>
  <img src="https://picsum.photos/id/128/800/400" alt="Magnum Scopulum Corallinum">
  <p>Magnum Scopulum Corallinum est maximum systema scopulorum corallinorum in mundo, quod per plus quam 2,300 chiliometra oram septentrionalem-orientalem Australiae extenditur. Ex milibus scopulorum individualium et centenis insularum constat, e spatio videri potest et inter mirabilia naturalia mundi numeratur.</p>
  <p>Domus est incredibili diversitati vitae marinae, cum plus quam 1,500 speciebus piscium, 400 generibus corallii, et innumerabilibus aliis organismis. Partem vitalem agit in salute oecosystematis marini conservanda et sustentat victum communitatum litoralium per otium et piscationem.</p>
  <p>Quamquam pulchritudinem ac significationem oecologicam praebet, Magnum Scopulum Corallinum minas continenter patitur ex mutatione climatis, pollutione, et nimia piscatione. Eventus albi corallii ex temperaturis marinis crescentibus magnam partem scopuli nuper laeserunt. Conatus conservatorii toto orbe suscipiuntur ad hunc magnificum oecosystema subaquaneum tuendum et restaurandum.</p>
</body>
</html>
)HTML";

int main()
{
    plutobook::Book book(plutobook::PageSize::A4, plutobook::PageMargins::Narrow);
    book.loadHtml(kHTMLContent);
    book.writeToPdf("hello.pdf");
    return 0;
}
```

