title=Tensors
tags=ai
summary=Concepts about tensors, which build LLM neural networks.
~~~~~~

## Reading

### Articles

- [Writing an optimizing tensor compiler from scratch](https://michaelmoroz.github.io/WritingAnOptimizingTensorCompilerFromScratch/) [Source](https://github.com/MichaelMoroz/TensorFrost): "A ‘small library’ involving a few matrix operations for a Unity-based project turned into a static optimizing tensor compiler, called TensorFrost, with a Python front-end and a shader-like syntax.... The Python-based front-end implements low-level NumPy-like operations, with development still ongoing. As for why Yet Another Tensor Library had be developed, the reasons were that most of existing libraries are heavily focused on machine learning tasks and scale poorly otherwise, dynamic control flow is hard to implement, and the requirement of writing custom kernels in e.g. CUDA. Above all Michael wanted to use a high-level language instead of pure shader code, and have something that can output graphical data in real-time. Taking the gamble, and leaning on LLVM for some parts, there is now a functional implementation, albeit with still a lot of work ahead." -- from https://hackaday.com/2026/01/30/writing-an-optimizing-tensor-compiler-from-scratch/

