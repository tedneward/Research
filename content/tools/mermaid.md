title=Mermaid
tags=tool, architecture, presentation, format
summary=Generation of diagram and flowchart from text in a similar manner as markdown.
~~~~~~

[Website](https://mermaid-js.github.io/mermaid/#/) | [Source](https://github.com/mermaid-js) | [CLI](https://github.com/mermaid-js/mermaid-cli) | [Live Editor](https://mermaid.live/edit)


To create a Mermaid diagram in these pages, use `<pre class="mermaid">` ... `</pre>` to enclose the diagram text.

Frontmatter configuration: The entire mermaid configuration (except the secure configs) can be overridden by the diagram author in the frontmatter of the diagram. The frontmatter is a YAML block at the top of the diagram.
```
---
title: Hello Title
config:
  theme: base
  themeVariables:
    primaryColor: "#00ff00"
---
flowchart
    Hello --> World
```
<pre class="mermaid">
---
title: Hello Title
config:
  theme: base
  themeVariables:
    primaryColor: "#00ff00"
---
flowchart
    Hello --> World
</pre>

[Flowchart](https://mermaid.js.org/syntax/flowchart.html)
```
```
<pre class="mermaid">
</pre>

[Sequence diagram](https://mermaid.js.org/syntax/sequenceDiagram.html)
```
sequenceDiagram
    Alice->>+John: Hello John, how are you?
    Alice->>+John: John, can you hear me?
    John-->>-Alice: Hi Alice, I can hear you!
    John-->>-Alice: I feel great!
```
<pre class="mermaid">
sequenceDiagram
    Alice->>+John: Hello John, how are you?
    Alice->>+John: John, can you hear me?
    John-->>-Alice: Hi Alice, I can hear you!
    John-->>-Alice: I feel great!
</pre>

[Class diagram](https://mermaid.js.org/syntax/classDiagram.html)
```
---
title: Animal example
---
classDiagram
    Animal <|-- Duck
    note for Duck "can fly\ncan swim\ncan dive\ncan help in debugging"
    Animal <|-- Fish
    Animal <|-- Zebra
    Animal : +int age
    Animal : +String gender
    Animal: +isMammal()
    Animal: +mate()
    class Duck{
      +String beakColor
      +swim()
      +quack()
    }
    class Fish{
      -int sizeInFeet
      -canEat()
    }
    class Zebra{
      +bool is_wild
      +run()
    }
    class Square~Shape~{
        int id
        List~int~ position
        setPoints(List~int~ points)
        getPoints() List~int~
    }

    Square : -List~string~ messages
    Square : +setMessages(List~string~ messages)
    Square : +getMessages() List~string~
    Square : +getDistanceMatrix() List~List~int~~

    classA --|> classB : Inheritance
    classC --* classD : Composition
    classE --o classF : Aggregation
    classG --> classH : Association
    classI -- classJ : Link(Solid)
    classK ..> classL : Dependency
    classM ..|> classN : Realization
    classO .. classP : Link(Dashed)
```
<pre class="mermaid">
---
title: Animal example
---
classDiagram
    Animal <|-- Duck
    Animal <|-- Fish
    Animal <|-- Zebra
    Animal : +int age
    Animal : +String gender
    Animal: +isMammal()
    Animal: +mate()
    class Duck{
      +String beakColor
      +swim()
      +quack()
    }
    class Fish{
      -int sizeInFeet
      -canEat()
    }
    class Zebra{
      +bool is_wild
      +run()
    }
    class Square~Shape~{
        int id
        List~int~ position
        setPoints(List~int~ points)
        getPoints() List~int~
    }

    Square : -List~string~ messages
    Square : +setMessages(List~string~ messages)
    Square : +getMessages() List~string~
    Square : +getDistanceMatrix() List~List~int~~

    classA --|> classB : Inheritance
    classC --* classD : Composition
    classE --o classF : Aggregation
    classG --> classH : Association
    classI -- classJ : Link(Solid)
    classK ..> classL : Dependency
    classM ..|> classN : Realization
    classO .. classP : Link(Dashed)

</pre>

[State diagram](https://mermaid.js.org/syntax/stateDiagram.html)
```
```
<pre class="mermaid">
</pre>



