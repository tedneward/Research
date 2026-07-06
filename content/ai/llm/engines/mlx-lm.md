title=Apple MLX-LM
tags=ai, llm, inference engine, macOS
summary=Deeply integrated with macOS to leverage unified memory on M-series chips for incredible generation speeds
~~~~~~

[Website](https://mlx-framework.org/) | [Source](https://github.com/ml-explore/mlx-lm)

## Installing
It's a Python package, so use either `pip` or `pipx` (depending on how Python is installed on the system--Homebrew doesn't install `pip`, it installs `pipx` which is supposed to be tuned slightly differently for global tool installs): `pipx install mlx-lm`

Download and run a model: `python -m mlx_lm.generate --model mlx-community/Llama-3.1-8B-Instruct-4bit --prompt "Write a python script to scrape a website."`

Launch a local chat interface: `python -m mlx_lm.chat --model mlx-community/Llama-3.1-8B-Instruct-4bit`

