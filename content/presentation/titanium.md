title=Titanium Mobile
tags=presentation, mobile, gamedev
summary=Develop cross-platform native mobile applications and build great mobile experiences using JavaScript.
~~~~~~

[Website](https://titaniumsdk.com/) | [Source](https://github.com/tidev/titanium_mobile)

> "All private source code of the Titanium SDK will be made public in the open source Titanium SDK github repository by March 1, 2022"

Uses extensions for VSCode or Atom as its IDE. There is also a CLI (`npm install titanium -g`) available.

The Titanium SDK supports two project types: Alloy and Classic. Alloy is an MVC framework that lets you develop applications in less time and with less code than is possible in a Classic project. In general, it's recommended you use Alloy for your projects.

Example code from [tutorial](https://titaniumsdk.com/guide/Titanium_SDK/Titanium_SDK_Getting_Started/Hello_Titanium_App_Tutorial.html):
```xml
<Alloy>
    <Window class="container">
        <Label id="label" onClick="doClick">Hello, Titanium</Label>
    </Window>
</Alloy>
```

Uses XML as its visual layout (replacement for HTML, similar in spirit to XAML, sort of), and Javascript as its event-handling/programmatic support language, and "TSS" (a variant of CSS) for styling and visual organization. Renders on both iOS and Android, so it's a single-source/multi-deliverable tool.

Also does game development?