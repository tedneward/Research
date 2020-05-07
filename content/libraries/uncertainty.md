title=Uncertainty
tags=probabilistic programming, clr
summary=A C# library that uses LINQ to let developers easily express probabilistic computations and then inference over those computations.
~~~~~~

"Uncertainty is a C# library that uses LINQ to let developers easily express probabilistic computations and then inference over those computations."

[Website](https://www.microsoft.com/en-us/research/project/uncertainty/) | [Github](https://github.com/klipto/uncertainty)

#### Publications
[Uncertain<T>: A First-Order Type for Uncertain Data](https://www.microsoft.com/en-us/research/publication/uncertaint-a-first-order-type-for-uncertain-data-2/)([Slides](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/uncertaint-asplos-2014-slides.pdf))([Doc](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/asplos077-bornholtA.pdf)): "Emerging applications increasingly use estimates such as sensor data (GPS), probabilistic models, machine learning, big data, and human data. Unfortunately, representing this uncertain data with discrete types (floats, integers, and booleans) encourages developers to pretend it is not probabilistic, which causes three types of uncertainty bugs. (1) Using estimates as facts ignores random error in estimates. (2) Computation compounds that error. (3) Boolean questions on probabilistic data induce false positives and negatives.

"This paper introduces Uncertain< T >, a new programming language abstraction for uncertain data. We implement a Bayesian network semantics for computation and conditionals that improves program correctness. The runtime uses sampling and hypothesis tests to evaluate computation and conditionals lazily and efficiently. We illustrate with sensor and machine learning applications that Uncertain improves expressiveness and accuracy.

Whereas previous probabilistic programming languages focus on experts, Uncertain< T > serves a wide range of developers. Experts still identify error distributions. However, both experts and application writers compute with distributions, improve estimates with domain knowledge, and ask questions with conditionals. The Uncertain< T > type system and operators encourage developers to expose and reason about uncertainty explicitly, controlling false positives and false negatives. These benefits make Uncertain< T > a compelling programming model for modern applications facing the challenge of uncertainty."

