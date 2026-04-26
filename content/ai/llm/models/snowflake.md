title=Snowflake
tags=ai, model, embedding
summary=An embedding model.
~~~~~~

## Snowflake Arctic Embed L v2.0

[HuggingFace](https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0)

A multilingual embedding model designed for high-quality retrieval at enterprise scale. It is optimized to deliver strong multilingual and English retrieval performance without requiring separate models, while maintaining efficient inference characteristics suitable for production systems. Released under the permissive Apache 2.0 license, Arctic-Embed-L-v2.0 is built for teams that need reliable, scalable retrieval across global datasets.

**Key features:**

-   **Multilingual without compromise**: Delivers strong English and non-English retrieval, outperforming many open-source and proprietary models on benchmarks like MTEB, MIRACL, and CLEF
-   **Inference efficient**: Uses a compact non-embedding parameter footprint for fast and cost-effective inference
-   **Compression friendly**: Supports Matryoshka Representation Learning and quantization to reduce embeddings to as little as 128 bytes with minimal quality loss
-   **Drop-in compatible**: Built on bge-m3-retromae, allowing direct replacement in existing embedding pipelines
-   **Long context support**: Handles inputs up to 8192 tokens using RoPE-based context extension

## Resources

### Articles, Blogs, Essays

* [Top 5 Embedding models for your RAG pipeline](https://www.kdnuggets.com/top-5-embedding-models-for-your-rag-pipeline)
