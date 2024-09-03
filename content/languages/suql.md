title=Structured and Unstructured Query Language (SUQL)
tags=language, storage, ai
summary=Conversational Search over Structured and Unstructured Data with LLMs
~~~~~~

[Source](https://github.com/stanford-oval/suql) | [Paper](https://arxiv.org/abs/2311.09818)

It augments SQL with several important free text primitives for a precise, succinct, and expressive representation. It can be used to build chatbots for relational data sources that contain both structured and unstructured information. Similar to how text-to-SQL has seen great success, SUQL can be used as the semantic parsing target language for hybrid databases, for instance, for:

![](https://github.com/stanford-oval/suql/blob/main/figures/figure1.png?raw=true)

An example restaurant relational database

Several important features:

* SUQL seamlessly integrates retrieval models, LLMs, and traditional SQL to deliver a clean, effective interface for hybrid data access;

    * It utilizes techniques inherent to each component: retrieval model and LM for unstructured data and relational SQL for structured data;

* Index of free text fields built with faiss, natively supporting all your favorite dense vector processing methods, e.g. product quantizer, HNSW, etc.;
* A series of important optimizations to minimize expensive LLM calls;
* Scalability to large databases with PostgreSQL;
* Support for general SQLs, e.g. JOINs, GROUP BYs.
