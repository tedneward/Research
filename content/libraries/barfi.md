title=Barfi
tags=library, language, python, visual, flow, ai
summary=A Flow-Based Programming framework that offers a graphical programming interface.
~~~~~~

[Source](https://github.com/krish-adi/barfi) | [Docs](https://barfi.ai/docs) | [Getting Started](https://barfi.ai/docs/getting_started)

Framework to build a custom no-code platform. Comes with a Flow Based programming env and a GUI.

**A Python visual Flow Based Programming library to buld workflows that integrates into existing codebases.**

![Demo GIF](https://github.com/krish-adi/barfi/raw/main/assets/demo.gif)

Barfi is a Flow-Based Programming framework that offers a graphical programming interface. It is designed to integrate seamlessly into your existing Python applications.

Barfi serves as an abstraction of Graphical Programming, Flow-Based Programming, or Node Programming, where a Block corresponds to a Node, and a Link (or connection) corresponds to an Edge. These concepts go by different names, each reflecting specific needs or philosophies. In Barfi, they form the foundation of a framework for building, saving, and executing workflows as needed. The framework is intentionally kept simple, providing APIs that allow customization for diverse use cases and philosophies.

Many existing visual Flow-Based Programming (FBP) libraries/frameworks operate within their own confined isolated environments, limiting their usability as components in existing applications or scripts. Barfi addresses this by decoupling the graphical programming interface from the computation environment, which eables easy integration into existing apps. The graphical interface is provided through a Streamlit widget: `st_flow` (with a Jupyter Notebook widget currently in development), while the computation environment is managed independently via the `ComputeEngine`.

## Quickstart

A workflow consists of a bunch of `Block`s connected to each other, the information of the blocks and connections is stored in a `FlowSchema`, which is then executed to execute each program/function connected to each `Block` and to propagate the data from one `Block` to another.

## Under the hood

The Flow Editor UI is built using [ReactFlow](https://reactflow.dev/).