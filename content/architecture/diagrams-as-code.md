title=Diagrams As Code
tags=architecture, tool
summary=Generate valid diagrams from source code.
~~~~~~

[Source](https://github.com/diagramsascode/diagramsascode)

Diagrams as code is a term used for storing the source of a diagram image as a text file. Examples are architecture diagrams, or diagrams showing a system's behavior or design. A generator tool like PlantUML then generates an image from the text, and automatically layouts it. According to the ThoughtWorks Technology Radar, a key benefit is that you can use version control on the text files.

The diagrams as code project presented here has additional advantages.

By representing the diagrams as models in Java source code, you can automatically check if the generated diagrams are modeled correctly. And you get better syntax highlighting and auto-completion, compared to solutions like PlantUML.

