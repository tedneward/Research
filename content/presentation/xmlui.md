title=XMLUI
tags=presentation, browser
summary=A framework for building browser user interfaces declaratively, with XML markup and flexible theming.
~~~~~~

[Website](https://www.xmlui.org/) | [Source](https://github.com/xmlui-org/xmlui) | [Demos](https://demo.xmlui.org/) | [Docs](https://docs.xmlui.org/)

## Reading

* [Introducing XMLUI](https://blog.jonudell.net/2025/07/18/introducing-xmlui/)

## Example

### Getting Started

The XMLUI engine is a single JS file. Here is the minimal XMLUI setup.

```
<your app folder>
index.html
Main.xmlui
xmlui
0.9.90.js
```

index.html
```
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="xmlui/0.9.90.js"></script>
  </head>
  <body>
  </body>
</html>
```

Main.xmlui
```
<App name="XMLUI Hello World">Hello World</App>
```



Automatic reactivity

```
<App>
  <Select id="lines" initialValue="bakerloo">
    <Items data="https://api.tfl.gov.uk/line/mode/tube/status">
        <Option value="{$item.id}" label="{$item.name}" />
    </Items>
  </Select>
  <DataSource
    id="tubeStations"
    url="https://api.tfl.gov.uk/Line/{lines.value}/Route/Sequence/inbound"
    resultSelector="stations"/>
  <Table data="{tubeStations}" height="280px">
    <Column bindTo="name" />
    <Column bindTo="modes" />
  </Table>
</App>
```

## Components

APICall, App, AppHeader, AppState, AutoComplete, Avatar, Backdrop, Badge, BarChart, Bookmark, Breakout, Button, CHStack, CVStack, Card, ChangeListener, Checkbox, ColorPicker, Column, ContentSeparator, DataSource, DatePicker, DonutChart, DropdownMenu, EmojiSelector, FileInput, FileUploadDropZone, FlowLayout, Footer, Form, FormItem, FormSection, Fragment, H1, H2, H3, H4, H5, H6, HSplitter, HStack, Heading, Icon, Image, Items, LabelList, Legend, LineChart, Link, List, Logo, Markdown, MenuItem, MenuSeparator, ModalDialog, NavGroup, NavLink, NavPanel, NoResult, NumberBox, Option, Page, PageMetaTitle, Pages, PasswordInput, PieChart, ProgressBar, Queue, RadioGroup, RealTimeAdapter, Redirect, Select, Slider, SpaceFiller, Spinner, Splitter, Stack, StickyBox, SubMenuItem, Switch, TabItem, Table, TableOfContents, Tabs, Text, TextArea, TextBox, Theme, ToneChangerButton, VSplitter, VStack

See the [whole catalog](https://docs.xmlui.org/components/_overview).

