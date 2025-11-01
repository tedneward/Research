title=GrimoireLab
tags=tool, open source
summary=An open source toolkit for Automatic and incremental data gathering from almost any tool (data source) related with contributing to Open Source development (source code management, issue tracking systems, forums, etc.); Automatic gathered data enrichment, merging duplicated identities, adding additional information about contributors affiliation, calculation delays, geographical data, etc.; Data consumption and visualization, allowing filtering by time range, project, repository, contributor, etc.
~~~~~~

[Website](https://chaoss.github.io/grimoirelab/) | [Source](http://github.com/chaoss/grimoirelab) | [Tutorial](https://chaoss.github.io/grimoirelab-tutorial/)

GrimoireLab is a CHAOSS toolset for software development analytics. It includes a coordinated set of tools to retrieve data from systems used to support software development (repositories), store it in databases, enrich it by computing relevant metrics, and make it easy to run analytics and visualizations on it.

Currently, GrimoireLab toolkit is organized in the following repositories:

-   Data retrieval related components:
    -   [Perceval](https://github.com/chaoss/grimoirelab-perceval): retrieval of data from data sources
        -   [Perceval (bundle for OPNFV)](https://github.com/chaoss/grimoirelab-perceval-opnfv)
        -   [Perceval (bundle for Mozilla)](https://github.com/chaoss/grimoirelab-perceval-mozilla)
        -   [Perceval (bundle for Puppet)](https://github.com/chaoss/grimoirelab-perceval-puppet)
        -   [Perceval (bundle for Weblate)](https://github.com/chaoss/grimoirelab-perceval-weblate)
    -   [Graal](https://github.com/chaoss/grimoirelab-graal): source data analysis with external tools
    -   [KingArthur](https://github.com/chaoss/grimoirelab-kingarthur): batch processing for massive retrieval
-   Data enrichment related components:
    -   [GrimoireElk](https://github.com/chaoss/grimoirelab-elk): storage and enrichment of data
    -   [Cereslib](https://github.com/chaoss/grimoirelab-cereslib): generic data processor
    -   [SortingHat](https://github.com/chaoss/grimoirelab-sortinghat): identity management
-   Data consumption related components:
    -   [Sigils](https://github.com/chaoss/grimoirelab-sigils): visualizations and dashboards
    -   [Kidash](https://github.com/chaoss/grimoirelab-kidash): visualizations and dashboards manager
    -   [Manuscripts](https://github.com/chaoss/grimoirelab-manuscripts): reporting
-   Platform management, orchestration, and common utils:
    -   [Mordred](https://github.com/chaoss/grimoirelab-mordred): orchestration
    -   [GrimoireLab Toolkit](https://github.com/chaoss/grimoirelab-toolkit): common utilities

