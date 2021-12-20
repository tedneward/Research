title=spaCy
tags=library, python, natural language processing
summary=A free, open-source library for advanced Natural Language Processing (NLP) in Python.
~~~~~~

[Website](https://spacy.io/) | [Source](https://github.com/explosion/spaCy)

Features

* Support for 60+ languages
* Trained pipelines for different languages and tasks
* Multi-task learning with pretrained transformers like BERT
* Support for pretrained word vectors and embeddings
* State-of-the-art speed
* Production-ready training system
* Linguistically-motivated tokenization
* Components for named entity recognition, part-of-speech-tagging, dependency parsing, sentence segmentation, text classification, lemmatization, morphological analysis, entity linking and more
* Easily extensible with custom components and attributes
* Support for custom models in PyTorch, TensorFlow and other frameworks
* Built in visualizers for syntax and NER
* Easy model packaging, deployment and workflow management
* Robust, rigorously evaluated accuracy

Concepts/Glossary

**NAME**  | **DESCRIPTION**
----- | -----------
Tokenization | Segmenting text into words, punctuations marks etc.
Part-of-speech (POS) Tagging | Assigning word types to tokens, like verb or noun.
Dependency Parsing | Assigning syntactic dependency labels, describing the relations between individual tokens, like subject or object.
Lemmatization | Assigning the base forms of words. For example, the lemma of “was” is “be”, and the lemma of “rats” is “rat”.
Sentence Boundary Detection (SBD) | Finding and segmenting individual sentences.
Named Entity Recognition (NER) | Labelling named “real-world” objects, like persons, companies or locations.
Entity Linking (EL) | Disambiguating textual entities to unique identifiers in a knowledge base.
Similarity | Comparing words, text spans and documents and how similar they are to each other.
Text Classification | Assigning categories or labels to a whole document, or parts of a document.
Rule-based Matching | Finding sequences of tokens based on their texts and linguistic annotations, similar to regular expressions.
Training | Updating and improving a statistical model’s predictions.
Serialization | Saving objects to files or byte strings.
