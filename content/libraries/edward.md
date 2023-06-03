title=Edward
tags=library, python, probabalistic
summary=A library for probabilistic modeling, inference, and criticism.
~~~~~~

[Website](http://edwardlib.org/)

It is a testbed for fast experimentation and research with probabilistic models, ranging from classical hierarchical models on small data sets to complex deep probabilistic models on large data sets. Edward fuses three fields: Bayesian statistics and machine learning, deep learning, and probabilistic programming.

It supports modeling with

* Directed graphical models
* Neural networks (via libraries such as tf.layers and Keras)
* Implicit generative models
* Bayesian nonparametrics and probabilistic programs

It supports inference with

* Variational inference
    * Black box variational inference
    * Stochastic variational inference
    * Generative adversarial networks
    * Maximum a posteriori estimation
* Monte Carlo
    * Gibbs sampling
    * Hamiltonian Monte Carlo
    * Stochastic gradient Langevin dynamics
* Compositions of inference
    * Expectation-Maximization
    * Pseudo-marginal and ABC methods
    * Message passing algorithms

It supports criticism of the model and inference with

* Point-based evaluations
* Posterior predictive checks

Edward is built on TensorFlow. It enables features such as computational graphs, distributed training, CPU/GPU integration, automatic differentiation, and visualization with TensorBoard.