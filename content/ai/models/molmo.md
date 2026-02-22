title=Molmo
tags=ai, model, vision
summary=AI model.
~~~~~~

[Allen AI](/ai/allenai) | [Website](https://allenai.org/) | [HuggingFace](https://huggingface.co/allenai/) | [Blog](https://molmo.allenai.org/blog)

A family of open-source VLMs developed by the Allen Institute for AI. Available in 1B, 7B, and 72B parameters, Molmo models deliver state-of-the-art performance for their class. According to the benchmarks, they can perform on a par with proprietary models like GPT-4V, Gemini 1.5 Pro, and Claude 3.5 Sonnet.

The key to Molmo’s performance lies in its unique training data, **PixMo**. This highly curated dataset consists of 1 million image-text pairs and includes two main types of data:

-   Dense captioning data for multimodal pre-training
-   Supervised fine-tuning data to enable various user interactions, such as question answering, document reading, and even pointing to objects in images.

Interestingly, Molmo researchers used an [innovative approach to data collection](https://arxiv.org/pdf/2409.17146): **Asked annotators to provide spoken descriptions of images within 60 to 90 seconds**. Specifically, these detailed descriptions included everything visible, even the spatial positioning and relationships among objects. The results show that annotators provided detailed captions far more efficiently than traditional methods (writing them down). Overall, they collected high-quality audio descriptions for 712k images that were sampled from 50 high-level topics.

Key features:

-   **State-of-the-art performance**: Molmo’s 72B model outperforms proprietary models like Gemini 1.5 Pro and Claude 3.5 Sonnet on academic benchmarks. Even the smaller 7B and 1B models rival GPT-4V in several tasks.
-   **Pointing capabilities**: Molmo can “point” to one or more visual elements in the image. Pointing provides a natural explanation grounded in image pixels. Molmo researchers believe that in the future pointing will be an important communication channel between VLMs and agents. For example, a web agent could query the VLM for the location of specific objects.
-   **Open architecture**: The original developers promise to release all artifacts used in creating Molmo, including the PixMo dataset, training code, evaluations, and intermediate checkpoints. This offers a new standard for building high-performing multimodal systems from scratch and promotes reproducibility.

Points to be cautious about:

-   **Transparent images**: Molmo may struggle with transparent images. It's recommended to [add a white or dark background](https://huggingface.co/allenai/Molmo-7B-D-0924#molmo-doesnt-work-great-with-transparent-images) to images before processing them with the model.
-   **Broadcast errors**: If you encounter a broadcast error while processing images, [ensure your image is in RGB format](https://huggingface.co/allenai/Molmo-7B-D-0924#im-getting-an-error-a-broadcast-error-when-processing-images).

## Reading

### Articles

- [The Best Open-Source Vision Language Models in 2026](https://www.bentoml.com/blog/multimodal-ai-a-guide-to-open-source-vision-language-models)
