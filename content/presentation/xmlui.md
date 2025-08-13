title=XMLUI
tags=presentation, browser
summary=A framework for building browser user interfaces declaratively, with XML markup and flexible theming.
~~~~~~

[Website](https://www.xmlui.org/) | [Source](https://github.com/xmlui-org/xmlui) | [Demos](https://demo.xmlui.org/) | [Docs](https://docs.xmlui.org/)

## Example

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

