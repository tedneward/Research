title=GTE
tags=ai, model, embedding
summary=An AI model.
~~~~~~

## GTE Multilingual Base

[HuggingFace](https://huggingface.co/Alibaba-NLP/gte-multilingual-base)

A compact yet high-performance embedding model from the GTE family, designed for multilingual retrieval and long-context text representation. It focuses on delivering strong retrieval accuracy while keeping hardware and inference requirements low, making it well suited for production RAG systems that need speed, scalability, and multilingual coverage without relying on large decoder-only models.

**Key features:**

-   **Strong multilingual retrieval**: Achieves state-of-the-art results on multilingual and cross-lingual retrieval benchmarks for models of similar size
-   **Efficient architecture**: Uses an encoder-only transformer design that delivers significantly faster inference and lower hardware requirements
-   **Long-context support**: Handles inputs up to 8192 tokens for long-document retrieval
-   **Elastic embeddings**: Supports flexible output dimensions to reduce storage costs while preserving downstream performance
-   **Hybrid retrieval support**: Generates both dense embeddings and sparse token weights for dense, sparse, or hybrid search pipelines

## Resources

### Articles, Blogs, Essays

* [Top 5 Embedding models for your RAG pipeline](https://www.kdnuggets.com/top-5-embedding-models-for-your-rag-pipeline)
