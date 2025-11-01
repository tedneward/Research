title=Augur
tags=tool, open source
summary=A software suite for collecting and measuring structured data about free and open-source software (FOSS) communities.
~~~~~~

[Source](https://github.com/chaoss/augur) | [Docs](https://oss-augur.readthedocs.io/en/main/)

Features:

* focus on data from GitHub and GitLab platforms, which can scale to tens of thousands of repositories, and use Augur’s relational database as a data engineering tool to write custom queries that explore complex or unanticipated questions while performing in-depth research.
* explore data about compliance, security, dependencies, and related software topics to better understand potential risks associated with an open source project in addition to using visualizations to learn about community health.
* Data is collected incrementally and includes all messages and commits associated with issues, pull requests, and pull request reviews, including historical data. This high velocity collection has been tested for up to 100,000 repositories, enabling assessment of diverse open source software ecosystems.
* Collection and analysis goes beyond the counting of activities to include license coverage and license type information, COCOMO based software complexity and cost of replacement data by project and file, software dependency scanning, measurement of dependency LibYears, and time series persistent OpenSSF Scorecard information.
* Understanding of community health is extended through automatically detecting unusual activity by performing computational linguistics machine learning analysis and contribution anomaly detection.
* Users can explore complex or unanticipated questions while performing in-depth research using Augur’s relational database or API to write custom queries.
* Augur includes data visualizations through an extensible frontend built using tools familiar to data scientists (e.g., Dash and Plotly) upon which 8Knot is developed.

