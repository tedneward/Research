title=Jina
tags=ai, model, embedding
summary=A text embedding model.
~~~~~~

## Jina Embeddings V3

[HuggingFace](https://huggingface.co/jinaai/jina-embeddings-v3)

One of the most downloaded embedding models for text feature extraction on Hugging Face, making it a popular choice for real-world retrieval and RAG systems. It is a multilingual, multi-task embedding model designed to support a wide range of NLP use cases, with a strong focus on flexibility and efficiency. Built on a Jina XLM-RoBERTa backbone and extended with task-specific LoRA adapters, it enables developers to generate embeddings optimized for different retrieval and semantic tasks using a single model.

**Key features:**

-   **Task-aware embeddings**: Uses multiple LoRA adapters to generate task-specific embeddings for retrieval, clustering, classification, and text matching
-   **Multilingual coverage**: Supports over 100 languages, with focused tuning on 30 high-impact languages including English, Arabic, Chinese, and Urdu
-   **Long-context support**: Handles input sequences up to 8192 tokens using Rotary Position Embeddings
-   **Flexible embedding sizes**: Supports Matryoshka embeddings with truncation from 32 up to 1024 dimensions
-   **Production friendly**: Widely adopted, easy to integrate with Transformers and SentenceTransformers, and supports efficient GPU inference


## Resources

### Articles, Blogs, Essays

* [Top 5 Embedding models for your RAG pipeline](https://www.kdnuggets.com/top-5-embedding-models-for-your-rag-pipeline)
