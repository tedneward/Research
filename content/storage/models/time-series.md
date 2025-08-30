title=Time-series storage model
tags=storage, model, temporal
summary=Thoughts and links on time-series models.
~~~~~~

[Wikipedia](https://en.wikipedia.org/wiki/Time_series_database)

"A time series database is a specialized database that efficiently stores and retrieves time-stamped data. Each time series is stored individually as an optimized list of values, enabling fast data retrieval and cost-effective storage." --[Honeycomb](https://www.honeycomb.io/blog/time-series-database)

"Time series databases are specialized databases designed to manage data that is organized and indexed by time. Unlike traditional databases, which are optimized for general-purpose data storage, TSDBs focus on efficiently storing, querying, and analyzing sequences of time-stamped data points." -- [Datacamp](https://www.datacamp.com/blog/time-series-database)

***Characteristics of Time Series Databases***: There are a few things that TSDBs do differently than traditional databases.

**Optimized for time-stamped data.** At their core, TSDBs are built to handle data with timestamps as a fundamental attribute. Every data point in a TSDB includes a timestamp, which serves as its primary index. This allows these databases to efficiently store and retrieve time-ordered sequences and provide quick access to historical trends or recent events. Most TSDBs use time-based partitioning, meaning the data is stored in partitions based on time intervals (e.g., hourly, daily). This enables efficient pruning, where queries ignore irrelevant partitions altogether.  They can also implement time buckets, grouping data into predefined time windows (e.g., 1 minute, 1 hour) for faster aggregations.

**High ingestion rates.** Time series data is often generated at a rapid pace—think of IoT devices sending thousands of data points per second or a server monitoring tool capturing system metrics in real time. TSDBs are optimized for these high write rates and can ingest vast amounts of data without slowing down or losing information. This is usually achieved using append-only data storage models and in-memory buffers to prevent locks or transactional bottlenecks.

**Efficient queries for time ranges.** Analyzing time series data often involves querying specific time intervals or windows, such as “last 24 hours” or “this year compared to last year.” TSDBs are built with this in mind, offering specialized query capabilities that allow users to quickly retrieve data over defined time ranges. They also support aggregations like averages, sums, or trends to offer valuable analytics without complex query logic.

The query optimization techniques include:

    * Pre-aggregated data: TSDBs often pre-calculate summaries for common time intervals (e.g., hourly or daily averages).
    * Sliding window algorithms: These help efficiently compute metrics over moving time windows, such as rolling averages.

**Data compression and retention policies.** To manage the vast amount of time series data generated over time, TSDBs use advanced data compression techniques. These methods reduce storage requirements while preserving query performance. TSDBs usually include retention policies so the users can define how long data should be kept. For example, a system might retain detailed data for the past month while downsampling for older data. Downsampling is the process of reducing the granularity of data over time. For example: Raw temperature readings might be recorded every 10 seconds for the most recent 7 days; or for older data, the system might downsample to hourly averages to save space while still retaining historical trends.

Examples of advanced compression techniques include:

    * Delta encoding: Storing the difference between consecutive values instead of the full value.
    * Gorilla compression: A method used to efficiently compress floating-point time series data by storing changes in binary format.

**Writes dominate.** Our primary requirement for a TSDB is that it should always be available to take writes. As we have hundreds of systems exposing multiple data items, the write rate might easily exceed tens of millions of data points each second. In constrast, the read rate is usually a couple orders of magnitude lower as it is primarily from automated systems watching ’important’ time series, data visualization systems presenting dashboards for human consumption, or from human operators wishing to diagnose an observed problem.

**State transitions.** We wish to identify issues that emerge from a new software release, an unexpected side effect of a configuration change, a network cut and other issues that result in a significant state transition. Thus, we wish for our TSDB to support fine-grained aggregations over short-time windows. The ability to display state transitions within tens of seconds is particularly prized as it allows automation to quickly remediate problems before they become wide spread.

**High availability.** Even if a network partition or other failure leads to disconnection between different datacenters, systems operating within any given datacenter ought to be able to write data to local TSDB machines and be able to retrieve this data on demand.

**Fault tolerance.** We wish to replicate all writes to multiple regions so we can survive the loss of any given datacenter or geographic region due to a disaster.

**Lack of ACID.** These systems do not store any user data so traditional ACID guarantees are not a core requirement for TSDBs. However, a high percentage of writes must succeed at all times, even in the face of disasters that might render entire datacenters unreachable. Additionally, recent data points are of higher value than older points given the intuition that knowing if a particular system or service is broken right now is more valuable to an operations engineer than knowing if it was broken an hour ago. 

## Databases

- [atlas](https://github.com/Netflix/atlas) In-memory dimensional time series database from Netflix.
- [Cassandra](/storage/cassandra) Apache Cassandra is an open source NoSQL distributed database trusted by thousands of companies for scalability and high availability without compromising performance.
- [ClickHouse](https://clickhouse.com/) An open-source, high performance columnar OLAP database management system for real-time analytics using SQL.
- [cratedb](https://crate.io/use-cases/time-series/) The SQL database for complex, large scale time series workloads in industrial IoT.
- [druid](https://druid.apache.org/) A high performance real-time analytics database.
- [fauna](https://fauna.com) Fauna is a flexible, developer-friendly, transactional database delivered as a secure and scalable cloud API with native GraphQL.
- [InfluxDB](/storage/influxdb/) Is the essential time series toolkit - dashboards, queries, tasks and agents all in one place.
- [KairosDB](https://kairosdb.github.io/) Fast Time Series Database on Cassandra.
- [OpenTSDB](/storage/opentsdb) The Scalable Time Series Database.
- [prometheus](https://prometheus.io/) An open-source systems monitoring and alerting toolkit originally built at [SoundCloud](https://soundcloud.com).
- [QuestDB](https://github.com/questdb/questdb) An open source SQL database designed to process time series data, faster.
- [SiriDB](https://siridb.com/) An highly-scalable, robust and super fast time series database.
- [TimescaleDB](/storage/timescaledb) TimescaleDB is the leading open-source relational database with support for time-series data.
- [TDengine](https://tdengine.com) An open-source time-series database with high-performance, scalability and SQL support.
- [Whisper (Graphite)](https://github.com/graphite-project/whisper): a file-based time-series database format for Graphite. ([Docs](http://graphite.readthedocs.org/)) | [Graphite website](https://graphiteapp.org/)

### Managed database services

- [Amazon Timestream](https://aws.amazon.com/timestream/) A fast, scalable, and serverless time series database service for IoT and operational applications.
- [Azure Database for PostgreSQL](https://azure.microsoft.com/en-us/services/postgresql/#overview) Fully managed, intelligent, and scalable PostgreSQL with support for TimeScaleDB.
- [Azure time series insights](https://azure.microsoft.com/en-us/services/time-series-insights/) Visualize IoT data in real time.
- [InfluxDB Cloud](https://www.influxdata.com/products/influxdb-cloud/) It’s a fast, elastic, serverless real-time monitoring platform, dashboarding engine, analytics service and event and metrics processor.
- [TimeScaleDB Cloud](https://www.timescale.com/products/#Timescale-Cloud) Managed TimeScaleDB service.
- [TDengine Cloud](https://cloud.tdengine.com/) Serverless, fully managed cloud service for time series data

## Packages

### Python

- [adtk](https://github.com/arundo/adtk) A Python toolkit for rule-based/unsupervised anomaly detection in time series.
- [aeon](https://github.com/aeon-toolkit/aeon) A unified framework for machine learning with time series.
- [alibi-detect](https://github.com/SeldonIO/alibi-detect) Algorithms for outlier, adversarial and drift detection.
- [AutoTS](https://github.com/winedarksea/AutoTS) A time series package for Python designed for rapidly deploying high-accuracy forecasts at scale.
- [Auto_TS](https://github.com/AutoViML/Auto_TS) Automatically build ARIMA, SARIMAX, VAR, FB Prophet and XGBoost Models on Time Series data sets with a Single Line of Code. Now updated with Dask to handle millions of rows.
- [cesium](https://github.com/cesium-ml/cesium) Open-Source Platform for Time Series Inference.
- [darts](https://github.com/unit8co/darts) Time Series Made Easy in Python. A python library for easy manipulation and forecasting of time series.
- [deeptime](https://github.com/deeptime-ml/deeptime) Python library for analysis of time series data including dimensionality reduction, clustering, and Markov model estimation.
- [dtw-python](https://github.com/DynamicTimeWarping/dtw-python) Python port of R's Comprehensive Dynamic Time Warp algorithm package.
- [etna](https://github.com/tinkoff-ai/etna) ETNA is an easy-to-use time series forecasting framework.
- [fost](https://github.com/microsoft/FOST) Forecasting open source tool aims to provide an easy-use tool for spatial-temporal forecasting.
- [functime](https://github.com/descendant-ai/functime) Time-series machine learning and embeddings at scale.
- [gluon-ts](https://github.com/awslabs/gluon-ts) Probabilistic time series modeling in Python from AWS.
- [gordo](https://github.com/equinor/gordo) Building thousands of models with time series data to monitor systems.
- [greykite](https://github.com/linkedin/greykite) A flexible, intuitive and fast forecasting library from LinkedIn.
- [hmmlearn](https://github.com/hmmlearn/hmmlearn) Hidden Markov Models in Python, with `scikit-learn` like API.
- [HyperTS](https://github.com/DataCanvasIO/HyperTS) A Full-Pipeline Automated Time Series (AutoTS) Analysis Toolkit.
- [kats](https://github.com/facebookresearch/kats) A kit to analyze time series data, a lightweight, easy-to-use, generalizable, and extendable framework to perform time series analysis, from understanding the key statistics and characteristics, detecting change points and anomalies, to forecasting future trends.
- [libmaxdiv](https://github.com/cvjena/libmaxdiv) Implementation of the Maximally Divergent Intervals algorithm for Anomaly Detection in multivariate spatio-temporal time-series.
- [lifelines](https://github.com/CamDavidsonPilon/lifelines) Survival analysis in Python.
- [luminaire](https://github.com/zillow/luminaire) A python package that provides ML driven solutions for monitoring time series data. Luminaire provides several anomaly detection and forecasting capabilities that incorporate correlational and seasonal patterns in the data over time as well as uncontrollable variations.
- [mass-ts](https://github.com/matrix-profile-foundation/mass-ts) Mueen's Algorithm for Similarity Search, a library used for searching time series sub- sequences under z-normalized Euclidean distance for similarity.
- [matrixprofile](https://github.com/matrix-profile-foundation/matrixprofile) A Python library making time series data mining tasks, utilizing matrix profile algorithms, accessible to everyone.
- [Merlion](https://github.com/salesforce/Merlion) A Python library for time series intelligence. It provides an end-to-end machine learning framework that includes loading and transforming data, building and training models, post-processing model outputs, and evaluating model performance.
- [neuralforecast](https://github.com/Nixtla/neuralforecast) Scalable and user friendly neural brain forecasting algorithms.
- [nixtla](https://github.com/Nixtla/nixtla) Automated time series processing and forecasting.
- [orbit](https://github.com/uber/orbit) A package for Bayesian forecasting with object-oriented design and probabilistic models under the hood from Uber.
- [pastas](https://github.com/pastas/pastas) An open-source Python framework for the analysis of hydrological time series.
- [pmdarima](https://github.com/alkaline-ml/pmdarima) A statistical library designed to fill the void in Python's time series analysis capabilities, including the equivalent of R's `auto.arima` function.
- [prophet](https://github.com/facebook/prophet) Tool for producing high quality forecasts for time series data that has multiple seasonality with linear or non-linear growth.
- [pyaf](https://github.com/antoinecarme/pyaf) PyAF is an Open Source Python library for Automatic Time Series Forecasting built on top of popular pydata modules.
- [PyDLM](https://github.com/wwrechard/pydlm) Bayesian time series modeling package. Based on the Bayesian dynamic linear model (Harrison and West, 1999) and optimized for fast model fitting and inference.
- [PyFlux](https://github.com/RJT1990/pyflux) Open source time series library for Python.
- [pyFTS](https://github.com/PYFTS/pyFTS) An open source library for Fuzzy Time Series in Python.
- [Pyod](https://github.com/yzhao062/Pyod) A Python toolbox for scalable outlier detection (Anomaly Detection).
- [PyPOTS](https://github.com/WenjieDu/PyPOTS) A python toolbox/library for data mining on partially-observed time series (A.K.A. irregularly-sampled time series), supporting tasks of forecasting/imputation/classification/clustering on incomplete multivariate time series with missing values.
- [pyspi](https://github.com/olivercliff/pyspi) Comparative analysis of pairwise interactions in multivariate time series.
- [pytimetk](https://github.com/business-science/pytimetk) The time series toolkit for python.
- [rrcf](https://github.com/kLabUM/rrcf) Implementation of the Robust Random Cut Forest algorithm for anomaly detection on streams.
- [scalecast](https://github.com/mikekeith52/scalecast) A scalable forecasting approach for Timeseries in Python
- [scikit-hts](https://github.com/carlomazzaferro/scikit-hts) Hierarchical Time Series Forecasting with a familiar API.
- [seglearn](https://github.com/dmbee/seglearn) A python package for machine learning time series or sequences.
- [shyft](https://gitlab.com/shyft-os/shyft) Time-series for python and c++, including distributed storage and calculations Hydrologic Forecasting Toolbox, high-performance flexible stacks, including calibration Energy-market models and micro services.
- [similarity_measures](https://github.com/cjekel/similarity_measures) Quantify the difference between two arbitrary curves.
- [skforecast](https://github.com/JoaquinAmatRodrigo/skforecast) Time series forecasting with scikit-learn models.
- [sktime](https://github.com/alan-turing-institute/sktime) A `scikit-learn` compatible Python toolbox for learning with time series.
- [statsforecast](https://github.com/Nixtla/statsforecast) Lightning :zap: fast forecasting with statistical and econometric models.
- [statsmodels.tsa](https://www.statsmodels.org/stable/tsa.html) Time Series Analysis (tsa) `statsmodels.tsa` contains model classes and functions that are useful for time series analysis.
- [stumpy](https://github.com/TDAmeritrade/stumpy) A powerful and scalable Python library that can be used for a variety of time series data mining tasks.
- [TICC](https://github.com/davidhallac/TICC) A python solver for efficiently segmenting and clustering a multivariate time series.
- [tick](https://github.com/X-DataInitiative/tick) Module for statistical learning, with a particular emphasis on time-dependent modelling.
- [TimeCopilot](https://github.com/AzulGarza/timecopilot) An open-source forecasting agent that combines the power of large language models with state-of-the-art time series foundation models.
- [timemachines](https://github.com/microprediction/timemachines) Continuously evaluated, functional, incremental, time-series forecasting.
- [TimeSeers](https://github.com/MBrouns/timeseers) A hierarchical Bayesian Time Series model based on Prophet, written in PyMC3.
- [TimesFM](https://github.com/google-research/timesfm) TimesFM (Time Series Foundation Model) is a pretrained time-series foundation model developed by Google Research for time-series forecasting.
- [Time Series Generator](https://pypi.org/project/time-series-generator/) Provides a solution for the direct multi-step outputs limitation in Keras.
- [tods](https://github.com/datamllab/tods) An Automated Time-series Outlier Detection System.
- [torchtime](https://github.com/philipdarke/torchtime) Time series data sets for PyTorch.
- [TSDB](https://github.com/WenjieDu/TSDB) Time-Series DataBase: A Python toolbox helping load time-series datasets easily.
- [tsai](https://github.com/timeseriesAI/tsai) State-of-the-art Deep Learning library for Time Series and Sequences.
- [tscv](https://github.com/WenjieZ/TSCV) Time Series Cross-Validation - an extension for scikit-learn.
- [tsflex](https://github.com/predict-idlab/tsflex) Flexible time series feature extraction & processing.
- [tslearn](https://github.com/tslearn-team/tslearn) The machine learning toolkit for time series analysis in Python.
- [tslumen](https://github.com/hsbc/tslumen) A library for Time Series Exploratory Data Analysis (EDA). 
- [tsmoothie](https://github.com/cerlymarco/tsmoothie) A python library for time-series smoothing and outlier detection in a vectorized way.

#### Date and Time
*Libraries for working with dates and times.*

- [astral](https://github.com/sffjunkie/astral) Python calculations for the position of the sun and moon.
- [Arrow](https://github.com/arrow-py/arrow) - A Python library that offers a sensible and human-friendly approach to creating, manipulating, formatting and converting dates, times and timestamps.
- [Chronyk](https://github.com/KoffeinFlummi/Chronyk) - A Python 3 library for parsing human-written times and dates.
- [dateutil](https://github.com/dateutil/dateutil) - Extensions to the standard Python [datetime](https://docs.python.org/3/library/datetime.html) module.
- [delorean](https://github.com/myusuf3/delorean/) - A library for clearing up the inconvenient truths that arise dealing with datetimes.
- [maya](https://github.com/timofurrer/maya) - Datetimes for Humans.
- [moment](https://github.com/zachwill/moment) - A Python library for dealing with dates/times. Inspired by [Moment.js](http://momentjs.com/).
- [Pendulum](https://github.com/sdispater/pendulum) - Python datetimes made easy.
- [PyTime](https://github.com/shinux/PyTime) - An easy-to-use Python module which aims to operate date/time/datetime by string.
- [pytz](https://launchpad.net/pytz) - World timezone definitions, modern and historical. Brings the [tz database](https://en.wikipedia.org/wiki/Tz_database) into Python.
- [when.py](https://github.com/dirn/When.py) - Providing user-friendly functions to help perform common date and time actions.

#### Feature Engineering

- [AntroPy](https://github.com/raphaelvallat/antropy) Time-efficient algorithms for computing the entropy and complexity of time-series.
- [catch22](https://github.com/chlubba/catch22) CAnonical Time-series CHaracteristics, 22 high-performing time-series features in C, Python and Julia.
- [featuretools](https://github.com/alteryx/featuretools) An open source python library for automated feature engineering.
- [temporian](https://github.com/google/temporian) Temporian is an open-source Python library for preprocessing ⚡ and feature engineering 🛠 temporal data 📈 for machine learning applications 🤖
- [tsfeatures](https://github.com/Nixtla/tsfeatures) Calculates various features from time series data. Python implementation of the R package tsfeatures.
- [tsfel](https://github.com/fraunhoferportugal/tsfel) An intuitive library to extract features from time series.
- [tsflex](https://github.com/predict-idlab/tsflex) Flexible & efficient time series feature extraction & processing package.
- [tsfresh](https://github.com/blue-yonder/tsfresh) The package contains many feature extraction methods and a robust feature selection algorithm.

#### Time Series Segmentation & Change Point Detection

- [bayesian_changepoint_detection](https://github.com/hildensia/bayesian_changepoint_detection) Methods to get the probability of a change point in a time series. Both online and offline methods are available.
- [changepy](https://github.com/ruipgil/changepy) Change point detection in time series in pure python.
- [RBEAST](https://github.com/zhaokg/Rbeast) Bayesian Change-Point Detection and Time Series Decomposition.
- [ruptures](https://github.com/deepcharles/ruptures) A Python library for off-line change point detection. This package provides methods for the analysis and segmentation of non-stationary signals.
- [TCPDBench](https://github.com/alan-turing-institute/TCPDBench) Turing Change Point Detection Benchmark, a benchmark evaluation of change point detection algorithms.

#### Time Series Generation and Augmentation

- [DeepEcho](https://github.com/sdv-dev/DeepEcho) Synthetic Data Generation for mixed-type, multivariate time series.
- [deltapy](https://github.com/firmai/deltapy) Tabular Data Augmentation & Feature Engineering.
- [time_series_augmentation](https://github.com/uchidalab/time_series_augmentation) An example of time series augmentation methods with Keras.
- [TimeSynth](https://github.com/TimeSynth/TimeSynth) A multipurpose library for synthetic time series in Python.
- [tsaug](https://github.com/arundo/tsaug) A Python package for time series augmentation.
- [tsgm](https://github.com/alexandervnikitin/tsgm) Synthetic time series generation and time series augmentations.

#### Visualization

- [atlair](https://github.com/altair-viz/altair) Declarative statistical visualization library for Python.
- [matplotlib](https://github.com/matplotlib/matplotlib) A comprehensive library for creating static, animated, and interactive visualizations in Python.
- [plotly](https://github.com/plotly/plotly.py) A graphing library makes interactive, publication-quality graphs.
  - [plotly-resampler](https://github.com/predict-idlab/plotly-resampler) Wrapper for Plotly figures, making large sequential plots scalable.
- [seaborn](https://github.com/mwaskom/seaborn) A data visualization library based on [matplotlib](https://matplotlib.org) that provides a high-level interface for drawing attractive and informative statistical graphics.
- [tsdownsample](https://github.com/predict-idlab/tsdownsample) Extremely fast time series downsampling for visualisation.

#### Benchmarking & Contests

- [timeseries-elo-ratings](https://github.com/microprediction/timeseries-elo-ratings) computes [Elo ratings](https://microprediction.github.io/timeseries-elo-ratings/html_leaderboards/overall.html).
- [m6](https://github.com/microprediction/m6) Provides utilities for the [M6-Competition](https://mofc.unic.ac.cy/the-m6-competition/)
- Microprediction time-series [competitions](https://www.microprediction.com/competitions)
- [SKAB](https://github.com/waico/SKAB) Skoltech Anomaly Benchmark. Time-series data for evaluating Anomaly Detection algorithms.

### R

- [bcp](https://cran.r-project.org/package=bcp) Bayesian Analysis of Change Point Problems.
- [CausalImpact](https://google.github.io/CausalImpact/CausalImpact.html) An R package for causal inference using Bayesian structural time-series models.
- [changepoint](https://github.com/rkillick/changepoint) Implements various mainstream and specialised changepoint methods for finding single and multiple changepoints within data.
- [cpm](https://cran.r-project.org/package=cpm) Sequential and Batch Change Detection Using Parametric and Nonparametric Methods.
- [EnvCpt](https://github.com/rkillick/EnvCpt) Detection of Structural Changes in Climate and Environment Time Series.
- [fable](https://github.com/tidyverts/fable) A [tidyverts](https://github.com/tidyverts) package for tidy time series forecasting.
- [fasster](https://github.com/tidyverts/fasster) A [tidyverts](https://github.com/tidyverts) package for forecasting with additive switching of seasonality, trend and exogenous regressors.
- [feasts](https://github.com/tidyverts/feasts) A [tidyverts](https://github.com/tidyverts) package for feature extraction and statistics for time series.
- [fpop](https://cran.r-project.org/package=fpop) Segmentation using Optimal Partitioning and Function Pruning.
- [greybox](https://github.com/config-i1/greybox) Regression model building and forecasting in R.
- [modeltime](https://github.com/business-science/modeltime) Modeltime unlocks time series forecast models and machine learning in one framework.
- [penaltyLearning](https://github.com/tdhock/penaltyLearning) Algorithms for supervised learning of penalty functions for change detection.
- [Rcatch22](https://github.com/hendersontrent/Rcatch22) R package for calculation of 22 CAnonical Time-series CHaracteristics.
- [smooth](https://github.com/config-i1/smooth) The set of smoothing functions used for time series analysis and in forecasting. 
- [theft](https://github.com/hendersontrent/theft) R package for Tools for Handling Extraction of Features from Time series.
- [timetk](https://github.com/business-science/timetk) A `tidyverse` toolkit to visualize, wrangle, and transform time series data.
- [tsibble](https://github.com/tidyverts/tsibble) A [tidyverts](https://github.com/tidyverts) package with tidy temporal data frames and tools.
- [tsrepr](https://github.com/PetoLau/TSrepr) TSrepr: R package for time series representations.

### Java

- [SFA](https://github.com/patrickzib/SFA) Scalable Time Series Data Analytics.
- [tsml](https://github.com/uea-machine-learning/tsml) Java time series machine learning tools in a Weka compatible toolkit.

### JavaScript

#### Visualization

- [cubism](https://github.com/square/cubism) A [D3](http://d3js.org) plugin for visualizing time series. Use Cubism to construct better realtime dashboards, pulling data from [Graphite](https://github.com/square/cubism/wiki/Graphite), [Cube](https://github.com/square/cubism/wiki/Cube) and other sources.
- [echarts](https://github.com/apache/echarts) A free, powerful charting and visualization library offering an easy way of adding intuitive, interactive, and highly customizable charts to your commercial products.
- [fusiontime](https://www.fusioncharts.com/fusiontime) Helps you visualize time-series and stock data in JavaScript, with just a few lines of code.
- [highcharts](https://github.com/highcharts/highcharts) A JavaScript charting library based on SVG, with fallbacks to VML and canvas for old browsers.
- [synchro-charts](https://github.com/awslabs/synchro-charts) A front-end component library that provides a collection of components to visualize time-series data.

### Spark

- [flint](https://github.com/twosigma/flint) A Time Series Library for Apache Spark.

### MATLAB

- [hctsa](https://github.com/benfulcher/hctsa) Highly comparative time-series analysis.

## Annotation and Labeling

- [AnnotateChange](https://github.com/alan-turing-institute/AnnotateChange) - A simple flask application to collect annotations for the Turing Change Point Dataset, a benchmark dataset for change point detection algorithms.
- [Curve](https://github.com/baidu/Curve) - An open-source tool to help label anomalies on time-series data
- [TagAnomaly](https://github.com/Microsoft/TagAnomaly) - Anomaly detection analysis and labeling tool, specifically for multiple time series (one time series per category)
- [time-series-annotator](https://github.com/CrowdCurio/time-series-annotator) - Time Series Annotation Library implements classification tasks for time series.
- [WDK](https://github.com/avenix/WDK) - The Wearables Development Toolkit (WDK) is a set of tools to facilitate the development of activity recognition applications with wearable devices.

## Reading

### Blogs

- [Goku: Building a Scalable and High-Performant Time Series Database System (Pinterest)](https://medium.com/pinterest-engineering/goku-building-a-scalable-and-high-performant-time-series-database-system-a8ff5758a181)

### Papers

- [**Dive into Time-Series Anomaly Detection: A Decade Review**](https://arxiv.org/abs/2412.20512), _Paul Boniol, Qinghua Liu, Mingyi Huang, Themis Palpanas, John Paparrizos_, 2024
- [**TS2Vec: Towards Universal Representation of Time Series**]((https://arxiv.org/abs/2106.10466)), _Zhihan Yue, Yujing Wang, Juanyong Duan, Tianmeng Yang, Congrui Huang, Yunhai Tong, Bixiong Xu_, 2022 - [code](https://github.com/yuezhihan/ts2vec)
- [**Conformal prediction interval for dynamic time-series**](https://proceedings.mlr.press/v139/xu21h), _Chen Xu, Yao Xie_, International Conference on Machine Learning 2021 (long presentation) - [code](https://github.com/hamrel-cxu/EnbPI)
- [**Deep learning for time series classification: a review**](https://arxiv.org/abs/1809.04356v3), _H. I. Fawaz, G. Forestier, J. Weber, L. Idoumghar, P-A. Muller_, Data Mining and Knowledge Discovery 2019 - [code](https://github.com/hfawaz/dl-4-tsc)
- [**Greedy Gaussian Segmentation of Multivariate Time Series**](http://stanford.edu/~boyd/papers/ggs.html), _D. Hallac, P. Nystrup, and S. Boyd_, Advances in Data Analysis and Classification, 13(3), 727–751, 2019. - [code](https://github.com/cvxgrp/GGS)
- [**U-Time: A Fully Convolutional Network for Time Series Segmentation Applied to Sleep Staging**](https://arxiv.org/abs/1910.11162), _Mathias Perslev, Michael Jensen, Sune Darkner, Poul Jørgen Jennum, Christian Igel_, _NeurIPS_, 2019. - [code](https://github.com/perslev/U-Time)
- [**A Better Alternative to Piecewise Linear Time Series Segmentation**](https://arxiv.org/abs/cs/0605103), _Daniel Lemire_, SIAM Data Mining, 2007. - [code](https://github.com/lemire/PiecewiseLinearTimeSeriesApproximation)
- [**Time-series Generative Adversarial Networks**](https://papers.nips.cc/paper/2019/file/c9efe5f26cd17ba6216bbe2a7d26d490-Paper.pdf), _Jinsung Yoon, Daniel Jarrett, Mihaela van der Schaar_, NeurIPS, 2019. - [code](https://github.com/jsyoon0823/TimeGAN)
- [**Learning to Diagnose with LSTM Recurrent Neural Networks**](https://arxiv.org/abs/1511.03677), _Zachary C. Lipton, David C. Kale, Charles Elkan, Randall Wetzel_, arXiv:1511.03677, 2015. - [code](https://github.com/aqibsaeed/Multilabel-timeseries-classification-with-LSTM)
- [**Coherence-based Label Propagation over Time Series for Accelerated Active Learning**](https://openreview.net/forum?id=gjNcH0hj0LM), _Yooju Shin, Susik Yoon, Sundong Kim, Hwanjun Song, Jae-Gil Lee, Byung Suk Lee_, ICLR, 2022. - [code](https://github.com/kaist-dmlab/TCLP)
- [Facebook Gorilla](https://www.vldb.org/pvldb/vol8/p1816-teller.pdf): "Large-scale internet services aim to remain highly-available and responsive for their users even in the presence of unexpected failures. As these services have grown to support a global audience, they have scaled beyond a few systems running on hundreds of machines to thousands of individual systems running on many thousands of machines, often across multiple geo-replicated datacenters. An important requirement to operating these large scale services is to accurately monitor the health and performance of the underlying system and quickly identify and diagnose problems as they arise. Facebook uses a time series database (TSDB) to store system measuring data points and provides quick query functionalities on top. We next specify some of the constraints that we need to satisy for monitoring and operating Facebook and then describe Gorilla, our new inmemory TSDB that can store tens of millions of datapoints (e.g., CPU load, error rate, latency etc.) every second and respond queries over this data within milliseconds."
- [Goku: A Schemaless Time Series Database for Large Scale Monitoring at Pinterest](https://dl.acm.org/doi/abs/10.14778/3705829.3705862)

### Books

- [Bayesian Time Series Models ](https://www.cambridge.org/pl/academic/subjects/computer-science/pattern-recognition-and-machine-learning/bayesian-time-series-models?format=HB) 💲 _David Barber, A. Taylan Cemgil, Silvia Chiappa_, Cambridge Academic Press 2011
- [Codeless Time Series Analysis with KNIME](https://www.knime.com/codeless-time-series-analysis-with-knime) 💲 _Corey Weisinger, Maarit Widmann, and Daniele Tonini_, Packt Publishing 2022
- [Forecasting principles and practice (3rd ed)](https://otexts.com/fpp3/) 🆓 _Rob J Hyndman and George Athanasopoulos_ 2021
- [Practical Time Series Analysis](https://www.packtpub.com/product/practical-time-series-analysis/9781788290227) 💲 _Avishek Pal, PKS Prakash_, Packt 2017
  - [repo with code](https://github.com/PacktPublishing/Practical-Time-Series-Analysis)
- [Practical Time Series Analysis: Prediction with Statistics and Machine Learning](https://www.oreilly.com/library/view/practical-time-series/9781492041641/) 💲  _Aileen Nielsen_, O’Reilly 2019
	- [repo with code](https://github.com/AileenNielsen/TimeSeriesAnalysisWithPython)
- [Machine Learning for Time-Series with Python](https://www.packtpub.com/product/machine-learning-for-time-series-with-python/9781801819626) 💲 _Ben Auffarth_, Packt Publishing 2021
  - [repo with code](https://github.com/PacktPublishing/Machine-Learning-for-Time-Series-with-Python)
- [Time Series Analysis Handbook](https://phdinds-aim.github.io/time_series_handbook/Preface/Preface.html)  🆓 _Students of PhD in Data Science Batch 2023 at the Asian Institute of Management_.
- [Visualization of Time-Oriented Data](https://amzn.to/3GITSpD) 💲 _Wolfgang Aigner, Silvia Miksch, Heidrun Schumann, Christian Tominski_, Springer-Verlag 2011

### Courses

- [Analytics Vidhya - Time Series Forecasting using Python](https://courses.analyticsvidhya.com/courses/creating-time-series-forecast-using-python)
- [Coursera - Intro to Time Series Analysis in R](https://www.coursera.org/projects/intro-time-series-analysis-in-r)
- [Coursera - Sequences, Time Series and Prediction](https://www.coursera.org/learn/tensorflow-sequences-time-series-and-prediction)
- [Coursera - Practical Time Series Analysis](https://www.coursera.org/learn/practical-time-series-analysis)
- [Data For Science - Time Series for Everyone](https://data4sci.com/timeseries)
- [Kaggle - Time Series](https://www.kaggle.com/learn/time-series)
- [Udacity - Time Series Forecasting](https://www.udacity.com/course/time-series-forecasting--ud980)

### Tutorials

- [Forecasting with Structural AR Timeseries | PyMC](https://www.pymc.io/projects/examples/en/latest/time_series/Forecasting_with_structural_timeseries.html)
- [Time-related feature engineering - scikit learn](https://scikit-learn.org/stable/auto_examples/applications/plot_cyclical_feature_engineering.html)

## Repos with Models

- [ESRNN-GPU](https://github.com/damitkwr/ESRNN-GPU) PyTorch GPU implementation of the ES-RNN model for time series forecasting.
- [LSTM-Neural-Network-for-Time-Series-Prediction](https://github.com/jaungiers/LSTM-Neural-Network-for-Time-Series-Prediction) LSTM built using Keras Python package to predict time series steps and sequences.
- [ROCKET](https://github.com/angus924/rocket) Exceptionally fast and accurate time series classification using random convolutional kernels.
- [TensorFlow-Time-Series-Examples](https://github.com/hzy46/TensorFlow-Time-Series-Examples) Time Series Prediction with `tf.contrib.timeseries`
- [TimeSeries](https://github.com/zhykoties/TimeSeries) Implementation of deep learning models for time series in PyTorch.
- [UCR_Time_Series_Classification_Deep_Learning_Baseline](https://github.com/cauchyturing/UCR_Time_Series_Classification_Deep_Learning_Baseline) Fully Convlutional Neural Networks for state-of-the-art time series classification.
- [wtte-rnn](https://github.com/ragulpr/wtte-rnn) WTTE-RNN a framework for churn and time to event prediction.

## Applications

- [binjr](https://github.com/binjr/binjr) A Time Series Data Browser.
- [CompEngine](https://www.comp-engine.org/)  A self-organizing database of time-series data, that allows you to upload time-series data and interactively visualize similar data that have been measured by others.

## Awesome lists

- https://github.com/lmmentel/awesome-time-series
- https://github.com/cuge1995/awesome-time-series
- https://github.com/MaxBenChrist/awesome_time_series_in_python
- https://github.com/vinta/awesome-python
- https://github.com/xephonhq/awesome-time-series-database - A curated list of awesome time series databases, benchmarks and papers.
- https://github.com/microprediction/awesome-python-benchmarks - Timeseries benchmarking mostly.
- https://github.com/Alro10/deep-learning-time-series - List of state of the art papers focus on deep learning and resources, code and experiments using deep learning for time series forecasting.
- https://github.com/benfulcher/hctsa/wiki/Related-time-series-resources - A collection of good resources for time-series analysis (including in other programming languages like python and R).
