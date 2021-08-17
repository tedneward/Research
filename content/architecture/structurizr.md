title=Structurizr
tags=architecture, language, format
summary=Builds upon "diagrams as code", allowing you to create multiple diagrams from a single model, using a number of tools and programming languages.
~~~~~~

[Website](https://structurizr.com/) | [Source](https://github.com/structurizr)

```
workspace {

    model {
        user = person "User"
        softwareSystem = softwareSystem "Software System" {
            webapp = container "Web Application" {
                user -> this "Uses"
            }
            container "Database" {
                webapp -> this "Reads from and writes to"
            }
        }
    }

    views {
        systemContext softwareSystem {
            include *
            autolayout lr
        }

        container softwareSystem {
            include *
            autolayout lr
        }

        theme default
    }

}
```

generates

![](https://static.structurizr.com/img/help/multiple-diagrams-1.png) 

and

![](https://static.structurizr.com/img/help/multiple-diagrams-2.png)

